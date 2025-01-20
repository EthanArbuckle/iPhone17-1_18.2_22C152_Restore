uint64_t sub_44FC(uint64_t a1, const void *a2, const __CFAllocator *a3, uint64_t *a4)
{
  unsigned char *DerivedStorage;
  unsigned char *v8;
  const void **v9;
  uint64_t v10;
  CFAllocatorRef v11;
  const void **v12;
  CFIndex v13;
  uint64_t v14;
  uint64_t SInt64;
  uint64_t v16;
  uint64_t SupportedFeatures;

  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage) {
    return 4294950584;
  }
  v8 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointManagerProperty_AvailableEndpoints))
  {
    v10 = *((void *)v8 + 6);
    v9 = (const void **)(v8 + 48);
    if (v10)
    {
LABEL_4:
      v11 = a3;
      v12 = v9;
      v13 = 1;
LABEL_8:
      SInt64 = (uint64_t)CFArrayCreate(v11, v12, v13, &kCFTypeArrayCallBacks);
LABEL_9:
      v16 = 0;
LABEL_10:
      *a4 = SInt64;
      return v16;
    }
LABEL_7:
    v11 = a3;
    v12 = 0;
    v13 = 0;
    goto LABEL_8;
  }
  if (CFEqual(a2, kFigEndpointManagerProperty_AvailableCameraPreviewEndpoint))
  {
    v14 = *((void *)v8 + 7);
    v9 = (const void **)(v8 + 56);
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (CFEqual(a2, kFigEndpointManagerProperty_Name))
  {
    SInt64 = (uint64_t)CFRetain(kFigEndpointManagerType_Nero);
    goto LABEL_9;
  }
  if (CFEqual(a2, kFigEndpointManagerProperty_SupportedFeatures))
  {
    SupportedFeatures = FigEndpointManagerGetSupportedFeatures();
  }
  else
  {
    if (!CFEqual(a2, kFigEndpointManagerProperty_SupportedDiscoveryFeatures)) {
      return 4294954512;
    }
    SupportedFeatures = FigEndpointManagerGetSupportedDiscoveryFeatures();
  }
  v16 = SupportedFeatures;
  if (!SupportedFeatures)
  {
    SInt64 = FigCFNumberCreateSInt64();
    goto LABEL_10;
  }
  return v16;
}

uint64_t sub_4684()
{
  return 0;
}

__CFDictionary *sub_468C()
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return Mutable;
  }
  v11 = 0;
  if (getifaddrs(&v11) == -1) {
    return Mutable;
  }
  v1 = v11;
  if (!v11)
  {
    v9 = 0;
    goto LABEL_20;
  }
  do
  {
    if (v1->ifa_addr->sa_family == 2 && (v1->ifa_flags & 9) == 1)
    {
      ifa_name = v1->ifa_name;
      if (strncmp("awdl", ifa_name, 4uLL))
      {
        CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, ifa_name, 0);
        v4.s_addr = *(_DWORD *)&v1->ifa_addr->sa_data[2];
        v5 = inet_ntoa(v4);
        CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0);
        CFStringRef v7 = v6;
        if (v6) {
          BOOL v8 = v3 == 0;
        }
        else {
          BOOL v8 = 1;
        }
        if (v8)
        {
          if (!v6)
          {
            if (!v3) {
              goto LABEL_15;
            }
LABEL_14:
            CFRelease(v3);
            goto LABEL_15;
          }
        }
        else
        {
          CFDictionaryAddValue(Mutable, v3, v6);
        }
        CFRelease(v7);
        if (v3) {
          goto LABEL_14;
        }
      }
    }
LABEL_15:
    v1 = v1->ifa_next;
  }
  while (v1);
  v9 = v11;
LABEL_20:
  freeifaddrs(v9);
  if (!CFDictionaryGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

BOOL sub_4800()
{
  return qword_20070 != 0;
}

void sub_4814(const void *a1)
{
  if (!qword_20070)
  {
    qword_20070 = (uint64_t)malloc_type_calloc(1uLL, 0x70uLL, 0x10E0040DA3EDBD3uLL);
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coremedia.Stevenote", 0);
    uint64_t v4 = qword_20070;
    *(void *)qword_20070 = v3;
    if (a1)
    {
      CFTypeRef v5 = CFRetain(a1);
      uint64_t v4 = qword_20070;
    }
    else
    {
      CFTypeRef v5 = 0;
    }
    *(void *)(v4 + 104) = v5;
    BKSDisplayServicesSetCloneRotationDisabled();
    CFStringRef v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    notify_register_dispatch("com.apple.mobile.demo.mode-1", (int *)(qword_20070 + 36), *(dispatch_queue_t *)qword_20070, &stru_1CD90);
    notify_register_dispatch("com.apple.mobile.demo.mode-2", (int *)(qword_20070 + 40), *(dispatch_queue_t *)qword_20070, &stru_1CDB0);
    notify_register_dispatch("com.apple.mobile.demo.mode-3", (int *)(qword_20070 + 44), *(dispatch_queue_t *)qword_20070, &stru_1CDD0);
    notify_register_dispatch("com.apple.mobile.demo.mode-4", (int *)(qword_20070 + 48), *(dispatch_queue_t *)qword_20070, &stru_1CDF0);
    if (!*(_DWORD *)(qword_20070 + 68))
    {
      AssertionID[0] = 0;
      IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"coremedia-stevenote", AssertionID);
      *(_DWORD *)(qword_20070 + 68) = AssertionID[0];
    }
    int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
    uint64_t v8 = qword_20070;
    *(unsigned char *)(qword_20070 + 96) = CFPreferenceNumberWithDefault != 0;
    if (CFPreferenceNumberWithDefault)
    {
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      if (!sub_5C0C())
      {
        *(void *)AssertionID = 21;
        uint64_t v24 = 13;
        int v25 = 1;
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        int v28 = 60000;
        long long v29 = 0u;
        long long v30 = 0u;
        int v31 = 60000;
        long long v32 = 0u;
        long long v33 = 0u;
        if (sub_5D6C((uint64_t)AssertionID)) {
          *(unsigned char *)(qword_20070 + 32) = 1;
        }
      }
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v8 = qword_20070;
    }
    if (!*(_DWORD *)(v8 + 8) && !*(_DWORD *)(v8 + 12))
    {
      io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
      uint64_t v12 = qword_20070;
      *(_DWORD *)(qword_20070 + 8) = ServiceWithPrimaryPort;
      if (!ServiceWithPrimaryPort
        || !IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, (io_connect_t *)(v12 + 12))
        && !*(_DWORD *)(qword_20070 + 12))
      {
        FigSignalErrorAt();
      }
    }
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*(_DWORD *)(qword_20070 + 12)) {
      IOAccessoryManagerSetUSBCurrentLimitBase();
    }
    else {
      FigSignalErrorAt();
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)qword_20070, (CFNotificationCallback)sub_4FD4, @"com.apple.coremedia.Stevenote-HUD.changed", 0, (CFNotificationSuspensionBehavior)0);
    sub_4FD4();
    *(_DWORD *)(qword_20070 + 72) = -1;
    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, (const void *)qword_20070, (CFNotificationCallback)sub_5118, @"com.apple.coremedia.Stevenote3D.changed", 0, (CFNotificationSuspensionBehavior)0);
    sub_5118();
    sub_51F0();
  }
}

void sub_4F10(id a1, int a2)
{
}

void sub_4F18(uint64_t a1)
{
  CMBlockBufferRef destinationBuffer = 0;
  uint64_t sourceBytes = a1;
  CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, 8uLL, kCFAllocatorDefault, 0, 0, 8uLL, 1u, &destinationBuffer);
  CMBlockBufferReplaceDataBytes(&sourceBytes, destinationBuffer, 0, 8uLL);
  FigTransportGetRemoteRootObject();
  NeroTransportSendAsyncMessage();
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
}

void sub_4FBC(id a1, int a2)
{
}

void sub_4FC4(id a1, int a2)
{
}

void sub_4FCC(id a1, int a2)
{
}

void sub_4FD4()
{
  CFPreferencesSynchronize(@"com.apple.coremedia", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  int v1 = CFPreferenceNumberWithDefault != 0;
  uint64_t v2 = qword_20070;
  if (*(unsigned __int8 *)(qword_20070 + 64) != v1)
  {
    *(unsigned char *)(qword_20070 + 64) = v1;
    if (CFPreferenceNumberWithDefault)
    {
      if (!*(void *)(v2 + 16) && !*(_DWORD *)(v2 + 24))
      {
        dispatch_queue_t v3 = IONotificationPortCreate(kIOMainPortDefault);
        uint64_t v4 = (dispatch_queue_t *)qword_20070;
        *(void *)(qword_20070 + 16) = v3;
        IONotificationPortSetDispatchQueue(v3, *v4);
        IOServiceAddInterestNotification(*(IONotificationPortRef *)(qword_20070 + 16), *(_DWORD *)(qword_20070 + 8), "IOGeneralInterest", (IOServiceInterestCallback)sub_5E00, 0, (io_object_t *)(qword_20070 + 24));
      }
      if (qword_20088 != -1) {
        dispatch_once(&qword_20088, &stru_1CE70);
      }
      CFTypeRef v5 = (const __SCDynamicStore *)qword_20090;
      CFStringRef v6 = (dispatch_queue_t *)qword_20070;
      *(void *)(qword_20070 + 56) = qword_20090;
      if (v5) {
        SCDynamicStoreSetDispatchQueue(v5, *v6);
      }
    }
    else
    {
      sub_5A4C();
    }
    sub_51F0();
  }
}

void sub_5118()
{
  CFPreferencesSynchronize(@"com.apple.coremedia", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  if (*(_DWORD *)(qword_20070 + 72) != CFPreferenceNumberWithDefault)
  {
    *(_DWORD *)(qword_20070 + 72) = CFPreferenceNumberWithDefault;
    if (!FigCreateBlockBufferCopyingMemoryBlock())
    {
      FigTransportGetRemoteRootObject();
      NeroTransportSendAsyncMessage();
    }
  }
}

void sub_51F0()
{
  if (!qword_20070) {
    return;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (qword_20098 != -1) {
      dispatch_once(&qword_20098, &stru_1CE90);
    }
    if (qword_200A0) {
      CFDictionaryAddValue(Mutable, @"DeviceUniqueID", (const void *)qword_200A0);
    }
    if (qword_200A8) {
      CFDictionaryAddValue(Mutable, @"DeviceModel", (const void *)qword_200A8);
    }
    if (qword_200B0) {
      CFDictionaryAddValue(Mutable, @"DeviceColor", (const void *)qword_200B0);
    }
    if (qword_200B8) {
      CFDictionaryAddValue(Mutable, @"DeviceEnclosureColor", (const void *)qword_200B8);
    }
    if (qword_200C0) {
      CFDictionaryAddValue(Mutable, @"iOS Build", (const void *)qword_200C0);
    }
    int v1 = sub_468C();
    if (v1) {
      CFDictionaryAddValue(Mutable, @"DeviceIP", v1);
    }
    int valuePtr = 0;
    if (*(_DWORD *)(qword_20070 + 8))
    {
      if (!IOAccessoryManagerGetUSBCurrentLimit())
      {
        CFNumberRef v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        if (v2) {
          CFDictionaryAddValue(Mutable, @"Device Current", v2);
        }
        goto LABEL_22;
      }
    }
    else
    {
      FigSignalErrorAt();
    }
    CFNumberRef v2 = 0;
LABEL_22:
    if (*(unsigned char *)(qword_20070 + 64)) {
      dispatch_queue_t v3 = (const void **)&kCFBooleanTrue;
    }
    else {
      dispatch_queue_t v3 = (const void **)&kCFBooleanFalse;
    }
    CFDictionaryAddValue(Mutable, @"Enable ATV HUD", *v3);
    if (!FigRemote_CreateSerializedAtomDataBlockBufferForCFType())
    {
      FigTransportGetRemoteRootObject();
      NeroTransportSendAsyncMessage();
    }
    goto LABEL_27;
  }
  int v1 = 0;
  CFNumberRef v2 = 0;
LABEL_27:
  if (v2) {
    CFRelease(v2);
  }
  if (v1) {
    CFRelease(v1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_5458()
{
  if (qword_20070)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)qword_20070, @"com.apple.coremedia.Stevenote-HUD.changed", 0);
    CFNumberRef v2 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v2, (const void *)qword_20070, @"com.apple.coremedia.Stevenote3D.changed", 0);
    uint64_t v4 = qword_20070;
    if (*(void *)(qword_20070 + 88))
    {
      CFRunLoopGetMain();
      IOHIDEventSystemClientUnscheduleWithRunLoop();
      IOHIDEventSystemClientUnregisterEventCallback();
      uint64_t v4 = qword_20070;
      CFTypeRef v5 = *(const void **)(qword_20070 + 88);
      if (v5)
      {
        CFRelease(v5);
        uint64_t v4 = qword_20070;
        *(void *)(qword_20070 + 88) = 0;
      }
    }
    objc_msgSend(*(id *)(v4 + 80), "stopDeviceMotionUpdates", v16, v17);

    *(void *)(qword_20070 + 80) = 0;
    sub_5A4C();
    for (uint64_t i = 36; i != 52; i += 4)
      notify_cancel(*(_DWORD *)(qword_20070 + i));
    dispatch_sync(*(dispatch_queue_t *)qword_20070, &stru_1CE30);
    BKSDisplayServicesSetCloneRotationDisabled();
    CFStringRef v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v8 = qword_20070;
    IOPMAssertionID v9 = *(_DWORD *)(qword_20070 + 68);
    if (v9)
    {
      IOPMAssertionRelease(v9);
      uint64_t v8 = qword_20070;
    }
    *(_DWORD *)(v8 + 68) = 0;
    if (*(unsigned char *)(v8 + 96))
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v31 = 0;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      long long v26 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      if (sub_5C0C())
      {
        if (*(unsigned char *)(qword_20070 + 32))
        {
          uint64_t v18 = 0x100000015;
          if (sub_5D6C((uint64_t)&v18)) {
            *(unsigned char *)(qword_20070 + 32) = 0;
          }
        }
      }
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v8 = qword_20070;
    }
    io_connect_t v12 = *(_DWORD *)(v8 + 12);
    if (v12)
    {
      IOServiceClose(v12);
      uint64_t v8 = qword_20070;
      *(_DWORD *)(qword_20070 + 12) = 0;
    }
    io_object_t v13 = *(_DWORD *)(v8 + 8);
    if (v13)
    {
      IOObjectRelease(v13);
      *(_DWORD *)(qword_20070 + 8) = 0;
    }
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    dispatch_release(*(dispatch_object_t *)qword_20070);
    v15 = (void *)qword_20070;
    if (*(void *)(qword_20070 + 104))
    {
      CFRelease(*(CFTypeRef *)(qword_20070 + 104));
      v15 = (void *)qword_20070;
      *(void *)(qword_20070 + 104) = 0;
    }
    free(v15);
    qword_20070 = 0;
  }
}

uint64_t sub_5A4C()
{
  uint64_t v0 = qword_20070;
  int v1 = *(const __SCDynamicStore **)(qword_20070 + 56);
  if (v1)
  {
    SCDynamicStoreSetDispatchQueue(v1, 0);
    uint64_t v0 = qword_20070;
  }
  *(void *)(v0 + 56) = 0;
  CFNumberRef v2 = *(IONotificationPort **)(v0 + 16);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    uint64_t v0 = qword_20070;
    *(void *)(qword_20070 + 16) = 0;
  }
  uint64_t result = *(unsigned int *)(v0 + 24);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(qword_20070 + 24) = 0;
  }
  return result;
}

uint64_t sub_5AB4(uint64_t result, uint64_t a2, void *a3, BOOL *a4)
{
  *a3 = 0;
  *a4 = result == 1852125503;
  return result;
}

CFDataRef sub_5AD0()
{
  if (!qword_20070) {
    return 0;
  }
  id v1 = *(id *)(qword_20070 + 80);
  if (v1 && (v2 = [v1 deviceMotion]) != 0 && (id v3 = objc_msgSend(v2, "attitude")) != 0)
  {
    [v3 quaternion];
    v10[0] = v4;
    v10[1] = v5;
    v10[2] = v6;
    v10[3] = v7;
    CFDataRef v8 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v10, 32);
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return v8;
}

uint64_t sub_5B70()
{
  return _BKSDisplayServicesSetCloneMirroringMode();
}

uint64_t sub_5B78()
{
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1CE50);
  }
  return byte_20078;
}

void sub_5BBC(id a1)
{
  byte_20078 = FigGetCFPreferenceNumberWithDefault() != 0;
}

BOOL sub_5C0C()
{
  uint64_t v25 = 0;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  uint64_t v12 = 0x200000015;
  BOOL result = sub_5D6C((uint64_t)&v12);
  if (result)
  {
    uint64_t v1 = 0;
    LOBYTE(v2) = 1;
    while (1)
    {
      while (1)
      {
        id v3 = (char *)&v12 + 100 * v1;
        long long v4 = *(_OWORD *)(v3 + 8);
        long long v5 = *(_OWORD *)(v3 + 56);
        char v6 = v2;
        long long v7 = *(_OWORD *)(v3 + 88);
        v28[0] = *(_OWORD *)(v3 + 72);
        v28[1] = v7;
        int v29 = *((_DWORD *)v3 + 26);
        long long v8 = *(_OWORD *)(v3 + 24);
        long long v26 = v4;
        v27[0] = v8;
        v27[1] = *(_OWORD *)(v3 + 40);
        v27[2] = v5;
        if (v2) {
          break;
        }
        IOPMAssertionID v9 = (float *)v27 + 3;
        if ((v26 & 4) != 0) {
          goto LABEL_5;
        }
LABEL_10:
        LOBYTE(v2) = 0;
        uint64_t v1 = 1;
        if ((v6 & 1) == 0) {
          return 0;
        }
      }
      IOPMAssertionID v9 = (float *)v28;
      if ((v26 & 8) == 0) {
        goto LABEL_10;
      }
LABEL_5:
      if (v9[2] != 0.0) {
        return 1;
      }
      int v2 = *((_DWORD *)v9 + 3);
      if (v2) {
        return 1;
      }
      int v10 = *(_DWORD *)v9;
      char v11 = (*(_DWORD *)v9 == 0) & v6;
      uint64_t v1 = 1;
      if ((v11 & 1) == 0) {
        return v10 != 0;
      }
    }
  }
  return result;
}

BOOL sub_5D6C(uint64_t a1)
{
  uint64_t v4 = 0;
  if (a1)
  {
    uint64_t v1 = a1;
    LODWORD(a1) = _nlc_connect(&v4);
    if (a1 == 1)
    {
      int v2 = *(_DWORD *)(v1 + 4);
      if (v2)
      {
        if (v2 == 1)
        {
          _nlc_stop_simulation((uint64_t)&v4, (long long *)v1);
        }
        else if (v2 == 2)
        {
          _nlc_get_status((uint64_t)&v4, (_DWORD *)v1);
        }
      }
      else
      {
        _nlc_start_simulation((uint64_t)&v4, (long long *)v1);
      }
      LODWORD(a1) = _nlc_disconnect((uint64_t)&v4);
    }
  }
  return a1 == 1;
}

void sub_5E00(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -469794795) {
    sub_51F0();
  }
}

void sub_5E18(id a1)
{
  qword_20090 = (uint64_t)SCDynamicStoreCreate(kCFAllocatorDefault, @"AddIPAddressListChangeCallbackSCF", (SCDynamicStoreCallBack)sub_5F20, 0);
  if (!qword_20090) {
    return;
  }
  Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
  CFStringRef v3 = NetworkServiceEntity;
  if (Mutable) {
    BOOL v4 = NetworkServiceEntity == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    CFArrayAppendValue(Mutable, NetworkServiceEntity);
    SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_20090, 0, Mutable);
    goto LABEL_10;
  }
  if (NetworkServiceEntity)
  {
LABEL_10:
    CFRelease(v3);
    if (!Mutable) {
      return;
    }
    goto LABEL_11;
  }
  if (!Mutable) {
    return;
  }
LABEL_11:

  CFRelease(Mutable);
}

void sub_5F24(id a1)
{
  qword_200A0 = MGCopyAnswer();
  ModelSpecificName = (const void *)CelestialGetModelSpecificName();
  if (ModelSpecificName) {
    ModelSpecificName = CFRetain(ModelSpecificName);
  }
  qword_200A8 = (uint64_t)ModelSpecificName;
  qword_200B0 = MGCopyAnswer();
  qword_200B8 = MGCopyAnswer();
  qword_200C0 = MGCopyAnswer();
}

void sub_5FAC()
{
  if (IOHIDEventGetIntegerValue() == 12 && IOHIDEventGetIntegerValue())
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue == 233)
    {
      *(_DWORD *)&v2[8] = 0;
      *(void *)int v2 = *(_DWORD *)(qword_20070 + 72) ^ 1u;
      *(_DWORD *)(qword_20070 + 72) = *(_DWORD *)v2;
      if (!FigCreateBlockBufferCopyingMemoryBlock())
      {
        FigTransportGetRemoteRootObject();
        NeroTransportSendAsyncMessage();
      }
    }
    else
    {
      if (IntegerValue != 234) {
        return;
      }
      CFDataRef v1 = sub_5AD0();
      *(void *)&v2[4] = 0;
      if (!FigRemote_CreateSerializedAtomDataBlockBufferForCFType())
      {
        FigTransportGetRemoteRootObject();
        NeroTransportSendAsyncMessage();
      }
      if (v1) {
        CFRelease(v1);
      }
    }
    if (*(void *)&v2[4]) {
      CFRelease(*(CFTypeRef *)&v2[4]);
    }
  }
}

uint64_t sub_60EC(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2) {
    [v2 resetLines];
  }
  *(void *)(a1 + 24) = 0;
  return 0;
}

uint64_t sub_6120(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  if (!*(void *)(a1 + 16)) {
    return -1;
  }
  if (a3) {
    CFStringRef v5 = a3;
  }
  else {
    CFStringRef v5 = @" ";
  }
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  id v7 = [*(id *)(a1 + 16) addLine:a2 withColorIndex:*(unsigned int *)(a1 + 24)];
  [*(id *)(a1 + 16) setValue:v5 atIndex:v7];
  long long v8 = *(void **)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  if (v9 <= 16) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = 0;
  }
  *(void *)(a1 + 24) = v10;
  [v8 setNeedsDisplay];
  +[CATransaction commit];
  [v6 drain];
  return (uint64_t)v7;
}

uint64_t sub_61FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 16))
  {
    id v6 = objc_alloc_init((Class)NSAutoreleasePool);
    +[CATransaction begin];
    +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    [*(id *)(a1 + 16) setValue:a3 atIndex:a2];
    [*(id *)(a1 + 16) setNeedsDisplay];
    +[CATransaction commit];
    [v6 drain];
  }
  return 0;
}

void sub_62A4(uint64_t a1)
{
  CFDataRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    CFArrayRef v2 = (const __CFArray *)[v1 getValues];
    if (v2)
    {
      CFStringRef v3 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v2, @" ");
      if (v3)
      {
        CFRelease(v3);
      }
    }
  }
}

void sub_6300(uint64_t a1)
{
  CFDataRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    CFArrayRef v2 = (const __CFArray *)[v1 getLabels];
    if (v2)
    {
      CFStringRef v3 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v2, @" ");
      if (v3)
      {
        CFRelease(v3);
      }
    }
  }
}

uint64_t sub_635C(uint64_t a1, const AudioStreamBasicDescription *a2, void *a3)
{
  if (!a3) {
    return 4294950504;
  }
  FigEndpointAudioSinkGetClassID();
  uint64_t v5 = CMDerivedObjectCreate();
  if (!v5)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    uint64_t v5 = CMAudioFormatDescriptionCreate(kCFAllocatorDefault, a2, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)DerivedStorage);
    if (!v5)
    {
      *(void *)(DerivedStorage + 40) = 0x20000;
      *(void *)(DerivedStorage + 32) = malloc_type_malloc(0x20000uLL, 0xCE0CE1uLL);
      *(void *)(DerivedStorage + 24) = dispatch_queue_create("com.apple.coremedia.neroaudiosink", 0);
      sub_645C();
      *a3 = 0;
    }
  }
  return v5;
}

void sub_645C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef v1 = *(NSObject **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_6B34;
  block[3] = &unk_1CFD0;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
}

void sub_64D4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
  free(*(void **)(DerivedStorage + 32));
  CFDataRef v1 = *(NSObject **)(DerivedStorage + 24);

  dispatch_release(v1);
}

__CFString *sub_6524(uint64_t a1)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroAudioSink %p>", a1);
  return Mutable;
}

uint64_t sub_657C(uint64_t a1, const void *a2, uint64_t a3, CFNumberRef *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!CFEqual(a2, kFigEndpointAudioSinkProperty_BufferDurationMS)) {
    return 4294954512;
  }
  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (const void *)(DerivedStorage + 8));
  uint64_t result = 0;
  *a4 = v7;
  return result;
}

uint64_t sub_65F4(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!CFEqual(a2, kFigEndpointAudioSinkProperty_BufferDurationMS)) {
    return 4294954512;
  }
  CFNumberGetValue(a3, kCFNumberSInt32Type, (void *)(DerivedStorage + 8));
  return 0;
}

uint64_t sub_665C(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = (CMAudioFormatDescriptionRef *)CMBaseObjectGetDerivedStorage();
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*DerivedStorage);
  uint64_t v5 = *(void *)&StreamBasicDescription->mBitsPerChannel;
  long long v6 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
  *(_OWORD *)a2 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
  *(_OWORD *)(a2 + 16) = v6;
  *(void *)(a2 + 32) = v5;
  return 0;
}

uint64_t sub_669C()
{
  *(unsigned char *)(CMBaseObjectGetDerivedStorage() + 16) = 0;
  return 0;
}

uint64_t sub_66BC()
{
  *(unsigned char *)(CMBaseObjectGetDerivedStorage() + 16) = 1;
  return 0;
}

uint64_t sub_66E0()
{
  return 0;
}

uint64_t sub_66FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFNumberRef v7 = *(NSObject **)(DerivedStorage + 24);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_6910;
  v9[3] = &unk_1CF68;
  v9[4] = a1;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v7, v9);
  return 0;
}

uint64_t sub_6798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v6 = *(NSObject **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_69A8;
  block[3] = &unk_1CF88;
  block[4] = DerivedStorage;
  void block[5] = a3;
  block[6] = a1;
  dispatch_sync(v6, block);
  return 0;
}

uint64_t sub_6828(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  unint64_t v7 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  if (!*(unsigned char *)(DerivedStorage + 17))
  {
    long long v8 = *(NSObject **)(DerivedStorage + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_6A30;
    block[3] = &unk_1CFB0;
    block[4] = &v11;
    void block[5] = a1;
    block[6] = a3;
    void block[7] = DerivedStorage;
    block[8] = a2;
    dispatch_sync(v8, block);
    unint64_t v7 = v12[3];
  }
  if (a3 > v7) {
    bzero((void *)(a2 + v7), a3 - v7);
  }
  _Block_object_dispose(&v11, 8);
  return 0;
}

uint64_t sub_6910(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v4 = 40;
  if (v3 < *(void *)(result + 48)) {
    uint64_t v4 = 56;
  }
  uint64_t v5 = *(void *)(result + v4) - v3;
  long long v6 = *(void **)(a1 + 40);
  if ((unint64_t)v5 >= 0x4000)
  {
    uint64_t v7 = v6[8];
  }
  else
  {
    v6[8] = 0;
    uint64_t v5 = v6[7];
    uint64_t v7 = 0;
    if (v5 < 0x4000)
    {
      uint64_t v5 = 0x8000;
      v6[7] = 0x8000;
    }
  }
  **(void **)(a1 + 48) = v6[4] + v7;
  **(void **)(a1 + 56) = v5;
  return result;
}

void *sub_69A8(void *result)
{
  CFDataRef v1 = result;
  uint64_t v2 = result[4];
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 64) + result[5];
  *(void *)(v2 + 64) = v4;
  if (v4 > v3) {
    *(void *)(v2 + 48) = v4;
  }
  if (v4 == *(void *)(v2 + 40)) {
    *(void *)(v2 + 64) = 0;
  }
  if (*(unsigned char *)(v2 + 17))
  {
    uint64_t result = (void *)CMBaseObjectGetDerivedStorage();
    uint64_t v5 = result[6];
    uint64_t v6 = v5 - result[7];
    if (result[8] >= v5) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = result[8];
    }
    unint64_t v8 = v6 + v7;
    uint64_t v9 = v1[4];
    if (v8 >= *(unsigned int *)(v9 + 12)) {
      *(unsigned char *)(v9 + 17) = 0;
    }
  }
  return result;
}

void *sub_6A30(void *a1)
{
  uint64_t result = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v3 = result[6];
  uint64_t v4 = v3 - result[7];
  if (result[8] >= v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = result[8];
  }
  unint64_t v6 = v4 + v5;
  if (a1[6] < v6) {
    unint64_t v6 = a1[6];
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = v6;
  size_t v7 = *(void *)(*(void *)(a1[4] + 8) + 24);
  if (v7)
  {
    unint64_t v8 = (void *)a1[7];
    int64_t v10 = v8[6];
    int64_t v9 = v8[7];
    char v11 = 1;
    do
    {
      size_t v12 = v10 - v9;
      if (v12 >= v7) {
        size_t v13 = v7;
      }
      else {
        size_t v13 = v12;
      }
      uint64_t result = memcpy((void *)(a1[8] + *(void *)(*(void *)(a1[4] + 8) + 24) - v7), (const void *)(v8[4] + v9), v13);
      unint64_t v8 = (void *)a1[7];
      int64_t v9 = v8[7] + v13;
      v8[7] = v9;
      int64_t v10 = v8[6];
      if (v9 == v10)
      {
        int64_t v10 = v8[8];
        if (v9 <= v10)
        {
          v8[6] = 0;
          v8[7] = 0;
          v8[8] = 0;
          return result;
        }
        int64_t v9 = 0;
        v8[6] = v10;
        v8[7] = 0;
      }
      v7 -= v13;
      char v14 = (v7 != 0) & v11;
      char v11 = 0;
    }
    while ((v14 & 1) != 0);
  }
  return result;
}

uint64_t sub_6B34(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(unsigned char *)(v1 + 17) = 1;
  *(_DWORD *)(v1 + 12) = 28800;
  return result;
}

uint64_t sub_6B54(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, void *a7)
{
  if (!a6)
  {
    FigSignalErrorAt();
    return 0;
  }
  FigHALAudioStreamGetClassID();
  uint64_t v12 = CMDerivedObjectCreate();
  if (v12) {
    return v12;
  }
  uint64_t v12 = FigHALAudioObjectMapperAddMapping();
  if (v12) {
    return v12;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)uint64_t DerivedStorage = 0;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(void *)(DerivedStorage + 8) = a5;
  if (a4) {
    CFTypeRef v14 = CFRetain(a4);
  }
  else {
    CFTypeRef v14 = 0;
  }
  *(void *)(DerivedStorage + 24) = v14;
  *(void *)(DerivedStorage + 48) = CFRetain(a6);
  uint64_t v15 = CMBaseObjectGetDerivedStorage();
  CFDataRef v16 = *(const __CFData **)(*(void *)(v15 + 48) + 88);
  if (v16 && (unint64_t)CFDataGetLength(v16) >= 0x38)
  {
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v15 + 48) + 88));
    long long v23 = *(_OWORD *)(BytePtr + 8);
    long long v24 = *(_OWORD *)(BytePtr + 24);
    uint64_t v18 = *((void *)BytePtr + 5);
    uint64_t v19 = *(void *)(CMBaseObjectGetDerivedStorage() + 48);
    *(void *)(v19 + 16) = v18;
    *(_OWORD *)(v19 + 40) = v24;
    *(_OWORD *)(v19 + 24) = v23;
  }
  else
  {
    uint64_t v22 = FigSignalErrorAt();
    if (v22) {
      return v22;
    }
  }
  uint64_t v20 = 0;
  *a7 = 0;
  return v20;
}

void sub_6D18()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0;
  }
  uint64_t v2 = (const void *)DerivedStorage[6];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[6] = 0;
  }
  uint64_t v3 = (const void *)DerivedStorage[4];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[4] = 0;
  }
}

CFStringRef sub_6D6C()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"NeroAudioInputStream ID %d Owner %d EndpointStream %p AudioSink %p", *DerivedStorage, DerivedStorage[4], *((void *)DerivedStorage + 3), *((void *)DerivedStorage + 4));
}

uint64_t sub_6DC0(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4) {
    return 4294950405;
  }
  uint64_t v7 = DerivedStorage;
  if (!CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats)) {
    return 4294954509;
  }
  unint64_t v8 = *(const void **)(*(void *)(v7 + 48) + 88);
  if (v8) {
    CFTypeRef v9 = CFRetain(v8);
  }
  else {
    CFTypeRef v9 = 0;
  }
  uint64_t result = 0;
  *a4 = v9;
  return result;
}

uint64_t sub_6E44()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

uint64_t sub_6E60(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }
    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }
  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }
  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }
  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }
  if (v4 || v3 == v5) {
    return 1;
  }
  return result;
}

BOOL sub_6F50(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_6F84(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88)) / 0x38uLL);
    }
    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4;
    }
    return 40;
  }
  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88)) / 0x38uLL);
    }
    return 40;
  }
  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }
  return 4;
}

uint64_t sub_70D4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, void *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
            *(_DWORD *)a7 = 0;
            return result;
          }
          return 561211770;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v14 = 1634956402;
          goto LABEL_35;
        }
        return 561211770;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v14 = 1634689642;
      goto LABEL_35;
    }
    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t result = 0;
        int v14 = *(unsigned __int8 *)(DerivedStorage + 40);
        goto LABEL_35;
      }
      goto LABEL_25;
    }
LABEL_27:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0;
      uint64_t v17 = *(void *)(DerivedStorage + 48);
      long long v18 = *(_OWORD *)(v17 + 16);
      long long v19 = *(_OWORD *)(v17 + 32);
      a7[4] = *(void *)(v17 + 48);
      *(_OWORD *)a7 = v18;
      *((_OWORD *)a7 + 1) = v19;
      return result;
    }
    return 561211770;
  }
  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v14 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_35;
        }
        return 561211770;
      }
      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v14 = 1936747378;
LABEL_35:
      *(_DWORD *)a7 = v14;
      return result;
    }
    goto LABEL_27;
  }
  if (v12 == 1935894638 || v12 == 1935960434)
  {
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    uint64_t result = 0;
    int v14 = 1;
    goto LABEL_35;
  }
  if (v12 == 1936092513)
  {
LABEL_25:
    size_t v15 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88)) / 0x38uLL);
    *a6 = v15;
    if (v15 <= a5)
    {
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88));
      memcpy(a7, BytePtr, v15);
      return 0;
    }
    return 561211770;
  }
  return result;
}

uint64_t sub_737C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, long long *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v12 = 2003332927;
      goto LABEL_16;
    }
    if (a5 == 4)
    {
      int v13 = *(_DWORD *)a6 != 0;
      if (*(unsigned __int8 *)(DerivedStorage + 40) != v13)
      {
        *(unsigned char *)(DerivedStorage + 40) = v13;
        FigHALAudioPropertySendOneChange();
      }
      uint64_t v12 = 0;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v12 = 561211770;
    goto LABEL_16;
  }
  if (a5 != 40) {
    goto LABEL_14;
  }
  long long v15 = *a6;
  long long v16 = a6[1];
  uint64_t v17 = *((void *)a6 + 4);
  uint64_t v12 = FigHALAudioConfigChangeCreateRecord();
  if (!v12)
  {
    *(_OWORD *)&dword_10 = v15;
    *(_OWORD *)&stru_20.cmd = v16;
    *(void *)&stru_20.segname[8] = v17;
    FigHALAudioConfigChangeSendRequest();
  }
LABEL_16:
  FigHALAudioConfigChangeDisposeRecord();
  return v12;
}

uint64_t sub_74C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMBaseObjectGetDerivedStorage();
  if (a2 == 1768321645)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetDerivedStorage() + 48);
    long long v7 = *(_OWORD *)(a3 + 16);
    long long v6 = *(_OWORD *)(a3 + 32);
    *(void *)(v5 + 48) = *(void *)(a3 + 48);
    *(_OWORD *)(v5 + 16) = v7;
    *(_OWORD *)(v5 + 32) = v6;
    FigHALAudioPropertySendChanges();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = FigSignalErrorAt();
  }
  FigHALAudioConfigChangeDisposeRecord();
  return v8;
}

uint64_t sub_757C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 40)) {
    return 0;
  }
  uint64_t v1 = DerivedStorage;
  uint64_t v2 = *(void *)(DerivedStorage + 48);
  *(void *)(v2 + 136) = 0;
  uint64_t result = sub_635C((uint64_t)kCFAllocatorDefault, (const AudioStreamBasicDescription *)(v2 + 16), (void *)(DerivedStorage + 32));
  if (!result)
  {
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = kFigEndpointStreamProperty_AudioSink;
      return v8(CMBaseObject, v9, v4);
    }
    else
    {
      return 4294954514;
    }
  }
  return result;
}

uint64_t sub_7688()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(const void **)(DerivedStorage + 32);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 32) = 0;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, void))(v4 + 56);
  if (!v5) {
    return 4294954514;
  }
  uint64_t v6 = kFigEndpointStreamProperty_AudioSink;

  return v5(CMBaseObject, v6, 0);
}

uint64_t sub_7770(uint64_t a1, int a2, unsigned int a3, uint64_t a4, void *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v10 = *(void *)(DerivedStorage + 48);
  if (!*(unsigned char *)(v10 + 196)) {
    return 1937010544;
  }
  if (a2 == 1919246692)
  {
    uint64_t v11 = *(void *)(DerivedStorage + 32);
    if (v11)
    {
      *(double *)(v10 + 136) = *(double *)(a4 + 80) + (double)a3;
      size_t v12 = *(_DWORD *)(v10 + 156) * a3;
      uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      long long v15 = *(uint64_t (**)(uint64_t, void *, size_t, void))(v14 + 56);
      if (!v15 || (uint64_t result = v15(v11, a5, v12, 0), result))
      {
        bzero(a5, v12);
        return 0;
      }
    }
    else
    {
      return 561214578;
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t sub_78E0(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 48);
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }
  return 0;
}

uint64_t sub_7920(uint64_t a1, const __CFDictionary *a2, const void *a3, void *a4)
{
  FigVirtualDisplaySinkGetClassID();
  uint64_t v7 = CMDerivedObjectCreate();
  if (!v7)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (a2)
    {
      CFDictionaryGetValue(a2, kFigVirtualDisplaySinkProperty_IsValeria);
      *(unsigned char *)(DerivedStorage + 320) = FigCFEqual();
      CFDictionaryGetValue(a2, kFigVirtualDisplaySinkProperty_ShouldUseStevenoteJPEG);
      *(unsigned char *)(DerivedStorage + 336) = FigCFEqual();
    }
    *(_OWORD *)(DerivedStorage + 160) = xmmword_1A020;
    sub_7B60();
    uint64_t v9 = *(void *)(DerivedStorage + 40);
    v10.i64[0] = (int)v9;
    v10.i64[1] = SHIDWORD(v9);
    *(float64x2_t *)(DerivedStorage + 176) = vcvtq_f64_s64(v10);
    *(unsigned char *)(DerivedStorage + 200) = 0;
    *(void *)(DerivedStorage + 192) = FVDUtilsCreateDisplayUUID();
    *(void *)(DerivedStorage + 296) = -1;
    LOBYTE(keyExistsAndHasValidFormat.value) = 0;
    uint64_t v11 = CMBaseObjectGetDerivedStorage();
    Appuint64_t IntegerValue = CFPreferencesGetAppIntegerValue(@"octavia_max_pending_frames", @"com.apple.coremedia", (Boolean *)&keyExistsAndHasValidFormat);
    if (LOBYTE(keyExistsAndHasValidFormat.value)) {
      *(void *)(v11 + 296) = AppIntegerValue;
    }
    CMTimeMake(&keyExistsAndHasValidFormat, 2, 30);
    *(CMTime *)(DerivedStorage + 340) = keyExistsAndHasValidFormat;
    uint64_t v13 = CMBaseObjectGetDerivedStorage();
    float valuePtr = 0.0;
    CFNumberRef v14 = (const __CFNumber *)CFPreferencesCopyAppValue(@"octavia_max_queue_duration", @"com.apple.coremedia");
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFTypeID v16 = CFGetTypeID(v14);
      if (v16 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v15, kCFNumberFloat32Type, &valuePtr);
        uint64_t v17 = v13 + 340;
        if (valuePtr <= 0.0)
        {
          *(_OWORD *)uint64_t v17 = *(_OWORD *)&kCMTimeInvalid.value;
          CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        }
        else
        {
          CMTimeMakeWithSeconds(&keyExistsAndHasValidFormat, valuePtr, 1000000);
          *(_OWORD *)uint64_t v17 = *(_OWORD *)&keyExistsAndHasValidFormat.value;
          CMTimeEpoch epoch = keyExistsAndHasValidFormat.epoch;
        }
        *(void *)(v17 + 16) = epoch;
      }
      CFRelease(v15);
    }
    if (a3) {
      CFTypeRef v19 = CFRetain(a3);
    }
    else {
      CFTypeRef v19 = 0;
    }
    *(void *)(DerivedStorage + 392) = v19;
    *a4 = 0;
  }
  return v7;
}

void sub_7B60()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  double v1 = *(double *)(DerivedStorage + 160);
  double v2 = *(double *)(DerivedStorage + 168);
  if (!sub_4800() && !*(unsigned char *)(DerivedStorage + 320))
  {
    long long v24 = (_OWORD *)(DerivedStorage + 40);
    int v25 = (int)v1;
    int v26 = (int)v2;
    double v27 = *(double *)(DerivedStorage + 160) / *(double *)(DerivedStorage + 168);
    if (v27 >= 1.5) {
      long long v28 = &unk_1A088;
    }
    else {
      long long v28 = &unk_1A0F8;
    }
    BOOL v29 = FVDUtilsH264EncoderSupports1080p60() == 0;
    long long v30 = &v28[4 * v29];
    if (*(_DWORD *)v30 <= v25 && v28[4 * v29 + 1] <= v26)
    {
      *long long v24 = *v30;
    }
    else
    {
      *(_DWORD *)(DerivedStorage + 40) = v25;
      *(_DWORD *)(DerivedStorage + 44) = v26;
      *(void *)(DerivedStorage + 48) = 100;
    }
    uint64_t v33 = 3;
    if (v27 >= 1.5) {
      uint64_t v33 = 5;
    }
    v34 = (char *)(v28 + 8);
    int v35 = 1;
    do
    {
      if (*(_DWORD *)v34 <= v25)
      {
        int v36 = *((_DWORD *)v34 + 1);
        if (v36 <= v26 && (*(_DWORD *)v34 != *(_DWORD *)v24 || v36 != *(_DWORD *)(DerivedStorage + 44))) {
          v24[v35++] = *(_OWORD *)v34;
        }
      }
      v34 += 16;
      --v33;
    }
    while (v33);
    goto LABEL_78;
  }
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFArrayRef v5 = (const __CFArray *)CFPreferencesCopyValue(@"octavia_mirroring_resolution", @"com.apple.coremedia", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5)
  {
    CFArrayRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFArrayGetTypeID() && CFArrayGetCount(v6) >= 2)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
      if (ValueAtIndex)
      {
        CFStringRef v9 = ValueAtIndex;
        CFTypeID v10 = CFGetTypeID(ValueAtIndex);
        if (v10 == CFStringGetTypeID()) {
          double width = (double)CFStringGetIntValue(v9);
        }
      }
      CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1);
      if (v11)
      {
        CFStringRef v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 == CFStringGetTypeID()) {
          double height = (double)CFStringGetIntValue(v12);
        }
      }
    }
    CFRelease(v6);
  }
  signed int v14 = (int)width;
  signed int v15 = (int)height;
  if ((int)width) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    double v17 = *(double *)(DerivedStorage + 168);
    BOOL v18 = sub_4800();
    int v19 = *(unsigned __int8 *)(DerivedStorage + 336);
    if (CelestialIsAppleTV()) {
      int SecondaryDisplay = IOMobileFramebufferGetSecondaryDisplay();
    }
    else {
      int SecondaryDisplay = IOMobileFramebufferGetMainDisplay();
    }
    int DisplaySize = SecondaryDisplay;
    if (SecondaryDisplay || (v44 = CGSizeZero, (int DisplaySize = IOMobileFramebufferGetDisplaySize()) != 0))
    {
LABEL_68:
      if (DisplaySize) {
        return;
      }
      goto LABEL_69;
    }
    if (v44.height >= v44.width) {
      double v22 = v44.width;
    }
    else {
      double v22 = v44.height;
    }
    if (v44.height <= v44.width) {
      double v23 = v44.width;
    }
    else {
      double v23 = v44.height;
    }
    if (!v19 && v17 >= 2160.0 && v18 && FVDUtilsHEVCEncoderSupports4K60())
    {
      int DisplaySize = 0;
      signed int v15 = 2160;
      signed int v14 = 3840;
      goto LABEL_68;
    }
    double v31 = fabs(v23 / v22 + -1.33333333);
    if (v31 >= 0.1 || v22 <= 1200.0)
    {
      double v38 = v44.height;
      double v37 = v44.width;
      if (!v18) {
        goto LABEL_67;
      }
      if (v31 < 0.1) {
        goto LABEL_67;
      }
      double v39 = 720.0;
      if (v22 <= 720.0) {
        goto LABEL_67;
      }
      double v40 = 1080.0;
      if (v22 <= 1080.0) {
        double v40 = v22;
      }
      if (!v19) {
        double v39 = v40;
      }
      double v37 = v39 * v44.width / v22;
      double v41 = v39 * v44.height;
    }
    else
    {
      if (v18 && v19) {
        double v32 = 900.0;
      }
      else {
        double v32 = dbl_1A030[FVDUtilsH264EncoderSupports1080p60() == 0];
      }
      double v37 = v32 * v44.width / v22;
      double v41 = v32 * v44.height;
    }
    double v38 = v41 / v22;
LABEL_67:
    int DisplaySize = 0;
    signed int v14 = (int)(v37 + 0.5) & 0xFFFFFFFE;
    signed int v15 = (int)(v38 + 0.5) & 0xFFFFFFFE;
    goto LABEL_68;
  }
LABEL_69:
  if (v14 <= v15) {
    signed int v42 = v15;
  }
  else {
    signed int v42 = v14;
  }
  if (*(unsigned char *)(DerivedStorage + 320)) {
    signed int v43 = v42;
  }
  else {
    signed int v43 = v14;
  }
  if (!*(unsigned char *)(DerivedStorage + 320)) {
    signed int v42 = v15;
  }
  *(_DWORD *)(DerivedStorage + 40) = v43;
  *(_DWORD *)(DerivedStorage + 44) = v42;
  *(void *)(DerivedStorage + 48) = 0x100000064;
  int v35 = 1;
LABEL_78:
  *(_DWORD *)(DerivedStorage + 152) = v35;
}

uint64_t sub_7F5C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v1 = DerivedStorage;
    *(unsigned char *)uint64_t DerivedStorage = 1;
    if (*(void *)(DerivedStorage + 8))
    {
      uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v3 = FigBaseObject;
        uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v5 = v4 ? v4 : 0;
        CFArrayRef v6 = *(void (**)(uint64_t))(v5 + 24);
        if (v6) {
          v6(v3);
        }
      }
    }
    CFTypeID v7 = *(opaqueCMBufferQueue **)(v1 + 16);
    if (v7) {
      CMBufferQueueReset(v7);
    }
  }
  return 0;
}

void sub_8030()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  sub_7F5C();
  uint64_t v1 = (const void *)DerivedStorage[1];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[1] = 0;
  }
  double v2 = (const void *)DerivedStorage[2];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[2] = 0;
  }
  uint64_t v3 = (const void *)DerivedStorage[26];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[26] = 0;
  }
  uint64_t v4 = (const void *)DerivedStorage[47];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[47] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[48];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[48] = 0;
  }
  CFArrayRef v6 = DerivedStorage[3];
  if (v6)
  {
    dispatch_release(v6);
    DerivedStorage[3] = 0;
  }
  CFTypeID v7 = (const void *)DerivedStorage[4];
  if (v7)
  {
    _Block_release(v7);
    DerivedStorage[4] = 0;
  }
  uint64_t v8 = (const void *)DerivedStorage[24];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[24] = 0;
  }
  CFStringRef v9 = (const void *)DerivedStorage[38];
  if (v9)
  {
    CFRelease(v9);
    DerivedStorage[38] = 0;
  }
  CFTypeID v10 = (const void *)DerivedStorage[41];
  if (v10)
  {
    CFRelease(v10);
    DerivedStorage[41] = 0;
  }
  CFStringRef v11 = (const void *)DerivedStorage[49];
  if (v11)
  {
    CFRelease(v11);
    DerivedStorage[49] = 0;
  }
}

__CFString *sub_8110(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFAllocatorRef v3 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v3, 0);
  CFIndex v5 = CFGetRetainCount(a1);
  if (*(unsigned char *)DerivedStorage) {
    CFArrayRef v6 = " (invalidated)";
  }
  else {
    CFArrayRef v6 = "";
  }
  CFAllocatorRef v7 = CFGetAllocator(a1);
  CFStringAppendFormat(Mutable, 0, @"<FigVirtualDisplaySink %p retainCount: %ld%s allocator: %p, ", a1, v5, v6, v7);
  CFStringAppendFormat(Mutable, 0, @"renderPipeline %@", *(void *)(DerivedStorage + 8));
  CFStringAppendFormat(Mutable, 0, @">");
  return Mutable;
}

uint64_t sub_81E4(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (!*DerivedStorage)
  {
    uint64_t v8 = DerivedStorage;
    if (CFEqual(kFigVirtualDisplaySinkProperty_Type, a2))
    {
      CFStringRef v9 = @"Octavia";
    }
    else
    {
      if (CFEqual(kFigVirtualDisplaySinkProperty_IsStevenote, a2))
      {
        BOOL v10 = sub_4800();
        CFStringRef v11 = &kCFBooleanTrue;
        if (!v10) {
          CFStringRef v11 = &kCFBooleanFalse;
        }
      }
      else
      {
        if (!CFEqual(kFigVirtualDisplaySinkProperty_IsValeria, a2)) {
          return 4294954512;
        }
        CFStringRef v11 = &kCFBooleanTrue;
        if (!v8[320]) {
          CFStringRef v11 = &kCFBooleanFalse;
        }
      }
      CFStringRef v9 = (const __CFString *)*v11;
    }
    CFTypeRef v12 = CFRetain(v9);
    uint64_t result = 0;
    *a4 = v12;
    return result;
  }

  return FigSignalErrorAt();
}

uint64_t sub_830C(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = (CGSize *)CMBaseObjectGetDerivedStorage();
  if (LOBYTE(DerivedStorage->width))
  {
    return FigSignalErrorAt();
  }
  uint64_t v8 = DerivedStorage;
  if (CFEqual(kFigVirtualDisplaySinkProperty_DeviceInfo, a2))
  {
    if (a3)
    {
      CFTypeID v9 = CFGetTypeID(a3);
      if (v9 == CFDictionaryGetTypeID())
      {
        CGSize v27 = CGSizeZero;
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a3, kFigVirtualDisplaySinkDeviceInfoKey_Overscanned);
        if (Value)
        {
          CFBooleanRef v11 = Value;
          CFTypeID v12 = CFGetTypeID(Value);
          if (v12 == CFBooleanGetTypeID()) {
            LOBYTE(v8[12].height) = CFBooleanGetValue(v11);
          }
        }
        CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a3, kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels);
        if (v13)
        {
          CFDictionaryRef v14 = v13;
          CFTypeID v15 = CFGetTypeID(v13);
          if (v15 == CFDictionaryGetTypeID()) {
            CGSizeMakeWithDictionaryRepresentation(v14, &v27);
          }
        }
        if (v27.width > 0.0 && v27.height > 0.0)
        {
          v8[10] = v27;
          sub_7B60();
          CGFloat height = v8[2].height;
          v17.i64[0] = SLODWORD(height);
          v17.i64[1] = SHIDWORD(height);
          v8[11] = (CGSize)vcvtq_f64_s64(v17);
        }
      }
    }
    return 0;
  }
  if (CFEqual(kFigVirtualDisplaySinkProperty_VirtualDisplayModeSize, a2))
  {
    if (a3)
    {
      CFTypeID v18 = CFGetTypeID(a3);
      if (v18 == CFDictionaryGetTypeID()) {
        CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)a3, v8 + 11);
      }
    }
    return 0;
  }
  if (CFEqual(kFigVirtualDisplaySinkProperty_FPSInfo, a2))
  {
    if (a3)
    {
      CFTypeID v19 = CFGetTypeID(a3);
      if (v19 == CFArrayGetTypeID()) {
        sub_86F4(a1, (const __CFArray *)a3);
      }
    }
    return 0;
  }
  if (CFEqual(kFigVirtualDisplaySinkProperty_FPS, a2))
  {
    if (a3)
    {
      CFTypeID v20 = CFGetTypeID(a3);
      if (v20 == CFArrayGetTypeID()) {
        sub_881C(a1, (const __CFArray *)a3);
      }
    }
    return 0;
  }
  if (CFEqual(kFigVirtualDisplaySinkProperty_Bitrate, a2))
  {
    if (a3)
    {
      CFTypeID v21 = CFGetTypeID(a3);
      if (v21 == CFNumberGetTypeID()) {
        sub_88F4(a1, (const __CFNumber *)a3);
      }
    }
    return 0;
  }
  if (CFEqual(kFigVirtualDisplaySinkProperty_Timestamps, a2))
  {
    if (a3)
    {
      CFTypeID v22 = CFGetTypeID(a3);
      if (v22 == CFArrayGetTypeID())
      {
        CGFloat width = v8[24].width;
        *(void *)&v8[24].CGFloat width = a3;
LABEL_37:
        CFRetain(a3);
        if (width != 0.0) {
          CFRelease(*(CFTypeRef *)&width);
        }
        return 0;
      }
    }
    return 0;
  }
  if (!CFEqual(kFigVirtualDisplaySinkProperty_TimestampInfo, a2))
  {
    if (CFEqual(kFigVirtualDisplaySinkProperty_UseEncryption, a2)
      || CFEqual(kFigVirtualDisplaySinkProperty_SubmitSurfaceTimestamp, a2)
      || CFEqual(kFigVirtualDisplaySinkProperty_ExtraInfo, a2))
    {
      return 0;
    }
    if (!CFEqual(kFigVirtualDisplaySinkProperty_NetworkInfo, a2)) {
      return 4294954512;
    }
    if (!a3) {
      return 0;
    }
    CFTypeID v26 = CFGetTypeID(a3);
    if (v26 != CFDictionaryGetTypeID()) {
      return 0;
    }
    CGFloat width = v8[20].height;
    *(void *)&v8[20].CGFloat height = a3;
    goto LABEL_37;
  }
  if (!a3) {
    return 0;
  }
  CFTypeID v24 = CFGetTypeID(a3);
  if (v24 != CFArrayGetTypeID()) {
    return 0;
  }
  CGFloat v25 = v8[23].height;
  *(void *)&v8[23].CGFloat height = a3;
  CFRetain(a3);
  if (v25 != 0.0) {
    CFRelease(*(CFTypeRef *)&v25);
  }
  uint64_t result = 0;
  LOBYTE(v8[23].width) = 1;
  return result;
}

void sub_86F4(uint64_t a1, const __CFArray *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(void *)(DerivedStorage + 304);
  if (v4)
  {
    sub_60EC(v4);
    *(void *)(DerivedStorage + 312) = -1;
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      uint64_t v8 = (const void *)kFigVirtualDisplaySinkFPSInfoKey_Name;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v7);
        if (ValueAtIndex)
        {
          CFDictionaryRef v10 = ValueAtIndex;
          CFTypeID v11 = CFGetTypeID(ValueAtIndex);
          if (v11 == CFDictionaryGetTypeID())
          {
            CFBooleanRef Value = CFDictionaryGetValue(v10, v8);
            if (Value)
            {
              uint64_t v13 = (uint64_t)Value;
              CFTypeID v14 = CFGetTypeID(Value);
              if (v14 == CFStringGetTypeID()) {
                sub_6120(*(void *)(DerivedStorage + 304), v13, 0);
              }
            }
          }
        }
        ++v7;
      }
      while (v6 != v7);
    }
    *(void *)(DerivedStorage + 312) = sub_6120(*(void *)(DerivedStorage + 304), @"A-Mbp", 0);
    uint64_t v15 = *(void *)(DerivedStorage + 304);
    sub_6300(v15);
  }
}

void sub_881C(uint64_t a1, const __CFArray *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 304))
  {
    uint64_t v4 = DerivedStorage;
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          CFTypeID v9 = ValueAtIndex;
          CFTypeID v10 = CFGetTypeID(ValueAtIndex);
          if (v10 == CFNumberGetTypeID())
          {
            CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%@", v9);
            sub_61FC(*(void *)(v4 + 304), i, (uint64_t)v11);
            if (v11) {
              CFRelease(v11);
            }
          }
        }
      }
    }
  }
}

void sub_88F4(uint64_t a1, const __CFNumber *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 304))
  {
    uint64_t v4 = DerivedStorage;
    double valuePtr = 0.0;
    if (CFNumberGetValue(a2, kCFNumberDoubleType, &valuePtr))
    {
      CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%.2f", valuePtr * 0.000000953674316);
      sub_61FC(*(void *)(v4 + 304), *(void *)(v4 + 312), (uint64_t)v5);
      if (v5) {
        CFRelease(v5);
      }
    }
    sub_62A4(*(void *)(v4 + 304));
  }
}

uint64_t sub_8990(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3)
  {
    uint64_t v5 = DerivedStorage;
    CFIndex v6 = _Block_copy(a3);
    CFIndex v7 = *(NSObject **)(v5 + 24);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_9F50;
    v9[3] = &unk_1D1F0;
    v9[4] = v6;
    int v10 = 0;
    dispatch_async(v7, v9);
  }
  return 0;
}

uint64_t sub_8A2C(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = DerivedStorage;
    uint64_t v5 = _Block_copy(a2);
    CFIndex v6 = *(NSObject **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_9F98;
    block[3] = &unk_1D218;
    block[4] = v5;
    dispatch_async(v6, block);
  }
  return 0;
}

uint64_t sub_8AC4(uint64_t a1, opaqueCMSampleBuffer *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9, double a10, double a11)
{
  int valuePtr = a3;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v131.origin.x = a4;
  v131.origin.y = a5;
  v131.size.CGFloat width = a6;
  v131.size.CGFloat height = a7;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v131);
  CFNumberRef value = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v23 = CGSizeCreateDictionaryRepresentation(*(CGSize *)(DerivedStorage + 176));
  double v25 = *(double *)(DerivedStorage + 176);
  double v24 = *(double *)(DerivedStorage + 184);
  if (a11 > v24 || a10 > v25)
  {
    double v27 = v24 / a11;
    if (v24 / a11 >= v25 / a10) {
      double v27 = v25 / a10;
    }
    a11 = a11 * v27;
    a10 = a10 * v27;
    a8 = (v25 - a10) * 0.5;
    a9 = (v24 - a11) * 0.5;
  }
  if (*(unsigned char *)(DerivedStorage + 320)) {
    double v28 = a7;
  }
  else {
    double v28 = a11;
  }
  if (*(unsigned char *)(DerivedStorage + 320)) {
    double v29 = a6;
  }
  else {
    double v29 = a10;
  }
  if (*(unsigned char *)(DerivedStorage + 320)) {
    double v30 = a5;
  }
  else {
    double v30 = a9;
  }
  if (*(unsigned char *)(DerivedStorage + 320)) {
    double v31 = a4;
  }
  else {
    double v31 = a8;
  }
  CFDictionaryRef v32 = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v28 - 3));
  if (*(void *)(DerivedStorage + 8))
  {
    CFDictionaryRef v33 = 0;
    goto LABEL_22;
  }
  CFDictionaryRef v102 = v23;
  memset(&v107, 0, sizeof(v107));
  CMTimeMake(&v107, 3, 30);
  memset(&v106, 0, sizeof(v106));
  CMTimeMake(&v106, 5, 30);
  v97 = a2;
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a2);
  v130.CFNumberRef value = v107.value;
  CMTimeFlags flags = v107.flags;
  v130.CMTimeScale timescale = v107.timescale;
  CMTimeEpoch epoch = v107.epoch;
  CMClockRef sourceClock = (CMClockRef)v106.value;
  CMTimeFlags v60 = v106.flags;
  CMTimeScale timescale = v106.timescale;
  CMTimeEpoch v96 = v106.epoch;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  memset(v121, 0, sizeof(v121));
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  memset(time, 0, sizeof(time));
  if (FormatDescription)
  {
    *(void *)v121 = kFigRenderPipelineOption_FormatDescription;
    *(void *)time = CFRetain(FormatDescription);
    unsigned int v61 = 1;
  }
  else
  {
    unsigned int v61 = 0;
  }
  if ((flags & 0x1D) == 1)
  {
    *(void *)((unint64_t)v121 | (8 * v61)) = kFigRenderPipelineOption_PreparedQueueLowWaterLevel;
    v108.CFNumberRef value = v130.value;
    v108.CMTimeScale timescale = v130.timescale;
    v108.CMTimeFlags flags = flags;
    v108.CMTimeEpoch epoch = epoch;
    *(void *)((unint64_t)time & 0xFFFFFFFFFFFFFFF7 | (8 * (v61++ & 1))) = CMTimeCopyAsDictionary(&v108, kCFAllocatorDefault);
  }
  CFDictionaryRef v23 = v102;
  a2 = v97;
  if ((v60 & 0x1D) == 1)
  {
    *(void *)&v121[8 * v61] = kFigRenderPipelineOption_PreparedQueueHighWaterLevel;
    v108.CFNumberRef value = (CMTimeValue)sourceClock;
    v108.CMTimeScale timescale = timescale;
    v108.CMTimeFlags flags = v60;
    v108.CMTimeEpoch epoch = v96;
    *(void *)&time[8 * v61] = CMTimeCopyAsDictionary(&v108, kCFAllocatorDefault);
    CFIndex v62 = v61 + 1;
    CFDictionaryRef v103 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v121, (const void **)time, v62, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  else
  {
    CFIndex v62 = v61;
    CFDictionaryRef v103 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v121, (const void **)time, v61, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!v61) {
      goto LABEL_54;
    }
  }
  v63 = (CFTypeRef *)time;
  do
  {
    if (*v63) {
      CFRelease(*v63);
    }
    ++v63;
    --v62;
  }
  while (v62);
LABEL_54:
  CFDictionaryRef v33 = v103;
  uint64_t v64 = FigOctaviaVideoRenderPipelineCreate();
  if (v64) {
    goto LABEL_101;
  }
  uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject();
  uint64_t v66 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v66) {
    uint64_t v67 = v66;
  }
  else {
    uint64_t v67 = 0;
  }
  v74 = *(void (**)(uint64_t, void, const CFBooleanRef))(v67 + 56);
  if (v74) {
    v74(FigBaseObject, kFigRenderPipelineProperty_VideoEnqueueResetsSystemSleepTimer, kCFBooleanTrue);
  }
  uint64_t v75 = FigRenderPipelineGetFigBaseObject();
  uint64_t v76 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v76) {
    uint64_t v77 = v76;
  }
  else {
    uint64_t v77 = 0;
  }
  v78 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v77 + 48);
  if (!v78)
  {
    uint64_t v64 = 4294954514;
    goto LABEL_101;
  }
  uint64_t v64 = v78(v75, kFigRenderPipelineProperty_SourceSampleBufferQueue, kCFAllocatorDefault, DerivedStorage + 16);
  if (v64)
  {
LABEL_101:
    sub_A710(a1, kFigVirtualDisplaySinkEvent_ForceKeyFrame, 0);
    goto LABEL_102;
  }
  uint64_t v79 = FigRenderPipelineGetFigBaseObject();
  uint64_t v80 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v80) {
    uint64_t v81 = v80;
  }
  else {
    uint64_t v81 = 0;
  }
  v82 = *(void (**)(uint64_t, void, const CFBooleanRef))(v81 + 56);
  if (v82) {
    v82(v79, kFigRenderPipelineProperty_ObeyEmptyMediaMarkers, kCFBooleanTrue);
  }
  uint64_t v83 = FigRenderPipelineGetFigBaseObject();
  uint64_t v84 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v84) {
    uint64_t v85 = v84;
  }
  else {
    uint64_t v85 = 0;
  }
  v86 = *(void (**)(uint64_t, void, const CFBooleanRef))(v85 + 56);
  if (v86) {
    v86(v83, kFigRenderPipelineProperty_RenderEmptyMedia, kCFBooleanFalse);
  }
  LODWORD(v108.value) = 0;
  LOBYTE(v130.value) = 0;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v88 = v108.value;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v130.value)) {
    unsigned int v89 = v88;
  }
  else {
    unsigned int v89 = v88 & 0xFFFFFFFE;
  }
  if (v89)
  {
    *(_DWORD *)time = 136315138;
    *(void *)&time[4] = "octaviaSink_PushFrame";
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  CFDictionaryRef v33 = v103;
LABEL_22:
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a2, 0);
  if (SampleAttachmentsArray)
  {
    CFArrayRef v35 = SampleAttachmentsArray;
    CFIndex Count = CFArrayGetCount(SampleAttachmentsArray);
    if (Count >= 1)
    {
      CFIndex v37 = Count;
      CFDictionaryRef v100 = v33;
      CFDictionaryRef v95 = v32;
      double v38 = a2;
      CFDictionaryRef v98 = DictionaryRepresentation;
      CFDictionaryRef v39 = v23;
      CFIndex v40 = 0;
      Mutable = 0;
      signed int v42 = (const void *)kVTSampleAttachmentKey_RequireAcknowledgementToken;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v35, v40);
        CGSize v44 = CFDictionaryGetValue(ValueAtIndex, v42);
        if (v44)
        {
          v45 = v44;
          if (!Mutable)
          {
            Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
            if (!Mutable)
            {
              uint64_t v64 = 4294954510;
              CFDictionaryRef v23 = v39;
              CFDictionaryRef DictionaryRepresentation = v98;
              CFDictionaryRef v32 = v95;
              CFDictionaryRef v33 = v100;
              goto LABEL_101;
            }
          }
          CFArrayAppendValue(Mutable, v45);
        }
        ++v40;
      }
      while (v37 != v40);
      CFDictionaryRef v23 = v39;
      CFDictionaryRef DictionaryRepresentation = v98;
      a2 = v38;
      CFDictionaryRef v32 = v95;
      CFDictionaryRef v33 = v100;
      if (!Mutable) {
        goto LABEL_33;
      }
      v46 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        CFDictionaryAddValue(v46, kFigVirtualDisplaySinkFramesAcknowledgedKey_Tokens, Mutable);
        sub_A710(a1, kFigVirtualDisplaySinkEvent_FramesAcknowledged, v47);
        CFRelease(Mutable);
        CFRelease(v47);
        goto LABEL_33;
      }
      CFRelease(Mutable);
      uint64_t v64 = 4294954510;
      goto LABEL_101;
    }
  }
LABEL_33:
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_SourceRect, DictionaryRepresentation, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_DestRect, v32, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_VirtualDisplaySizeForDestRect, v23, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_SymmetricTransform, value, 1u);
  if (*(void *)(DerivedStorage + 384))
  {
    v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v49 = v48;
    if (*(unsigned char *)(DerivedStorage + 368))
    {
      v50 = *(const void **)(DerivedStorage + 376);
      if (v50)
      {
        CFDictionarySetValue(v48, kFigVirtualDisplaySinkProperty_TimestampInfo, v50);
        *(unsigned char *)(DerivedStorage + 368) = 0;
      }
    }
    CFDictionarySetValue(v49, kFigVirtualDisplaySinkProperty_Timestamps, *(const void **)(DerivedStorage + 384));
    CMSetAttachment(a2, kCMSampleBufferAttachmentKey_ClientTimingInfo, v49, 1u);
    if (v49) {
      CFRelease(v49);
    }
  }
  if (!*(void *)(DerivedStorage + 208))
  {
    CFDictionaryRef v101 = v33;
    uint64_t v51 = *(void *)(DerivedStorage + 8);
    CMBaseObjectGetDerivedStorage();
    CMTimebaseRef timebaseOut = 0;
    CMClockRef sourceClock = 0;
    long long v99 = *(_OWORD *)&kCMTimeInvalid.value;
    *(_OWORD *)&v108.CFNumberRef value = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch v52 = kCMTimeInvalid.epoch;
    v108.CMTimeEpoch epoch = v52;
    CMTime v107 = kCMTimeZero;
    int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
    CMTimeMake(&v107, CFPreferenceNumberWithDefault, 60);
    *(CMTime *)time = v107;
    CMTimeConvertScale((CMTime *)v121, (CMTime *)time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTime v107 = *(CMTime *)v121;
    uint64_t v54 = FigRenderPipelineGetFigBaseObject();
    uint64_t v55 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v55) {
      uint64_t v56 = v55;
    }
    else {
      uint64_t v56 = 0;
    }
    v68 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CMClockRef *))(v56 + 48);
    if (v68 && !v68(v54, kFigRenderPipelineProperty_PreferredClock, kCFAllocatorDefault, &sourceClock))
    {
      OSStatus v69 = CMTimebaseCreateWithSourceClock(kCFAllocatorDefault, sourceClock, &timebaseOut);
      CMTimebaseRef v70 = timebaseOut;
      if (!v69)
      {
        uint64_t v71 = FigRenderPipelineGetFigBaseObject();
        uint64_t v72 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v72) {
          uint64_t v73 = v72;
        }
        else {
          uint64_t v73 = 0;
        }
        v90 = *(void (**)(uint64_t, void, CMTimebaseRef))(v73 + 56);
        if (v90) {
          v90(v71, kFigRenderPipelineProperty_Timebase, v70);
        }
        CMClockGetTime(&v108, sourceClock);
        CMTime v106 = v108;
        CMTime v130 = v108;
        uint64_t v91 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v91) {
          uint64_t v92 = v91;
        }
        else {
          uint64_t v92 = 0;
        }
        v93 = *(void (**)(uint64_t, unsigned char *, unsigned char *, float, float))(v92 + 8);
        if (v93)
        {
          *(CMTime *)v121 = v106;
          *(CMTime *)time = v130;
          v93(v51, v121, time, 1.0, 1.0);
        }
        *(void *)(DerivedStorage + 208) = sourceClock;
        *(CMTime *)(DerivedStorage + 216) = v107;
        CMTimebaseRef v70 = timebaseOut;
      }
      if (v70) {
        CFRelease(v70);
      }
    }
    *(_OWORD *)(DerivedStorage + 240) = v99;
    *(void *)(DerivedStorage + 256) = v52;
    *(_OWORD *)(DerivedStorage + 264) = v99;
    *(void *)(DerivedStorage + 280) = v52;
    *(unsigned char *)(DerivedStorage + 288) = 0;
    CFDictionaryRef v33 = v101;
  }
  uint64_t v64 = sub_9FDC(a1, a2);
  if (v64) {
    goto LABEL_101;
  }
LABEL_102:
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (value) {
    CFRelease(value);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v33) {
    CFRelease(v33);
  }
  return v64;
}

uint64_t sub_97C4()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage[1])
  {
    uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v2 = FigBaseObject;
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v4 = v3 ? v3 : 0;
      uint64_t v5 = *(void (**)(uint64_t))(v4 + 24);
      if (v5) {
        v5(v2);
      }
    }
  }
  CFIndex v6 = (opaqueCMBufferQueue *)DerivedStorage[2];
  if (v6) {
    CMBufferQueueReset(v6);
  }
  CFIndex v7 = (const void *)DerivedStorage[1];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[1] = 0;
  }
  uint64_t v8 = (const void *)DerivedStorage[2];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[2] = 0;
  }
  CFTypeID v9 = (const void *)DerivedStorage[26];
  if (v9)
  {
    CFRelease(v9);
    DerivedStorage[26] = 0;
  }
  return 0;
}

uint64_t sub_98B8()
{
  return 0;
}

uint64_t sub_98C0(uint64_t a1, const void *a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFIndex v7 = (const void *)kFigVirtualDisplaySinkProperty_DeviceInfo;
  if (CFEqual(a2, kFigVirtualDisplaySinkProperty_DeviceInfo) || CFEqual(a2, kFigVirtualDisplaySinkProperty_DisplayInfo))
  {
    int v8 = *(unsigned __int8 *)(DerivedStorage + 200);
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)(DerivedStorage + 176));
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v11 = DictionaryRepresentation;
        if (CFEqual(a2, v7))
        {
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels, v11);
          CFTypeID v12 = (const void *)kFigVirtualDisplaySinkDeviceInfoKey_Overscanned;
          uint64_t v13 = &kCFBooleanFalse;
          if (v8) {
            uint64_t v13 = &kCFBooleanTrue;
          }
          CFBooleanRef v14 = *v13;
        }
        else
        {
          uint64_t v15 = CMBaseObjectGetDerivedStorage();
          CFMutableArrayRef v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v17 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          if (v16) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (v18)
          {
            Mutable = 0;
            uint64_t v25 = 4294954510;
            goto LABEL_21;
          }
          CFMutableArrayRef v19 = v17;
          if (*(int *)(v15 + 152) >= 1)
          {
            CFTypeRef cf = 0;
            CFNumberRef value = 0;
            FigDisplayModes_BuildColorAndTimingModes();
            Mutable = 0;
            uint64_t v25 = 4294954510;
LABEL_21:
            CFRelease(v11);
            goto LABEL_22;
          }
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_ColorModes, v16);
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_TimingModes, v19);
          CFRelease(v16);
          CFRelease(v19);
          CFTypeID v20 = (const void **)&kCFBooleanFalse;
          if (!*(unsigned char *)(DerivedStorage + 320)) {
            CFTypeID v20 = (const void **)&kCFBooleanTrue;
          }
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_RotationSupport, *v20);
          CFBooleanRef v14 = *(CFBooleanRef *)(DerivedStorage + 192);
          if (!v14)
          {
LABEL_20:
            uint64_t v25 = 0;
            goto LABEL_21;
          }
          CFTypeID v12 = (const void *)kFigVirtualDisplaySinkDeviceInfoKey_DisplayUUID;
        }
        CFDictionarySetValue(Mutable, v12, v14);
        goto LABEL_20;
      }
      Mutable = 0;
    }
    uint64_t v25 = 4294954510;
    goto LABEL_22;
  }
  if (CFEqual(a2, kFigVirtualDisplaySinkProperty_NetworkInfo))
  {
    double v24 = *(const void **)(DerivedStorage + 328);
    if (v24) {
      Mutable = (__CFDictionary *)CFRetain(v24);
    }
    else {
      Mutable = 0;
    }
    uint64_t v25 = 0;
  }
  else
  {
    Mutable = 0;
    uint64_t v25 = 4294954512;
  }
LABEL_22:
  CFTypeID v21 = _Block_copy(a4);
  CFTypeID v22 = *(NSObject **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_A9C4;
  block[3] = &unk_1D268;
  int v27 = v25;
  block[4] = v21;
  void block[5] = Mutable;
  dispatch_async(v22, block);
  return v25;
}

uint64_t sub_9C38(uint64_t a1, const __CFString *a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (CFStringCompare(kFigVirtualDisplaySinkAction_ClearScreen, a2, 1uLL) == kCFCompareEqualTo
    && DerivedStorage[1]
    && DerivedStorage[2]
    && (HostTimeClock = CMClockGetHostTimeClock(),
        CMClockGetTime(&v16, HostTimeClock),
        CMSampleBufferRef v18 = 0,
        (v16.flags & 0x1D) == 1))
  {
    *(_OWORD *)&sampleTimingArray.duration.CFNumberRef value = *(_OWORD *)&kCMTimeZero.value;
    sampleTimingArray.duration.CMTimeEpoch epoch = kCMTimeZero.epoch;
    sampleTimingArray.presentationTimeStamp = v16;
    sampleTimingArray.decodeTimeStamp = kCMTimeInvalid;
    uint64_t v8 = CMSampleBufferCreate(kCFAllocatorDefault, 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v18);
    if (!v8)
    {
      CMSetAttachment(v18, kCMSampleBufferAttachmentKey_EmptyMedia, kCFBooleanTrue, 1u);
      CMSetAttachment(v18, kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately, kCFBooleanTrue, 1u);
    }
    CMSampleBufferRef v13 = v18;
    if (v18)
    {
      sub_9FDC(a1, v18);
      CFRelease(v13);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (a4)
  {
    CFTypeID v9 = _Block_copy(a4);
    int v10 = DerivedStorage[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_AA2C;
    block[3] = &unk_1D290;
    block[4] = v9;
    int v15 = v8;
    dispatch_async(v10, block);
  }
  return v8;
}

uint64_t sub_9E28(uint64_t a1, NSObject *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a2) {
    a2 = &_dispatch_main_q;
  }
  dispatch_retain(a2);
  uint64_t v4 = *(NSObject **)(DerivedStorage + 24);
  if (v4) {
    dispatch_release(v4);
  }
  *(void *)(DerivedStorage + 24) = a2;
  return 0;
}

uint64_t sub_9E7C(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = _Block_copy(a2);
  uint64_t v5 = *(const void **)(DerivedStorage + 32);
  if (v5) {
    _Block_release(v5);
  }
  *(void *)(DerivedStorage + 32) = v4;
  return 0;
}

opaqueCMBufferQueue *sub_9EC4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ((*(unsigned char *)(DerivedStorage + 352) & 1) == 0) {
    return 0;
  }
  uint64_t v2 = DerivedStorage;
  uint64_t result = *(opaqueCMBufferQueue **)(DerivedStorage + 16);
  if (result)
  {
    uint64_t v3 = (CMTime *)(v2 + 340);
    memset(&v6, 0, sizeof(v6));
    CMBufferQueueGetDuration(&v6, result);
    CMTime time1 = v6;
    CMTime v4 = *v3;
    return (opaqueCMBufferQueue *)(CMTimeCompare(&time1, &v4) >= 0);
  }
  return result;
}

void sub_9F50(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

void sub_9F98(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

uint64_t sub_9FDC(uint64_t a1, opaqueCMSampleBuffer *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMSampleBufferRef sampleBufferOut = 0;
  if (*(void *)(DerivedStorage + 208))
  {
    uint64_t v5 = DerivedStorage;
    memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
    memset(&v42, 0, sizeof(v42));
    CMSampleBufferGetOutputPresentationTimeStamp(&v42, a2);
    long long v36 = *(_OWORD *)&kCMTimeInvalid.value;
    *(_OWORD *)&v41.CFNumberRef value = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch epoch = kCMTimeInvalid.epoch;
    v41.CMTimeEpoch epoch = epoch;
    memset(&v40, 0, sizeof(v40));
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    uint64_t v8 = *(const void **)(v5 + 208);
    CMTime time = v42;
    CMSyncConvertTime(&v40, &time, HostTimeClock, v8);
    CMTime v39 = v40;
    CMTime v38 = kCMTimeZero;
    CMTime v37 = v38;
    CFTypeID v9 = (_OWORD *)(v5 + 240);
    if (*(unsigned char *)(v5 + 252))
    {
      CMTime time = v42;
      *(_OWORD *)&rhs.CFNumberRef value = *v9;
      rhs.CMTimeEpoch epoch = *(void *)(v5 + 256);
      CMTimeSubtract(&v41, &time, &rhs);
      CMTime time = v41;
      *(_OWORD *)&rhs.CFNumberRef value = xmmword_1A148;
      rhs.CMTimeEpoch epoch = 0;
      if (CMTimeCompare(&time, &rhs) < 0)
      {
        CMTime time = *(CMTime *)(v5 + 264);
        CMTime rhs = v41;
        CMTimeAdd(&v39, &time, &rhs);
        CMTime time = v39;
        CMTime rhs = v40;
        CMTimeSubtract(&v38, &time, &rhs);
        CMTime time = v38;
        *(_OWORD *)&rhs.CFNumberRef value = xmmword_1A160;
        rhs.CMTimeEpoch epoch = 0;
        if (CMTimeCompare(&time, &rhs) < 1)
        {
          CMTime time = v38;
          *(_OWORD *)&rhs.CFNumberRef value = xmmword_1A178;
          rhs.CMTimeEpoch epoch = 0;
          if (CMTimeCompare(&time, &rhs) < 0)
          {
            CMTime rhs = v39;
            *(_OWORD *)&hostTime.CFNumberRef value = xmmword_1A160;
            hostTime.CMTimeEpoch epoch = 0;
            CMTimeAdd(&time, &rhs, &hostTime);
            CMTime v39 = time;
          }
        }
        else
        {
          CMTime time = v41;
          *(_OWORD *)&rhs.CFNumberRef value = xmmword_1A160;
          rhs.CMTimeEpoch epoch = 0;
          if (CMTimeCompare(&time, &rhs) < 1)
          {
            if (!*(unsigned char *)(v5 + 288))
            {
              if (*(void *)(v5 + 32)) {
                sub_A710(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, 0);
              }
              *(unsigned char *)(v5 + 288) = 1;
            }
          }
          else
          {
            CMTime rhs = v39;
            *(_OWORD *)&hostTime.CFNumberRef value = xmmword_1A160;
            hostTime.CMTimeEpoch epoch = 0;
            CMTimeSubtract(&time, &rhs, &hostTime);
            CMTime v39 = time;
            *(unsigned char *)(v5 + 288) = 0;
          }
        }
      }
    }
    CMTime time = v39;
    CMTime rhs = *(CMTime *)(v5 + 264);
    CMTimeSubtract(&v37, &time, &rhs);
    if (*(unsigned char *)(v5 + 320))
    {
      CMTime time = v37;
      *(_OWORD *)&rhs.CFNumberRef value = xmmword_1A190;
      rhs.CMTimeEpoch epoch = 0;
      if (CMTimeCompare(&time, &rhs) < 0)
      {
        if (*(void *)(v5 + 32)) {
          sub_A710(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, 0);
        }
        CMTime rhs = *(CMTime *)(v5 + 264);
        *(_OWORD *)&hostTime.CFNumberRef value = xmmword_1A160;
        hostTime.CMTimeEpoch epoch = 0;
        CMTimeAdd(&time, &rhs, &hostTime);
        CMTime v39 = time;
      }
    }
    uint64_t v33 = a1;
    if (a2)
    {
      int v10 = *(const void **)(v5 + 208);
      if (v10)
      {
        CFStringRef v11 = (const __CFString *)kCMSampleBufferAttachmentKey_ClientTimingInfo;
        CFDictionaryRef v12 = (const __CFDictionary *)CMGetAttachment(a2, kCMSampleBufferAttachmentKey_ClientTimingInfo, 0);
        if (v12)
        {
          CFDictionaryRef v13 = v12;
          CFTypeID v14 = CFGetTypeID(v12);
          if (v14 == CFDictionaryGetTypeID())
          {
            MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v13);
            CMTime v16 = (const void *)kFigVirtualDisplaySinkProperty_Timestamps;
            CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v13, kFigVirtualDisplaySinkProperty_Timestamps);
            if (Value && (CFArrayRef v18 = Value, v19 = CFGetTypeID(Value), v19 == CFArrayGetTypeID()))
            {
              CMTimeEpoch v34 = epoch;
              target = a2;
              CFIndex Count = CFArrayGetCount(v18);
              CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
              if (CFArrayGetCount(v18) >= 1)
              {
                CFIndex v22 = 0;
                do
                {
                  valuePtr[0] = 0;
                  CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v18, v22);
                  if (ValueAtIndex)
                  {
                    CFNumberRef v24 = ValueAtIndex;
                    CFTypeID v25 = CFGetTypeID(ValueAtIndex);
                    if (v25 == CFNumberGetTypeID())
                    {
                      CFNumberGetValue(v24, kCFNumberSInt64Type, valuePtr);
                      if ((uint64_t)valuePtr[0] >= 1)
                      {
                        memset(&time, 0, sizeof(time));
                        CMClockMakeHostTimeFromSystemUnits(&time, valuePtr[0]);
                        memset(&rhs, 0, sizeof(rhs));
                        CMClockRef v26 = CMClockGetHostTimeClock();
                        CMTime hostTime = time;
                        CMSyncConvertTime(&rhs, &hostTime, v26, v10);
                        CMTime hostTime = rhs;
                        CMClockConvertHostTimeToSystemUnits(&hostTime);
                        FigHostTimeToNanoseconds();
                      }
                      FigCFArrayAppendInt64();
                    }
                  }
                  ++v22;
                }
                while (v22 < CFArrayGetCount(v18));
              }
              CFDictionarySetValue(MutableCopy, v16, Mutable);
              a2 = target;
              CMSetAttachment(target, v11, MutableCopy, 1u);
              CMTimeEpoch epoch = v34;
            }
            else
            {
              CFMutableArrayRef Mutable = 0;
            }
            CFTypeID v9 = (_OWORD *)(v5 + 240);
            if (MutableCopy) {
              CFRelease(MutableCopy);
            }
            if (Mutable) {
              CFRelease(Mutable);
            }
          }
        }
      }
    }
    *(CMTime *)CFTypeID v9 = v42;
    long long v27 = *(_OWORD *)&v39.value;
    *(_OWORD *)(v5 + 264) = *(_OWORD *)&v39.value;
    CMTimeEpoch v28 = v39.epoch;
    *(void *)(v5 + 280) = v39.epoch;
    *(_OWORD *)&time.CFNumberRef value = v27;
    time.CMTimeEpoch epoch = v28;
    CMTime rhs = *(CMTime *)(v5 + 216);
    CMTimeAdd(&sampleTimingArray.presentationTimeStamp, &time, &rhs);
    CMTimeMake(&time, 1, 60);
    sampleTimingArray.duration = time;
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CFNumberRef value = v36;
    sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = epoch;
    uint64_t v29 = CMSampleBufferCreateCopyWithNewTiming(kCFAllocatorDefault, a2, 1, &sampleTimingArray, &sampleBufferOut);
    if (!v29) {
      uint64_t v29 = sub_A7CC(v33, sampleBufferOut);
    }
    if (sampleBufferOut) {
      CFRelease(sampleBufferOut);
    }
    return v29;
  }
  else
  {
    CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a2, 1u);
    if (SampleAttachmentsArray)
    {
      CFDictionaryRef v32 = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
      if (v32) {
        CFDictionarySetValue(v32, kCMSampleAttachmentKey_DisplayImmediately, kCFBooleanTrue);
      }
    }
    return sub_A7CC(a1, a2);
  }
}

void sub_A710(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTime v6 = *(const void **)(DerivedStorage + 32);
  if (v6)
  {
    CFIndex v7 = _Block_copy(v6);
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = *(NSObject **)(DerivedStorage + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_A958;
    block[3] = &unk_1D240;
    block[4] = v7;
    void block[5] = a2;
    void block[6] = a3;
    dispatch_async(v8, block);
  }
}

uint64_t sub_A7CC(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef v5 = sub_5AD0();
  if (v5) {
    CMSetAttachment(a2, kFigVirtualDisplaySinkAttachment_Quaternion, v5, 1u);
  }
  if (*(unsigned char *)(DerivedStorage + 352))
  {
    memset(&v13, 0, sizeof(v13));
    CMBufferQueueGetDuration(&v13, *(CMBufferQueueRef *)(DerivedStorage + 16));
    CMTime time1 = v13;
    CMTime v11 = *(CMTime *)(DerivedStorage + 340);
    if (CMTimeCompare(&time1, &v11) < 0)
    {
      int v8 = 1;
LABEL_10:
      *(_DWORD *)(DerivedStorage + 364) = v8;
      goto LABEL_11;
    }
    if (*(void *)(DerivedStorage + 32))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      FigCFDictionarySetInt32();
      sub_A710(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, Mutable);
      CFRelease(Mutable);
      int v7 = *(_DWORD *)(DerivedStorage + 364);
      if (v7 <= 30) {
        int v8 = 2 * v7;
      }
      else {
        int v8 = 60;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  if (*(uint64_t *)(DerivedStorage + 296) >= 1
    && CMBufferQueueGetBufferCount(*(CMBufferQueueRef *)(DerivedStorage + 16)) >= *(void *)(DerivedStorage + 296))
  {
    uint64_t v9 = 0;
    if (!v5) {
      return v9;
    }
    goto LABEL_14;
  }
  uint64_t v9 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(DerivedStorage + 16), a2);
  if (v5) {
LABEL_14:
  }
    CFRelease(v5);
  return v9;
}

void sub_A958(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

void sub_A9C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    _Block_release(*(const void **)(a1 + 32));
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

void sub_AA2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 40), 0);
    uint64_t v3 = *(const void **)(a1 + 32);
    _Block_release(v3);
  }
}

uint64_t sub_AA88(uint64_t a1, const AudioStreamBasicDescription *a2, void *a3)
{
  if (!a3) {
    return 4294950525;
  }
  FigEndpointAudioSourceGetClassID();
  uint64_t v5 = CMDerivedObjectCreate();
  if (!v5)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    int v7 = CMMemoryPoolCreate(0);
    *(void *)(DerivedStorage + 24) = v7;
    if (v7 && (CFAllocatorRef Allocator = CMMemoryPoolGetAllocator(v7), (*(void *)(DerivedStorage + 32) = Allocator) != 0))
    {
      CFRetain(Allocator);
      uint64_t v5 = CMAudioFormatDescriptionCreate(kCFAllocatorDefault, a2, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)DerivedStorage);
      if (!v5) {
        *a3 = 0;
      }
    }
    else
    {
      return 4294950526;
    }
  }
  return v5;
}

uint64_t sub_AB78(uint64_t a1, NSObject *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ((a2 != 0) == (a3 != 0))
  {
    uint64_t v6 = DerivedStorage;
    int v7 = *(NSObject **)(DerivedStorage + 8);
    if (v7 != a2)
    {
      if (v7)
      {
        dispatch_release(v7);
        *(void *)(v6 + 8) = 0;
      }
      if (a2)
      {
        *(void *)(v6 + 8) = a2;
        dispatch_retain(a2);
      }
    }
    _Block_release(*(const void **)(v6 + 16));
    *(void *)(v6 + 16) = _Block_copy(a3);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

void sub_AC44()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(const void **)(DerivedStorage + 24);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 24) = 0;
  }
  uint64_t v2 = *(const void **)(DerivedStorage + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 32) = 0;
  }
  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
  _Block_release(*(const void **)(DerivedStorage + 16));
  *(void *)(DerivedStorage + 16) = 0;
  uint64_t v3 = *(NSObject **)(DerivedStorage + 8);
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(DerivedStorage + 8) = 0;
  }
}

__CFString *sub_ACB4(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroAudioSource %p>", a1);
  return Mutable;
}

uint64_t sub_AD0C(const void *a1, const void *a2, size_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMBlockBufferRef blockBufferOut = 0;
  if (!a2) {
    return 4294950525;
  }
  uint64_t v9 = DerivedStorage;
  if (*(void *)(DerivedStorage + 8) && *(void *)(DerivedStorage + 16))
  {
    uint64_t v10 = CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, a3, kCFAllocatorDefault, 0, 0, a3, 1u, &blockBufferOut);
    if (!v10)
    {
      uint64_t v10 = CMBlockBufferReplaceDataBytes(a2, blockBufferOut, 0, a3);
      if (!v10)
      {
        CFRetain(a1);
        CFRetain(blockBufferOut);
        CMTime v11 = *(NSObject **)(v9 + 8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_AE54;
        block[3] = &unk_1D3B8;
        block[4] = a1;
        void block[5] = blockBufferOut;
        void block[6] = a4;
        dispatch_async(v11, block);
      }
    }
  }
  else
  {
    uint64_t v10 = 4294950524;
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return v10;
}

void sub_AE54(uint64_t a1)
{
  uint64_t v2 = *(OpaqueCMBlockBuffer **)(a1 + 40);
  int64_t v3 = *(void *)(a1 + 48);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_OWORD *)&sampleTimingArray.duration.CFNumberRef value = *(_OWORD *)&kCMTimeInvalid.value;
  sampleTimingArray.duration.CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  sampleTimingArray.presentationTimeStamp = sampleTimingArray.duration;
  sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
  CFTypeRef cf = 0;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)DerivedStorage);
  uint64_t v6 = StreamBasicDescription;
  if (StreamBasicDescription->mFormatID == 1819304813) {
    int v7 = (StreamBasicDescription->mFormatFlags >> 5) & 1;
  }
  else {
    int v7 = 1;
  }
  CMTimeMake(&sampleTimingArray.presentationTimeStamp, v3, (int)StreamBasicDescription->mSampleRate);
  CMTimeMake(&v11, 1, (int)v6->mSampleRate);
  sampleTimingArray.duration = v11;
  unint64_t mBytesPerPacket = v6->mBytesPerPacket;
  v11.CFNumberRef value = mBytesPerPacket;
  size_t DataLength = CMBlockBufferGetDataLength(v2);
  if (v7) {
    sampleSizeArray = 0;
  }
  else {
    sampleSizeArray = &v11;
  }
  if (!CMSampleBufferCreate(kCFAllocatorDefault, v2, 1u, 0, 0, *(CMFormatDescriptionRef *)DerivedStorage, DataLength / mBytesPerPacket, 1, &sampleTimingArray, v7 ^ 1u, (const size_t *)sampleSizeArray, (CMSampleBufferRef *)&cf))(*(void (**)(void))(*(void *)(DerivedStorage + 16) + 16))(); {
  if (cf)
  }
    CFRelease(cf);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t sub_AFD0(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v3 = 4294954516;
  if (a2 && a3)
  {
    FigEndpointMessengerGetClassID();
    uint64_t BBufFromPointer = CMDerivedObjectCreate();
    if (BBufFromPointer) {
      return BBufFromPointer;
    }
    uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
    DerivedStorage[2] = CFRetain(a2);
    *uint64_t DerivedStorage = dispatch_queue_create("NeroMessenger", 0);
    NeroTransportRegisterObject();
    uint64_t BBufFromPointer = FigTransportCreateBBufFromPointer();
    if (BBufFromPointer) {
      return BBufFromPointer;
    }
    FigTransportGetRemoteRootObject();
    uint64_t BBufFromPointer = NeroTransportSendSyncMessageCreatingReply();
    if (BBufFromPointer)
    {
      return BBufFromPointer;
    }
    else
    {
      uint64_t v3 = CMBlockBufferCopyDataBytes(0, 0, 8uLL, DerivedStorage + 3);
      if (!v3) {
        *a3 = 0;
      }
    }
  }
  return v3;
}

void sub_B164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v6 = *(void *)(DerivedStorage + 8);
  if (v6)
  {
    if (a3)
    {
      if (FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer()) {
        return;
      }
      uint64_t v6 = *(void *)(DerivedStorage + 8);
    }
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a2, 0);
  }
}

void sub_B200()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  NeroTransportUnregisterObject();
  *(void *)(DerivedStorage + 24) = 0;
  _Block_release(*(const void **)(DerivedStorage + 8));
  *(void *)(DerivedStorage + 8) = 0;
  uint64_t v1 = *(const void **)(DerivedStorage + 16);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 16) = 0;
  }
  if (*(void *)DerivedStorage)
  {
    dispatch_release(*(dispatch_object_t *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
}

__CFString *sub_B264(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroMessenger %p>", a1);
  return Mutable;
}

uint64_t sub_B2BC(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  _Block_release(*(const void **)(DerivedStorage + 8));
  *(void *)(DerivedStorage + 8) = _Block_copy(a2);
  return 0;
}

uint64_t sub_B2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMBaseObjectGetDerivedStorage();
  if (!a3) {
    return NeroTransportSendAsyncMessage();
  }
  uint64_t result = FigRemote_CreateSerializedAtomDataBlockBufferForCFType();
  if (!result) {
    return NeroTransportSendAsyncMessage();
  }
  return result;
}

uint64_t *FigOctaviaHALPlugin_Create(uint64_t a1, const void *a2)
{
  if (FigIsAirplaydEnabled() && !FigServer_IsAirplayd()) {
    return 0;
  }
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  CMTime v4 = &qword_200C8;
  qword_200C8 = FigHALPluginDriverGetInterface();
  if (FigHALAudioObjectMapperCreate() || FigHALAudioCreateStandardPluginObject()) {
    return 0;
  }
  FigAtomicIncrement32();
  return v4;
}

uint64_t sub_B480(uint64_t a1, void *a2)
{
  CFTypeRef cf = 0;
  uint64_t Shared = FigNeroEndpointManagerGetShared(&cf);
  CFTypeRef v4 = cf;
  if (Shared)
  {
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    if (cf) {
      CFTypeRef v4 = CFRetain(cf);
    }
    *a2 = v4;
  }
  return Shared;
}

uint64_t sub_B4DC(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0;
  int v32 = 0;
  CFDictionaryRef dictionaryRepresentation = 0;
  if (!a6)
  {
    FigSignalErrorAt();
    uint64_t v29 = 0;
    goto LABEL_28;
  }
  FigHALAudioStreamGetClassID();
  uint64_t v12 = CMDerivedObjectCreate();
  if (v12) {
    goto LABEL_33;
  }
  uint64_t v12 = FigHALAudioObjectMapperAddMapping();
  if (v12) {
    goto LABEL_33;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)uint64_t DerivedStorage = v32;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(void *)(DerivedStorage + 8) = a5;
  if (a4) {
    CFTypeRef v14 = CFRetain(a4);
  }
  else {
    CFTypeRef v14 = 0;
  }
  *(void *)(DerivedStorage + 24) = v14;
  *(void *)(DerivedStorage + 72) = CFRetain(a6);
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  CFArrayRef v18 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDictionaryRef *))(v17 + 48);
  if (!v18)
  {
    uint64_t v29 = 4294954514;
    goto LABEL_28;
  }
  uint64_t v12 = v18(CMBaseObject, kFigEndpointStreamProperty_OutputLatency, kCFAllocatorDefault, &dictionaryRepresentation);
  if (v12)
  {
LABEL_33:
    uint64_t v29 = v12;
    goto LABEL_28;
  }
  CMTimeMakeFromDictionary((CMTime *)v34, dictionaryRepresentation);
  *(_OWORD *)(DerivedStorage + 32) = *(_OWORD *)v34;
  *(void *)(DerivedStorage + 48) = *(void *)&v34[16];
  CFTypeRef v19 = cf;
  uint64_t v20 = CMBaseObjectGetDerivedStorage();
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  CFDataRef v21 = *(const __CFData **)(*(void *)(v20 + 72) + 88);
  if (v21 && (unint64_t Length = CFDataGetLength(v21), Length > 0x37))
  {
    unint64_t v23 = Length / 0x38;
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v20 + 72) + 88));
    int v25 = 0;
    CMClockRef v26 = BytePtr + 28;
    do
    {
      if (*((_DWORD *)v26 - 5) == 1819304813)
      {
        unsigned int v27 = *(_DWORD *)v26;
        if (*(_DWORD *)v26 <= 2u)
        {
          if (v27 > *(_DWORD *)&v34[28] || v27 == *(_DWORD *)&v34[28] && *((_DWORD *)v26 + 1) > v35)
          {
            *(_OWORD *)CMTimeEpoch v34 = *(_OWORD *)(v26 - 28);
            *(_OWORD *)&v34[16] = *(_OWORD *)(v26 - 12);
            uint64_t v35 = *(void *)(v26 + 4);
            *(void *)CMTimeEpoch v34 = *(void *)(v26 + 12);
          }
          int v25 = 1;
        }
      }
      v26 += 56;
      --v23;
    }
    while (v23);
    if (!v25)
    {
      uint64_t v29 = 4294950405;
      goto LABEL_28;
    }
    uint64_t v28 = sub_C284((uint64_t)v19, (uint64_t)v34);
  }
  else
  {
    uint64_t v28 = FigSignalErrorAt();
  }
  uint64_t v29 = v28;
  if (!v28)
  {
    *a7 = cf;
    CFTypeRef cf = 0;
    goto LABEL_30;
  }
LABEL_28:
  if (cf) {
    CFRelease(cf);
  }
LABEL_30:
  if (dictionaryRepresentation) {
    CFRelease(dictionaryRepresentation);
  }
  return v29;
}

void sub_B7F8()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0;
  }
  uint64_t v2 = (const void *)DerivedStorage[9];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[9] = 0;
  }
  CFUUIDRef v3 = (const void *)DerivedStorage[7];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[7] = 0;
  }
}

CFStringRef sub_B84C()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"NeroAudioOutputStream ID %d Owner %d EndpointStream %p AudioSource %p", *DerivedStorage, DerivedStorage[4], *((void *)DerivedStorage + 3), *((void *)DerivedStorage + 7));
}

uint64_t sub_B8A4(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4) {
    return 4294950405;
  }
  uint64_t v7 = DerivedStorage;
  if (!CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats)) {
    return 4294954509;
  }
  int v8 = *(const void **)(*(void *)(v7 + 72) + 88);
  if (v8) {
    CFTypeRef v9 = CFRetain(v8);
  }
  else {
    CFTypeRef v9 = 0;
  }
  uint64_t result = 0;
  *a4 = v9;
  return result;
}

uint64_t sub_B928()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

uint64_t sub_B944(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }
    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }
  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }
  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }
  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }
  if (v4 || v3 == v5) {
    return 1;
  }
  return result;
}

BOOL sub_BA34(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_BA68(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88)) / 0x38uLL);
    }
    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4;
    }
    return 40;
  }
  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88)) / 0x38uLL);
    }
    return 40;
  }
  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }
  return 4;
}

uint64_t sub_BBB8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, void *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          int32_t v14 = (int)*(double *)(*(void *)(DerivedStorage + 72) + 16);
          CMTime v22 = *(CMTime *)(DerivedStorage + 32);
          CMTimeConvertScale(&v23, &v22, v14, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          int value = v23.value;
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
            *(_DWORD *)a7 = value;
            return result;
          }
          return 561211770;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v16 = 1634956402;
          goto LABEL_37;
        }
        return 561211770;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v16 = 1634689642;
      goto LABEL_37;
    }
    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t result = 0;
        int v16 = *(unsigned __int8 *)(DerivedStorage + 64);
        goto LABEL_37;
      }
      goto LABEL_23;
    }
LABEL_25:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0;
      uint64_t v19 = *(void *)(DerivedStorage + 72);
      long long v20 = *(_OWORD *)(v19 + 16);
      long long v21 = *(_OWORD *)(v19 + 32);
      a7[4] = *(void *)(v19 + 48);
      *(_OWORD *)a7 = v20;
      *((_OWORD *)a7 + 1) = v21;
      return result;
    }
    return 561211770;
  }
  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v16 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }
        return 561211770;
      }
      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v16 = 1936747378;
LABEL_37:
      *(_DWORD *)a7 = v16;
      return result;
    }
    goto LABEL_25;
  }
  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v16 = 1;
      goto LABEL_37;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0;
        *(_DWORD *)a7 = 0;
        return result;
      }
      return 561211770;
    case 1936092513:
LABEL_23:
      size_t v17 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88)) / 0x38uLL);
      *a6 = v17;
      if (v17 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88));
        memcpy(a7, BytePtr, v17);
        return 0;
      }
      return 561211770;
  }
  return result;
}

uint64_t sub_BEB4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, long long *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v12 = 2003332927;
      goto LABEL_16;
    }
    if (a5 == 4)
    {
      int v13 = *(_DWORD *)a6 != 0;
      if (*(unsigned __int8 *)(DerivedStorage + 64) != v13)
      {
        *(unsigned char *)(DerivedStorage + 64) = v13;
        FigHALAudioPropertySendOneChange();
      }
      uint64_t v12 = 0;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v12 = 561211770;
    goto LABEL_16;
  }
  if (a5 != 40) {
    goto LABEL_14;
  }
  long long v15 = *a6;
  long long v16 = a6[1];
  uint64_t v17 = *((void *)a6 + 4);
  uint64_t v12 = FigHALAudioConfigChangeCreateRecord();
  if (!v12)
  {
    *(_OWORD *)&dword_10 = v15;
    *(_OWORD *)&stru_20.cmd = v16;
    *(void *)&stru_20.segname[8] = v17;
    FigHALAudioConfigChangeSendRequest();
  }
LABEL_16:
  FigHALAudioConfigChangeDisposeRecord();
  return v12;
}

uint64_t sub_BFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMBaseObjectGetDerivedStorage();
  if (a2 == 1868984941)
  {
    sub_C284(a1, a3 + 16);
    FigHALAudioPropertySendChanges();
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = FigSignalErrorAt();
  }
  FigHALAudioConfigChangeDisposeRecord();
  return v6;
}

uint64_t sub_C0A4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 64)) {
    return 0;
  }
  uint64_t v1 = DerivedStorage;
  uint64_t v2 = *(void *)(DerivedStorage + 72);
  *(void *)(v2 + 144) = 0;
  uint64_t result = sub_AA88((uint64_t)kCFAllocatorDefault, (const AudioStreamBasicDescription *)(v2 + 96), (void *)(DerivedStorage + 56));
  if (!result)
  {
    uint64_t v4 = *(void *)(v1 + 56);
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = kFigEndpointStreamProperty_AudioSource;
      return v8(CMBaseObject, v9, v4);
    }
    else
    {
      return 4294954514;
    }
  }
  return result;
}

uint64_t sub_C1B4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(const void **)(DerivedStorage + 56);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 56) = 0;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = *(void (**)(uint64_t, void, void))(v4 + 56);
  if (v5) {
    v5(CMBaseObject, kFigEndpointStreamProperty_AudioSource, 0);
  }
  return 0;
}

uint64_t sub_C284(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = DerivedStorage;
  CFTypeRef v19 = 0;
  CFTypeRef cf = 0;
  uint64_t v17 = *(void *)(a2 + 32);
  long long v5 = *(_OWORD *)(a2 + 16);
  v16[0] = *(_OWORD *)a2;
  long long v6 = v16[0];
  v16[1] = v5;
  uint64_t v7 = *(void *)(DerivedStorage + 72);
  *(void *)(v7 + 48) = v17;
  *(_OWORD *)(v7 + 16) = v6;
  *(_OWORD *)(v7 + 32) = v5;
  if (*(_DWORD *)(a2 + 8) == 1819304813) {
    HIDWORD(v16[0]) |= 0x40u;
  }
  uint64_t v8 = sub_139C0(*(void *)(DerivedStorage + 24), v16, &v19, &cf);
  if (!v8)
  {
    uint64_t v9 = *(void *)(v4 + 72);
    int v10 = *(const void **)(v9 + 56);
    CFTypeRef v11 = v19;
    *(void *)(v9 + 56) = v19;
    if (v11) {
      CFRetain(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
    uint64_t v12 = *(void *)(v4 + 72);
    int v13 = *(const void **)(v12 + 64);
    CFTypeRef v14 = cf;
    *(void *)(v12 + 64) = cf;
    if (v14) {
      CFRetain(v14);
    }
    if (v13) {
      CFRelease(v13);
    }
  }
  if (v19) {
    CFRelease(v19);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

uint64_t sub_C380(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v10 = *(void *)(DerivedStorage + 72);
  if (!*(unsigned char *)(v10 + 196)) {
    return 1937010544;
  }
  if (a2 == 1919513701)
  {
    if (*(unsigned char *)(DerivedStorage + 64))
    {
      double v11 = *(double *)(a4 + 144);
      *(double *)(v10 + 144) = v11 + (double)a3;
      int v12 = *(_DWORD *)(v10 + 156);
      uint64_t v13 = *(void *)(DerivedStorage + 56);
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, void, unint64_t))(v15 + 64);
      if (v17)
      {
        return v17(v13, a5, v12 * a3, (unint64_t)v11);
      }
      else
      {
        return 4294954514;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t sub_C508(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 72);
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }
  return 0;
}

uint64_t sub_C548(uint64_t a1, const void *a2, const __CFDictionary *a3, const void *a4, void *a5)
{
  if (a5)
  {
    FigEndpointGetClassID();
    uint64_t v9 = CMDerivedObjectCreate();
    if (!v9)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      dispatch_queue_t v11 = dispatch_queue_create("NeroEndpoint.queue", 0);
      *(void *)(DerivedStorage + 24) = v11;
      if (!v11) {
        return 4294950575;
      }
      dispatch_queue_t v12 = dispatch_queue_create("NeroEndpoint.notification", 0);
      *(void *)(DerivedStorage + 32) = v12;
      if (!v12) {
        return 4294950575;
      }
      if (a2) {
        CFTypeRef v13 = CFRetain(a2);
      }
      else {
        CFTypeRef v13 = 0;
      }
      *(void *)(DerivedStorage + 16) = v13;
      if (a3)
      {
        CFArrayRef Value = CFDictionaryGetValue(a3, kFigTransportDiscoveryDeviceInfoKey_DeviceRef);
        if (Value) {
          CFArrayRef Value = CFRetain(Value);
        }
        *(void *)(DerivedStorage + 40) = Value;
      }
      CFTypeRef v15 = a4 ? CFRetain(a4) : 0;
      *(void *)(DerivedStorage + 48) = v15;
      *(_WORD *)(DerivedStorage + 4) = 0;
      *(unsigned char *)(DerivedStorage + 6) = 0;
      *(void *)(DerivedStorage + 8) = 0;
      CFUUIDRef v16 = CFUUIDCreate(kCFAllocatorDefault);
      if (v16)
      {
        CFUUIDRef v17 = v16;
        *(void *)(DerivedStorage + 56) = CFUUIDCreateString(kCFAllocatorDefault, v16);
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        *a5 = 0;
        CFRelease(v17);
        return 0;
      }
      else
      {
        return 4294950575;
      }
    }
    return v9;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

void sub_C818(const void *a1, int a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v7 = *(NSObject **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_C8C4;
  block[3] = &unk_1D5E0;
  int v9 = a2;
  block[4] = a1;
  void block[5] = a3;
  dispatch_async(v7, block);
}

void sub_C8C4(uint64_t a1)
{
  sub_C920(*(const void **)(a1 + 32), *(_DWORD *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_C920(const void *a1, int a2)
{
  if (!*(unsigned char *)CMBaseObjectGetDerivedStorage())
  {
    if (a2 == 1684628836 || a2 == 1752196144)
    {
      sub_DF20(a1);
    }
    else if (a2 == 1752196145)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (!*(unsigned char *)DerivedStorage
        && !*(void *)(DerivedStorage + 64)
        && !FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer())
      {
        *(unsigned char *)(DerivedStorage + 1) = CFDictionaryContainsKey(0, @"Stevenote");
        CFDictionaryGetValue(0, @"Valeria");
        int v6 = FigCFEqual();
        *(unsigned char *)(DerivedStorage + 2) = v6;
        if (*(unsigned char *)(DerivedStorage + 1))
        {
          sub_4814(*(const void **)(DerivedStorage + 16));
          uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          int v6 = *(unsigned __int8 *)(DerivedStorage + 2);
        }
        if (v6 && FigGetCFPreferenceNumberWithDefault()) {
          SBSSetStatusBarShowsOverridesForRecording();
        }
        if (*(unsigned char *)(DerivedStorage + 1) || *(unsigned char *)(DerivedStorage + 2))
        {
          sub_5B70();
          if (*(unsigned char *)(DerivedStorage + 1))
          {
            uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        *(unsigned char *)(DerivedStorage + 98) = 1;
        MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
        CFDictionaryRef v10 = MutableCopy;
        if (*(unsigned char *)(DerivedStorage + 3)) {
          CFDictionarySetValue(MutableCopy, @"CameraPreview", kCFBooleanTrue);
        }
        if (sub_122A0((int)kCFAllocatorDefault, v10, *(const void **)(DerivedStorage + 48), *(const void **)(DerivedStorage + 16), (void *)(DerivedStorage + 64)))goto LABEL_30; {
        if (*(void *)(DerivedStorage + 32))
        }
        {
          if (*(unsigned char *)(DerivedStorage + 4))
          {
            uint64_t v11 = *(void *)(DerivedStorage + 104);
            CFRetain(a1);
            dispatch_queue_t v12 = *(NSObject **)(DerivedStorage + 32);
            block[0] = _NSConcreteStackBlock;
            block[1] = 0x40000000;
            block[2] = sub_EF08;
            block[3] = &unk_1D888;
            block[4] = DerivedStorage;
            void block[5] = a1;
            void block[6] = v11;
            dispatch_async(v12, block);
LABEL_29:
            *(void *)(DerivedStorage + 8) |= 1uLL;
LABEL_30:
            if (v10) {
              CFRelease(v10);
            }
            return;
          }
        }
        else if (*(unsigned char *)(DerivedStorage + 4))
        {
          goto LABEL_29;
        }
        *(unsigned char *)(DerivedStorage + 5) = 1;
        goto LABEL_29;
      }
    }
  }
}

void sub_CE8C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(NSObject **)(CMBaseObjectGetDerivedStorage() + 24);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_CF28;
  v9[3] = &unk_1D608;
  int v10 = a2;
  void v9[5] = a1;
  v9[6] = a3;
  v9[4] = a4;
  dispatch_sync(v8, v9);
}

void sub_CF28(uint64_t a1)
{
}

void sub_CF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  CFTypeRef cf = 0;
  BOOL v10 = 0;
  if (*DerivedStorage)
  {
    CFTypeRef v9 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 4294955260;
    if (DerivedStorage[1])
    {
      sub_5AB4(a2, a3, &cf, &v10);
      CFTypeRef v9 = cf;
      if (v10) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 4294955260;
      }
    }
    else
    {
      CFTypeRef v9 = 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t, CFTypeRef))(a4 + 16))(a4, v8, v9);
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t sub_CFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v5 = *(NSObject **)(DerivedStorage + 24);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_D0B0;
  v8[3] = &unk_1D630;
  v8[4] = &v9;
  v8[5] = DerivedStorage;
  v8[6] = a1;
  v8[7] = a2;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_D0B0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(const void **)(a1 + 48);
  *(unsigned char *)(v3 + 3) = 1;
  int v4 = sub_D12C(v2, *(void *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *(unsigned char *)(v5 + 4) = 1;
  }
  if (*(unsigned char *)(v5 + 5))
  {
    sub_D7BC(*(const void **)(a1 + 48), 1, kFigEndpointNotification_CameraPreviewStreamChanged);
    *(unsigned char *)(*(void *)(a1 + 40) + 5) = 0;
  }
}

uint64_t sub_D12C(const void *a1, uint64_t a2)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage) {
    return 4294950573;
  }
  uint64_t v5 = DerivedStorage;
  if (DerivedStorage[96]) {
    return 0;
  }
  if (DerivedStorage[1])
  {
    int valuePtr = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ++*((void *)v5 + 13);
  *((void *)v5 + 14) = a2;
  block[17] = _NSConcreteStackBlock;
  block[18] = 0x40000000;
  block[19] = sub_EFB0;
  block[20] = &unk_1D8A8;
  block[21] = a1;
  block[11] = a1;
  block[12] = _NSConcreteStackBlock;
  block[13] = 0x40000000;
  block[14] = sub_F2D8;
  block[15] = &unk_1D8C8;
  void block[16] = a1;
  void block[7] = _NSConcreteStackBlock;
  block[8] = 0x40000000;
  void block[9] = sub_F2E0;
  block[10] = &unk_1D8E8;
  if (*((void *)v5 + 2))
  {
    if (v5[2]) {
      v5[97] = 1;
    }
    goto LABEL_8;
  }
  uint64_t v10 = CMBaseObjectGetDerivedStorage();
  v34[0] = 0;
  CFTypeRef cf = 0;
  if (*(void *)(v10 + 16))
  {
    uint64_t v7 = FigSignalErrorAt();
    CFTypeRef v13 = 0;
    goto LABEL_40;
  }
  uint64_t v11 = v10;
  CFPropertyListRef v12 = CFPreferencesCopyValue(@"neroendpoint_ip", @"com.apple.coremedia", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFTypeRef v13 = v12;
  if (!v12 || (CFTypeID v14 = CFGetTypeID(v12), v14 != CFStringGetTypeID()))
  {
    if (*(void *)(v11 + 48))
    {
      uint64_t CMBaseObject = FigVirtualDisplaySourceGetCMBaseObject();
      uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v21 = v20 ? v20 : 0;
      CMTime v22 = *(void (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFTypeRef *))(v21 + 48);
      if (v22)
      {
        v22(CMBaseObject, @"Destination", kCFAllocatorDefault, v34);
        if (v34[0])
        {
          uint64_t v15 = FigTransportConnectionIDSCreate();
          if (v15) {
            goto LABEL_39;
          }
        }
      }
    }
    goto LABEL_38;
  }
  uint64_t v15 = FigTransportConnectionTCPCreate();
  if (v15)
  {
LABEL_39:
    uint64_t v7 = v15;
    goto LABEL_40;
  }
  uint64_t v16 = NeroTransportConnectionGetCMBaseObject();
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  CMTime v23 = *(uint64_t (**)(uint64_t, void, const void *))(v18 + 56);
  if (v23)
  {
    uint64_t v15 = v23(v16, kFigTransportConnectionTCPProperty_IPAddress, v13);
    if (!v15)
    {
      int valuePtr = FigGetCFPreferenceNumberWithDefault();
      if (valuePtr >= 1)
      {
        CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        uint64_t v25 = NeroTransportConnectionGetCMBaseObject();
        uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v26) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = 0;
        }
        uint64_t v28 = *(void (**)(uint64_t, void, CFNumberRef))(v27 + 56);
        if (v28) {
          v28(v25, kFigTransportConnectionTCPProperty_Port, v24);
        }
        CFRelease(v24);
      }
LABEL_38:
      uint64_t v15 = NeroTransportCreate();
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  uint64_t v7 = 4294954514;
LABEL_40:
  if (v34[0]) {
    CFRelease(v34[0]);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v7) {
    return v7;
  }
  FigTransportGetLocalRootObject();
  uint64_t v7 = NeroTransportRegisterObject();
  if (v7) {
    return v7;
  }
  uint64_t v7 = NeroTransportConnectToReceiver();
  if (v7) {
    return v7;
  }
  v5[97] = 1;
LABEL_8:
  uint64_t v7 = NeroTransportRegisterObjectWithFlags();
  if (!v7)
  {
    v5[96] = 1;
    if (*((void *)v5 + 4) && !v5[3])
    {
      uint64_t v8 = *((void *)v5 + 13);
      CFRetain(a1);
      uint64_t v9 = *((void *)v5 + 4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_F2E8;
      block[3] = &unk_1D908;
      block[4] = a1;
      void block[5] = 0;
      void block[6] = v8;
      dispatch_async(v9, block);
    }
    return 0;
  }
  return v7;
}

void sub_D7BC(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v7 = *(void *)(DerivedStorage + 104);
  CFRetain(a1);
  uint64_t v8 = *(NSObject **)(DerivedStorage + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_F3F0;
  v9[3] = &unk_1D948;
  v9[4] = a1;
  void v9[5] = a2;
  v9[6] = v7;
  void v9[7] = a3;
  dispatch_async(v8, v9);
}

void sub_D868(const void *a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v3 = DerivedStorage[4];
  if (v3)
  {
    dispatch_release(v3);
    DerivedStorage[4] = 0;
  }
  sub_DC78(a1);
  int v4 = (const void *)DerivedStorage[5];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[5] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[6];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[6] = 0;
  }
  uint64_t v6 = DerivedStorage[3];
  if (v6)
  {
    dispatch_release(v6);
    DerivedStorage[3] = 0;
  }
  uint64_t v7 = (const void *)DerivedStorage[7];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[7] = 0;
  }
}

__CFString *sub_D8E8(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroEndpoint %p>", a1);
  return Mutable;
}

uint64_t sub_D940(uint64_t a1, const void *a2, uint64_t a3, __CFArray **a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, kFigEndpointProperty_Type))
  {
    uint64_t v7 = (const CFBooleanRef *)&kFigEndpointType_Nero;
LABEL_3:
    CFStringRef v8 = (const __CFString *)*v7;
LABEL_4:
    uint64_t v9 = (__CFArray *)CFRetain(v8);
LABEL_5:
    uint64_t v10 = v9;
LABEL_6:
    uint64_t result = 0;
    *a4 = v10;
    return result;
  }
  if (*(unsigned char *)DerivedStorage) {
    return 4294950573;
  }
  if (CFEqual(a2, kFigEndpointProperty_Streams))
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!Mutable) {
      return 4294950575;
    }
    CFTypeRef v13 = Mutable;
    CFTypeID v14 = *(const void **)(DerivedStorage + 64);
    if (v14) {
      CFArrayAppendValue(Mutable, v14);
    }
    uint64_t v15 = *(const void **)(DerivedStorage + 72);
    if (v15) {
      CFArrayAppendValue(v13, v15);
    }
    uint64_t result = 0;
    *a4 = v13;
    return result;
  }
  if (CFEqual(a2, kFigEndpointProperty_ID))
  {
    CFStringRef v8 = *(const __CFString **)(DerivedStorage + 56);
    if (!v8)
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  if (CFEqual(a2, kFigEndpointProperty_TransportType))
  {
    uint64_t v7 = (const CFBooleanRef *)&kFigEndpointTransportType_USB;
    goto LABEL_3;
  }
  if (CFEqual(a2, kFigEndpointProperty_Model))
  {
    int v16 = *(unsigned __int8 *)(DerivedStorage + 1);
    CFStringRef v17 = @"Stevenote";
    goto LABEL_23;
  }
  if (CFEqual(a2, kFigEndpointProperty_Name))
  {
    if (!*(unsigned char *)(DerivedStorage + 1))
    {
      uint64_t v9 = (__CFArray *)sub_E814();
      goto LABEL_5;
    }
    goto LABEL_28;
  }
  if (CFEqual(a2, kFigEndpointProperty_IsActivated))
  {
    uint64_t v7 = &kCFBooleanTrue;
    int v18 = *(unsigned __int8 *)(DerivedStorage + 96);
    goto LABEL_31;
  }
  if (!CFEqual(a2, kFigEndpointProperty_Messenger))
  {
    if (CFEqual(a2, @"subType"))
    {
      if (*(unsigned char *)(DerivedStorage + 2))
      {
        CFStringRef v8 = @"Valeria";
        goto LABEL_4;
      }
      if (!*(unsigned char *)(DerivedStorage + 1))
      {
        int v16 = *(unsigned __int8 *)(DerivedStorage + 80);
        CFStringRef v17 = @"Messalina";
LABEL_23:
        if (v16) {
          CFStringRef v8 = v17;
        }
        else {
          CFStringRef v8 = @"Nero";
        }
        goto LABEL_4;
      }
LABEL_28:
      CFStringRef v8 = @"Stevenote";
      goto LABEL_4;
    }
    if (CFEqual(a2, kFigEndpointProperty_AutoconnectEnabled))
    {
      uint64_t v7 = &kCFBooleanTrue;
      goto LABEL_3;
    }
    if (CFEqual(a2, kFigEndpointProperty_ActivatedFeatures))
    {
      CFTypeRef v19 = *(NSObject **)(DerivedStorage + 24);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 0x40000000;
      v20[2] = sub_E87C;
      v20[3] = &unk_1D768;
      v20[4] = a4;
      v20[5] = DerivedStorage;
      dispatch_sync(v19, v20);
      return 0;
    }
    if (!CFEqual(a2, kFigEndpointProperty_ForceMirroringOnly)) {
      return 4294954512;
    }
    uint64_t v7 = &kCFBooleanTrue;
    if (*(unsigned char *)(DerivedStorage + 1)) {
      goto LABEL_3;
    }
    int v18 = *(unsigned __int8 *)(DerivedStorage + 2);
LABEL_31:
    if (!v18) {
      uint64_t v7 = &kCFBooleanFalse;
    }
    goto LABEL_3;
  }
  CFStringRef v8 = *(const __CFString **)(DerivedStorage + 120);
  if (v8) {
    goto LABEL_4;
  }
  uint64_t result = sub_AFD0((uint64_t)kCFAllocatorDefault, *(const void **)(DerivedStorage + 16), (void *)(DerivedStorage + 120));
  if (!result)
  {
    CFStringRef v8 = *(const __CFString **)(DerivedStorage + 120);
    goto LABEL_4;
  }
  return result;
}

void sub_DC78(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 96))
  {
    uint64_t v3 = DerivedStorage;
    uint64_t v4 = *(void *)(DerivedStorage + 112);
    uint64_t v6 = (void *)(DerivedStorage + 104);
    uint64_t v5 = *(void *)(DerivedStorage + 104);
    if (*(unsigned char *)(DerivedStorage + 1))
    {
      int v12 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    sub_DEDC();
    if (*(void *)(v3 + 16))
    {
      if (*(unsigned char *)(v3 + 97)) {
        NeroTransportDisconnectFromReceiver();
      }
      FigTransportGetLocalRootObject();
      NeroTransportUnregisterObject();
      NeroTransportUnregisterObject();
      NeroTransportInvalidate();
      CFStringRef v8 = *(const void **)(v3 + 16);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(v3 + 16) = 0;
      }
    }
    sub_DF20(a1);
    sub_E370(a1);
    *(unsigned char *)(v3 + 96) = 0;
    *(unsigned char *)(v3 + 4) = 0;
    *(void *)(v3 + 8) = 0;
    *uint64_t v6 = 0;
    v6[1] = 0;
    if (*(void *)(v3 + 32))
    {
      CFRetain(a1);
      uint64_t v9 = *(NSObject **)(v3 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_E4B4;
      block[3] = &unk_1D708;
      block[4] = a1;
      void block[5] = v4;
      void block[6] = v5;
      dispatch_async(v9, block);
    }
  }
}

uint64_t sub_DEDC()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  if (*(void *)(result + 88))
  {
    uint64_t v1 = result;
    uint64_t result = NeroTransportSendAsyncMessage();
    *(void *)(v1 + 88) = 0;
  }
  return result;
}

void sub_DF20(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v15 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (*(unsigned char *)(DerivedStorage + 98))
  {
    if (*(unsigned char *)(DerivedStorage + 1) || *(unsigned char *)(DerivedStorage + 2))
    {
      sub_5B70();
      if (*(unsigned char *)(DerivedStorage + 1))
      {
        int v15 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (*(unsigned char *)(DerivedStorage + 2)) {
      SBSSetStatusBarShowsOverridesForRecording();
    }
    if (*(unsigned char *)(DerivedStorage + 1))
    {
      sub_5458();
      int v15 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(unsigned char *)(DerivedStorage + 98) = 0;
  }
  uint64_t v6 = *(void *)(DerivedStorage + 64);
  if (v6)
  {
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 32);
    if (v9) {
      v9(v6);
    }
    uint64_t v10 = *(const void **)(DerivedStorage + 64);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(DerivedStorage + 64) = 0;
    }
    if (*(void *)(DerivedStorage + 32))
    {
      uint64_t v11 = *(void *)(DerivedStorage + 104);
      CFRetain(a1);
      int v12 = *(NSObject **)(DerivedStorage + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_E5F8;
      block[3] = &unk_1D728;
      block[4] = DerivedStorage;
      void block[5] = a1;
      void block[6] = v11;
      dispatch_async(v12, block);
    }
  }
  *(void *)(DerivedStorage + 8) &= ~1uLL;
}

void sub_E370(const void *a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v3 = DerivedStorage[9];
  if (v3)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t))(v5 + 32);
    if (v6) {
      v6(v3);
    }
    uint64_t v7 = (const void *)DerivedStorage[9];
    if (v7)
    {
      CFRelease(v7);
      DerivedStorage[9] = 0;
    }
    if (DerivedStorage[4])
    {
      uint64_t v8 = DerivedStorage[13];
      CFRetain(a1);
      uint64_t v9 = DerivedStorage[4];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 0x40000000;
      v10[2] = sub_E78C;
      v10[3] = &unk_1D748;
      void v10[4] = a1;
      v10[5] = v8;
      dispatch_async(v9, v10);
    }
  }
  DerivedStorage[1] &= ~2uLL;
}

void sub_E4B4(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E534(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

uint64_t sub_E534(const void *a1, uint64_t a2, uint64_t a3, CFMutableDictionaryRef *a4)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v5, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v7 = Mutable;
    FigCFDictionarySetInt64();
    uint64_t result = FigCFDictionarySetInt64();
    *a4 = v7;
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

void sub_E5F8(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E6A0(*(const void **)(a1 + 40), 1, 0, *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);

  CFRelease(v3);
}

uint64_t sub_E6A0(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFMutableDictionaryRef *a5)
{
  CFAllocatorRef v6 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v8 = Mutable;
    FigCFDictionarySetInt64();
    FigCFDictionarySetInt64();
    uint64_t result = FigCFDictionarySetInt64();
    *a5 = v8;
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

void sub_E78C(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E6A0(*(const void **)(a1 + 32), 2, 0, *(void *)(a1 + 40), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

CFStringRef sub_E814()
{
  if (qword_200E8 != -1) {
    dispatch_once(&qword_200E8, &stru_1D7A8);
  }
  uint64_t v0 = (__CFBundle *)qword_200F8;

  return CFBundleCopyLocalizedString(v0, @"plou", @"plou", @"Localizable");
}

uint64_t sub_E87C(uint64_t a1)
{
  uint64_t result = FigCFNumberCreateUInt64();
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_E8BC(id a1)
{
  qword_200F0 = (uint64_t)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/Library/Audio/Plug-Ins/HAL/VirtualAudio.plugin", kCFURLPOSIXPathStyle, 1u);
  CFBundleRef v1 = CFBundleCreate(kCFAllocatorDefault, (CFURLRef)qword_200F0);
  qword_200F8 = (uint64_t)v1;
  if (v1) {
    CFRetain(v1);
  }
  CFMutableDictionaryRef v2 = (const void *)qword_200F0;
  if (qword_200F0)
  {
    CFRelease(v2);
  }
}

uint64_t sub_E944(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  uint64_t v10 = *(NSObject **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_EB4C;
  block[3] = &unk_1D7E8;
  block[4] = a1;
  void block[5] = a2;
  void block[6] = a4;
  void block[7] = DerivedStorage;
  block[8] = a5;
  dispatch_async(v10, block);
  return 0;
}

uint64_t sub_E9F8(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  CFMutableDictionaryRef v8 = *(NSObject **)(DerivedStorage + 24);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_ECC0;
  v10[3] = &unk_1D828;
  void v10[4] = a1;
  v10[5] = a3;
  void v10[6] = DerivedStorage;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0;
}

uint64_t sub_EA9C(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v3 = DerivedStorage;
    *(unsigned char *)uint64_t DerivedStorage = 1;
    CFMutableDictionaryRef v4 = *(const void **)(DerivedStorage + 120);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v3 + 120) = 0;
    }
    CFRetain(a1);
    CFAllocatorRef v5 = *(NSObject **)(v3 + 24);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_EDD0;
    v7[3] = &unk_1D868;
    v7[4] = v3;
    v7[5] = a1;
    dispatch_sync(v5, v7);
  }
  return 0;
}

void sub_EB4C(uint64_t a1)
{
  int v2 = sub_D12C(*(const void **)(a1 + 32), *(void *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    int v3 = v2;
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 104);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    CFAllocatorRef v5 = *(NSObject **)(*(void *)(a1 + 56) + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000;
    v8[2] = sub_EC78;
    v8[3] = &unk_1D7C8;
    uint64_t v6 = *(void *)(a1 + 32);
    v8[4] = *(void *)(a1 + 48);
    v8[5] = v6;
    v8[6] = 0;
    v8[7] = v4;
    int v9 = v3;
    void v8[8] = *(void *)(a1 + 64);
    dispatch_async(v5, v8);
    if (!v3) {
      *(unsigned char *)(*(void *)(a1 + 56) + 4) = 1;
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v7 + 5))
  {
    sub_D7BC(*(const void **)(a1 + 32), 1, kFigEndpointNotification_StreamsChanged);
    uint64_t v7 = *(void *)(a1 + 56);
    *(unsigned char *)(v7 + 5) = 0;
  }
  if (*(unsigned char *)(v7 + 6))
  {
    sub_D7BC(*(const void **)(a1 + 32), 2, kFigEndpointNotification_StreamsChanged);
    *(unsigned char *)(*(void *)(a1 + 56) + 6) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_EC78(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 64));
  int v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_ECC0(uint64_t a1)
{
  sub_DC78(*(const void **)(a1 + 32));
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    CFAllocatorRef v5 = *(NSObject **)(*(void *)(a1 + 48) + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_ED88;
    v6[3] = &unk_1D808;
    int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    uint64_t v8 = v4;
    uint64_t v9 = v3;
    int v11 = 0;
    uint64_t v10 = *(void *)(a1 + 56);
    dispatch_async(v5, v6);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_ED88(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 64));
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_EDD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 112);
  sub_DC78(*(const void **)(a1 + 40));
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    CFRetain(*(CFTypeRef *)(a1 + 40));
    CFAllocatorRef v5 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_EE88;
    block[3] = &unk_1D848;
    block[4] = *(void *)(a1 + 40);
    void block[5] = v4;
    void block[6] = v3;
    dispatch_async(v5, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_EE88(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E534(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

void sub_EF08(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E6A0(*(const void **)(a1 + 40), 1, 1, *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);

  CFRelease(v3);
}

void sub_EFB0(uint64_t a1, int a2, OpaqueCMBlockBuffer *a3)
{
  CFAllocatorRef v5 = *(const void **)(a1 + 32);
  int destination = 0;
  if (*(unsigned char *)CMBaseObjectGetDerivedStorage()) {
    return;
  }
  if (a2 <= 1700885553)
  {
    if (a2 == 1651470958)
    {
      if (a3) {
        CMBlockBufferCopyDataBytes(a3, 0, 4uLL, &destination);
      }
      block[0] = 0;
      int v16 = 0;
      int v12 = (void *)(CMBaseObjectGetDerivedStorage() + 88);
      if (*v12) {
        sub_DEDC();
      }
      if (!FigTransportCreateBBufFromPointer())
      {
        FigTransportGetRemoteRootObject();
        if (!NeroTransportSendSyncMessageCreatingReply() && CMBlockBufferGetDataLength(v16) == 8) {
          CMBlockBufferCopyDataBytes(v16, 0, 8uLL, v12);
        }
      }
      if (block[0]) {
        CFRelease(block[0]);
      }
      goto LABEL_38;
    }
    if (a2 != 1684628836) {
      return;
    }
LABEL_22:
    sub_E370(v5);
    return;
  }
  if (a2 != 1700885554)
  {
    if (a2 != 1752195376)
    {
      if (a2 != 1752195377) {
        return;
      }
      int v16 = 0;
      int value = 0;
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(unsigned char *)DerivedStorage) {
        goto LABEL_38;
      }
      uint64_t v7 = DerivedStorage;
      if (!*(void *)(DerivedStorage + 88)
        || *(void *)(DerivedStorage + 72)
        || FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer())
      {
        goto LABEL_38;
      }
      if (CFDictionaryGetValueIfPresent(v16, @"inputFormats", (const void **)&value)) {
        *(unsigned char *)(v7 + 80) = 1;
      }
      uint64_t v8 = *(const void **)(v7 + 56);
      uint64_t v9 = CFDictionaryGetValue(v16, @"deviceUID");
      *(void *)(v7 + 56) = v9;
      if (v9) {
        CFRetain(v9);
      }
      if (v8) {
        CFRelease(v8);
      }
      if (sub_135CC((uint64_t)kCFAllocatorDefault, v16, *(const void **)(v7 + 56), *(void *)(v7 + 88), *(const void **)(v7 + 16), (void *)(v7 + 72)))goto LABEL_38; {
      if (*(void *)(v7 + 32))
      }
      {
        if (*(unsigned char *)(v7 + 4))
        {
          uint64_t v10 = *(const void **)(v7 + 104);
          CFRetain(v5);
          int v11 = *(NSObject **)(v7 + 32);
          block[0] = _NSConcreteStackBlock;
          block[1] = (CFTypeRef)0x40000000;
          block[2] = sub_F368;
          block[3] = &unk_1D928;
          block[4] = v5;
          void block[5] = v10;
          dispatch_async(v11, block);
LABEL_43:
          *(void *)(v7 + 8) |= 2uLL;
LABEL_38:
          if (v16) {
            CFRelease(v16);
          }
          return;
        }
      }
      else if (*(unsigned char *)(v7 + 4))
      {
        goto LABEL_43;
      }
      *(unsigned char *)(v7 + 6) = 1;
      goto LABEL_43;
    }
    goto LABEL_22;
  }
  CMBaseObjectGetDerivedStorage();

  sub_13C68();
}

void sub_F2D8(uint64_t a1, int a2)
{
}

void sub_F2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_F2E8(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E534(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

void sub_F368(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E6A0(*(const void **)(a1 + 32), 2, 1, *(void *)(a1 + 40), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

void sub_F3F0(uint64_t a1)
{
  CFMutableDictionaryRef v4 = 0;
  sub_E6A0(*(const void **)(a1 + 32), *(void *)(a1 + 40), 1, *(void *)(a1 + 48), &v4);
  CMNotificationCenterGetDefaultLocalCenter();
  CFMutableDictionaryRef v2 = v4;
  CMNotificationCenterPostNotification();
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

uint64_t FigNeroEndpointManagerGetShared(void *a1)
{
  if (qword_20100 == -1)
  {
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_20100, &stru_1D988);
  if (a1) {
LABEL_3:
  }
    *a1 = qword_20110;
LABEL_4:
  if (!dword_20108) {
    return 0;
  }
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return dword_20108;
}

void sub_F5F0(id a1)
{
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (FigIsAirplaydEnabled())
  {
    CFMutableDictionaryRef v2 = getprogname();
    if (!strcmp(v2, "audiomxd"))
    {
      LODWORD(block[0]) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      CFAllocatorRef v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v32 = FigEndpointManagerRemoteCopyNeroManager();
      if (v32)
      {
        int v4 = v32;
        goto LABEL_48;
      }
LABEL_41:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        int v4 = CMSessionMgrRegisterEndpointManager();
        if (v4) {
          goto LABEL_48;
        }
      }
      if (_os_feature_enabled_impl())
      {
        if (!FigIsAirplaydEnabled())
        {
          if (!in_audio_mx_server_process()) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
        if (FigServer_IsAirplayd()) {
LABEL_46:
        }
          FigTransportXPCConnectionServerStart();
      }
LABEL_47:
      int v4 = 0;
      goto LABEL_48;
    }
  }
  LODWORD(block[0]) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  uint64_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  CFTypeRef cf = 0;
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    int v4 = -12782;
    goto LABEL_48;
  }
  FigEndpointManagerGetClassID();
  int v4 = CMDerivedObjectCreate();
  if (v4) {
    goto LABEL_5;
  }
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v7 = dispatch_queue_create("NeroEndpointManager.queue", 0);
  DerivedStorage[1] = v7;
  if (v7)
  {
    dispatch_async(v7, &stru_1DA20);
    dispatch_queue_t v8 = dispatch_queue_create("NeroEndpointManager.notification", 0);
    DerivedStorage[2] = v8;
    if (v8)
    {
      v49 = _NSConcreteStackBlock;
      uint64_t v50 = 0x40000000;
      uint64_t v51 = sub_103BC;
      CMTimeEpoch v52 = &unk_1DA40;
      CFTypeRef v53 = cf;
      uint64_t SharedDiscovery = FigTransportDiscoveryGetSharedDiscovery();
      DerivedStorage[4] = FigTransportDiscoveryAddEventHandler();
      if (FigGetCFPreferenceNumberWithDefault())
      {
        dispatch_time_t v9 = dispatch_time(0, 5000000000);
        uint64_t v10 = DerivedStorage[1];
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_105EC;
        block[3] = &unk_1DA60;
        block[4] = cf;
        dispatch_after(v9, v10, block);
      }
      v55[0] = 0;
      if (qword_20148 != -1) {
        dispatch_once(&qword_20148, &stru_1DB88);
      }
      FigCFWeakReferenceTableAddValueAndGetKey();
      DerivedStorage[10] = v55[0];
      if (!FigIsAirplaydEnabled()) {
        goto LABEL_38;
      }
      dispatch_queue_t v11 = dispatch_queue_create("NeroEndpointManager.pluginregister", 0);
      DerivedStorage[3] = v11;
      if (v11)
      {
        CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
        uint64_t v44 = 0;
        CFStringAppendFormat(Mutable, 0, @"/System/Library/Audio/Plug-Ins/HAL/%@", @"OctaviaHalogen.driver");
        CFURLRef v13 = CFURLCreateWithFileSystemPath(0, Mutable, kCFURLPOSIXPathStyle, 1u);
        if (v13)
        {
          CFURLRef v14 = v13;
          CFPlugInRef v15 = CFPlugInCreate(0, v13);
          if (v15)
          {
            int v16 = v15;
            CFUUIDRef v17 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
            CFArrayRef FactoriesForPlugInTypeInPlugIn = CFPlugInFindFactoriesForPlugInTypeInPlugIn(v17, v16);
            if (FactoriesForPlugInTypeInPlugIn)
            {
              CFArrayRef v19 = FactoriesForPlugInTypeInPlugIn;
              if (CFArrayGetCount(FactoriesForPlugInTypeInPlugIn) <= 0)
              {
                *(_DWORD *)signed int v43 = 0;
                os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
                CMTime v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v38 = *(_DWORD *)v43;
                if (os_log_type_enabled(v37, v42)) {
                  unsigned int v39 = v38;
                }
                else {
                  unsigned int v39 = v38 & 0xFFFFFFFE;
                }
                if (v39)
                {
                  *(_DWORD *)os_log_type_t type = 136315138;
                  v46 = "nmanager_createFigNeroHALDriver";
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              else
              {
                CFUUIDRef ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v19, 0);
                if (ValueAtIndex)
                {
                  CFUUIDRef v21 = ValueAtIndex;
                  CFUUIDRef v22 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
                  CMTime v23 = CFPlugInInstanceCreate(0, v21, v22);
                  if (v23)
                  {
                    CFNumberRef v24 = v23;
                    uint64_t v25 = *(void (**)(void *, void, void, uint64_t *))(*(void *)v23 + 8);
                    CFUUIDRef v26 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u);
                    CFUUIDBytes v27 = CFUUIDGetUUIDBytes(v26);
                    v25(v24, *(void *)&v27.byte0, *(void *)&v27.byte8, &v44);
                    (*(void (**)(void *))(*(void *)v24 + 24))(v24);
                  }
                }
              }
              CFRelease(v14);
            }
            else
            {
              CFArrayRef v19 = v14;
            }
            CFRelease(v19);
          }
          else
          {
            int v16 = v14;
          }
          CFRelease(v16);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        uint64_t v28 = v44;
        DerivedStorage[9] = v44;
        if (v28)
        {
          LODWORD(v44) = 0;
          v43[0] = OS_LOG_TYPE_DEFAULT;
          uint64_t v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v30 = v44;
          if (os_log_type_enabled(v29, v43[0])) {
            unsigned int v31 = v30;
          }
          else {
            unsigned int v31 = v30 & 0xFFFFFFFE;
          }
          if (v31)
          {
            *(_DWORD *)os_log_type_t type = 136315394;
            v46 = "nmanager_create";
            __int16 v47 = 2048;
            CFTypeRef v48 = cf;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          sub_10804(cf, 0);
LABEL_38:
          CFTypeRef v33 = cf;
          uint64_t v34 = CMBaseObjectGetDerivedStorage();
          if (!*(unsigned char *)(v34 + 40))
          {
            uint64_t v35 = v34;
            FigTransportDiscoveryGetSharedDiscovery();
            long long v36 = *(NSObject **)(v35 + 8);
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 0x40000000;
            v55[2] = sub_12290;
            v55[3] = &unk_1DD68;
            v55[4] = v33;
            dispatch_async(v36, v55);
            FigTransportDiscoveryStart();
            *(unsigned char *)(v35 + 40) = 1;
          }
          qword_20110 = (uint64_t)cf;
          goto LABEL_41;
        }
      }
    }
  }
  int v4 = -16711;
LABEL_5:
  if (cf) {
    CFRelease(cf);
  }
LABEL_48:
  dword_20108 = v4;
}

uint64_t FigNeroEndpointManagerForCameraPreviewGetShared(void *a1)
{
  if (qword_20118 == -1)
  {
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_20118, &stru_1D9C8);
  if (a1) {
LABEL_3:
  }
    *a1 = qword_20128;
LABEL_4:
  if (!dword_20120) {
    return 0;
  }
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return dword_20120;
}

void sub_100D8(id a1)
{
  if (qword_20110)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v3 = 0;
    qword_20128 = qword_20110;
  }
  else
  {
    CFMutableDictionaryRef v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (FigGetCFPreferenceNumberWithDefault())
    {
      FigEndpointManagerGetClassID();
      int v3 = CMDerivedObjectCreate();
      if (!v3)
      {
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
        CFAllocatorRef v5 = dispatch_queue_create("NeroEndpointManager.queue", 0);
        *(void *)(DerivedStorage + 8) = v5;
        if (v5)
        {
          dispatch_async(v5, &stru_1DDA8);
          dispatch_queue_t v6 = dispatch_queue_create("NeroEndpointManager.notification", 0);
          *(void *)(DerivedStorage + 16) = v6;
          if (v6)
          {
            int v3 = 0;
            qword_20128 = 0;
          }
          else
          {
            int v3 = -16711;
          }
        }
        else
        {
          int v3 = -16711;
        }
      }
    }
    else
    {
      int v3 = -12782;
    }
  }
  dword_20120 = v3;
}

void sub_103B4(id a1)
{
}

void sub_103BC(uint64_t a1, int a2, const __CFDictionary *a3)
{
  CFAllocatorRef v5 = *(const void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (!*DerivedStorage)
  {
    dispatch_queue_t v8 = DerivedStorage;
    switch(a2)
    {
      case 3:
        dispatch_time_t v10 = dispatch_time(0, 10000000000);
        dispatch_queue_t v11 = *((void *)v8 + 1);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_11D90;
        block[3] = &unk_1DCC8;
        block[4] = v6;
        dispatch_after(v10, v11, block);
        break;
      case 2:
        sub_11574(v5, 0);
        break;
      case 1:
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (!*((void *)v8 + 6)) {
          sub_10604(v5, 0, a3, 0, 0);
        }
        break;
    }
  }
}

void sub_105EC(uint64_t a1)
{
}

void sub_10604(const void *a1, int a2, const __CFDictionary *a3, const void *a4, int a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  dispatch_queue_t v11 = (void *)DerivedStorage;
  if (!a2)
  {
    if (!a5)
    {
      sub_10E60();
      int v12 = 0;
      goto LABEL_11;
    }
    int v12 = 0;
LABEL_6:
    if (sub_C548((uint64_t)kCFAllocatorDefault, v12, a3, a4, (void *)(DerivedStorage + 56))
      || sub_CFEC(v11[7], 1)
      || !v11[2])
    {
      goto LABEL_15;
    }
    CFRetain(a1);
    CFURLRef v13 = v11[2];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    _OWORD v16[2] = sub_11D98;
    v16[3] = &unk_1DCE8;
    v16[4] = a1;
    CFURLRef v14 = v16;
    goto LABEL_14;
  }
  int v12 = *(const void **)(DerivedStorage + 64);
  *(void *)(DerivedStorage + 64) = 0;
  if (a5) {
    goto LABEL_6;
  }
LABEL_11:
  if (sub_C548((uint64_t)kCFAllocatorDefault, v12, a3, a4, v11 + 6)) {
    goto LABEL_15;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  if (!v11[2]) {
    goto LABEL_15;
  }
  CFRetain(a1);
  CFURLRef v13 = v11[2];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000;
  v15[2] = sub_11DEC;
  v15[3] = &unk_1DD08;
  v15[4] = a1;
  CFURLRef v14 = v15;
LABEL_14:
  dispatch_async(v13, v14);
LABEL_15:
  if (v12) {
    CFRelease(v12);
  }
}

void sub_10804(const void *a1, unsigned int a2)
{
  if (a1)
  {
    CFRetain(a1);
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * a2);
    uint64_t v6 = *(NSObject **)(DerivedStorage + 24);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_11E40;
    v7[3] = &unk_1DD48;
    v7[4] = DerivedStorage;
    v7[5] = a1;
    dispatch_after(v5, v6, v7);
  }
}

uint64_t sub_108B8()
{
  uint64_t SharedDiscovery = FigTransportDiscoveryGetSharedDiscovery();
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (!*DerivedStorage)
  {
    CFMutableDictionaryRef v2 = DerivedStorage;
    *uint64_t DerivedStorage = 1;
    if (SharedDiscovery)
    {
      uint64_t v3 = CMBaseObjectGetDerivedStorage();
      if (*(unsigned char *)(v3 + 40))
      {
        uint64_t v4 = v3;
        FigTransportDiscoveryGetSharedDiscovery();
        sub_10E60();
        FigTransportDiscoveryStop();
        *(unsigned char *)(v4 + 40) = 0;
      }
      dispatch_time_t v5 = v2[1];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 0x40000000;
      v17[2] = sub_10E50;
      v17[3] = &unk_1DB08;
      v17[4] = SharedDiscovery;
      v17[5] = v2;
      dispatch_sync(v5, v17);
    }
    uint64_t v6 = v2[6];
    if (v6)
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      dispatch_time_t v9 = *(void (**)(uint64_t))(v8 + 32);
      if (v9) {
        v9(v6);
      }
      dispatch_time_t v10 = (const void *)v2[6];
      if (v10)
      {
        CFRelease(v10);
        v2[6] = 0;
      }
    }
    uint64_t v11 = v2[7];
    if (v11)
    {
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      CFURLRef v14 = *(void (**)(uint64_t))(v13 + 32);
      if (v14) {
        v14(v11);
      }
      CFPlugInRef v15 = (const void *)v2[7];
      if (v15)
      {
        CFRelease(v15);
        v2[7] = 0;
      }
    }
  }
  return 0;
}

void sub_10AD0()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  CFBundleRef v1 = DerivedStorage[2];
  if (v1)
  {
    dispatch_release(v1);
    DerivedStorage[2] = 0;
  }
  sub_108B8();
  CFMutableDictionaryRef v2 = DerivedStorage[3];
  if (v2)
  {
    dispatch_release(v2);
    DerivedStorage[3] = 0;
  }
  if (qword_20148 != -1) {
    dispatch_once(&qword_20148, &stru_1DB88);
  }
  FigCFWeakReferenceTableRemoveValue();
  uint64_t v3 = DerivedStorage[9];
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
    DerivedStorage[9] = 0;
  }
  uint64_t v4 = DerivedStorage[1];
  if (v4)
  {
    dispatch_release(v4);
    DerivedStorage[1] = 0;
  }
}

__CFString *sub_10B84(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroEndpointManager %p>", a1);
  return Mutable;
}

uint64_t sub_10BDC(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, @"ValeriaConnected"))
  {
    if (!a3 || (CFTypeID v7 = CFGetTypeID(a3), v7 != CFBooleanGetTypeID()))
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 0;
    }
    uint64_t v8 = *(NSObject **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_110DC;
    block[3] = &unk_1DBA8;
    block[4] = a3;
    void block[5] = a1;
    dispatch_time_t v9 = block;
LABEL_5:
    dispatch_async(v8, v9);
    return 0;
  }
  if (CFEqual(a2, @"CustomEndpoint"))
  {
    if (qword_20150 != -1) {
      dispatch_once(&qword_20150, &stru_1DBE8);
    }
    if (byte_20158) {
      return 0;
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = *(NSObject **)(DerivedStorage + 8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 0x40000000;
    v12[2] = sub_11358;
    v12[3] = &unk_1DC08;
    v12[4] = a3;
    v12[5] = a1;
    dispatch_time_t v9 = v12;
    goto LABEL_5;
  }
  return 4294954512;
}

uint64_t sub_10E50(uint64_t a1)
{
  return _FigTransportDiscoveryRemoveEventHandler(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 32));
}

void sub_10E60()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (qword_20138 != -1) {
    dispatch_once(&qword_20138, &stru_1DB48);
  }
  if ((byte_20130 & 1) == 0 && *(void *)(DerivedStorage + 64))
  {
    NeroTransportStopAcceptingConnections();
    FigTransportGetLocalRootObject();
    NeroTransportUnregisterObject();
    NeroTransportInvalidate();
    CFBundleRef v1 = *(const void **)(DerivedStorage + 64);
    if (v1)
    {
      CFRelease(v1);
      *(void *)(DerivedStorage + 64) = 0;
    }
  }
}

void sub_10EF0(id a1)
{
  uint64_t v1 = MGCopyAnswer();
  if (v1)
  {
    CFMutableDictionaryRef v2 = (const void *)v1;
    CFURLRef v3 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/AppleInternal/Applications/Stevenote.app/Stevenote", kCFURLPOSIXPathStyle, 0);
    if (v3)
    {
      CFURLRef v4 = v3;
      if (FigFileDoesFileExist()) {
        byte_20130 = 1;
      }
      CFRelease(v4);
    }
    CFRelease(v2);
  }
}

void sub_10F88(id a1)
{
  if (FigCFWeakReferenceTableCreate())
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    __break(1u);
  }
}

void sub_110DC(uint64_t a1)
{
  CFBooleanRef v2 = *(const __CFBoolean **)(a1 + 32);
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v2 == kCFBooleanTrue) {
    sub_110FC(v1);
  }
  else {
    sub_112C8((uint64_t)v1);
  }
}

void sub_110FC(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  int v4 = 10;
  while (1)
  {
    CFBooleanRef v5 = (const __CFBoolean *)lockdown_copy_trustedHostAttached();
    if (v5 == kCFBooleanTrue) {
      break;
    }
    if (v5) {
      CFRelease(v5);
    }
    FigUSleep();
    if (!--v4)
    {
      if (kCFBooleanTrue)
      {
        sub_112C8((uint64_t)a1);
        return;
      }
      break;
    }
  }
  if (!*(void *)(DerivedStorage + 48))
  {
    if (FigIsAirplaydEnabled())
    {
      sub_11800(a1);
      if (!*(void *)(DerivedStorage + 64) || NeroTransportStartAcceptingConnections()) {
        goto LABEL_14;
      }
      NeroTransportSetAsConnected();
    }
    sub_10604(a1, 1, 0, 0, 0);
  }
LABEL_14:
  if (kCFBooleanTrue) {
    CFRelease(kCFBooleanTrue);
  }
}

uint64_t sub_112C8(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  if (result)
  {
    return sub_11574(a1, 0);
  }
  return result;
}

void sub_11314(id a1)
{
  if (!FigGetCFPreferenceNumberWithDefault()) {
    byte_20158 = 1;
  }
}

void sub_11358(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    sub_10604(*(const void **)(a1 + 40), 0, 0, *(const void **)(a1 + 32), 1);
  }
  else
  {
    CFURLRef v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    sub_11574(*(const void **)(a1 + 40), 1);
  }
  int v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
}

void sub_11574(const void *a1, int a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = DerivedStorage;
  if (a2)
  {
    uint64_t v6 = *(const void **)(DerivedStorage + 56);
    if (v6)
    {
      *(void *)(DerivedStorage + 56) = 0;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v12 = *(void (**)(const void *))(v8 + 32);
      if (v12) {
        v12(v6);
      }
      CFRelease(v6);
      if (*(void *)(v5 + 16))
      {
        CFRetain(a1);
        uint64_t v13 = *(NSObject **)(v5 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_11B34;
        block[3] = &unk_1DC68;
        block[4] = a1;
        dispatch_async(v13, block);
      }
    }
  }
  else
  {
    dispatch_time_t v9 = *(const void **)(DerivedStorage + 48);
    if (v9)
    {
      *(void *)(DerivedStorage + 48) = 0;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterRemoveListener();
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterRemoveListener();
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      CFURLRef v14 = *(void (**)(const void *))(v11 + 32);
      if (v14) {
        v14(v9);
      }
      CFRelease(v9);
      if (*(void *)(v5 + 16))
      {
        CFRetain(a1);
        CFPlugInRef v15 = *(NSObject **)(v5 + 16);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 0x40000000;
        _OWORD v16[2] = sub_11C2C;
        v16[3] = &unk_1DC88;
        v16[4] = a1;
        dispatch_async(v15, v16);
      }
    }
    sub_11CA0();
  }
}

void sub_11800()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(void *)(DerivedStorage + 64))
  {
    uint64_t v1 = DerivedStorage;
    if (!FigTransportConnectionUSBCreate())
    {
      uint64_t CMBaseObject = NeroTransportConnectionGetCMBaseObject();
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
      uint64_t v5 = *(unsigned int (**)(uint64_t, void, void))(v4 + 56);
      if (v5
        && !v5(CMBaseObject, kFigTransportConnectionUSBProperty_InterfaceName, kFigTransportConnectionUSBInterfaceName_Valeria)&& !NeroTransportCreate())
      {
        FigTransportGetLocalRootObject();
        if (!NeroTransportRegisterObject()) {
          *(void *)(v1 + 64) = 0;
        }
      }
    }
  }
}

void sub_119F0(uint64_t a1, int a2, const void *a3)
{
  uint64_t v5 = *(const void **)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v7 = DerivedStorage;
    if (a2 == 1684628836)
    {
      dispatch_time_t v9 = *(const void **)(DerivedStorage + 48);
      if (v9) {
        sub_C818(v9, 1684628836, a3);
      }
      sub_112C8((uint64_t)v5);
    }
    else
    {
      if (a2 == 1651470958) {
        sub_110FC(v5);
      }
      uint64_t v8 = *(const void **)(v7 + 48);
      if (v8)
      {
        sub_C818(v8, a2, a3);
      }
    }
  }
}

void sub_11AC8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(CMBaseObjectGetDerivedStorage() + 48);
  if (v7)
  {
    sub_CE8C(v7, a2, a3, a4);
  }
}

void sub_11B34(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFBooleanRef v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_11B88(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 16))
  {
    uint64_t v5 = DerivedStorage;
    CFRetain(a2);
    uint64_t v6 = *(NSObject **)(v5 + 16);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_11D3C;
    v7[3] = &unk_1DCA8;
    v7[4] = a1;
    v7[5] = a2;
    dispatch_async(v6, v7);
  }
}

void sub_11C2C(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFBooleanRef v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_11CA0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!FigIsAirplaydEnabled() || !FigServer_IsAirplayd())
  {
    if (qword_20138 != -1) {
      dispatch_once(&qword_20138, &stru_1DB48);
    }
    if ((byte_20130 & 1) == 0 && !*(void *)(DerivedStorage + 64))
    {
      sub_11800();
      NeroTransportStartAcceptingConnections();
    }
  }
}

void sub_11D3C(uint64_t a1)
{
  CMNotificationCenterPostNotification();
  CFBooleanRef v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

uint64_t sub_11D90()
{
  return FigTransportDiscoveryStart();
}

void sub_11D98(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFBooleanRef v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_11DEC(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFBooleanRef v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_11E40(uint64_t a1)
{
  int v2 = AudioServerPlugInRegisterRemote();
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (v2)
  {
    uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    sub_10804(*(void *)(a1 + 40), 5);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_120FC()
{
  if (qword_20148 != -1) {
    dispatch_once(&qword_20148, &stru_1DB88);
  }
  uint64_t v0 = FigCFWeakReferenceTableCopyValue();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    sub_10804(v1, 5);
    CFRelease(v1);
  }
}

void sub_12290()
{
}

void sub_12298(id a1)
{
}

uint64_t sub_122A0(int a1, CFDictionaryRef theDict, const void *a3, const void *a4, void *a5)
{
  if (a5)
  {
    CFArrayRef Value = CFDictionaryGetValue(theDict, @"DisplaySize");
    if (!Value) {
      return 4294950536;
    }
    uint64_t v10 = Value;
    CFBooleanRef v11 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"IsOverscanned");
    FigEndpointStreamGetClassID();
    uint64_t v12 = CMDerivedObjectCreate();
    if (!v12)
    {
      if (v11) {
        CFBooleanRef v13 = v11;
      }
      else {
        CFBooleanRef v13 = kCFBooleanFalse;
      }
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(void *)(DerivedStorage + 8) = CFRetain(v10);
      *(void *)(DerivedStorage + 16) = CFRetain(v13);
      if (a3) {
        CFTypeRef v15 = CFRetain(a3);
      }
      else {
        CFTypeRef v15 = 0;
      }
      *(void *)(DerivedStorage + 56) = v15;
      *(void *)(DerivedStorage + 72) = a4;
      if (a4) {
        CFRetain(a4);
      }
      dispatch_queue_t v16 = dispatch_queue_create("NeroEndpointScreenStream.queue", 0);
      *(void *)(DerivedStorage + 32) = v16;
      if (v16)
      {
        dispatch_queue_t v17 = dispatch_queue_create("NeroEndpointScreenStream.notification", 0);
        *(void *)(DerivedStorage + 40) = v17;
        if (v17)
        {
          CFDictionaryGetValue(theDict, @"Valeria");
          *(unsigned char *)(DerivedStorage + 48) = FigCFEqual();
          CFDictionaryGetValue(theDict, @"CameraPreview");
          *(unsigned char *)(DerivedStorage + 80) = FigCFEqual();
          CFDictionaryGetValue(theDict, @"H264DecoderSupports444");
          *(unsigned char *)(DerivedStorage + 49) = FigCFEqual();
          CFDictionaryGetValue(theDict, @"HEVCDecoderSupports444");
          *(unsigned char *)(DerivedStorage + 50) = FigCFEqual();
          CFDictionaryGetValue(theDict, @"HEVCDecoderSupports44410");
          *(unsigned char *)(DerivedStorage + 51) = FigCFEqual();
          CGSize size = CGSizeZero;
          uint64_t v18 = CMBaseObjectGetDerivedStorage();
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          int v20 = 1;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (*(unsigned char *)(v18 + 80)) {
            goto LABEL_23;
          }
          if (*(unsigned char *)(v18 + 48))
          {
            CFUUIDRef v22 = (const void *)kFigVirtualDisplayUsage_Valeria;
          }
          else
          {
            if (!sub_4800()) {
              goto LABEL_23;
            }
            CFUUIDRef v22 = (const void *)kFigVirtualDisplayUsage_Stevenote;
            if (!*(unsigned char *)(v18 + 49) || !FVDUtilsH264EncoderSupports444()) {
              int v20 = 0;
            }
          }
          if (v22) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_Usage, v22);
          }
LABEL_23:
          if (*(unsigned char *)(v18 + 49)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants444H264, kCFBooleanTrue);
          }
          if (*(unsigned char *)(v18 + 50)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants444HEVC, kCFBooleanTrue);
          }
          if (*(unsigned char *)(v18 + 51)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants44410HEVC, kCFBooleanTrue);
          }
          if (*(unsigned char *)(v18 + 48))
          {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ScreenRecording, kCFBooleanTrue);
            FigCFDictionarySetInt();
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_DisplayLabel, @"iOSScreenCaptureForMac");
          }
          if (sub_4800())
          {
            FigCFDictionarySetInt();
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_DisplayLabel, @"Stevenote");
          }
          CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ClientName, @"NeroScreen");
          CMTime v23 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFNumberRef v24 = v23;
          if (*(unsigned char *)(v18 + 48)) {
            CFBooleanRef v25 = kCFBooleanTrue;
          }
          else {
            CFBooleanRef v25 = kCFBooleanFalse;
          }
          CFDictionarySetValue(v23, kFigVirtualDisplaySinkProperty_IsValeria, v25);
          if (v20) {
            CFBooleanRef v26 = kCFBooleanFalse;
          }
          else {
            CFBooleanRef v26 = kCFBooleanTrue;
          }
          CFDictionarySetValue(v24, kFigVirtualDisplaySinkProperty_ShouldUseStevenoteJPEG, v26);
          uint64_t v27 = sub_7920((uint64_t)kCFAllocatorDefault, v24, *(const void **)(v18 + 72), (void *)(v18 + 64));
          if (v27)
          {
            uint64_t v12 = v27;
            uint64_t v28 = 0;
LABEL_63:
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (v24) {
              CFRelease(v24);
            }
            if (v28) {
              CFRelease(v28);
            }
            if (!v12) {
              *a5 = 0;
            }
            return v12;
          }
          if (!CGSizeMakeWithDictionaryRepresentation(*(CFDictionaryRef *)(v18 + 8), &size))
          {
            uint64_t v28 = 0;
LABEL_84:
            uint64_t v12 = 4294950536;
            goto LABEL_63;
          }
          uint64_t v29 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          uint64_t v28 = v29;
          if (!v29)
          {
            uint64_t v12 = 4294954510;
            goto LABEL_63;
          }
          CFDictionarySetValue(v29, kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels, *(const void **)(v18 + 8));
          CFDictionarySetValue(v28, kFigVirtualDisplaySinkDeviceInfoKey_Overscanned, *(const void **)(v18 + 16));
          uint64_t CMBaseObject = FigVirtualDisplaySinkGetCMBaseObject();
          uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v31) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = 0;
          }
          CFTypeRef v33 = *(uint64_t (**)(uint64_t, void, __CFDictionary *))(v32 + 56);
          if (v33)
          {
            uint64_t v34 = v33(CMBaseObject, kFigVirtualDisplaySinkProperty_DeviceInfo, v28);
            if (v34)
            {
LABEL_48:
              uint64_t v12 = v34;
              goto LABEL_63;
            }
            if (!*(void *)(v18 + 56))
            {
              if (sub_5B78())
              {
                uint64_t v34 = FigVirtualDisplayProcessorAccessoryCreate();
                if (v34) {
                  goto LABEL_48;
                }
                CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_CustomProcessor, 0);
                uint64_t v34 = FigVirtualDisplaySourceNullCreate();
                if (v34) {
                  goto LABEL_48;
                }
              }
              else
              {
                FigVirtualDisplaySourceScreenGetCurrent();
              }
LABEL_74:
              CMTime v41 = (const void *)FigVirtualDisplaySessionActivateWithSourceAndSink();
              *(void *)(v18 + 24) = v41;
              if (v41)
              {
                CFRetain(v41);
                if (*(unsigned char *)(v18 + 48)) {
                  g87kjbhgf();
                }
                uint64_t v12 = 0;
                goto LABEL_63;
              }
              goto LABEL_84;
            }
            CFMutableDictionaryRef v35 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            FigCFDictionarySetInt32();
            FigCFDictionarySetInt32();
            uint64_t v36 = FigVirtualDisplaySinkGetCMBaseObject();
            uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v37) {
              uint64_t v38 = v37;
            }
            else {
              uint64_t v38 = 0;
            }
            unsigned int v39 = *(uint64_t (**)(uint64_t, void, CFMutableDictionaryRef))(v38 + 56);
            if (v39)
            {
              uint64_t v34 = v39(v36, kFigVirtualDisplaySinkProperty_NetworkInfo, v35);
              if (v34) {
                goto LABEL_48;
              }
              if (v35) {
                CFRelease(v35);
              }
              goto LABEL_74;
            }
          }
          uint64_t v12 = 4294954514;
          goto LABEL_63;
        }
      }
      return 4294950535;
    }
    return v12;
  }

  return FigSignalErrorAt();
}

void sub_12B34()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage[5];
  if (v1)
  {
    dispatch_release(v1);
    DerivedStorage[5] = 0;
  }
  sub_12E30();
  int v2 = (const void *)DerivedStorage[3];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[3] = 0;
  }
  uint64_t v3 = (const void *)DerivedStorage[1];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[1] = 0;
  }
  uint64_t v4 = (const void *)DerivedStorage[2];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[2] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[7];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[7] = 0;
  }
  uint64_t v6 = (const void *)DerivedStorage[8];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[8] = 0;
  }
  uint64_t v7 = (const void *)DerivedStorage[9];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[9] = 0;
  }
  uint64_t v8 = DerivedStorage[4];
  if (v8)
  {
    dispatch_release(v8);
    DerivedStorage[4] = 0;
  }
}

__CFString *sub_12BE4(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroEndpointScreenStream %p>", a1);
  return Mutable;
}

uint64_t sub_12C3C(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage) {
    return 4294950534;
  }
  uint64_t v7 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointStreamProperty_Type))
  {
    uint64_t v8 = (const CFBooleanRef *)&kFigEndpointStreamType_Screen;
LABEL_4:
    CFBooleanRef v9 = *v8;
LABEL_5:
    CFMutableStringRef Mutable = (__CFDictionary *)CFRetain(v9);
LABEL_6:
    uint64_t result = 0;
    *a4 = Mutable;
    return result;
  }
  uint64_t v12 = (const void *)kFigEndpointStreamProperty_DisplaySize;
  if (CFEqual(a2, kFigEndpointStreamProperty_DisplaySize))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 1);
    if (v9) {
      goto LABEL_5;
    }
LABEL_15:
    CFMutableStringRef Mutable = 0;
    goto LABEL_6;
  }
  if (CFEqual(a2, kFigEndpointStreamProperty_DisplaySink))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 8);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  if (CFEqual(a2, kFigEndpointStreamProperty_IsOverscanned))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 2);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  CFBooleanRef v13 = (const void *)kFigEndpointStreamProperty_SupportsVideo;
  if (CFEqual(a2, kFigEndpointStreamProperty_SupportsVideo))
  {
    BOOL v14 = sub_4800();
    uint64_t v8 = &kCFBooleanFalse;
    if (!v14 && !v7[48]) {
      uint64_t v8 = &kCFBooleanTrue;
    }
    goto LABEL_4;
  }
  if (CFEqual(a2, kFigEndpointStreamProperty_NeroTransport))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 9);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  if (CFEqual(a2, kFigEndpointStreamProperty_NeroScreenStreamInfo))
  {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    BOOL v15 = sub_4800();
    dispatch_queue_t v16 = (const void **)&kCFBooleanFalse;
    if (!v15 && !v7[48]) {
      dispatch_queue_t v16 = (const void **)&kCFBooleanTrue;
    }
    CFDictionarySetValue(Mutable, v13, *v16);
    CFDictionarySetValue(Mutable, v12, *((const void **)v7 + 1));
    goto LABEL_6;
  }
  return 4294954512;
}

uint64_t sub_12E28()
{
  return 4294954512;
}

void sub_12E30()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (*(void *)(DerivedStorage + 24))
  {
    if (*(unsigned char *)(DerivedStorage + 48)) {
      g87kjbhgf();
    }
    FigVirtualDisplaySessionDeactivate();
    int v2 = *(const void **)(DerivedStorage + 24);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(DerivedStorage + 24) = 0;
    }
  }
}

uint64_t sub_12F9C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  uint64_t v8 = *(NSObject **)(DerivedStorage + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_1316C;
  v10[3] = &unk_1DE90;
  void v10[4] = DerivedStorage;
  v10[5] = a3;
  void v10[6] = a1;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0;
}

uint64_t sub_13040(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  uint64_t v8 = *(NSObject **)(DerivedStorage + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_1331C;
  v10[3] = &unk_1DED0;
  void v10[4] = DerivedStorage;
  v10[5] = a3;
  void v10[6] = a1;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0;
}

uint64_t sub_130E4(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = *(NSObject **)(DerivedStorage + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_134C4;
  v5[3] = &unk_1DF10;
  v5[4] = DerivedStorage;
  v5[5] = a1;
  dispatch_sync(v3, v5);
  return 0;
}

void sub_1316C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)v2)
  {
    int v3 = -16762;
    goto LABEL_12;
  }
  if (*(unsigned char *)(v2 + 1)) {
    goto LABEL_4;
  }
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v6 + 24);
  if (v7)
  {
    int v3 = v7(v4);
    if (!v3)
    {
      uint64_t v2 = *(void *)(a1 + 32);
LABEL_4:
      int v3 = 0;
      *(unsigned char *)(v2 + 1) = 1;
    }
  }
  else
  {
    int v3 = -12782;
  }
LABEL_12:
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_132D8;
    v9[3] = &unk_1DE70;
    long long v10 = *(_OWORD *)(a1 + 40);
    int v12 = v3;
    uint64_t v11 = *(void *)(a1 + 56);
    dispatch_async(v8, v9);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_132D8(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_1331C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)v2)
  {
    int v3 = -16762;
    goto LABEL_12;
  }
  if (!*(unsigned char *)(v2 + 1))
  {
LABEL_10:
    int v3 = 0;
    *(unsigned char *)(v2 + 1) = 0;
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v6 + 32);
  if (v7)
  {
    int v3 = v7(v4);
    if (v3) {
      goto LABEL_12;
    }
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_10;
  }
  int v3 = -12782;
LABEL_12:
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_13480;
    v9[3] = &unk_1DEB0;
    long long v10 = *(_OWORD *)(a1 + 40);
    int v12 = v3;
    uint64_t v11 = *(void *)(a1 + 56);
    dispatch_async(v8, v9);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_13480(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_134C4(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (!*v1)
  {
    unsigned char *v1 = 1;
    sub_12E30();
    if (*(void *)(*(void *)(a1 + 32) + 40))
    {
      CFRetain(*(CFTypeRef *)(a1 + 40));
      int v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_13578;
      block[3] = &unk_1DEF0;
      block[4] = *(void *)(a1 + 40);
      dispatch_async(v3, block);
    }
  }
}

void sub_13578(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

uint64_t sub_135CC(uint64_t a1, const void *a2, const void *a3, uint64_t a4, const void *a5, void *a6)
{
  if (a2)
  {
    if (!a3 || !a6) {
      return FigSignalErrorAt();
    }
    FigEndpointStreamGetClassID();
    uint64_t v11 = CMDerivedObjectCreate();
    if (!v11)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      dispatch_queue_t v13 = dispatch_queue_create("NeroEndpointAudioStream.notification", 0);
      *(void *)(DerivedStorage + 32) = v13;
      if (v13 && (uint64_t v14 = FigDispatchQueueCreateWithPriority(), (*(void *)(DerivedStorage + 40) = v14) != 0))
      {
        *(void *)(DerivedStorage + 104) = dispatch_queue_create("NeroEndpointAudioStream.silentAudioQueue", 0);
        *(void *)(DerivedStorage + 16) = CFRetain(a2);
        *(void *)(DerivedStorage + 24) = CFRetain(a3);
        *(void *)(DerivedStorage + 48) = a4;
        *(void *)(DerivedStorage + 96) = a5;
        if (a5) {
          CFRetain(a5);
        }
        CFDictionaryGetValue((CFDictionaryRef)a2, @"deviceName");
        if (FigCFEqual())
        {
          *(unsigned char *)(DerivedStorage + 1) = 1;
          uint64_t v15 = CMBaseObjectGetDerivedStorage();
          dispatch_queue_t v16 = *(NSObject **)(v15 + 104);
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_14CF8;
          block[3] = &unk_1E140;
          block[4] = v15;
          dispatch_async(v16, block);
        }
        dispatch_queue_t v17 = (unsigned char *)CMBaseObjectGetDerivedStorage();
        if (*v17)
        {
          uint64_t v11 = 4294950534;
        }
        else
        {
          uint64_t v11 = 0;
          if (!v17[2]) {
            v17[2] = 1;
          }
        }
        *a6 = 0;
      }
      else
      {
        return 4294950535;
      }
    }
    return v11;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t sub_13820(uint64_t a1, _DWORD *a2)
{
  uint64_t v16 = 0;
  dispatch_queue_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  int v19 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  uint64_t v15 = 0;
  double destination = 0.0;
  if (*(unsigned char *)DerivedStorage)
  {
    uint64_t v5 = v17;
    *((_DWORD *)v17 + 6) = -16762;
  }
  else
  {
    uint64_t v4 = *(NSObject **)(DerivedStorage + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 0x40000000;
    v10[2] = sub_13970;
    v10[3] = &unk_1DF68;
    v10[5] = &v12;
    void v10[6] = DerivedStorage;
    void v10[4] = &v16;
    dispatch_sync(v4, v10);
    uint64_t v5 = v17;
    if (!*((_DWORD *)v17 + 6))
    {
      OSStatus v6 = CMBlockBufferCopyDataBytes((CMBlockBufferRef)v13[3], 0, 8uLL, &destination);
      uint64_t v5 = v17;
      *((_DWORD *)v17 + 6) = v6;
      if (a2)
      {
        if (!v6) {
          *a2 = (destination + 0.5);
        }
      }
    }
  }
  uint64_t v7 = (const void *)v13[3];
  if (v7)
  {
    CFRelease(v7);
    uint64_t v5 = v17;
  }
  uint64_t v8 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t sub_13970(uint64_t a1)
{
  uint64_t result = NeroTransportSendSyncMessageCreatingReply();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_139C0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  CMBlockBufferRef blockBufferOut = 0;
  uint64_t v23 = 0;
  CFNumberRef v24 = &v23;
  uint64_t v25 = 0x2000000000;
  uint64_t v26 = 0;
  CFDictionaryRef theDict = 0;
  if (*DerivedStorage)
  {
    *((_DWORD *)v29 + 6) = -16762;
  }
  else
  {
    uint64_t v8 = DerivedStorage;
    OSStatus v9 = CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, a2, 0x28uLL, kCFAllocatorNull, 0, 0, 0x28uLL, 0, &blockBufferOut);
    *((_DWORD *)v29 + 6) = v9;
    if (!v9)
    {
      long long v10 = *((void *)v8 + 5);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_13C18;
      block[3] = &unk_1DF90;
      void block[6] = v8;
      void block[7] = blockBufferOut;
      block[4] = &v28;
      void block[5] = &v23;
      dispatch_sync(v10, block);
      if (!*((_DWORD *)v29 + 6))
      {
        int CFTypeFromSerializedAtomDataBlockBuffer = FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer();
        *((_DWORD *)v29 + 6) = CFTypeFromSerializedAtomDataBlockBuffer;
        if (!CFTypeFromSerializedAtomDataBlockBuffer)
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Error");
          dispatch_queue_t v13 = v29 + 3;
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, v13);
            if (!*((_DWORD *)v29 + 6))
            {
              uint64_t v14 = CFDictionaryGetValue(theDict, @"DefaultAudioChannelLayout");
              uint64_t v15 = CFDictionaryGetValue(theDict, @"PreferredAudioChannelLayout");
              if (v14) {
                CFTypeRef v16 = CFRetain(v14);
              }
              else {
                CFTypeRef v16 = 0;
              }
              *a3 = v16;
              if (v15) {
                CFTypeRef v17 = CFRetain(v15);
              }
              else {
                CFTypeRef v17 = 0;
              }
              *a4 = v17;
            }
          }
          else
          {
            _DWORD *v13 = -16760;
          }
        }
      }
    }
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  uint64_t v18 = (const void *)v24[3];
  if (v18) {
    CFRelease(v18);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  uint64_t v19 = *((unsigned int *)v29 + 6);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v28, 8);
  return v19;
}

uint64_t sub_13C18(uint64_t a1)
{
  uint64_t result = NeroTransportSendSyncMessageCreatingReply();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_13C68()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  size_t v23 = 0;
  double destination = 0;
  if (!*(void *)(DerivedStorage + 64))
  {
    LODWORD(v3) = 0;
    uint64_t v2 = 0;
    goto LABEL_15;
  }
  uint64_t SampleBufferFromSerializedAtomDataBlockBuffer = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
  if (SampleBufferFromSerializedAtomDataBlockBuffer)
  {
LABEL_3:
    uint64_t v2 = SampleBufferFromSerializedAtomDataBlockBuffer;
    LODWORD(v3) = 0;
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)(DerivedStorage + 64);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, void **, size_t *))(v6 + 40);
  if (!v7)
  {
    LODWORD(v3) = 0;
    goto LABEL_14;
  }
  uint64_t SampleBufferFromSerializedAtomDataBlockBuffer = v7(v4, &destination, &v23);
  if (SampleBufferFromSerializedAtomDataBlockBuffer) {
    goto LABEL_3;
  }
  uint64_t v3 = *(unsigned int *)(DerivedStorage + 72);
  *(_DWORD *)(DerivedStorage + 72) += CMSampleBufferGetNumSamples(0);
  DataBuffer = CMSampleBufferGetDataBuffer(0);
  size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
  if (v23 < DataLength)
  {
    uint64_t v2 = 4294950536;
    goto LABEL_15;
  }
  size_t v10 = DataLength;
  uint64_t v11 = CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, destination);
  if (v11)
  {
    uint64_t v2 = v11;
    goto LABEL_15;
  }
  uint64_t v18 = *(void *)(DerivedStorage + 64);
  uint64_t v19 = destination;
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  CFUUIDRef v22 = *(uint64_t (**)(uint64_t, void *, size_t, uint64_t))(v21 + 48);
  if (!v22)
  {
LABEL_14:
    uint64_t v2 = 4294954514;
    goto LABEL_15;
  }
  uint64_t v2 = v22(v18, v19, v10, v3);
  if (!v2)
  {
    double destination = 0;
    return v2;
  }
LABEL_15:
  uint64_t v12 = destination;
  if (destination)
  {
    uint64_t v13 = *(void *)(DerivedStorage + 64);
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    CFTypeRef v16 = *(void (**)(uint64_t, void *, void, void))(v15 + 48);
    if (v16) {
      v16(v13, v12, 0, v3);
    }
  }
  return v2;
}

void sub_13F3C()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage[4];
  if (v1)
  {
    dispatch_release(v1);
    DerivedStorage[4] = 0;
  }
  sub_143F4();
  uint64_t v2 = (const void *)DerivedStorage[7];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[7] = 0;
  }
  uint64_t v3 = (const void *)DerivedStorage[10];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[10] = 0;
  }
  uint64_t v4 = (const void *)DerivedStorage[11];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[11] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[2];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[2] = 0;
  }
  uint64_t v6 = (const void *)DerivedStorage[3];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[3] = 0;
  }
  uint64_t v7 = DerivedStorage[5];
  if (v7)
  {
    dispatch_release(v7);
    DerivedStorage[5] = 0;
  }
  uint64_t v8 = DerivedStorage[13];
  if (v8)
  {
    dispatch_release(v8);
    DerivedStorage[13] = 0;
  }
}

__CFString *sub_13FEC(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigNeroEndpointAudioStream %p>", a1);
  return Mutable;
}

uint64_t sub_14044(uint64_t a1, const void *a2, const __CFAllocator *a3, CFDictionaryRef *a4)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage) {
    return 4294950534;
  }
  OSStatus v9 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointStreamProperty_Type))
  {
    CFNumberRef Value = (const void *)kFigEndpointStreamType_Audio;
LABEL_6:
    CFDictionaryRef v11 = (const __CFDictionary *)CFRetain(Value);
    uint64_t result = 0;
    *a4 = v11;
    return result;
  }
  if (CFEqual(a2, kFigEndpointStreamProperty_ID))
  {
    CFNumberRef Value = (const void *)*((void *)v9 + 3);
    goto LABEL_6;
  }
  if (!CFEqual(a2, kFigEndpointStreamProperty_SupportedPCMFormats))
  {
    if (CFEqual(a2, @"edidAC3Support"))
    {
      CFNumberRef Value = CFDictionaryGetValue(*((CFDictionaryRef *)v9 + 2), @"EDIDAC3Support");
      goto LABEL_6;
    }
    if (CFEqual(a2, kFigEndpointStreamProperty_OutputLatency))
    {
      sub_144AC(a1, a3, a4);
    }
    else
    {
      if (!CFEqual(a2, @"screenLatency")) {
        return 4294954512;
      }
      sub_1455C(a1, a3, a4);
    }
    return 0;
  }
  uint64_t v13 = CMBaseObjectGetDerivedStorage();
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a3, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 4294950535;
  }
  uint64_t v15 = Mutable;
  CFTypeRef v16 = CFDictionaryGetValue(*(CFDictionaryRef *)(v13 + 16), @"formats");
  CFDictionarySetValue(v15, @"default", v16);
  uint64_t result = 0;
  *a4 = v15;
  return result;
}

uint64_t sub_141F4(uint64_t a1, const void *a2, const void *a3)
{
  if (*(unsigned char *)CMBaseObjectGetDerivedStorage()) {
    return 4294950534;
  }
  if (!CFEqual(a2, kFigEndpointStreamProperty_AudioSource))
  {
    if (!CFEqual(a2, kFigEndpointStreamProperty_AudioSink)) {
      return 4294954512;
    }
    if (!a3 || (CFTypeID v12 = CFGetTypeID(a3), v12 == FigEndpointAudioSinkGetTypeID()))
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (!*(unsigned char *)(DerivedStorage + 3))
      {
        uint64_t v14 = *(const void **)(DerivedStorage + 64);
        *(void *)(DerivedStorage + 64) = a3;
        if (a3) {
          CFRetain(a3);
        }
        if (v14) {
          CFRelease(v14);
        }
        return 0;
      }
      return FigSignalErrorAt();
    }
    return 4294950536;
  }
  if (a3)
  {
    CFTypeID v6 = CFGetTypeID(a3);
    if (v6 != FigEndpointAudioSourceGetTypeID()) {
      return 4294950536;
    }
  }
  uint64_t v7 = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(v7 + 3))
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v7 + 56);
    if (v9)
    {
      sub_AB78(v9, 0, 0);
      CFRelease(*(CFTypeRef *)(v8 + 56));
    }
    *(void *)(v8 + 56) = a3;
    if (a3)
    {
      CFRetain(a3);
      uint64_t v10 = *(void *)(v8 + 56);
      CFDictionaryRef v11 = *(NSObject **)(v8 + 40);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000;
      _OWORD v16[2] = sub_1460C;
      v16[3] = &unk_1E060;
      v16[4] = a1;
      sub_AB78(v10, v11, v16);
    }
    return 0;
  }
  return FigSignalErrorAt();
}

void sub_143F4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(NSObject **)(DerivedStorage + 104);
  if (v1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_14470;
    block[3] = &unk_1E040;
    block[4] = DerivedStorage;
    dispatch_sync(v1, block);
  }
}

OpaqueAudioQueue *sub_14470(uint64_t a1)
{
  uint64_t result = *(OpaqueAudioQueue **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = (OpaqueAudioQueue *)AudioQueueDispose(result, 1u);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
  return result;
}

CFDictionaryRef sub_144AC(uint64_t a1, const __CFAllocator *a2, CFDictionaryRef *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTime v10 = kCMTimeZero;
  double valuePtr = 0.0;
  int64_t Value = (int64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 16), @"BufferAheadInterval");
  if (Value)
  {
    CFNumberGetValue((CFNumberRef)Value, kCFNumberDoubleType, &valuePtr);
    int64_t Value = (int)(valuePtr * 1000.0);
  }
  CMTimeMake(&v10, Value, 1000);
  CMTime v8 = v10;
  CFDictionaryRef result = CMTimeCopyAsDictionary(&v8, a2);
  *a3 = result;
  return result;
}

CFDictionaryRef sub_1455C(uint64_t a1, const __CFAllocator *a2, CFDictionaryRef *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTime v10 = kCMTimeZero;
  double valuePtr = 0.0;
  int64_t Value = (int64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 16), @"ScreenLatency");
  if (Value)
  {
    CFNumberGetValue((CFNumberRef)Value, kCFNumberDoubleType, &valuePtr);
    int64_t Value = (int)(valuePtr * 1000.0);
  }
  CMTimeMake(&v10, Value, 1000);
  CMTime v8 = v10;
  CFDictionaryRef result = CMTimeCopyAsDictionary(&v8, a2);
  *a3 = result;
  return result;
}

void sub_1460C()
{
  if (!FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForSampleBuffer()) {
    NeroTransportSendAsyncMessage();
  }
}

uint64_t sub_14698(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  CMTime v8 = *(NSObject **)(DerivedStorage + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_14908;
  v10[3] = &unk_1E0A0;
  void v10[4] = a1;
  v10[5] = a3;
  void v10[6] = DerivedStorage;
  void v10[7] = a4;
  dispatch_async(v8, v10);
  return 0;
}

uint64_t sub_1473C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  CMTime v8 = *(NSObject **)(DerivedStorage + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_14AA4;
  v10[3] = &unk_1E0E0;
  void v10[4] = a1;
  v10[5] = a3;
  void v10[6] = DerivedStorage;
  void v10[7] = a4;
  dispatch_async(v8, v10);
  return 0;
}

uint64_t sub_147E0(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v3 = (void *)DerivedStorage;
    *(unsigned char *)uint64_t DerivedStorage = 1;
    uint64_t v4 = *(NSObject **)(DerivedStorage + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_14C64;
    block[3] = &unk_1E100;
    block[4] = a1;
    dispatch_sync(v4, block);
    sub_143F4();
    uint64_t v5 = (const void *)v3[7];
    if (v5)
    {
      CFRelease(v5);
      v3[7] = 0;
    }
    v3[6] = 0;
    CFTypeID v6 = (const void *)v3[12];
    if (v6)
    {
      CFRelease(v6);
      v3[12] = 0;
    }
    if (v3[4])
    {
      CFRetain(a1);
      uint64_t v7 = v3[4];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      v9[2] = sub_14CA4;
      v9[3] = &unk_1E120;
      void v9[4] = a1;
      dispatch_async(v7, v9);
    }
  }
  return 0;
}

void sub_14908(uint64_t a1)
{
  int v2 = sub_149C0();
  if (*(void *)(a1 + 40))
  {
    int v3 = v2;
    CFRetain(*(CFTypeRef *)(a1 + 32));
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 48) + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_14A60;
    v5[3] = &unk_1E080;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    int v8 = v3;
    uint64_t v7 = *(void *)(a1 + 56);
    dispatch_async(v4, v5);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_149C0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMBlockBufferRef theSourceBuffer = 0;
  unsigned int destination = 0;
  if (*(unsigned char *)(DerivedStorage + 3))
  {
    uint64_t v1 = DerivedStorage;
    uint64_t v2 = NeroTransportSendSyncMessageCreatingReply();
    if (!v2)
    {
      uint64_t v2 = CMBlockBufferCopyDataBytes(theSourceBuffer, 0, 4uLL, &destination);
      if (!v2)
      {
        uint64_t v2 = destination;
        if (!destination) {
          *(unsigned char *)(v1 + 3) = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (theSourceBuffer) {
    CFRelease(theSourceBuffer);
  }
  return v2;
}

void sub_14A60(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_14AA4(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  uint64_t destination = 0;
  CMBlockBufferRef v12 = 0;
  CFTypeRef v10 = 0;
  if (*DerivedStorage)
  {
    int BlockBufferCopyingMemoryBlock = -16762;
  }
  else
  {
    int v3 = DerivedStorage;
    if (DerivedStorage[3])
    {
      int BlockBufferCopyingMemoryBlock = 0;
    }
    else
    {
      LODWORD(destination) = 1;
      int BlockBufferCopyingMemoryBlock = FigCreateBlockBufferCopyingMemoryBlock();
      if (!BlockBufferCopyingMemoryBlock)
      {
        int BlockBufferCopyingMemoryBlock = NeroTransportSendSyncMessageCreatingReply();
        if (!BlockBufferCopyingMemoryBlock)
        {
          int BlockBufferCopyingMemoryBlock = CMBlockBufferCopyDataBytes(v12, 0, 4uLL, (char *)&destination + 4);
          if (!BlockBufferCopyingMemoryBlock)
          {
            int BlockBufferCopyingMemoryBlock = HIDWORD(destination);
            if (!HIDWORD(destination)) {
              v3[3] = 1;
            }
          }
        }
      }
    }
    if (v10) {
      CFRelease(v10);
    }
  }
  if (v12) {
    CFRelease(v12);
  }
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 48) + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_14C20;
    block[3] = &unk_1E0C0;
    int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    int v9 = BlockBufferCopyingMemoryBlock;
    uint64_t v8 = *(void *)(a1 + 56);
    dispatch_async(v5, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_14C20(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

uint64_t sub_14C64()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(result + 2))
  {
    uint64_t v1 = result;
    uint64_t result = sub_149C0();
    *(unsigned char *)(v1 + 2) = 0;
  }
  return result;
}

void sub_14CA4(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

uint64_t sub_14CF8(uint64_t a1)
{
  inFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inFormat.mFormatID = xmmword_1A1C0;
  *(_OWORD *)&inFormat.mBytesPerFrame = xmmword_1A1D0;
  uint64_t result = AudioQueueNewOutput(&inFormat, (AudioQueueOutputCallback)nullsub_3, 0, 0, 0, 0, (AudioQueueRef *)(*(void *)(a1 + 32) + 8));
  if (!result) {
    return AudioQueueStart(*(AudioQueueRef *)(*(void *)(a1 + 32) + 8), 0);
  }
  return result;
}

uint64_t sub_14D88(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, uint64_t a6, CFTypeRef *a7)
{
  CFTypeRef v73 = 0;
  int v72 = 0;
  CFTypeRef cf1 = 0;
  CFTypeRef cf = 0;
  CFDictionaryRef v68 = 0;
  CFDictionaryRef theDict = 0;
  CFTypeRef v67 = 0;
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  CFTypeRef v16 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v15 + 48);
  if (!v16) {
    goto LABEL_79;
  }
  uint64_t v17 = v16(CMBaseObject, kFigEndpointProperty_IsActivated, kCFAllocatorDefault, &cf);
  if (v17) {
    goto LABEL_94;
  }
  if (cf != kCFBooleanTrue) {
    goto LABEL_93;
  }
  uint64_t v18 = FigEndpointStreamGetCMBaseObject();
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v20 + 48);
  if (!v21) {
    goto LABEL_79;
  }
  uint64_t v17 = v21(v18, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &v67);
  if (v17) {
    goto LABEL_94;
  }
  if (!FigCFEqual())
  {
LABEL_93:
    uint64_t v17 = FigSignalErrorAt();
    goto LABEL_94;
  }
  uint64_t v22 = FigEndpointGetCMBaseObject();
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFTypeRef *))(v24 + 48);
  if (!v25) {
    goto LABEL_79;
  }
  uint64_t v17 = v25(v22, @"subType", kCFAllocatorDefault, &cf1);
  if (v17) {
    goto LABEL_94;
  }
  FigHALAudioDeviceGetClassID();
  uint64_t v17 = CMDerivedObjectCreate();
  if (v17) {
    goto LABEL_94;
  }
  uint64_t v17 = FigHALAudioObjectMapperAddMapping();
  if (v17) {
    goto LABEL_94;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)(DerivedStorage + 8) = a3;
  *(void *)(DerivedStorage + 16) = a2;
  *(_DWORD *)uint64_t DerivedStorage = v72;
  if (a4) {
    CFTypeRef v27 = CFRetain(a4);
  }
  else {
    CFTypeRef v27 = 0;
  }
  *(void *)(DerivedStorage + 48) = v27;
  if (a5) {
    CFTypeRef v28 = CFRetain(a5);
  }
  else {
    CFTypeRef v28 = 0;
  }
  *(void *)(DerivedStorage + 56) = v28;
  *(_DWORD *)(DerivedStorage + 40) = 1751412073;
  if (CFEqual(cf1, @"Valeria"))
  {
    int v29 = 1986818665;
  }
  else
  {
    if (!CFEqual(cf1, @"Messalina")) {
      goto LABEL_31;
    }
    int v29 = 1970496032;
  }
  *(_DWORD *)(DerivedStorage + 40) = v29;
LABEL_31:
  if (qword_20160 != -1) {
    dispatch_once(&qword_20160, &stru_1E2E8);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    *(void *)(DerivedStorage + 64) = Instance;
  }
  else
  {
    uint64_t v65 = FigSignalErrorAt();
    if (v65) {
      goto LABEL_80;
    }
  }
  uint64_t v31 = FigDispatchQueueCreateWithPriority();
  *(void *)(DerivedStorage + 72) = v31;
  if (!v31)
  {
    uint64_t v65 = 4294950406;
    goto LABEL_80;
  }
  uint64_t v32 = FigEndpointStreamGetCMBaseObject();
  uint64_t v33 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v33) {
    uint64_t v34 = v33;
  }
  else {
    uint64_t v34 = 0;
  }
  CFMutableDictionaryRef v35 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v34 + 48);
  if (!v35)
  {
LABEL_79:
    uint64_t v65 = 4294954514;
    goto LABEL_80;
  }
  uint64_t v17 = v35(v32, kFigEndpointStreamProperty_ID, kCFAllocatorDefault, DerivedStorage + 24);
  if (v17) {
    goto LABEL_94;
  }
  if (!*(void *)(DerivedStorage + 24)) {
    goto LABEL_93;
  }
  uint64_t v36 = FigEndpointStreamGetCMBaseObject();
  uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 0;
  }
  unsigned int v39 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDictionaryRef *))(v38 + 48);
  if (!v39) {
    goto LABEL_79;
  }
  uint64_t v40 = kFigEndpointStreamProperty_SupportedPCMFormats;
  uint64_t v17 = v39(v36, kFigEndpointStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &theDict);
  if (v17) {
    goto LABEL_94;
  }
  if (theDict)
  {
    int64_t Value = CFDictionaryGetValue(theDict, @"default");
    *(void *)(*(void *)(DerivedStorage + 64) + 80) = CFRetain(Value);
  }
  uint64_t v42 = FigEndpointStreamGetCMBaseObject();
  uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v43) {
    uint64_t v44 = v43;
  }
  else {
    uint64_t v44 = 0;
  }
  v45 = *(uint64_t (**)(uint64_t, uint64_t, const CFAllocatorRef, CFDictionaryRef *))(v44 + 48);
  if (!v45) {
    goto LABEL_79;
  }
  uint64_t v17 = v45(v42, v40, kCFAllocatorDefault, &v68);
  if (v17)
  {
LABEL_94:
    uint64_t v65 = v17;
    goto LABEL_80;
  }
  if (!v68) {
    goto LABEL_93;
  }
  v46 = CFDictionaryGetValue(v68, @"default");
  *(void *)(*(void *)(DerivedStorage + 64) + 72) = CFRetain(v46);
  uint64_t v47 = CMBaseObjectGetDerivedStorage();
  CFTypeRef v48 = *(void **)(v47 + 64);
  v49 = (const void *)v48[11];
  if (v49)
  {
    CFRelease(v49);
    CFTypeRef v48 = *(void **)(v47 + 64);
    v48[11] = 0;
  }
  uint64_t v50 = (const void *)v48[10];
  if (v50)
  {
    v48[11] = v50;
  }
  else
  {
    uint64_t v50 = (const void *)v48[9];
    v48[11] = v50;
    if (!v50) {
      goto LABEL_70;
    }
  }
  CFRetain(v50);
  uint64_t v51 = CMBaseObjectGetDerivedStorage();
  CFDataRef v52 = *(const __CFData **)(*(void *)(v51 + 64) + 88);
  if (v52)
  {
    uint64_t v53 = v51;
    CFDataRef MutableCopy = CFDataCreateMutableCopy(kCFAllocatorDefault, 0, v52);
    if (MutableCopy)
    {
      CFDataRef v55 = MutableCopy;
      unint64_t Length = CFDataGetLength(MutableCopy);
      if (Length <= 0x37)
      {
        FigSignalErrorAt();
      }
      else
      {
        unint64_t v57 = Length / 0x38;
        v58 = CFDataGetBytePtr(v55) + 12;
        do
        {
          if (*((_DWORD *)v58 - 1) == 1819304813) {
            *(_DWORD *)v58 &= ~0x40u;
          }
          v58 += 56;
          --v57;
        }
        while (v57);
        uint64_t v59 = *(void *)(v53 + 64);
        CMTimeFlags v60 = *(const void **)(v59 + 88);
        *(void *)(v59 + 88) = v55;
        CFRetain(v55);
        if (v60) {
          CFRelease(v60);
        }
      }
      CFRelease(v55);
    }
  }
  else
  {
    FigSignalErrorAt();
  }
LABEL_70:
  uint64_t v17 = sub_6B54(a1, a2, v72, a5, a3, *(const void **)(DerivedStorage + 64), (void *)(DerivedStorage + 80));
  if (v17) {
    goto LABEL_94;
  }
  uint64_t v61 = FigEndpointGetCMBaseObject();
  uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v62) {
    uint64_t v63 = v62;
  }
  else {
    uint64_t v63 = 0;
  }
  uint64_t v64 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v63 + 48);
  if (!v64) {
    goto LABEL_79;
  }
  uint64_t v17 = v64(v61, kFigEndpointProperty_Name, kCFAllocatorDefault, DerivedStorage + 32);
  if (v17) {
    goto LABEL_94;
  }
  uint64_t v17 = sub_B4DC(a1, a2, v72, a5, a3, *(const void **)(DerivedStorage + 64), (CFTypeRef *)(DerivedStorage + 88));
  if (v17) {
    goto LABEL_94;
  }
  CMBaseObjectGetDerivedStorage();
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v65 = FigNotificationCenterAddWeakListener();
  if (!v65)
  {
    *a7 = v73;
    CFTypeRef v73 = 0;
  }
LABEL_80:
  if (theDict) {
    CFRelease(theDict);
  }
  if (v68) {
    CFRelease(v68);
  }
  if (cf1) {
    CFRelease(cf1);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v67) {
    CFRelease(v67);
  }
  if (v73) {
    CFRelease(v73);
  }
  return v65;
}

void sub_1569C()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (*(void *)(CMBaseObjectGetDerivedStorage() + 56))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
  uint64_t v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0;
  }
  uint64_t v2 = (const void *)DerivedStorage[4];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[4] = 0;
  }
  int v3 = (const void *)DerivedStorage[6];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[6] = 0;
  }
  uint64_t v4 = (const void *)DerivedStorage[7];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[7] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[11];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[11] = 0;
  }
  int8x16_t v6 = (const void *)DerivedStorage[10];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[10] = 0;
  }
  int8x16_t v7 = (const void *)DerivedStorage[8];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[8] = 0;
  }
  uint64_t v8 = DerivedStorage[9];
  if (v8)
  {
    dispatch_release(v8);
    DerivedStorage[9] = 0;
  }
}

CFStringRef sub_1578C()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"NeroAudioDevice ID %d UID %@ Endpoint %p EndpointStream %p", *DerivedStorage, *((void *)DerivedStorage + 3), *((void *)DerivedStorage + 6), *((void *)DerivedStorage + 7));
}

uint64_t sub_157E0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  *(unsigned char *)(DerivedStorage + 100) = 1;
  uint64_t v1 = *(void *)(DerivedStorage + 88);
  if (v1)
  {
    uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v2) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 8);
    if (v4) {
      v4(v1);
    }
    FigHALAudioObjectMapperRemoveMapping();
  }
  uint64_t v5 = *(void *)(DerivedStorage + 80);
  if (v5)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t))(v7 + 8);
    if (v8) {
      v8(v5);
    }
    FigHALAudioObjectMapperRemoveMapping();
  }

  return FigHALAudioObjectMapperRemoveMapping();
}

uint64_t sub_15994(uint64_t a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v3 + 8);
  if (!v4) {
    return 0;
  }

  return v4(a1);
}

uint64_t sub_15A4C()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

BOOL sub_15A68(uint64_t a1, int *a2)
{
  BOOL result = 0;
  int v3 = *a2;
  if (*a2 > 1819173228)
  {
    if (v3 <= 1935763059)
    {
      if (v3 > 1853059699)
      {
        if (v3 > 1870098019)
        {
          if (v3 == 1870098020) {
            return 1;
          }
          int v5 = 1919512167;
        }
        else
        {
          if (v3 == 1853059700) {
            return 1;
          }
          int v5 = 1869180523;
        }
      }
      else
      {
        if (v3 <= 1836411235)
        {
          if (v3 != 1819173229)
          {
            int v4 = 1819569763;
            goto LABEL_43;
          }
          return 1;
        }
        if (v3 == 1836411236) {
          return 1;
        }
        int v5 = 1853059619;
      }
LABEL_58:
      if (v3 != v5) {
        return result;
      }
      return 1;
    }
    if (v3 > 1937007733)
    {
      if (v3 > 1953653101)
      {
        if (v3 == 1969841184) {
          return 1;
        }
        int v5 = 1953653102;
      }
      else
      {
        if (v3 == 1937007734) {
          return 1;
        }
        int v5 = 1937009955;
      }
      goto LABEL_58;
    }
    if (v3 > 1936876643)
    {
      if (v3 != 1936876644)
      {
        int v4 = 1936879204;
LABEL_43:
        if (v3 != v4) {
          return result;
        }
      }
    }
    else if (v3 != 1935763060)
    {
      int v4 = 1936092276;
      goto LABEL_43;
    }
LABEL_44:
    int v8 = a2[1];
    return v8 == 1768845428 || v8 == 1869968496;
  }
  if (v3 > 1684236337)
  {
    if (v3 > 1735354733)
    {
      if (v3 > 1818850925)
      {
        if (v3 == 1818850926) {
          return 1;
        }
        int v5 = 1819107691;
      }
      else
      {
        if (v3 == 1735354734) {
          return 1;
        }
        int v5 = 1751737454;
      }
      goto LABEL_58;
    }
    if (v3 > 1698775858)
    {
      if (v3 == 1698775859) {
        return 1;
      }
      int v5 = 1718839674;
      goto LABEL_58;
    }
    if (v3 != 1684236338)
    {
      int v4 = 1684434036;
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  if (v3 > 1668047218)
  {
    if (v3 > 1668575851)
    {
      if (v3 == 1668575852) {
        return 1;
      }
      int v5 = 1668641652;
    }
    else
    {
      if (v3 == 1668047219) {
        return 1;
      }
      int v5 = 1668049764;
    }
    goto LABEL_58;
  }
  if (v3 == 1634429294 || v3 == 1634759532 || v3 == 1650682995) {
    return 1;
  }
  return result;
}

BOOL sub_15D38(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1853059700;
}

CFDataRef sub_15D50(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef result = 0;
  int v5 = *a2;
  if (*a2 > 1819569762)
  {
    if (v5 <= 1935763059)
    {
      if (v5 <= 1853059699)
      {
        int v16 = 1819569763;
        unsigned int v17 = 4;
        if (v5 == 1853059619) {
          int v22 = 32;
        }
        else {
          int v22 = 0;
        }
        if (v5 == 1836411236) {
          unsigned int v21 = 8;
        }
        else {
          unsigned int v21 = v22;
        }
LABEL_76:
        if (v5 == v16) {
          return (const __CFData *)v17;
        }
        else {
          return (const __CFData *)v21;
        }
      }
      if (v5 <= 1870098019)
      {
        int v16 = 1853059700;
        unsigned int v17 = 8;
        int v18 = 1869180523;
LABEL_47:
        BOOL v20 = v5 == v18;
        unsigned int v21 = 4;
        goto LABEL_74;
      }
      if (v5 != 1870098020)
      {
        int v19 = 1919512167;
LABEL_69:
        if (v5 == v19) {
          return (const __CFData *)&dword_4;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      if (v5 <= 1937007733)
      {
        if (v5 > 1936876643)
        {
          if (v5 == 1936876644)
          {
            CFDataRef result = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 56);
            if (!result) {
              return result;
            }
          }
          else
          {
            if (v5 != 1936879204) {
              return result;
            }
            CFDataRef result = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 64);
            if (!result) {
              return result;
            }
          }
          return (const __CFData *)CFDataGetLength(result);
        }
        int v16 = 1935763060;
        unsigned int v17 = 4;
        int v18 = 1936092276;
        goto LABEL_47;
      }
      if (v5 > 1953653101)
      {
        int v16 = 1953653102;
        unsigned int v17 = 4;
        int v23 = 1969841184;
LABEL_73:
        BOOL v20 = v5 == v23;
        unsigned int v21 = 8;
LABEL_74:
        if (!v20) {
          unsigned int v21 = 0;
        }
        goto LABEL_76;
      }
      if (v5 == 1937007734) {
        return (const __CFData *)&dword_4;
      }
      if (v5 != 1937009955) {
        return result;
      }
    }
    int v24 = a2[1];
    if (v24 != 1869968496)
    {
      if (v24 == 1768845428) {
        return (const __CFData *)(4 * (*(void *)(DerivedStorage + 80) != 0));
      }
      if (v24 != 1735159650) {
        return 0;
      }
      if (*(void *)(DerivedStorage + 80)) {
        return (const __CFData *)&dword_8;
      }
      return (const __CFData *)&dword_4;
    }
    return (const __CFData *)&dword_4;
  }
  if (v5 <= 1684434035)
  {
    if (v5 <= 1668047218)
    {
      if (v5 != 1634429294 && v5 != 1634759532 && v5 != 1650682995) {
        return result;
      }
      return (const __CFData *)&dword_4;
    }
    if (v5 <= 1668641651)
    {
      if (v5 != 1668047219)
      {
        int v19 = 1668049764;
        goto LABEL_69;
      }
      return (const __CFData *)&dword_4;
    }
    int v16 = 1668641652;
    unsigned int v17 = 24;
    int v23 = 1684236338;
    goto LABEL_73;
  }
  if (v5 == 1819173229) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  if (v5 == 1819107691) {
    int v7 = 8;
  }
  else {
    int v7 = v6;
  }
  if (v5 == 1818850926) {
    int v8 = 4;
  }
  else {
    int v8 = 0;
  }
  if (v5 == 1751737454) {
    int v9 = 4;
  }
  else {
    int v9 = v8;
  }
  if (v5 <= 1819107690) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v7;
  }
  if (v5 == 1735354734) {
    int v11 = 4;
  }
  else {
    int v11 = 0;
  }
  if (v5 == 1718839674) {
    int v12 = 4;
  }
  else {
    int v12 = v11;
  }
  if (v5 == 1698775859) {
    int v13 = 4;
  }
  else {
    int v13 = 0;
  }
  if (v5 == 1684434036) {
    int v14 = 4;
  }
  else {
    int v14 = v13;
  }
  if (v5 <= 1718839673) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = v12;
  }
  if (v5 <= 1751737453) {
    return (const __CFData *)v15;
  }
  else {
    return (const __CFData *)v10;
  }
}

uint64_t sub_160F4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, uint64_t a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v12 = DerivedStorage;
  int v13 = *a2;
  uint64_t v14 = 2003332927;
  if (*a2 > 1819173228)
  {
    if (v13 <= 1935763059)
    {
      if (v13 <= 1853059699)
      {
        if (v13 <= 1836411235)
        {
          if (v13 == 1819173229)
          {
            CFTypeRef v28 = *(const void **)(DerivedStorage + 32);
            if (!v28 || (CFTypeRef v29 = CFRetain(v28)) == 0) {
              CFTypeRef v29 = CFRetain(@"No Name Endpoint");
            }
            *a6 = 8;
            if (a5 < 8)
            {
              uint64_t v14 = 561211770;
            }
            else
            {
              uint64_t v14 = 0;
              *(void *)a7 = CFRetain(v29);
            }
            CFRelease(v29);
            return v14;
          }
          int v15 = 1819569763;
          goto LABEL_30;
        }
        if (v13 != 1836411236)
        {
          if (v13 != 1853059619) {
            return v14;
          }
          goto LABEL_111;
        }
LABEL_69:
        *a6 = 8;
        if (a5 < 8) {
          return 561211770;
        }
        CFStringRef v22 = *(const __CFString **)(DerivedStorage + 24);
        if (!v22)
        {
LABEL_72:
          uint64_t v14 = 0;
          *(void *)a7 = v22;
          return v14;
        }
LABEL_71:
        CFStringRef v22 = (const __CFString *)CFRetain(v22);
        goto LABEL_72;
      }
      if (v13 <= 1870098019)
      {
        if (v13 == 1853059700)
        {
          *a6 = 8;
          if (a5 >= 8)
          {
            uint64_t v14 = 0;
            *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 64) + 16);
            return v14;
          }
          return 561211770;
        }
        if (v13 != 1869180523) {
          return v14;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t v14 = 0;
        unsigned int v17 = -1;
        goto LABEL_132;
      }
      if (v13 != 1870098020)
      {
        int v18 = 1919512167;
        goto LABEL_60;
      }
LABEL_73:
      int v23 = a2[1];
      if (v23 == 1869968496)
      {
        if (a5 < 4) {
          goto LABEL_145;
        }
        uint64_t v38 = *(void *)(DerivedStorage + 88);
      }
      else
      {
        unsigned int v24 = a5 >> 2;
        if (v23 != 1768845428)
        {
          if (v23 != 1735159650)
          {
LABEL_146:
            uint64_t v14 = 0;
LABEL_147:
            int v30 = 4 * v24;
            goto LABEL_148;
          }
          if (*(void *)(DerivedStorage + 80)) {
            unsigned int v25 = 2;
          }
          else {
            unsigned int v25 = 1;
          }
          if (v24 >= v25) {
            unsigned int v26 = v25;
          }
          else {
            unsigned int v26 = a5 >> 2;
          }
          if (v26)
          {
            *(_DWORD *)a7 = sub_15994(*(void *)(DerivedStorage + 88));
            if (v26 != 1)
            {
              uint64_t v27 = *(void *)(v12 + 80);
              if (v27) {
                *(_DWORD *)(a7 + 4) = sub_15994(v27);
              }
              unsigned int v24 = 2;
              goto LABEL_146;
            }
            goto LABEL_141;
          }
LABEL_145:
          unsigned int v24 = 0;
          goto LABEL_146;
        }
        uint64_t v38 = *(void *)(DerivedStorage + 80);
        if (v24 >= (v38 != 0)) {
          unsigned int v24 = v38 != 0;
        }
        if (!v24) {
          goto LABEL_146;
        }
        if (!v38)
        {
LABEL_141:
          unsigned int v24 = 1;
          goto LABEL_146;
        }
      }
      *(_DWORD *)a7 = sub_15994(v38);
      goto LABEL_141;
    }
    if (v13 <= 1937007733)
    {
      if (v13 <= 1936876643)
      {
        if (v13 == 1935763060) {
          goto LABEL_31;
        }
        int v16 = 1936092276;
LABEL_16:
        if (v13 != v16) {
          return v14;
        }
        goto LABEL_42;
      }
      if (v13 == 1936876644)
      {
        CFDataRef v32 = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 56);
        if (v32)
        {
          if (CFDataGetLength(v32) > a5) {
            return 561211770;
          }
          CFDataRef v33 = *(const __CFData **)(*(void *)(v12 + 64) + 56);
          v41.length = CFDataGetLength(v33);
          v41.location = 0;
          CFDataGetBytes(v33, v41, (UInt8 *)a7);
          CFDataRef v21 = *(const __CFData **)(*(void *)(v12 + 64) + 56);
          goto LABEL_110;
        }
      }
      else
      {
        if (v13 != 1936879204) {
          return v14;
        }
        CFDataRef v19 = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 64);
        if (v19)
        {
          if (CFDataGetLength(v19) > a5) {
            return 561211770;
          }
          CFDataRef v20 = *(const __CFData **)(*(void *)(v12 + 64) + 64);
          v40.length = CFDataGetLength(v20);
          v40.location = 0;
          CFDataGetBytes(v20, v40, (UInt8 *)a7);
          CFDataRef v21 = *(const __CFData **)(*(void *)(v12 + 64) + 64);
LABEL_110:
          uint64_t v14 = 0;
          *a6 = CFDataGetLength(v21);
          return v14;
        }
      }
LABEL_111:
      uint64_t v14 = 0;
      *a6 = 0;
      return v14;
    }
    if (v13 <= 1953653101)
    {
      if (v13 != 1937007734)
      {
        if (v13 != 1937009955) {
          return v14;
        }
        goto LABEL_73;
      }
LABEL_42:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      unsigned int v17 = 1;
      goto LABEL_132;
    }
    if (v13 != 1953653102)
    {
      if (v13 != 1969841184) {
        return v14;
      }
      goto LABEL_69;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    uint64_t v14 = 0;
    unsigned int v17 = *(_DWORD *)(DerivedStorage + 40);
LABEL_132:
    *(_DWORD *)a7 = v17;
    return v14;
  }
  if (v13 <= 1684236337)
  {
    if (v13 <= 1668047218)
    {
      if (v13 == 1634429294)
      {
        *a6 = 4;
        if (a5 < 4) {
          return 0;
        }
        uint64_t v14 = 0;
        unsigned int v17 = *(_DWORD *)DerivedStorage;
        goto LABEL_132;
      }
      if (v13 != 1634759532)
      {
        if (v13 != 1650682995) {
          return v14;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t v14 = 0;
        unsigned int v17 = 1634689642;
        goto LABEL_132;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      int v31 = sub_16CCC();
      goto LABEL_106;
    }
    if (v13 > 1668575851)
    {
      if (v13 != 1668575852)
      {
        if (v13 != 1668641652) {
          return v14;
        }
        *a6 = 24;
        if (a5 >= 0x18)
        {
          uint64_t v14 = 0;
          *(_OWORD *)a7 = *(_OWORD *)"lspawwar";
          *(void *)(a7 + 16) = 1918990199;
          return v14;
        }
        return 561211770;
      }
      uint64_t v14 = 0;
      unsigned int v24 = a5 >> 2;
      int v34 = a2[1];
      if (a5 >= 4) {
        unsigned int v35 = 0;
      }
      else {
        unsigned int v35 = a5 >> 2;
      }
      if (a5 >= 4) {
        unsigned int v36 = 0;
      }
      else {
        unsigned int v36 = a5 >> 2;
      }
      if (a5 >= 4) {
        unsigned int v37 = 0;
      }
      else {
        unsigned int v37 = a5 >> 2;
      }
      if (v34 == 1735159650) {
        unsigned int v24 = v37;
      }
      if (v34 == 1768845428) {
        unsigned int v24 = v36;
      }
      if (v34 == 1869968496) {
        unsigned int v24 = v35;
      }
      goto LABEL_147;
    }
    if (v13 == 1668047219)
    {
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      unsigned int v17 = 1633969526;
      goto LABEL_132;
    }
    int v15 = 1668049764;
  }
  else
  {
    if (v13 <= 1735354733)
    {
      if (v13 <= 1698775858)
      {
        if (v13 == 1684236338)
        {
          if (a5 < 8) {
            return 561211770;
          }
          uint64_t v14 = 0;
          *(void *)a7 = 0x200000001;
          int v30 = 8;
LABEL_148:
          *a6 = v30;
          return v14;
        }
        int v16 = 1684434036;
        goto LABEL_16;
      }
      if (v13 != 1698775859)
      {
        int v18 = 1718839674;
LABEL_60:
        if (v13 != v18) {
          return v14;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t v14 = 0;
        unsigned int v17 = (*(double *)(*(void *)(DerivedStorage + 64) + 16) * 0.25);
        goto LABEL_132;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      int v31 = sub_16BDC();
LABEL_106:
      uint64_t v14 = 0;
      *(_DWORD *)a7 = v31;
      return v14;
    }
    if (v13 > 1818850925)
    {
      if (v13 != 1818850926)
      {
        if (v13 != 1819107691) {
          return v14;
        }
        *a6 = 8;
        if (a5 < 8) {
          return 561211770;
        }
        CFStringRef v22 = @"Apple, Inc.";
        goto LABEL_71;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      unsigned int v17 = *(unsigned char *)(DerivedStorage + 100) == 0;
      goto LABEL_132;
    }
    if (v13 == 1735354734)
    {
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      unsigned int v17 = *(_DWORD *)(DerivedStorage + 96) > 0;
      goto LABEL_132;
    }
    int v15 = 1751737454;
  }
LABEL_30:
  if (v13 == v15)
  {
LABEL_31:
    *a6 = 4;
    if (a5 >= 4)
    {
      uint64_t v14 = 0;
      *(_DWORD *)a7 = 0;
      return v14;
    }
    return 561211770;
  }
  return v14;
}

uint64_t sub_16898(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef v37 = 0;
  uint64_t v38 = 0;
  if (*a2 == 1853059700)
  {
    uint64_t v10 = DerivedStorage;
    memset(__s2, 0, 40);
    uint64_t v11 = *(void *)(DerivedStorage + 64);
    long long v12 = *(_OWORD *)(v11 + 32);
    long long v33 = *(_OWORD *)(v11 + 16);
    long long v34 = v12;
    uint64_t v35 = *(void *)(v11 + 48);
    if (a5 == 8)
    {
      double v13 = *a6;
      if (*a6 == *(double *)&v33)
      {
LABEL_22:
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t CMBaseObject = FigHALAudioStreamGetCMBaseObject();
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v15) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        int v18 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDataRef *))(v16 + 48);
        if (v18)
        {
          uint64_t v19 = v18(CMBaseObject, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v37);
          if (v19)
          {
            uint64_t v17 = v19;
          }
          else
          {
            CFDataRef v20 = v37;
            unint64_t Length = CFDataGetLength(v37);
            if (Length < 0x70)
            {
              uint64_t v17 = 4294950405;
            }
            else
            {
              unint64_t v22 = Length / 0x38;
              BytePtr = CFDataGetBytePtr(v20);
              unsigned int v24 = 0;
              do
              {
                if (*((double *)BytePtr + 5) <= v13 && *((double *)BytePtr + 6) >= v13)
                {
                  unsigned int v24 = BytePtr;
                  if (*((_DWORD *)BytePtr + 7) == HIDWORD(v34))
                  {
                    unsigned int v24 = BytePtr;
                    if (*((_DWORD *)BytePtr + 8) >= v35)
                    {
                      unsigned int v24 = BytePtr;
                      goto LABEL_19;
                    }
                  }
                }
                BytePtr += 56;
                --v22;
              }
              while (v22);
              if (!v24)
              {
                uint64_t v17 = 1970171760;
                goto LABEL_29;
              }
LABEL_19:
              *(double *)__s2 = v13;
              long long v25 = *(_OWORD *)(v24 + 24);
              *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v24 + 8);
              *(_OWORD *)((char *)&__s2[1] + 8) = v25;
              if (!memcmp(&v33, __s2, 0x28uLL)) {
                goto LABEL_22;
              }
              uint64_t v26 = *(void *)(v10 + 88);
              uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v27) {
                uint64_t v28 = v27;
              }
              else {
                uint64_t v28 = 0;
              }
              CFTypeRef v29 = *(void (**)(uint64_t))(v28 + 8);
              if (v29) {
                v29(v26);
              }
              uint64_t v17 = FigHALAudioConfigChangeCreateRecord();
              uint64_t v30 = v38;
              if (!v17)
              {
                long long v31 = __s2[1];
                *(_OWORD *)(v38 + 16) = __s2[0];
                *(_OWORD *)(v30 + 32) = v31;
                *(void *)(v30 + 48) = *(void *)&__s2[2];
                FigHALAudioConfigChangeSendRequest();
                uint64_t v38 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v17 = 4294954514;
        }
      }
    }
    else
    {
      uint64_t v17 = 561211770;
    }
  }
  else
  {
    uint64_t v17 = 2003332927;
  }
LABEL_29:
  FigHALAudioConfigChangeDisposeRecord();
  if (v37) {
    CFRelease(v37);
  }
  return v17;
}

uint64_t sub_16BDC()
{
  CMBaseObjectGetDerivedStorage();
  unsigned int valuePtr = 0;
  CFNumberRef number = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v1 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = *(unsigned int (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFNumberRef *))(v2 + 48);
  if (!v3 || v3(CMBaseObject, @"edidAC3Support", kCFAllocatorDefault, &number)) {
    return 0;
  }
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

CMTimeValue sub_16CCC()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTimeValue value = kCMTimeZero.value;
  CFDictionaryRef dictionaryRepresentation = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFDictionaryRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(CMBaseObject, @"screenLatency", kCFAllocatorDefault, &dictionaryRepresentation);
    CFDictionaryRef v7 = dictionaryRepresentation;
    if (!v6)
    {
      CMTimeMakeFromDictionary(&v11, dictionaryRepresentation);
      long long v13 = *(_OWORD *)&v11.timescale;
      int32_t v8 = (int)*(double *)(*(void *)(DerivedStorage + 64) + 16);
      CMTime time = v11;
      CMTimeConvertScale(&v11, &time, v8, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTimeValue value = v11.value;
      CFDictionaryRef v7 = dictionaryRepresentation;
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  return value;
}

CFTypeRef sub_16E08()
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_16E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 == 1868984941)
  {
    uint64_t v9 = *(void *)(DerivedStorage + 88);
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    if (v14) {
      uint64_t v13 = v14(v9, 1868984941, a3);
    }
    else {
      uint64_t v13 = 4294954514;
    }
    FigHALAudioPropertySendChanges();
    return v13;
  }
  if (a2 == 1768321645)
  {
    uint64_t v6 = *(void *)(DerivedStorage + 80);
    if (!v6) {
      return 0;
    }
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    if (v15)
    {
      return v15(v6, 1768321645, a3);
    }
    return 4294954514;
  }

  return FigSignalErrorAt();
}

uint64_t sub_1706C()
{
  return 0;
}

uint64_t sub_1708C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  if (*(unsigned char *)(DerivedStorage + 100))
  {
    uint64_t v12 = FigSignalErrorAt();
    if (!v12) {
      return v12;
    }
    goto LABEL_22;
  }
  int v2 = *(_DWORD *)(DerivedStorage + 96);
  if (v2)
  {
LABEL_3:
    *(_DWORD *)(v1 + 96) = v2 + 1;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  uint64_t v4 = *(void *)(DerivedStorage + 64);
  long long v5 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v4 + 96) = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v4 + 112) = v5;
  *(void *)(v4 + 128) = *(void *)(v4 + 48);
  uint64_t v6 = *(void *)(DerivedStorage + 64);
  int v7 = *(_DWORD *)(v6 + 120);
  double v8 = *(double *)(v6 + 96);
  *(_DWORD *)(v6 + 152) = v8;
  *(_DWORD *)(v6 + 156) = v7;
  *(_DWORD *)(v6 + 160) = v8;
  *(void *)(v6 + 172) = 0;
  if (*(_DWORD *)(v6 + 104) == 1819304813) {
    *(_DWORD *)(v6 + 108) |= 0x40u;
  }
  uint64_t v9 = *(void *)(DerivedStorage + 88);
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(uint64_t))(v11 + 32);
  if (!v14) {
    goto LABEL_21;
  }
  uint64_t v15 = v14(v9);
  if (v15) {
    goto LABEL_35;
  }
  uint64_t v16 = *(void *)(v1 + 80);
  if (v16)
  {
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(uint64_t (**)(uint64_t))(v18 + 32);
    if (v19)
    {
      uint64_t v15 = v19(v16);
      if (!v15) {
        goto LABEL_18;
      }
LABEL_35:
      uint64_t v12 = v15;
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v12 = 4294954514;
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v20 = FigEndpointStreamResumeSync();
  if (!v20 || (uint64_t v12 = v20, v20 == -16764))
  {
    *(unsigned char *)(*(void *)(v1 + 64) + 196) = 1;
    int v2 = *(_DWORD *)(v1 + 96);
    goto LABEL_3;
  }
LABEL_22:
  uint64_t v21 = *(void *)(v1 + 88);
  uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  unsigned int v24 = *(void (**)(uint64_t))(v23 + 40);
  if (v24) {
    v24(v21);
  }
  uint64_t v25 = *(void *)(v1 + 80);
  if (v25)
  {
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = *(void (**)(uint64_t))(v27 + 40);
    if (v28) {
      v28(v25);
    }
  }
  return v12;
}

uint64_t sub_174CC()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(_DWORD *)(DerivedStorage + 96);
  if (v1 < 2)
  {
    if (v1 != 1)
    {
      uint64_t v3 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_DWORD *)(DerivedStorage + 96) = 0;
  dispatch_sync(*(dispatch_queue_t *)(DerivedStorage + 72), &stru_1E288);
  unsigned int v4 = FigEndpointStreamSuspendSync();
  if (v4 == -16764) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v4;
  }
  uint64_t v5 = *(void *)(DerivedStorage + 88);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  double v8 = *(void (**)(uint64_t))(v7 + 40);
  if (v8) {
    v8(v5);
  }
  uint64_t v9 = *(void *)(DerivedStorage + 80);
  if (v9)
  {
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(void (**)(uint64_t))(v11 + 40);
    if (v12) {
      v12(v9);
    }
  }
  *(unsigned char *)(*(void *)(DerivedStorage + 64) + 196) = 0;
LABEL_20:
  uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v3;
}

uint64_t sub_17840(const void *a1, void *a2, void *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v9 = *(void *)(DerivedStorage + 64);
  if (!*(unsigned char *)(v9 + 196)) {
    return 1937010544;
  }
  uint64_t v10 = DerivedStorage;
  int v11 = *(_DWORD *)(v9 + 152);
  int v12 = *(_DWORD *)(v9 + 160);
  unint64_t UpTime = FigGetUpTime();
  uint64_t v14 = *(void *)(v10 + 64);
  unint64_t v15 = *(void *)(v14 + 172);
  if (v15)
  {
    uint64_t v16 = *(void *)(v14 + 164);
  }
  else
  {
    uint64_t v16 = FigNanosecondsToHostTime();
    uint64_t v14 = *(void *)(v10 + 64);
    *(void *)(v14 + 164) = v16;
    *(void *)(v14 + 180) = UpTime;
    unint64_t v15 = v16 + UpTime;
    *(void *)(v14 + 172) = v16 + UpTime;
    *(void *)(v14 + 188) = 0;
  }
  if (UpTime <= v15 + 2 * v16)
  {
    if (UpTime >= v15)
    {
      *(void *)(v14 + 180) = v15;
      if (v11 != v12) {
        uint64_t v16 = (uint64_t)((double)v11 * (double)(unint64_t)v16 / (double)v12 + 0.5);
      }
      *(void *)(v14 + 172) = v16 + v15;
      *(double *)(v14 + 188) = *(double *)(v14 + 188) + (double)(v11 / 4);
      CFRetain(a1);
      uint64_t v18 = *(NSObject **)(v10 + 72);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_17CD0;
      block[3] = &unk_1E2A8;
      void block[4] = a1;
      dispatch_async(v18, block);
    }
  }
  else
  {
    int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = 0;
  uint64_t v20 = *(void *)(v10 + 64);
  *a2 = *(void *)(v20 + 188);
  *a3 = *(void *)(v20 + 180);
  *a4 = 0;
  return result;
}

uint64_t sub_17B10(uint64_t a1, int a2, BOOL *a3, BOOL *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(*(void *)(DerivedStorage + 64) + 196)) {
    return 1937010544;
  }
  if (a2 == 1919246692)
  {
    uint64_t v9 = *(void *)(DerivedStorage + 80);
    if (v9
      && ((uint64_t v16 = 0, v14 = *(void *)"tcasbolg", v15 = 0, (v10 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
        ? (uint64_t v11 = 0)
        : (uint64_t v11 = v10),
          (int v12 = *(void (**)(uint64_t, uint64_t *, void, void, uint64_t, uint64_t *, char *))(v11 + 40)) != 0))
    {
      v12(v9, &v14, 0, 0, 4, &v16, (char *)&v16 + 4);
      BOOL v8 = HIDWORD(v16) != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = a2 == 1919513701;
  }
  uint64_t result = 0;
  *a3 = v8;
  *a4 = v8;
  return result;
}

uint64_t sub_17C64()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 64) + 196)) {
    return 0;
  }
  else {
    return 1937010544;
  }
}

uint64_t sub_17C98()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 64) + 196)) {
    return 0;
  }
  else {
    return 1937010544;
  }
}

void sub_17CD0(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = *(void *)(DerivedStorage + 64);
  int v6 = *(_DWORD *)(v3 + 160);
  if (*(unsigned char *)(v3 + 196))
  {
    uint64_t v4 = DerivedStorage;
    sub_13820(*(void *)(DerivedStorage + 56), &v6);
    if (v6)
    {
      uint64_t v5 = *(void *)(v4 + 64);
      if (v6 != *(_DWORD *)(v5 + 160)) {
        *(_DWORD *)(v5 + 160) = v6;
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_17D48(id a1)
{
  qword_20168 = _CFRuntimeRegisterClass();
}

double sub_17D70(uint64_t a1)
{
  *(void *)(a1 + 192) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_17D94(void *a1)
{
  int v2 = (const void *)a1[7];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[8];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[11];
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)a1[10];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)a1[9];
  if (v6)
  {
    CFRelease(v6);
  }
}

uint64_t _nlc_connect(_DWORD *a1)
{
  *(void *)sp = 0;
  bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    mach_error_t v3 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v3) {
      mach_error("nlc_connect:", v3);
    }
    return sp[1];
  }
}

uint64_t _nlc_disconnect(uint64_t a1)
{
  unsigned int v4 = 0;
  mach_error_t v2 = nlc_disconnect(*(_DWORD *)a1, *(_DWORD *)(a1 + 4), &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
  return v4;
}

uint64_t _nlc_start_simulation(uint64_t a1, long long *a2)
{
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_simulate(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(uint64_t a1, long long *a2)
{
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(uint64_t a1, _DWORD *a2)
{
  a2[1] = 2;
  size_t __n = 208;
  long long v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  long long v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  long long v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  long long v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*(_DWORD *)a1, (uint64_t)v14, 0xD0u, __src, &__n, *(_DWORD *)(a1 + 4), (_DWORD *)&__n + 1);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v13 = 5395;
  *(void *)rcv_name_12 = 0x9D4C00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            uint64_t v10 = 0;
            int v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&rcv_name_12[16];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_CGSize size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x9D4D00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 40369)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t nlc_simulate(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
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
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&rcv_name + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D4E00000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v13 = mach_msg(&rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40370)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
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
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&rcv_name + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D4F00000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v13 = mach_msg(&rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40371)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, int a6, _DWORD *a7)
{
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
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
  *(_OWORD *)size_t __n = 0u;
  long long v27 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v25 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(_DWORD *)((char *)&rcv_name + v14 + 36) = a6;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D5000000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v17 = mach_msg(&rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v7;
    }
    if (v17)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v7;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40372)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = LODWORD(__n[0]) == 0;
          }
          if (!v18 && rcv_name.msgh_size == 36) {
            uint64_t v7 = LODWORD(__n[0]);
          }
          else {
            uint64_t v7 = 4294966996;
          }
          goto LABEL_27;
        }
        if (!rcv_name.msgh_remote_port)
        {
          uint64_t v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0])) {
            goto LABEL_27;
          }
          int v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            uint64_t v7 = 4294966996;
            if (rcv_name.msgh_size - 44 >= HIDWORD(__n[0]))
            {
              unsigned int v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name.msgh_size == v22 + 44)
              {
                long long v23 = (char *)&rcv_name + v22 - 1024;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                uint64_t v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy(&rcv_name);
    return v7;
  }
  return 4294966989;
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueDispose(inAQ, inImmediate);
}

OSStatus AudioQueueNewOutput(const AudioStreamBasicDescription *inFormat, AudioQueueOutputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return _AudioQueueNewOutput(inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, inFlags, outAQ);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return _AudioQueueStart(inAQ, inStartTime);
}

uint64_t AudioServerPlugInRegisterRemote()
{
  return _AudioServerPlugInRegisterRemote();
}

uint64_t BKSDisplayServicesSetCloneRotationDisabled()
{
  return _BKSDisplayServicesSetCloneRotationDisabled();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return _CFDataCreateMutableCopy(allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return _CFPlugInCreate(allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return _CFPlugInFindFactoriesForPlugInTypeInPlugIn(typeUUID, plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return _CFPlugInInstanceCreate(allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return _CGSizeCreateDictionaryRepresentation(size);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return _CGSizeMakeWithDictionaryRepresentation(dict, size);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return _CMAudioFormatDescriptionCreate(allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return _CMAudioFormatDescriptionGetStreamBasicDescription(desc);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return _CMBlockBufferCopyDataBytes(theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMBlockBufferCreateWithMemoryBlock(structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, flags, blockBufferOut);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return _CMBlockBufferGetDataLength(theBuffer);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return _CMBlockBufferReplaceDataBytes(sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return _CMBufferQueueEnqueue(queue, buf);
}

CMItemCount CMBufferQueueGetBufferCount(CMBufferQueueRef queue)
{
  return _CMBufferQueueGetBufferCount(queue);
}

CMTime *__cdecl CMBufferQueueGetDuration(CMTime *__return_ptr retstr, CMBufferQueueRef queue)
{
  return _CMBufferQueueGetDuration(retstr, queue);
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return _CMBufferQueueReset(queue);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return _CMClockConvertHostTimeToSystemUnits(hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return _CMClockGetHostTimeClock();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return _CMClockGetTime(retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return _CMClockMakeHostTimeFromSystemUnits(retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return _CMDerivedObjectCreate();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return _CMMemoryPoolCreate(options);
}

CFAllocatorRef CMMemoryPoolGetAllocator(CMMemoryPoolRef pool)
{
  return _CMMemoryPoolGetAllocator(pool);
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterPostNotification()
{
  return _CMNotificationCenterPostNotification();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreate(allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreateCopyWithNewTiming(allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetDataBuffer(sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetFormatDescription(sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetNumSamples(sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetOutputPresentationTimeStamp(retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return _CMSampleBufferGetSampleAttachmentsArray(sbuf, createIfNecessary);
}

uint64_t CMSessionMgrRegisterEndpointManager()
{
  return _CMSessionMgrRegisterEndpointManager();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return _CMSyncConvertTime(retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return _CMTimeConvertScale(retstr, time, newTimescale, method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return _CMTimeMakeFromDictionary(retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeSubtract(retstr, lhs, rhs);
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return _CMTimebaseCreateWithSourceClock(allocator, sourceClock, timebaseOut);
}

uint64_t CelestialGetModelSpecificName()
{
  return _CelestialGetModelSpecificName();
}

uint64_t CelestialIsAppleTV()
{
  return _CelestialIsAppleTV();
}

uint64_t FVDUtilsCreateDisplayUUID()
{
  return _FVDUtilsCreateDisplayUUID();
}

uint64_t FVDUtilsH264EncoderSupports1080p60()
{
  return _FVDUtilsH264EncoderSupports1080p60();
}

uint64_t FVDUtilsH264EncoderSupports444()
{
  return _FVDUtilsH264EncoderSupports444();
}

uint64_t FVDUtilsHEVCEncoderSupports4K60()
{
  return _FVDUtilsHEVCEncoderSupports4K60();
}

uint64_t FigAtomicIncrement32()
{
  return _FigAtomicIncrement32();
}

uint64_t FigCFArrayAppendInt64()
{
  return _FigCFArrayAppendInt64();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return _FigCFDictionaryCreateMutableCopy();
}

uint64_t FigCFDictionarySetInt()
{
  return _FigCFDictionarySetInt();
}

uint64_t FigCFDictionarySetInt32()
{
  return _FigCFDictionarySetInt32();
}

uint64_t FigCFDictionarySetInt64()
{
  return _FigCFDictionarySetInt64();
}

uint64_t FigCFEqual()
{
  return _FigCFEqual();
}

uint64_t FigCFNumberCreateSInt64()
{
  return _FigCFNumberCreateSInt64();
}

uint64_t FigCFNumberCreateUInt64()
{
  return _FigCFNumberCreateUInt64();
}

uint64_t FigCFWeakReferenceTableAddValueAndGetKey()
{
  return _FigCFWeakReferenceTableAddValueAndGetKey();
}

uint64_t FigCFWeakReferenceTableCopyValue()
{
  return _FigCFWeakReferenceTableCopyValue();
}

uint64_t FigCFWeakReferenceTableCreate()
{
  return _FigCFWeakReferenceTableCreate();
}

uint64_t FigCFWeakReferenceTableRemoveValue()
{
  return _FigCFWeakReferenceTableRemoveValue();
}

uint64_t FigCreateBlockBufferCopyingMemoryBlock()
{
  return _FigCreateBlockBufferCopyingMemoryBlock();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return _FigDispatchQueueCreateWithPriority();
}

uint64_t FigDisplayModes_BuildColorAndTimingModes()
{
  return _FigDisplayModes_BuildColorAndTimingModes();
}

uint64_t FigEndpointAudioSinkGetClassID()
{
  return _FigEndpointAudioSinkGetClassID();
}

uint64_t FigEndpointAudioSinkGetTypeID()
{
  return _FigEndpointAudioSinkGetTypeID();
}

uint64_t FigEndpointAudioSourceGetClassID()
{
  return _FigEndpointAudioSourceGetClassID();
}

uint64_t FigEndpointAudioSourceGetTypeID()
{
  return _FigEndpointAudioSourceGetTypeID();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

uint64_t FigEndpointGetClassID()
{
  return _FigEndpointGetClassID();
}

uint64_t FigEndpointManagerGetClassID()
{
  return _FigEndpointManagerGetClassID();
}

uint64_t FigEndpointManagerGetSupportedDiscoveryFeatures()
{
  return _FigEndpointManagerGetSupportedDiscoveryFeatures();
}

uint64_t FigEndpointManagerGetSupportedFeatures()
{
  return _FigEndpointManagerGetSupportedFeatures();
}

uint64_t FigEndpointManagerRemoteCopyNeroManager()
{
  return _FigEndpointManagerRemoteCopyNeroManager();
}

uint64_t FigEndpointMessengerGetClassID()
{
  return _FigEndpointMessengerGetClassID();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return _FigEndpointStreamGetCMBaseObject();
}

uint64_t FigEndpointStreamGetClassID()
{
  return _FigEndpointStreamGetClassID();
}

uint64_t FigEndpointStreamResumeSync()
{
  return _FigEndpointStreamResumeSync();
}

uint64_t FigEndpointStreamSuspendSync()
{
  return _FigEndpointStreamSuspendSync();
}

uint64_t FigFileDoesFileExist()
{
  return _FigFileDoesFileExist();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigGetUpTime()
{
  return _FigGetUpTime();
}

uint64_t FigHALAudioConfigChangeCreateRecord()
{
  return _FigHALAudioConfigChangeCreateRecord();
}

uint64_t FigHALAudioConfigChangeDisposeRecord()
{
  return _FigHALAudioConfigChangeDisposeRecord();
}

uint64_t FigHALAudioConfigChangeSendRequest()
{
  return _FigHALAudioConfigChangeSendRequest();
}

uint64_t FigHALAudioCreateStandardPluginObject()
{
  return _FigHALAudioCreateStandardPluginObject();
}

uint64_t FigHALAudioDeviceGetClassID()
{
  return _FigHALAudioDeviceGetClassID();
}

uint64_t FigHALAudioObjectMapperAddMapping()
{
  return _FigHALAudioObjectMapperAddMapping();
}

uint64_t FigHALAudioObjectMapperCreate()
{
  return _FigHALAudioObjectMapperCreate();
}

uint64_t FigHALAudioObjectMapperRemoveMapping()
{
  return _FigHALAudioObjectMapperRemoveMapping();
}

uint64_t FigHALAudioPropertySendChanges()
{
  return _FigHALAudioPropertySendChanges();
}

uint64_t FigHALAudioPropertySendOneChange()
{
  return _FigHALAudioPropertySendOneChange();
}

uint64_t FigHALAudioStreamGetCMBaseObject()
{
  return _FigHALAudioStreamGetCMBaseObject();
}

uint64_t FigHALAudioStreamGetClassID()
{
  return _FigHALAudioStreamGetClassID();
}

uint64_t FigHALPluginDriverGetInterface()
{
  return _FigHALPluginDriverGetInterface();
}

uint64_t FigHostTimeToNanoseconds()
{
  return _FigHostTimeToNanoseconds();
}

uint64_t FigIsAirplaydEnabled()
{
  return _FigIsAirplaydEnabled();
}

uint64_t FigNanosecondsToHostTime()
{
  return _FigNanosecondsToHostTime();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return _FigNotificationCenterAddWeakListener();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return _FigNotificationCenterRemoveWeakListener();
}

uint64_t FigOctaviaVideoRenderPipelineCreate()
{
  return _FigOctaviaVideoRenderPipelineCreate();
}

uint64_t FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer()
{
  return _FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer()
{
  return _FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForCFType()
{
  return _FigRemote_CreateSerializedAtomDataBlockBufferForCFType();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForSampleBuffer()
{
  return _FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForSampleBuffer();
}

uint64_t FigRenderPipelineGetFigBaseObject()
{
  return _FigRenderPipelineGetFigBaseObject();
}

uint64_t FigServer_IsAirplayd()
{
  return _FigServer_IsAirplayd();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t FigTransportConnectionIDSCreate()
{
  return _FigTransportConnectionIDSCreate();
}

uint64_t FigTransportConnectionTCPCreate()
{
  return _FigTransportConnectionTCPCreate();
}

uint64_t FigTransportConnectionUSBCreate()
{
  return _FigTransportConnectionUSBCreate();
}

uint64_t FigTransportCreateBBufFromPointer()
{
  return _FigTransportCreateBBufFromPointer();
}

uint64_t FigTransportDiscoveryAddEventHandler()
{
  return _FigTransportDiscoveryAddEventHandler();
}

uint64_t FigTransportDiscoveryGetSharedDiscovery()
{
  return _FigTransportDiscoveryGetSharedDiscovery();
}

uint64_t FigTransportDiscoveryStart()
{
  return _FigTransportDiscoveryStart();
}

uint64_t FigTransportDiscoveryStop()
{
  return _FigTransportDiscoveryStop();
}

uint64_t FigTransportGetLocalRootObject()
{
  return _FigTransportGetLocalRootObject();
}

uint64_t FigTransportGetRemoteRootObject()
{
  return _FigTransportGetRemoteRootObject();
}

uint64_t FigTransportXPCConnectionServerStart()
{
  return _FigTransportXPCConnectionServerStart();
}

uint64_t FigUSleep()
{
  return _FigUSleep();
}

uint64_t FigVirtualDisplayProcessorAccessoryCreate()
{
  return _FigVirtualDisplayProcessorAccessoryCreate();
}

uint64_t FigVirtualDisplaySessionActivateWithSourceAndSink()
{
  return _FigVirtualDisplaySessionActivateWithSourceAndSink();
}

uint64_t FigVirtualDisplaySessionDeactivate()
{
  return _FigVirtualDisplaySessionDeactivate();
}

uint64_t FigVirtualDisplaySinkGetCMBaseObject()
{
  return _FigVirtualDisplaySinkGetCMBaseObject();
}

uint64_t FigVirtualDisplaySinkGetClassID()
{
  return _FigVirtualDisplaySinkGetClassID();
}

uint64_t FigVirtualDisplaySourceGetCMBaseObject()
{
  return _FigVirtualDisplaySourceGetCMBaseObject();
}

uint64_t FigVirtualDisplaySourceNullCreate()
{
  return _FigVirtualDisplaySourceNullCreate();
}

uint64_t FigVirtualDisplaySourceScreenGetCurrent()
{
  return _FigVirtualDisplaySourceScreenGetCurrent();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return _IOAccessoryManagerGetServiceWithPrimaryPort();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit()
{
  return _IOAccessoryManagerGetUSBCurrentLimit();
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase()
{
  return _IOAccessoryManagerSetUSBCurrentLimitBase();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return _IOHIDEventSystemClientUnregisterEventCallback();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return _IOHIDEventSystemClientUnscheduleWithRunLoop();
}

uint64_t IOMobileFramebufferGetDisplaySize()
{
  return _IOMobileFramebufferGetDisplaySize();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return _IOMobileFramebufferGetMainDisplay();
}

uint64_t IOMobileFramebufferGetSecondaryDisplay()
{
  return _IOMobileFramebufferGetSecondaryDisplay();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t NeroTransportConnectToReceiver()
{
  return _NeroTransportConnectToReceiver();
}

uint64_t NeroTransportConnectionGetCMBaseObject()
{
  return _NeroTransportConnectionGetCMBaseObject();
}

uint64_t NeroTransportCreate()
{
  return _NeroTransportCreate();
}

uint64_t NeroTransportDisconnectFromReceiver()
{
  return _NeroTransportDisconnectFromReceiver();
}

uint64_t NeroTransportInvalidate()
{
  return _NeroTransportInvalidate();
}

uint64_t NeroTransportRegisterObject()
{
  return _NeroTransportRegisterObject();
}

uint64_t NeroTransportRegisterObjectWithFlags()
{
  return _NeroTransportRegisterObjectWithFlags();
}

uint64_t NeroTransportSendAsyncMessage()
{
  return _NeroTransportSendAsyncMessage();
}

uint64_t NeroTransportSendSyncMessageCreatingReply()
{
  return _NeroTransportSendSyncMessageCreatingReply();
}

uint64_t NeroTransportSetAsConnected()
{
  return _NeroTransportSetAsConnected();
}

uint64_t NeroTransportStartAcceptingConnections()
{
  return _NeroTransportStartAcceptingConnections();
}

uint64_t NeroTransportStopAcceptingConnections()
{
  return _NeroTransportStopAcceptingConnections();
}

uint64_t NeroTransportUnregisterObject()
{
  return _NeroTransportUnregisterObject();
}

uint64_t SBSSetStatusBarShowsOverridesForRecording()
{
  return _SBSSetStatusBarShowsOverridesForRecording();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return _fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return _fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

uint64_t g87kjbhgf()
{
  return _g87kjbhgf();
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

const char *getprogname(void)
{
  return _getprogname();
}

uint64_t in_audio_mx_server_process()
{
  return _in_audio_mx_server_process();
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

uint64_t lockdown_copy_trustedHostAttached()
{
  return _lockdown_copy_trustedHostAttached();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return [a1 deviceMotion];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_getLabels(void *a1, const char *a2, ...)
{
  return [a1 getLabels];
}

id objc_msgSend_getValues(void *a1, const char *a2, ...)
{
  return [a1 getValues];
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return [a1 quaternion];
}

id objc_msgSend_resetLines(void *a1, const char *a2, ...)
{
  return [a1 resetLines];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}