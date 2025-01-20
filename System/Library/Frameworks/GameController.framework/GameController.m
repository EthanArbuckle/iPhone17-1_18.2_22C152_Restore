uint64_t GCFrameworkStaticInitializer()
{
  return +[GCFrameworkInitialization listenForObservers];
}

void __currentProcessIsGameControllerDaemon_block_invoke()
{
  id v1 = +[NSBundle mainBundle];
  v0 = [v1 bundleIdentifier];
  currentProcessIsGameControllerDaemon_IsGameControllerDaemon = [v0 isEqualToString:@"com.apple.GameController.gamecontrollerd"];
}

uint64_t gc_isInternalBuild()
{
  if (gc_isInternalBuild_onceToken != -1) {
    dispatch_once(&gc_isInternalBuild_onceToken, &__block_literal_global_12);
  }
  return gc_isInternalBuild_isInternalBuild;
}

uint64_t currentProcessIsGameControllerDaemon()
{
  if (currentProcessIsGameControllerDaemon_onceToken != -1) {
    dispatch_once(&currentProcessIsGameControllerDaemon_onceToken, &__block_literal_global_221);
  }
  return currentProcessIsGameControllerDaemon_IsGameControllerDaemon;
}

uint64_t __gc_isInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  gc_isInternalBuild_isInternalBuild = result;
  return result;
}

void sub_22099C238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_2(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

BOOL GCMicroGamepadSnapshotDataFromNSData(GCMicroGamepadSnapshotData *snapshotData, NSData *data)
{
  v3 = data;
  uint64_t v4 = v3;
  BOOL v5 = 0;
  if (snapshotData && v3)
  {
    int v8 = 0;
    [(NSData *)v3 getBytes:&v8 length:4];
    uint64_t v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x14u)
    {
      [(NSData *)v4 getBytes:snapshotData length:HIWORD(v8)];
      if (v6 != 20) {
        bzero((char *)snapshotData + HIWORD(v8), 20 - v6);
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

BOOL GCExtendedGamepadSnapshotDataFromNSData(GCExtendedGamepadSnapshotData *snapshotData, NSData *data)
{
  v3 = data;
  uint64_t v4 = v3;
  BOOL v5 = 0;
  if (snapshotData && v3)
  {
    int v8 = 0;
    [(NSData *)v3 getBytes:&v8 length:4];
    uint64_t v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x3Fu)
    {
      [(NSData *)v4 getBytes:snapshotData length:HIWORD(v8)];
      if (v6 != 63) {
        bzero((char *)snapshotData + HIWORD(v8), 63 - v6);
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

NSData *__cdecl NSDataFromGCMicroGamepadSnapshotData(GCMicroGamepadSnapshotData *snapshotData)
{
  if (snapshotData)
  {
    v2 = snapshotData;
    if (!snapshotData->version)
    {
      long long v4 = *(_OWORD *)&snapshotData->version;
      *(float *)&uint64_t v5 = snapshotData->buttonX;
      LODWORD(v4) = 1310976;
      v2 = (GCMicroGamepadSnapshotData *)&v4;
    }
    +[NSData dataWithBytes:length:](&off_26D2B69D0, "dataWithBytes:length:", v2, 20, v4, v5);
    snapshotData = (GCMicroGamepadSnapshotData *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return (NSData *)snapshotData;
}

NSData *__cdecl NSDataFromGCExtendedGamepadSnapshotData(GCExtendedGamepadSnapshotData *snapshotData)
{
  if (snapshotData)
  {
    v2 = snapshotData;
    if (!snapshotData->version)
    {
      long long v3 = *(_OWORD *)&snapshotData->buttonB;
      long long v5 = *(_OWORD *)&snapshotData->version;
      long long v6 = v3;
      v7[0] = *(_OWORD *)&snapshotData->rightShoulder;
      *(_OWORD *)((char *)v7 + 15) = *(_OWORD *)((char *)&snapshotData->rightThumbstickX + 3);
      LODWORD(v5) = 4129025;
      v2 = (GCExtendedGamepadSnapshotData *)&v5;
    }
    +[NSData dataWithBytes:length:](&off_26D2B69D0, "dataWithBytes:length:", v2, 63, v5, v6, v7[0], v7[1]);
    snapshotData = (GCExtendedGamepadSnapshotData *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return (NSData *)snapshotData;
}

BOOL GCMicroGamepadSnapShotDataV100FromNSData(GCMicroGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  long long v3 = data;
  long long v4 = v3;
  BOOL v5 = 0;
  if (snapshotData && v3)
  {
    int v8 = 0;
    [(NSData *)v3 getBytes:&v8 length:4];
    uint64_t v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x14u)
    {
      [(NSData *)v4 getBytes:snapshotData length:HIWORD(v8)];
      if (v6 != 20) {
        bzero((char *)snapshotData + HIWORD(v8), 20 - v6);
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

BOOL GCExtendedGamepadSnapShotDataV100FromNSData(GCExtendedGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  long long v3 = data;
  long long v4 = v3;
  BOOL v5 = 0;
  if (snapshotData && v3)
  {
    int v8 = 0;
    [(NSData *)v3 getBytes:&v8 length:4];
    uint64_t v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x3Cu)
    {
      [(NSData *)v4 getBytes:snapshotData length:HIWORD(v8)];
      if (v6 != 60) {
        bzero((char *)snapshotData + HIWORD(v8), 60 - v6);
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

NSData *__cdecl NSDataFromGCMicroGamepadSnapShotDataV100(GCMicroGamepadSnapShotDataV100 *snapshotData)
{
  if (snapshotData)
  {
    v2 = snapshotData;
    if (!snapshotData->version)
    {
      long long v4 = *(_OWORD *)&snapshotData->version;
      *(float *)&uint64_t v5 = snapshotData->buttonX;
      LODWORD(v4) = 1310976;
      v2 = (GCMicroGamepadSnapShotDataV100 *)&v4;
    }
    +[NSData dataWithBytes:length:](&off_26D2B69D0, "dataWithBytes:length:", v2, 20, v4, v5);
    snapshotData = (GCMicroGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return (NSData *)snapshotData;
}

NSData *__cdecl NSDataFromGCExtendedGamepadSnapShotDataV100(GCExtendedGamepadSnapShotDataV100 *snapshotData)
{
  if (snapshotData)
  {
    v2 = snapshotData;
    if (!snapshotData->version)
    {
      long long v3 = *(_OWORD *)&snapshotData->buttonB;
      long long v5 = *(_OWORD *)&snapshotData->version;
      long long v6 = v3;
      v7[0] = *(_OWORD *)&snapshotData->rightShoulder;
      *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)&snapshotData->rightThumbstickX;
      LODWORD(v5) = 3932416;
      v2 = (GCExtendedGamepadSnapShotDataV100 *)&v5;
    }
    +[NSData dataWithBytes:length:](&off_26D2B69D0, "dataWithBytes:length:", v2, 60, v5, v6, v7[0], v7[1]);
    snapshotData = (GCExtendedGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return (NSData *)snapshotData;
}

void sub_2209A1078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSXPCInterface *GCAgentClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B3C28];
}

id GCAgentServerInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D299F20];
  uint64_t v1 = GCVideoRelocationXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v1 forSelector:sel_connectToVideoRelocationXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  v2 = GCVideoRelocationXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v2 forSelector:sel_connectToVideoRelocationXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  long long v3 = GCUserDefaultsXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v3 forSelector:sel_connectToUserDefaultsXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  long long v4 = GCUserDefaultsXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v4 forSelector:sel_connectToUserDefaultsXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_2209A1A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209A2450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCBatteryXPCProxyRemoteClientEndpointInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D28C348];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCBatteryXPCProxyRemoteServerEndpointInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D28C4F8];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCBatteryXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A680];
}

id GCBatteryXPCProxyServiceRemoteServerInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29EA18];
  uint64_t v1 = GCBatteryXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_batteryXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  v2 = GCBatteryXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_batteryXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *GCSystemGestureModeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Off";
  }
  else {
    return off_26D22AA68[a1];
  }
}

void sub_2209A3E0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A3FB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A43E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A4564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A4BA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A4ECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A5410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _DescendantPointerEvent(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 && IOHIDEventGetType() != 17)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (CFArrayRef v3 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        uint64_t v8 = _DescendantPointerEvent(ValueAtIndex);
        if (v8) {
          break;
        }
        if (v5 == ++v6) {
          return 0;
        }
      }
      return v8;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2209A59D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A5A58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209A5C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_2209A5E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

uint64_t HapticSharedMemory::allocate(uint64_t a1, void **a2, _DWORD *a3)
{
  xpc_object_t v6 = xpc_null_create();
  v7 = *a2;
  *a2 = v6;

  *a3 = 0;
  uint64_t v16 = 1;
  v15 = &unk_26D285930;
  id v17 = 0;
  uint64_t inited = SharableMemoryBlock::InitServer(a1, 0x189C0uLL, &v15);
  if (!inited)
  {
    uint64_t v9 = *(int **)(a1 + 24);
    if (v9)
    {
      NSLog(&cfstr_ClearingRingBu.isa);
      int v10 = *(_DWORD *)(a1 + 16) - 16;
      v9[1] = 0;
      v9[2] = 0;
      *uint64_t v9 = v10;
    }
    id v11 = v17;
    xpc_object_t v12 = v11;
    if (!v11) {
      xpc_object_t v12 = xpc_null_create();
    }

    v13 = *a2;
    *a2 = v12;

    *a3 = HIDWORD(v16);
  }
  SharableMemoryBlock::XPCServerToken::~XPCServerToken((SharableMemoryBlock::XPCServerToken *)&v15);
  return inited;
}

void sub_2209A7038(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SharableMemoryBlock::XPCServerToken::~XPCServerToken((SharableMemoryBlock::XPCServerToken *)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_2209AAB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  __destructor_8_s0_s8_s16(v17);
  __destructor_8_s0_s8_s16((uint64_t)va);
  _Unwind_Resume(a1);
}

double __copy_helper_block_e8_40n20_8_8_s0_s8_s16_t24w64(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = __copy_constructor_8_8_s0_s8_s16_t24w64(a1 + 40, a2 + 40).n128_u64[0];
  return result;
}

__n128 __copy_constructor_8_8_s0_s8_s16_t24w64(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  __n128 result = *(__n128 *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 72) = v6;
  *(_OWORD *)(a1 + 56) = v5;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40n11_8_s0_s8_s16(uint64_t a1)
{
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

void sub_2209AD4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223C6E420](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2209ADE40(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1 - 176);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_s0_t8w39_s48_s56_s64(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 39);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)(a1 + 39) = v4;
  *(void *)(a1 + 48) = *(id *)(a2 + 48);
  *(void *)(a1 + 56) = *(id *)(a2 + 56);
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  return result;
}

void __destructor_8_s0_s48_s56_s64(uint64_t a1)
{
  v2 = *(void **)(a1 + 64);
}

void sub_2209AE130(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + *(int *)(v2 + 3736)));
  objc_exception_rethrow();
}

void sub_2209AE14C(_Unwind_Exception *a1)
{
}

void sub_2209AE2BC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2209AE2D4(_Unwind_Exception *a1)
{
}

void sub_2209AE3F4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2209AE408(_Unwind_Exception *a1)
{
}

void SetupVirtualGameControllerIfForced()
{
  if (SetupVirtualGameControllerIfForced_onceToken != -1) {
    dispatch_once(&SetupVirtualGameControllerIfForced_onceToken, &__block_literal_global_4);
  }
}

void __SetupVirtualGameControllerIfForced_block_invoke()
{
  id v3 = (id)[objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
  if ([v3 BOOLForKey:@"GCForceVirtual"])
  {
    v0 = VirtualControllerBundle();
    uint64_t v1 = v0;
    if (v0)
    {
      uint64_t v2 = (void *)[v0 classNamed:@"_GCVirtualControllerImpl"];
      if (v2) {
        [v2 forceVirtualController];
      }
    }
  }
}

id VirtualControllerBundle()
{
  v0 = (void *)VirtualControllerBundle_Bundle;
  if (VirtualControllerBundle_Bundle) {
    goto LABEL_2;
  }
  id v3 = GCFrameworkBundle();
  uint64_t v4 = [v3 URLForResource:@"VirtualGameController" withExtension:@"bundle"];
  if (v4)
  {
    long long v5 = (void *)v4;
    long long v6 = +[NSBundle bundleWithURL:v4];
    v7 = v6;
    if (v6)
    {
      id v14 = 0;
      char v8 = [v6 loadAndReturnError:&v14];
      uint64_t v9 = v14;
      if (v8)
      {
        id v10 = v7;
        int v11 = 0;
        xpc_object_t v12 = VirtualControllerBundle_Bundle;
        VirtualControllerBundle_Bundle = (uint64_t)v10;
      }
      else
      {
        xpc_object_t v12 = _gc_log_virtualcontroller();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          VirtualControllerBundle_cold_3((uint64_t)v9, v12);
        }
        int v11 = 1;
      }
    }
    else
    {
      uint64_t v9 = _gc_log_virtualcontroller();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        VirtualControllerBundle_cold_2(v5);
      }
      int v11 = 1;
    }

    if (!v11)
    {
      v0 = (void *)VirtualControllerBundle_Bundle;
LABEL_2:
      id v1 = v0;
      goto LABEL_3;
    }
  }
  else
  {
    v13 = _gc_log_virtualcontroller();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      VirtualControllerBundle_cold_1(v3);
    }
  }
  id v1 = 0;
LABEL_3:

  return v1;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t __ControllerAxisInputSetValue_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Axis Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(float))(*(void *)(a1 + 56) + 16))(*(float *)(a1 + 80));
}

id gcBundle()
{
  if (gcBundle_onceToken != -1) {
    dispatch_once(&gcBundle_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)_gcBundle;

  return v0;
}

void __gcBundle_block_invoke()
{
  uint64_t v0 = +[NSBundle bundleWithIdentifier:@"com.apple.GameController"];
  id v1 = (void *)_gcBundle;
  _gcBundle = v0;
}

id GCExecutablePathWithPID()
{
  int v0 = MEMORY[0x270FA5388]();
  id v1 = objc_msgSend(objc_alloc((Class)&off_26D2B6E68), "initWithBytes:length:encoding:", buffer, proc_pidpath(v0, buffer, 0x1000u), 4);

  return v1;
}

id GCBundleWithPID()
{
  int v0 = GCExecutablePathWithPID();
  id v1 = +[NSURL fileURLWithPath:v0];
  if (v1)
  {
    uint64_t v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (v2)
    {
      id v3 = +[NSBundle bundleWithURL:v2];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id GCFrameworkBundle()
{
  if (GCFrameworkBundle_onceToken != -1) {
    dispatch_once(&GCFrameworkBundle_onceToken, &__block_literal_global_101);
  }
  int v0 = (void *)GCFrameworkBundle_bundle;

  return v0;
}

void __GCFrameworkBundle_block_invoke()
{
  uint64_t v0 = +[NSBundle bundleForClass:objc_opt_class()];
  id v1 = (void *)GCFrameworkBundle_bundle;
  GCFrameworkBundle_bundle = v0;
}

id GCGameIntentBlocklist()
{
  if (GCGameIntentBlocklist_onceToken != -1) {
    dispatch_once(&GCGameIntentBlocklist_onceToken, &__block_literal_global_104);
  }
  uint64_t v0 = (void *)GCGameIntentBlocklist__gameIntentBlockList;

  return v0;
}

void __GCGameIntentBlocklist_block_invoke()
{
  uint64_t v0 = +[NSSet setWithObjects:@"com.apple.mobilesafari", @"com.apple.SafariViewService", 0];
  id v1 = (void *)GCGameIntentBlocklist__gameIntentBlockList;
  GCGameIntentBlocklist__gameIntentBlockList = v0;
}

double clamp(double a1, double a2, double a3)
{
  if (a1 <= a3) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

__IOHIDDevice *deviceMatchesUsageAndUsagePage(__IOHIDDevice *result, int a2, int a3)
{
  if (result)
  {
    id result = (__IOHIDDevice *)IOHIDDeviceGetProperty(result, @"DeviceUsagePairs");
    if (result)
    {
      CFArrayRef v5 = result;
      CFIndex Count = CFArrayGetCount(result);
      if (Count < 1)
      {
        return 0;
      }
      else
      {
        CFIndex v7 = Count;
        int v18 = a3;
        BOOL v8 = 0;
        uint64_t v9 = 1;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9 - 1);
          if (ValueAtIndex)
          {
            CFDictionaryRef v11 = ValueAtIndex;
            Value = CFDictionaryGetValue(ValueAtIndex, @"DeviceUsage");
            v13 = CFDictionaryGetValue(v11, @"DeviceUsagePage");
            if (Value)
            {
              id v14 = v13;
              if (v13)
              {
                CFTypeID v15 = CFGetTypeID(Value);
                if (v15 == CFNumberGetTypeID())
                {
                  CFTypeID v16 = CFGetTypeID(v14);
                  if (v16 == CFNumberGetTypeID())
                  {
                    uint64_t valuePtr = 0;
                    CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, (char *)&valuePtr + 4);
                    CFNumberGetValue((CFNumberRef)v14, kCFNumberIntType, &valuePtr);
                    BOOL v8 = valuePtr == a2 && HIDWORD(valuePtr) == v18;
                  }
                }
              }
            }
          }
          if (v9 >= v7) {
            break;
          }
          ++v9;
        }
        while (!v8);
      }
      return (__IOHIDDevice *)v8;
    }
  }
  return result;
}

BOOL elementRangesMatch(__IOHIDElement *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  CFIndex LogicalMin = IOHIDElementGetLogicalMin(a1);
  CFIndex LogicalMax = IOHIDElementGetLogicalMax(a1);
  CFIndex PhysicalMin = IOHIDElementGetPhysicalMin(a1);
  CFIndex PhysicalMax = IOHIDElementGetPhysicalMax(a1);
  uint32_t ReportSize = IOHIDElementGetReportSize(a1);
  ReportCFIndex Count = IOHIDElementGetReportCount(a1);
  return LogicalMin == a2
      && LogicalMax == a3
      && PhysicalMin == a4
      && PhysicalMax == a5
      && ReportSize == a6
      && ReportCount == a7;
}

BOOL doesDescriptorConformToSpec(__IOHIDServiceClient *a1)
{
  return IOHIDServiceClientConformsTo(a1, 1u, 5u) != 0;
}

__IOHIDServiceClient *serviceMatchesUsageAndUsagePage(__IOHIDServiceClient *result, int a2, int a3)
{
  if (result)
  {
    id result = (__IOHIDServiceClient *)IOHIDServiceClientCopyProperty(result, @"DeviceUsagePairs");
    if (result)
    {
      CFArrayRef v5 = result;
      CFIndex Count = CFArrayGetCount(result);
      if (Count < 1)
      {
        BOOL v8 = 0;
      }
      else
      {
        CFIndex v7 = Count;
        BOOL v8 = 0;
        uint64_t v9 = 1;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9 - 1);
          if (ValueAtIndex)
          {
            CFDictionaryRef v11 = ValueAtIndex;
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"DeviceUsage");
            CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v11, @"DeviceUsagePage");
            if (Value)
            {
              CFNumberRef v14 = v13;
              if (v13)
              {
                uint64_t valuePtr = 0;
                CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
                CFNumberGetValue(v14, kCFNumberIntType, &valuePtr);
                BOOL v8 = valuePtr == a2 && HIDWORD(valuePtr) == a3;
              }
            }
          }
          if (v9 >= v7) {
            break;
          }
          ++v9;
        }
        while (!v8);
      }
      CFRelease(v5);
      return (__IOHIDServiceClient *)v8;
    }
  }
  return result;
}

uint64_t isDeviceParentAuthenticated(__IOHIDServiceClient *a1)
{
  uint64_t v2 = GC_IOHIDServiceClientGetStringProperty(a1, @"Transport");
  if ([v2 isEqualToString:@"USB"])
  {
    id v3 = IOHIDServiceClientGetRegistryID(a1);
    CFDictionaryRef v4 = IORegistryEntryIDMatching([v3 unsignedLongValue]);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    if (MatchingService)
    {
      io_registry_entry_t v6 = MatchingService;
      if (gc_isInternalBuild())
      {
        __int16 v10 = getGCLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12[0] = 67109376;
          v12[1] = v6;
          __int16 v13 = 2048;
          uint64_t v14 = [v3 unsignedLongValue];
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "Retrieved matching service %d for registry %lu", (uint8_t *)v12, 0x12u);
        }
      }
      CFIndex v7 = (void *)IORegistryEntrySearchCFProperty(v6, "IOService", @"Authenticated", 0, 3u);
      if (v7)
      {
        if (gc_isInternalBuild())
        {
          CFDictionaryRef v11 = getGCLogger();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v12[0]) = 0;
            _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Found kIOHIDAuthenticatedDeviceKey property set in parent", (uint8_t *)v12, 2u);
          }
        }
        uint64_t v8 = [v7 BOOLValue];
      }
      else
      {
        uint64_t v8 = 0;
      }
      IOObjectRelease(v6);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t isDeviceMFiGamepadCompliantForDeviceRef(__IOHIDDevice *a1)
{
  CFArrayRef v1 = IOHIDDeviceCopyMatchingElements(a1, 0, 0);
  CFArrayRef v2 = v1;
  if (v1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    CFArrayRef v19 = v1;
    CFArrayRef v3 = v1;
    uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v3);
          }
          CFDictionaryRef v11 = *(__IOHIDElement **)(*((void *)&v20 + 1) + 8 * i);
          uint32_t UsagePage = IOHIDElementGetUsagePage(v11);
          uint32_t Usage = IOHIDElementGetUsage(v11);
          if (UsagePage == 9)
          {
            if (Usage <= 8) {
              v8 |= (1 << (Usage - 1));
            }
          }
          else if (UsagePage == 1)
          {
            if (Usage - 144 <= 3) {
              v7 |= (1 << (Usage + 112));
            }
          }
          else if (Usage == 547 && UsagePage == 12)
          {
            char v6 = 1;
          }
        }
        uint64_t v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v5);
    }
    else
    {
      char v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }

    unsigned int v15 = v6 & 1;
    CFArrayRef v2 = v19;
  }
  else
  {
    unsigned int v15 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  if (gc_isInternalBuild())
  {
    int v18 = getGCLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v25 = v8;
      __int16 v26 = 2048;
      uint64_t v27 = v7;
      __int16 v28 = 1024;
      unsigned int v29 = v15;
      _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "Is device MFi compliant? Buttons: 0x%lx, Dpad: 0x%lx, ACHome: %d", buf, 0x1Cu);
    }
  }
  if (~(_BYTE)v8 | (unint64_t)(~(_BYTE)v7 & 0xF)) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15;
  }

  return v16;
}

__IOHIDServiceClient *isDeviceKeyboard(__IOHIDServiceClient *a1)
{
  id result = serviceMatchesUsageAndUsagePage(a1, 1, 6);
  if (result) {
    return (__IOHIDServiceClient *)(isDeviceAppleDirectionalRemote(a1) ^ 1);
  }
  return result;
}

uint64_t isDeviceAppleDirectionalRemote(__IOHIDServiceClient *a1)
{
  CFArrayRef v2 = GC_IOHIDServiceClientGetNumberProperty(a1, @"VendorID");
  int v3 = [v2 unsignedIntValue];

  uint64_t v4 = GC_IOHIDServiceClientGetNumberProperty(a1, @"ProductID");
  int v5 = [v4 unsignedIntValue];

  unsigned int v6 = serviceMatchesUsageAndUsagePage(a1, 12, 1);
  unsigned int v7 = serviceMatchesUsageAndUsagePage(a1, 13, 5);
  BOOL v8 = (v5 & 0xFFFFFFFE) == 0x314 && v3 == 76;
  if ((v5 & 0xFFFFFFFE) == 0x314) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v3 == 147 && v5 == 40960) {
    BOOL v8 = 1;
  }
  return v8 & v6 | v9;
}

__IOHIDServiceClient *isDeviceMouse(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 1, 2);
}

__IOHIDServiceClient *isDeviceAppleEmbeddedBluetoothButtons(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 12, 1);
}

__IOHIDServiceClient *isDeviceAppleMultiPointDigitizer(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 12);
}

__IOHIDServiceClient *isDeviceAppleTouchpad(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 5);
}

__IOHIDServiceClient *isDeviceMotionLite(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 65280, 16);
}

__IOHIDServiceClient *isDeviceAppleControlCenterRemote(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 5);
}

__IOHIDServiceClient *isDeviceAppleSiriRemote(__IOHIDServiceClient *a1)
{
  CFArrayRef v2 = GC_IOHIDServiceClientGetNumberProperty(a1, @"VendorID");
  int v3 = [v2 unsignedIntValue];

  uint64_t v4 = GC_IOHIDServiceClientGetNumberProperty(a1, @"ProductID");
  int v5 = [v4 unsignedIntValue];

  BOOL v7 = v5 == 614 || v5 == 621;
  BOOL v8 = v3 == 76 && v7;
  uint64_t v9 = 1;
  unsigned int v10 = serviceMatchesUsageAndUsagePage(a1, 12, 1);
  CFDictionaryRef v11 = serviceMatchesUsageAndUsagePage(a1, 13, 12);
  unsigned int v12 = serviceMatchesUsageAndUsagePage(a1, 65280, 16);
  unsigned int v13 = serviceMatchesUsageAndUsagePage(a1, 13, 5);
  if (!v8 || ((v10 | v12 | v13) & 1) == 0)
  {
    if (v5 == 621 || v5 == 614) {
      return v11;
    }
    else {
      return 0;
    }
  }
  return (__IOHIDServiceClient *)v9;
}

uint64_t isDeviceXbox(int a1, int a2)
{
  if (a1 != 1118) {
    return 0;
  }
  uint64_t result = 1;
  if (a2 > 2817)
  {
    if ((a2 - 2818) <= 0x22 && ((1 << (a2 - 2)) & 0x7C0030409) != 0) {
      return result;
    }
    return 0;
  }
  if (a2 != 654 && a2 != 736 && a2 != 765) {
    return 0;
  }
  return result;
}

BOOL isDeviceDualShock4(int a1, int a2)
{
  BOOL v3 = a2 == 1476 || a2 == 2508;
  return a1 == 1356 && v3;
}

BOOL isDeviceDualSense(int a1, int a2)
{
  return a1 == 1356 && a2 == 3302;
}

BOOL isDeviceDualSenseEdge(int a1, int a2)
{
  return a1 == 1356 && a2 == 3570;
}

BOOL isDeviceLuna(int a1, int a2)
{
  return a1 == 369 && a2 == 1049;
}

BOOL isDeviceSwitchJoyCon(int a1, unsigned int a2)
{
  BOOL v3 = a2 == 8206 || a2 >> 1 == 4099;
  return a1 == 1406 && v3;
}

BOOL isDeviceSwitchProController(int a1, int a2)
{
  return a1 == 1406 && a2 == 8201;
}

BOOL isDeviceSwitchSuperFamicomController(int a1, int a2)
{
  return a1 == 1406 && a2 == 8215;
}

BOOL isDeviceSwitchN64Controller(int a1, int a2)
{
  return a1 == 1406 && a2 == 8217;
}

id ControllerClassForService(__IOHIDServiceClient *a1)
{
  if (isDeviceKeyboard(a1))
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_12;
    }
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      unsigned int v6 = a1;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard discovered: %@", (uint8_t *)&v5, 0xCu);
    }
    goto LABEL_28;
  }
  if (serviceMatchesUsageAndUsagePage(a1, 1, 2))
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_12;
    }
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      unsigned int v6 = a1;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "Mouse discovered: %@", (uint8_t *)&v5, 0xCu);
    }
    goto LABEL_28;
  }
  if (isDeviceAppleSiriRemote(a1))
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_12;
    }
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "is apple siri remote", (uint8_t *)&v5, 2u);
    }
    goto LABEL_28;
  }
  if (isDeviceAppleDirectionalRemote(a1))
  {
    if (!gc_isInternalBuild())
    {
LABEL_12:
      CFArrayRef v2 = objc_opt_class();
      goto LABEL_13;
    }
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "is apple directional remote", (uint8_t *)&v5, 2u);
    }
LABEL_28:

    goto LABEL_12;
  }
  CFArrayRef v2 = 0;
LABEL_13:

  return v2;
}

__CFString *VendorNameForATVProfile(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_26D294150])
  {
    uint64_t v2 = [v1 deviceType];
    if ((unint64_t)(v2 - 1) > 5) {
      BOOL v3 = @"Unset";
    }
    else {
      BOOL v3 = off_26D22AE20[v2 - 1];
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

BOOL currentProcessHasEntitlement(void *a1)
{
  id v1 = a1;
  [v1 UTF8String];
  uint64_t v2 = (void *)xpc_copy_entitlement_for_self();
  BOOL v3 = v2;
  if (v2)
  {
    BOOL value = xpc_BOOL_get_value(v2);
    if (gc_isInternalBuild())
    {
      int v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unsigned int v6 = @"NO";
        if (value) {
          unsigned int v6 = @"YES";
        }
        int v8 = 138412546;
        id v9 = v1;
        __int16 v10 = 2112;
        CFDictionaryRef v11 = v6;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Does the current process have entitlement (%@)? %@", (uint8_t *)&v8, 0x16u);
      }
LABEL_13:
    }
  }
  else
  {
    if (gc_isInternalBuild())
    {
      int v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v1;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Unable to find entitlement %@", (uint8_t *)&v8, 0xCu);
      }
      BOOL value = 0;
      goto LABEL_13;
    }
    BOOL value = 0;
  }

  return value;
}

id currentProcessBundleIdentifier()
{
  if (currentProcessBundleIdentifier_onceToken != -1) {
    dispatch_once(&currentProcessBundleIdentifier_onceToken, &__block_literal_global_226);
  }
  uint64_t v0 = (void *)currentProcessBundleIdentifier_currentProcessBundleIdentifier;

  return v0;
}

void __currentProcessBundleIdentifier_block_invoke()
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  id v1 = (void *)currentProcessBundleIdentifier_currentProcessBundleIdentifier;
  currentProcessBundleIdentifier_currentProcessBundleIdentifier = v0;
}

__CFString *nameForKeyCode(uint64_t a1)
{
  if (nameForKeyCode_onceToken != -1) {
    dispatch_once(&nameForKeyCode_onceToken, &__block_literal_global_228);
  }
  id v2 = (void *)nameForKeyCode_dict;
  BOOL v3 = +[NSNumber numberWithLong:a1];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = &stru_26D27BBB8;
  }
  unsigned int v6 = v5;

  return v6;
}

void __nameForKeyCode_block_invoke()
{
  v135 = +[NSNumber numberWithLong:4];
  v136[0] = v135;
  v137[0] = @"A";
  v134 = +[NSNumber numberWithLong:5];
  v136[1] = v134;
  v137[1] = @"B";
  v133 = +[NSNumber numberWithLong:6];
  v136[2] = v133;
  v137[2] = @"C";
  v132 = +[NSNumber numberWithLong:7];
  v136[3] = v132;
  v137[3] = @"D";
  v131 = +[NSNumber numberWithLong:8];
  v136[4] = v131;
  v137[4] = @"E";
  v130 = +[NSNumber numberWithLong:9];
  v136[5] = v130;
  v137[5] = @"F";
  v129 = +[NSNumber numberWithLong:10];
  v136[6] = v129;
  v137[6] = @"G";
  v128 = +[NSNumber numberWithLong:11];
  v136[7] = v128;
  v137[7] = @"H";
  v127 = +[NSNumber numberWithLong:12];
  v136[8] = v127;
  v137[8] = @"I";
  v126 = +[NSNumber numberWithLong:13];
  v136[9] = v126;
  v137[9] = @"J";
  v125 = +[NSNumber numberWithLong:14];
  v136[10] = v125;
  v137[10] = @"K";
  v124 = +[NSNumber numberWithLong:15];
  v136[11] = v124;
  v137[11] = @"L";
  v123 = +[NSNumber numberWithLong:16];
  v136[12] = v123;
  v137[12] = @"M";
  v122 = +[NSNumber numberWithLong:17];
  v136[13] = v122;
  v137[13] = @"N";
  v121 = +[NSNumber numberWithLong:18];
  v136[14] = v121;
  v137[14] = @"O";
  v120 = +[NSNumber numberWithLong:19];
  v136[15] = v120;
  v137[15] = @"P";
  v119 = +[NSNumber numberWithLong:20];
  v136[16] = v119;
  v137[16] = @"Q";
  v118 = +[NSNumber numberWithLong:21];
  v136[17] = v118;
  v137[17] = @"R";
  v117 = +[NSNumber numberWithLong:22];
  v136[18] = v117;
  v137[18] = @"S";
  v116 = +[NSNumber numberWithLong:23];
  v136[19] = v116;
  v137[19] = @"T";
  v115 = +[NSNumber numberWithLong:24];
  v136[20] = v115;
  v137[20] = @"U";
  v114 = +[NSNumber numberWithLong:25];
  v136[21] = v114;
  v137[21] = @"V";
  v113 = +[NSNumber numberWithLong:26];
  v136[22] = v113;
  v137[22] = @"W";
  v112 = +[NSNumber numberWithLong:27];
  v136[23] = v112;
  v137[23] = @"X";
  v111 = +[NSNumber numberWithLong:28];
  v136[24] = v111;
  v137[24] = @"Y";
  v110 = +[NSNumber numberWithLong:29];
  v136[25] = v110;
  v137[25] = @"Z";
  v109 = +[NSNumber numberWithLong:30];
  v136[26] = v109;
  v137[26] = @"One";
  v108 = +[NSNumber numberWithLong:31];
  v136[27] = v108;
  v137[27] = @"Two";
  v107 = +[NSNumber numberWithLong:32];
  v136[28] = v107;
  v137[28] = @"Three";
  v106 = +[NSNumber numberWithLong:33];
  v136[29] = v106;
  v137[29] = @"Four";
  v105 = +[NSNumber numberWithLong:34];
  v136[30] = v105;
  v137[30] = @"Five";
  v104 = +[NSNumber numberWithLong:35];
  v136[31] = v104;
  v137[31] = @"Six";
  v103 = +[NSNumber numberWithLong:36];
  v136[32] = v103;
  v137[32] = @"Seven";
  v102 = +[NSNumber numberWithLong:37];
  v136[33] = v102;
  v137[33] = @"Eight";
  v101 = +[NSNumber numberWithLong:38];
  v136[34] = v101;
  v137[34] = @"Nine";
  v100 = +[NSNumber numberWithLong:39];
  v136[35] = v100;
  v137[35] = @"Zero";
  v99 = +[NSNumber numberWithLong:40];
  v136[36] = v99;
  v137[36] = @"ReturnOrEnter";
  v98 = +[NSNumber numberWithLong:41];
  v136[37] = v98;
  v137[37] = @"Escape";
  v97 = +[NSNumber numberWithLong:42];
  v136[38] = v97;
  v137[38] = @"DeleteOrBackspace";
  v96 = +[NSNumber numberWithLong:43];
  v136[39] = v96;
  v137[39] = @"Tab";
  v95 = +[NSNumber numberWithLong:44];
  v136[40] = v95;
  v137[40] = @"Spacebar";
  v94 = +[NSNumber numberWithLong:45];
  v136[41] = v94;
  v137[41] = @"Hyphen";
  v93 = +[NSNumber numberWithLong:46];
  v136[42] = v93;
  v137[42] = @"EqualSign";
  v92 = +[NSNumber numberWithLong:47];
  v136[43] = v92;
  v137[43] = @"OpenBracket";
  v91 = +[NSNumber numberWithLong:48];
  v136[44] = v91;
  v137[44] = @"CloseBracket";
  v90 = +[NSNumber numberWithLong:49];
  v136[45] = v90;
  v137[45] = @"Backslash";
  v89 = +[NSNumber numberWithLong:50];
  v136[46] = v89;
  v137[46] = @"NonUSPound";
  v88 = +[NSNumber numberWithLong:51];
  v136[47] = v88;
  v137[47] = @"Semicolon";
  v87 = +[NSNumber numberWithLong:52];
  v136[48] = v87;
  v137[48] = @"Quote";
  v86 = +[NSNumber numberWithLong:53];
  v136[49] = v86;
  v137[49] = @"GraveAccentAndTilde";
  v85 = +[NSNumber numberWithLong:54];
  v136[50] = v85;
  v137[50] = @"Comma";
  v84 = +[NSNumber numberWithLong:55];
  v136[51] = v84;
  v137[51] = @"Period";
  v83 = +[NSNumber numberWithLong:56];
  v136[52] = v83;
  v137[52] = @"Slash";
  v82 = +[NSNumber numberWithLong:57];
  v136[53] = v82;
  v137[53] = @"CapsLock";
  v81 = +[NSNumber numberWithLong:58];
  v136[54] = v81;
  v137[54] = @"F1";
  v80 = +[NSNumber numberWithLong:59];
  v136[55] = v80;
  v137[55] = @"F2";
  v79 = +[NSNumber numberWithLong:60];
  v136[56] = v79;
  v137[56] = @"F3";
  v78 = +[NSNumber numberWithLong:61];
  v136[57] = v78;
  v137[57] = @"F4";
  v77 = +[NSNumber numberWithLong:62];
  v136[58] = v77;
  v137[58] = @"F5";
  v76 = +[NSNumber numberWithLong:63];
  v136[59] = v76;
  v137[59] = @"F6";
  v75 = +[NSNumber numberWithLong:64];
  v136[60] = v75;
  v137[60] = @"F7";
  v74 = +[NSNumber numberWithLong:65];
  v136[61] = v74;
  v137[61] = @"F8";
  v73 = +[NSNumber numberWithLong:66];
  v136[62] = v73;
  v137[62] = @"F9";
  v72 = +[NSNumber numberWithLong:67];
  v136[63] = v72;
  v137[63] = @"F10";
  v71 = +[NSNumber numberWithLong:68];
  v136[64] = v71;
  v137[64] = @"F11";
  v70 = +[NSNumber numberWithLong:69];
  v136[65] = v70;
  v137[65] = @"F12";
  v69 = +[NSNumber numberWithLong:104];
  v136[66] = v69;
  v137[66] = @"F13";
  v68 = +[NSNumber numberWithLong:105];
  v136[67] = v68;
  v137[67] = @"F14";
  v67 = +[NSNumber numberWithLong:106];
  v136[68] = v67;
  v137[68] = @"F15";
  v66 = +[NSNumber numberWithLong:107];
  v136[69] = v66;
  v137[69] = @"F16";
  v65 = +[NSNumber numberWithLong:108];
  v136[70] = v65;
  v137[70] = @"F17";
  v64 = +[NSNumber numberWithLong:109];
  v136[71] = v64;
  v137[71] = @"F18";
  v63 = +[NSNumber numberWithLong:110];
  v136[72] = v63;
  v137[72] = @"F19";
  v62 = +[NSNumber numberWithLong:111];
  v136[73] = v62;
  v137[73] = @"F20";
  v61 = +[NSNumber numberWithLong:70];
  v136[74] = v61;
  v137[74] = @"PrintScreen";
  v60 = +[NSNumber numberWithLong:71];
  v136[75] = v60;
  v137[75] = @"ScrollLock";
  v59 = +[NSNumber numberWithLong:72];
  v136[76] = v59;
  v137[76] = @"Pause";
  v58 = +[NSNumber numberWithLong:73];
  v136[77] = v58;
  v137[77] = @"Insert";
  v57 = +[NSNumber numberWithLong:74];
  v136[78] = v57;
  v137[78] = @"Home";
  v56 = +[NSNumber numberWithLong:75];
  v136[79] = v56;
  v137[79] = @"PageUp";
  v55 = +[NSNumber numberWithLong:76];
  v136[80] = v55;
  v137[80] = @"DeleteForward";
  v54 = +[NSNumber numberWithLong:77];
  v136[81] = v54;
  v137[81] = @"End";
  v53 = +[NSNumber numberWithLong:78];
  v136[82] = v53;
  v137[82] = @"PageDown";
  v52 = +[NSNumber numberWithLong:79];
  v136[83] = v52;
  v137[83] = @"RightArrow";
  v51 = +[NSNumber numberWithLong:80];
  v136[84] = v51;
  v137[84] = @"LeftArrow";
  v50 = +[NSNumber numberWithLong:81];
  v136[85] = v50;
  v137[85] = @"DownArrow";
  v49 = +[NSNumber numberWithLong:82];
  v136[86] = v49;
  v137[86] = @"UpArrow";
  v48 = +[NSNumber numberWithLong:83];
  v136[87] = v48;
  v137[87] = @"KeypadNumLock";
  v47 = +[NSNumber numberWithLong:84];
  v136[88] = v47;
  v137[88] = @"KeypadSlash";
  v46 = +[NSNumber numberWithLong:85];
  v136[89] = v46;
  v137[89] = @"KeypadAsterisk";
  v45 = +[NSNumber numberWithLong:45];
  v136[90] = v45;
  v137[90] = @"Hyphen";
  v44 = +[NSNumber numberWithLong:87];
  v136[91] = v44;
  v137[91] = @"KeypadPlus";
  v43 = +[NSNumber numberWithLong:88];
  v136[92] = v43;
  v137[92] = @"KeypadEnter";
  v42 = +[NSNumber numberWithLong:89];
  v136[93] = v42;
  v137[93] = @"Keypad1";
  v41 = +[NSNumber numberWithLong:90];
  v136[94] = v41;
  v137[94] = @"Keypad2";
  v40 = +[NSNumber numberWithLong:91];
  v136[95] = v40;
  v137[95] = @"Keypad3";
  v39 = +[NSNumber numberWithLong:92];
  v136[96] = v39;
  v137[96] = @"Keypad4";
  v38 = +[NSNumber numberWithLong:93];
  v136[97] = v38;
  v137[97] = @"Keypad5";
  v37 = +[NSNumber numberWithLong:94];
  v136[98] = v37;
  v137[98] = @"Keypad6";
  v36 = +[NSNumber numberWithLong:95];
  v136[99] = v36;
  v137[99] = @"Keypad7";
  v35 = +[NSNumber numberWithLong:96];
  v136[100] = v35;
  v137[100] = @"Keypad8";
  v34 = +[NSNumber numberWithLong:97];
  v136[101] = v34;
  v137[101] = @"Keypad9";
  v33 = +[NSNumber numberWithLong:98];
  v136[102] = v33;
  v137[102] = @"Keypad0";
  v32 = +[NSNumber numberWithLong:99];
  v136[103] = v32;
  v137[103] = @"KeypadPeriod";
  v31 = +[NSNumber numberWithLong:103];
  v136[104] = v31;
  v137[104] = @"KeypadEqualSign";
  v30 = +[NSNumber numberWithLong:100];
  v136[105] = v30;
  v137[105] = @"NonUSBackslash";
  unsigned int v29 = +[NSNumber numberWithLong:101];
  v136[106] = v29;
  v137[106] = @"Application";
  __int16 v28 = +[NSNumber numberWithLong:102];
  v136[107] = v28;
  v137[107] = @"Power";
  uint64_t v27 = +[NSNumber numberWithLong:135];
  v136[108] = v27;
  v137[108] = @"International1";
  __int16 v26 = +[NSNumber numberWithLong:136];
  v136[109] = v26;
  v137[109] = @"International2";
  uint64_t v25 = +[NSNumber numberWithLong:137];
  v136[110] = v25;
  v137[110] = @"International3";
  v24 = +[NSNumber numberWithLong:138];
  v136[111] = v24;
  v137[111] = @"International4";
  long long v23 = +[NSNumber numberWithLong:139];
  v136[112] = v23;
  v137[112] = @"International5";
  long long v22 = +[NSNumber numberWithLong:140];
  v136[113] = v22;
  v137[113] = @"International6";
  long long v21 = +[NSNumber numberWithLong:141];
  v136[114] = v21;
  v137[114] = @"International7";
  long long v20 = +[NSNumber numberWithLong:142];
  v136[115] = v20;
  v137[115] = @"International8";
  CFArrayRef v19 = +[NSNumber numberWithLong:143];
  v136[116] = v19;
  v137[116] = @"International9";
  int v18 = +[NSNumber numberWithLong:144];
  v136[117] = v18;
  v137[117] = @"LANG1";
  uint64_t v17 = +[NSNumber numberWithLong:145];
  v136[118] = v17;
  v137[118] = @"LANG2";
  uint64_t v16 = +[NSNumber numberWithLong:146];
  v136[119] = v16;
  v137[119] = @"LANG3";
  unsigned int v15 = +[NSNumber numberWithLong:147];
  v136[120] = v15;
  v137[120] = @"LANG4";
  uint64_t v14 = +[NSNumber numberWithLong:148];
  v136[121] = v14;
  v137[121] = @"LANG5";
  unsigned int v13 = +[NSNumber numberWithLong:149];
  v136[122] = v13;
  v137[122] = @"LANG6";
  unsigned int v12 = +[NSNumber numberWithLong:150];
  v136[123] = v12;
  v137[123] = @"LANG7";
  uint64_t v0 = +[NSNumber numberWithLong:151];
  v136[124] = v0;
  v137[124] = @"LANG8";
  id v1 = +[NSNumber numberWithLong:152];
  v136[125] = v1;
  v137[125] = @"LANG9";
  id v2 = +[NSNumber numberWithLong:224];
  v136[126] = v2;
  v137[126] = @"LeftControl";
  BOOL v3 = +[NSNumber numberWithLong:225];
  v136[127] = v3;
  v137[127] = @"LeftShift";
  uint64_t v4 = +[NSNumber numberWithLong:226];
  v136[128] = v4;
  v137[128] = @"LeftAlt";
  int v5 = +[NSNumber numberWithLong:227];
  v136[129] = v5;
  v137[129] = @"LeftGUI";
  unsigned int v6 = +[NSNumber numberWithLong:228];
  v136[130] = v6;
  v137[130] = @"RightControl";
  BOOL v7 = +[NSNumber numberWithLong:229];
  v136[131] = v7;
  v137[131] = @"RightShift";
  int v8 = +[NSNumber numberWithLong:230];
  v136[132] = v8;
  v137[132] = @"RightAlt";
  id v9 = +[NSNumber numberWithLong:231];
  v136[133] = v9;
  v137[133] = @"RightGUI";
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:134];
  CFDictionaryRef v11 = (void *)nameForKeyCode_dict;
  nameForKeyCode_dict = v10;
}

unint64_t GCOverrideCurrentProcessLinkedOn(unint64_t a1)
{
  unint64_t result = mapFromVersionSet(a1);
  OverrideLinkedOn = result;
  return result;
}

unint64_t mapFromVersionSet(unint64_t a1)
{
  unint64_t v1 = HIDWORD(a1);
  if (a1 == -1)
  {
    uint64_t v2 = 0;
    while (dword_220A91D30[v2] != HIDWORD(a1))
    {
      v2 += 5;
      if (v2 == 25)
      {
        BOOL v3 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
        uint64_t v4 = +[NSString stringWithUTF8String:"dyld_build_version_t mapFromVersionSet(dyld_build_version_t)"];
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"GCUtility.m", 729, @"No versionMap entry for combined version: %x.  Update versionMap!", v1);

        int v5 = 0;
        goto LABEL_7;
      }
    }
    int v5 = &dword_220A91D30[v2];
LABEL_7:
    dyld_get_active_platform();
    int base_platform = dyld_get_base_platform();
    if (base_platform <= 2)
    {
      if (base_platform == 1)
      {
        LODWORD(v1) = v5[1];
        LODWORD(a1) = 1;
        return a1 | ((unint64_t)v1 << 32);
      }
      if (base_platform == 2)
      {
        LODWORD(v1) = v5[2];
LABEL_17:
        LODWORD(a1) = 2;
        return a1 | ((unint64_t)v1 << 32);
      }
      goto LABEL_14;
    }
    if (base_platform == 3)
    {
      LODWORD(v1) = v5[3];
      goto LABEL_17;
    }
    if (base_platform != 11)
    {
LABEL_14:
      BOOL v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      int v8 = +[NSString stringWithUTF8String:"dyld_build_version_t mapFromVersionSet(dyld_build_version_t)"];
      [v7 handleFailureInFunction:v8 file:@"GCUtility.m" lineNumber:740 description:@"Unknown platform!"];

      LODWORD(a1) = 0;
      LODWORD(v1) = 0;
      return a1 | ((unint64_t)v1 << 32);
    }
    LODWORD(v1) = v5[4];
    LODWORD(a1) = 11;
  }
  return a1 | ((unint64_t)v1 << 32);
}

uint64_t GCCurrentProcessLinkedOnAfter(unint64_t a1)
{
  if (OverrideLinkedOn)
  {
    unint64_t v1 = mapFromVersionSet(a1);
    return OverrideLinkedOn == v1 && HIDWORD(OverrideLinkedOn) >= HIDWORD(v1);
  }
  else
  {
    return dyld_program_sdk_at_least();
  }
}

id loadNSDictionaryFromJSON(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSBundle bundleForClass:a1];
  int v5 = [v4 pathForResource:v3 ofType:@"json"];
  unsigned int v6 = +[NSData dataWithContentsOfFile:v5 options:1 error:0];
  BOOL v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    loadNSDictionaryFromJSON_cold_1();
  }

  return v7;
}

uint64_t GCApplicationIsAlmond()
{
  uint64_t v0 = +[NSProcessInfo processInfo];
  uint64_t v1 = [v0 isiOSAppOnMac];

  return v1;
}

uint64_t GCApplicationIsMacCatalyst()
{
  uint64_t v0 = +[NSProcessInfo processInfo];
  uint64_t v1 = [v0 isMacCatalystApp];

  return v1;
}

uint64_t GCBypassMFiAuthentication()
{
  if (GCBypassMFiAuthentication_onceToken != -1) {
    dispatch_once(&GCBypassMFiAuthentication_onceToken, &__block_literal_global_243);
  }
  return GCBypassMFiAuthentication_bypassMFiAuthentication;
}

void __GCBypassMFiAuthentication_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
  GCBypassMFiAuthentication_bypassMFiAuthentication = [v0 BOOLForKey:@"GCMFiAuthBypassEnable"];
  if (gc_isInternalBuild())
  {
    uint64_t v1 = getGCLogger();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v2[0] = 67109120;
      v2[1] = GCBypassMFiAuthentication_bypassMFiAuthentication;
      _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_INFO, "Bypassing MFi authentication via user default? %d", (uint8_t *)v2, 8u);
    }
  }
}

__CFString *GCFrameworkInitializationReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_26D22AE80[a1 - 1];
  }
}

void _keyboardDependentNotificationInit()
{
  if (_keyboardDependentNotificationInit_onceToken != -1) {
    dispatch_once(&_keyboardDependentNotificationInit_onceToken, &__block_literal_global_132);
  }
}

uint64_t ___keyboardDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableKeyboardSupportWithReason:1];
}

void _mouseDependentNotificationInit()
{
  if (_mouseDependentNotificationInit_onceToken != -1) {
    dispatch_once(&_mouseDependentNotificationInit_onceToken, &__block_literal_global_134);
  }
}

uint64_t ___mouseDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:1];
}

void _controllerDependentNotificationInit()
{
  if (_controllerDependentNotificationInit_onceToken != -1) {
    dispatch_once(&_controllerDependentNotificationInit_onceToken, &__block_literal_global_136);
  }
}

uint64_t ___controllerDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:1];
}

void HandleReport(void *a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  id v10 = a1;
  if (gc_isInternalBuild())
  {
    v111 = getGCLogger();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG)) {
      HandleReport_cold_5();
    }

    if (a4) {
      goto LABEL_283;
    }
  }
  else if (a4)
  {
    goto LABEL_283;
  }
  if (*((void *)v10 + 7) == a3)
  {
    CFDictionaryRef v11 = objc_opt_new();
    unsigned int v13 = v11;
    switch(*((_DWORD *)v10 + 19))
    {
      case 0:
        if (a5 == 1)
        {
          LODWORD(v12) = 1.0;
          int v14 = *(_DWORD *)(a6 + 1) & 0xF;
          if (v14)
          {
            double v12 = 0.0;
            if (v14 == 1) {
              *(float *)&double v12 = 1.0;
            }
            if (v14 == 7) {
              *(float *)&double v12 = 1.0;
            }
          }
          [v11 setDpadUpValue:v12];
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 5) {
            *(float *)&double v15 = 1.0;
          }
          else {
            *(float *)&double v15 = 0.0;
          }
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 3 < 2) {
            *(float *)&double v15 = 1.0;
          }
          [v13 setDpadDownValue:v15];
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 7) {
            *(float *)&double v16 = 1.0;
          }
          else {
            *(float *)&double v16 = 0.0;
          }
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 5 < 2) {
            *(float *)&double v16 = 1.0;
          }
          [v13 setDpadLeftValue:v16];
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 3) {
            *(float *)&double v17 = 1.0;
          }
          else {
            *(float *)&double v17 = 0.0;
          }
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 1 < 2) {
            *(float *)&double v17 = 1.0;
          }
          [v13 setDpadRightValue:v17];
          if ((*(_DWORD *)(a6 + 1) & 0x10) != 0) {
            *(float *)&double v18 = 1.0;
          }
          else {
            *(float *)&double v18 = 0.0;
          }
          [v13 setButtonAValue:v18];
          if ((*(_DWORD *)(a6 + 1) & 0x20) != 0) {
            *(float *)&double v19 = 1.0;
          }
          else {
            *(float *)&double v19 = 0.0;
          }
          [v13 setButtonBValue:v19];
          if ((*(_DWORD *)(a6 + 1) & 0x80) != 0) {
            *(float *)&double v20 = 1.0;
          }
          else {
            *(float *)&double v20 = 0.0;
          }
          [v13 setButtonYValue:v20];
          if ((*(_DWORD *)(a6 + 1) & 0x40) != 0) {
            *(float *)&double v21 = 1.0;
          }
          else {
            *(float *)&double v21 = 0.0;
          }
          [v13 setButtonXValue:v21];
          if ((*(_DWORD *)(a6 + 1) & 0x800) != 0) {
            *(float *)&double v22 = 1.0;
          }
          else {
            *(float *)&double v22 = 0.0;
          }
          [v13 setLeftTrigger:v22];
          if ((*(_DWORD *)(a6 + 1) & 0x400) != 0) {
            *(float *)&double v23 = 1.0;
          }
          else {
            *(float *)&double v23 = 0.0;
          }
          [v13 setRightTrigger:v23];
          if ((*(_DWORD *)(a6 + 1) & 0x2000) != 0) {
            *(float *)&double v24 = 1.0;
          }
          else {
            *(float *)&double v24 = 0.0;
          }
          [v13 setLeftThumbstickButton:v24];
          if ((*(_DWORD *)(a6 + 1) & 0x1000) != 0) {
            *(float *)&double v25 = 1.0;
          }
          else {
            *(float *)&double v25 = 0.0;
          }
          [v13 setRightThumbstickButton:v25];
          if ((*(_DWORD *)(a6 + 1) & 0x200) != 0) {
            *(float *)&double v26 = 1.0;
          }
          else {
            *(float *)&double v26 = 0.0;
          }
          [v13 setButtonLeftShoulder:v26];
          if ((*(_DWORD *)(a6 + 1) & 0x100) != 0) {
            *(float *)&double v27 = 1.0;
          }
          else {
            *(float *)&double v27 = 0.0;
          }
          [v13 setButtonRightShoulder:v27];
          if ((*(_DWORD *)(a6 + 1) & 0x4000) != 0) {
            *(float *)&double v28 = 1.0;
          }
          else {
            *(float *)&double v28 = 0.0;
          }
          [v13 setButtonHome:v28];
          if ((*(_DWORD *)(a6 + 1) & 0x400) != 0) {
            *(float *)&double v29 = 1.0;
          }
          else {
            *(float *)&double v29 = 0.0;
          }
          [v13 setButtonMenu:v29];
          if ((*(_DWORD *)(a6 + 1) & 0x800) != 0) {
            *(float *)&double v30 = 1.0;
          }
          else {
            *(float *)&double v30 = 0.0;
          }
          [v13 setButtonOptions:v30];
          *(float *)&double v31 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial0:v31];
          *(float *)&double v32 = (float)~(*(_DWORD *)(a6 + 7) >> 8) / 255.0;
          [v13 setButtonSpecial1:v32];
          *(float *)&double v33 = (float)(*(unsigned __int8 *)(a6 + 9) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial2:v33];
          *(float *)&double v34 = (float)(*(unsigned __int16 *)(a6 + 5) - 0x7FFF) / 32767.0;
          [v13 setButtonSpecial3:v34];
          unsigned int v36 = (*(_DWORD *)(a6 + 1) >> 15) & 0x7F;
          if (v36 <= 0xF)
          {
            float v37 = -1.0;
            switch(v36)
            {
              case 1u:
                goto LABEL_274;
              case 2u:
                goto LABEL_127;
              case 4u:
                goto LABEL_264;
              case 8u:
                goto LABEL_269;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
          goto LABEL_138;
        }
        if (gc_isInternalBuild())
        {
          v38 = getGCLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            HandleReport_cold_1();
          }
          goto LABEL_281;
        }
        goto LABEL_282;
      case 1:
        if (!a5)
        {
          float v37 = 1.0;
          LODWORD(v12) = 1.0;
          int v63 = *(_DWORD *)a6 & 0xF;
          if (v63)
          {
            double v12 = 0.0;
            if (v63 == 1) {
              *(float *)&double v12 = 1.0;
            }
            if (v63 == 7) {
              *(float *)&double v12 = 1.0;
            }
          }
          [v11 setDpadUpValue:v12];
          if ((*(_DWORD *)a6 & 0xF) == 5) {
            *(float *)&double v64 = 1.0;
          }
          else {
            *(float *)&double v64 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 3 < 2) {
            *(float *)&double v64 = 1.0;
          }
          [v13 setDpadDownValue:v64];
          if ((*(_DWORD *)a6 & 0xF) == 7) {
            *(float *)&double v65 = 1.0;
          }
          else {
            *(float *)&double v65 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 5 < 2) {
            *(float *)&double v65 = 1.0;
          }
          [v13 setDpadLeftValue:v65];
          if ((*(_DWORD *)a6 & 0xF) == 3) {
            *(float *)&double v66 = 1.0;
          }
          else {
            *(float *)&double v66 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 1 < 2) {
            *(float *)&double v66 = 1.0;
          }
          [v13 setDpadRightValue:v66];
          if ((*(_DWORD *)a6 & 0x10) != 0) {
            *(float *)&double v67 = 1.0;
          }
          else {
            *(float *)&double v67 = 0.0;
          }
          [v13 setButtonAValue:v67];
          if ((*(_DWORD *)a6 & 0x40) != 0) {
            *(float *)&double v68 = 1.0;
          }
          else {
            *(float *)&double v68 = 0.0;
          }
          [v13 setButtonBValue:v68];
          if ((*(_DWORD *)a6 & 0x80) != 0) {
            *(float *)&double v69 = 1.0;
          }
          else {
            *(float *)&double v69 = 0.0;
          }
          [v13 setButtonYValue:v69];
          if ((*(_DWORD *)a6 & 0x20) != 0) {
            *(float *)&double v70 = 1.0;
          }
          else {
            *(float *)&double v70 = 0.0;
          }
          [v13 setButtonXValue:v70];
          if ((*(_DWORD *)a6 & 0x800) != 0) {
            *(float *)&double v71 = 1.0;
          }
          else {
            *(float *)&double v71 = 0.0;
          }
          [v13 setLeftTrigger:v71];
          if ((*(_DWORD *)a6 & 0x400) != 0) {
            *(float *)&double v72 = 1.0;
          }
          else {
            *(float *)&double v72 = 0.0;
          }
          [v13 setRightTrigger:v72];
          if ((*(_DWORD *)a6 & 0x8000) != 0) {
            *(float *)&double v73 = 1.0;
          }
          else {
            *(float *)&double v73 = 0.0;
          }
          [v13 setLeftThumbstickButton:v73];
          if ((*(_DWORD *)a6 & 0x4000) != 0) {
            *(float *)&double v74 = 1.0;
          }
          else {
            *(float *)&double v74 = 0.0;
          }
          [v13 setRightThumbstickButton:v74];
          if ((*(_DWORD *)a6 & 0x200) != 0) {
            *(float *)&double v75 = 1.0;
          }
          else {
            *(float *)&double v75 = 0.0;
          }
          [v13 setButtonLeftShoulder:v75];
          if ((*(_DWORD *)a6 & 0x100) != 0) {
            *(float *)&double v76 = 1.0;
          }
          else {
            *(float *)&double v76 = 0.0;
          }
          [v13 setButtonRightShoulder:v76];
          if ((*(_DWORD *)a6 & 0x10000000) != 0) {
            *(float *)&double v77 = 1.0;
          }
          else {
            *(float *)&double v77 = 0.0;
          }
          [v13 setButtonHome:v77];
          if ((*(_DWORD *)a6 & 0x2000) != 0) {
            *(float *)&double v78 = 1.0;
          }
          else {
            *(float *)&double v78 = 0.0;
          }
          [v13 setButtonOptions:v78];
          if ((*(_DWORD *)a6 & 0x1000) != 0) {
            *(float *)&double v79 = 1.0;
          }
          else {
            *(float *)&double v79 = 0.0;
          }
          [v13 setButtonSpecial15:v79];
          *(float *)&double v80 = (float)(*(unsigned __int8 *)(a6 + 6) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial0:v80];
          *(float *)&double v81 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial1:v81];
          *(float *)&double v82 = (float)(~(*(unsigned __int8 *)(a6 + 8) << 16) >> 16) / 255.0;
          [v13 setButtonSpecial2:v82];
          *(float *)&double v83 = (float)(*(unsigned __int16 *)(a6 + 4) - 0x7FFF) / 32767.0;
          [v13 setButtonSpecial3:v83];
          unsigned int v84 = *(_WORD *)(a6 + 2) & 0x7F;
          if (v84 <= 0xF)
          {
            switch(*(_WORD *)(a6 + 2) & 0x7F)
            {
              case 1:
                goto LABEL_274;
              case 2:
                goto LABEL_264;
              case 4:
                goto LABEL_269;
              case 8:
                goto LABEL_270;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
          goto LABEL_265;
        }
        if (gc_isInternalBuild())
        {
          v38 = getGCLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            HandleReport_cold_2();
          }
          goto LABEL_281;
        }
        goto LABEL_282;
      case 2:
        if (a5 == 1)
        {
          __int16 v39 = *(_WORD *)(a6 + 1);
          LODWORD(v12) = 1.0;
          if ((v39 & 0xF) != 0)
          {
            double v12 = 0.0;
            if ((v39 & 0xF) == 1) {
              *(float *)&double v12 = 1.0;
            }
            if ((*(_WORD *)(a6 + 1) & 0xF) == 7) {
              *(float *)&double v12 = 1.0;
            }
          }
          [v11 setDpadUpValue:v12];
          __int16 v42 = *(_WORD *)(a6 + 1);
          v41 = (unsigned __int16 *)(a6 + 1);
          int v43 = v42 & 0xF;
          if (v43 == 5) {
            *(float *)&double v40 = 1.0;
          }
          else {
            *(float *)&double v40 = 0.0;
          }
          if ((v43 - 3) < 2) {
            *(float *)&double v40 = 1.0;
          }
          [v13 setDpadDownValue:v40];
          int v45 = *v41 & 0xF;
          if (v45 == 7) {
            *(float *)&double v44 = 1.0;
          }
          else {
            *(float *)&double v44 = 0.0;
          }
          if ((v45 - 5) < 2) {
            *(float *)&double v44 = 1.0;
          }
          [v13 setDpadLeftValue:v44];
          int v47 = *v41 & 0xF;
          if (v47 == 3) {
            *(float *)&double v46 = 1.0;
          }
          else {
            *(float *)&double v46 = 0.0;
          }
          if ((v47 - 1) < 2) {
            *(float *)&double v46 = 1.0;
          }
          [v13 setDpadRightValue:v46];
          if ((*v41 & 0x10) != 0) {
            *(float *)&double v48 = 1.0;
          }
          else {
            *(float *)&double v48 = 0.0;
          }
          [v13 setButtonAValue:v48];
          if ((*v41 & 0x20) != 0) {
            *(float *)&double v49 = 1.0;
          }
          else {
            *(float *)&double v49 = 0.0;
          }
          [v13 setButtonBValue:v49];
          if ((*v41 & 0x80) != 0) {
            *(float *)&double v50 = 1.0;
          }
          else {
            *(float *)&double v50 = 0.0;
          }
          [v13 setButtonYValue:v50];
          if ((*v41 & 0x40) != 0) {
            *(float *)&double v51 = 1.0;
          }
          else {
            *(float *)&double v51 = 0.0;
          }
          [v13 setButtonXValue:v51];
          if ((*v41 & 0x800) != 0) {
            *(float *)&double v52 = 1.0;
          }
          else {
            *(float *)&double v52 = 0.0;
          }
          [v13 setLeftTrigger:v52];
          if ((*v41 & 0x400) != 0) {
            *(float *)&double v53 = 1.0;
          }
          else {
            *(float *)&double v53 = 0.0;
          }
          [v13 setRightTrigger:v53];
          if ((*v41 & 0x2000) != 0) {
            *(float *)&double v54 = 1.0;
          }
          else {
            *(float *)&double v54 = 0.0;
          }
          [v13 setLeftThumbstickButton:v54];
          if ((*v41 & 0x1000) != 0) {
            *(float *)&double v55 = 1.0;
          }
          else {
            *(float *)&double v55 = 0.0;
          }
          [v13 setRightThumbstickButton:v55];
          if ((*v41 & 0x200) != 0) {
            *(float *)&double v56 = 1.0;
          }
          else {
            *(float *)&double v56 = 0.0;
          }
          [v13 setButtonLeftShoulder:v56];
          if ((*v41 & 0x100) != 0) {
            *(float *)&double v57 = 1.0;
          }
          else {
            *(float *)&double v57 = 0.0;
          }
          [v13 setButtonRightShoulder:v57];
          if ((*v41 & 0x4000) != 0) {
            *(float *)&double v58 = 1.0;
          }
          else {
            *(float *)&double v58 = 0.0;
          }
          [v13 setButtonHome:v58];
          *(float *)&double v59 = (float)(*((unsigned __int8 *)v41 + 5) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial0:v59];
          *(float *)&double v60 = (float)~(*(_DWORD *)((char *)v41 + 5) >> 8) / 255.0;
          [v13 setButtonSpecial1:v60];
          *(float *)&double v61 = (float)(*((unsigned __int8 *)v41 + 7) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial2:v61];
          *(float *)&double v62 = (float)(*(unsigned __int16 *)((char *)v41 + 3) - 0x7FFF) / 32767.0;
          [v13 setButtonSpecial3:v62];
          unsigned int v36 = ((*v41 | (*((unsigned __int8 *)v41 + 2) << 16)) >> 15) & 0x7F;
          if (v36 <= 0xF)
          {
            float v37 = -1.0;
            switch(v36)
            {
              case 1u:
                goto LABEL_274;
              case 2u:
LABEL_127:
                float v37 = 1.0;
                break;
              case 4u:
                goto LABEL_264;
              case 8u:
                goto LABEL_269;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
LABEL_138:
          switch(v36)
          {
            case 0x10u:
LABEL_270:
              float v37 = 4.0;
              goto LABEL_274;
            case 0x20u:
              goto LABEL_272;
            case 0x40u:
              goto LABEL_271;
          }
          goto LABEL_273;
        }
        if (gc_isInternalBuild())
        {
          v38 = getGCLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            HandleReport_cold_3();
          }
          goto LABEL_281;
        }
        goto LABEL_282;
      case 3:
        if (a5)
        {
          if (!gc_isInternalBuild())
          {
LABEL_282:

            break;
          }
          v38 = getGCLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            HandleReport_cold_4();
          }
        }
        else
        {
          float v37 = 1.0;
          LODWORD(v12) = 1.0;
          int v85 = *(_DWORD *)a6 & 0xF;
          if (v85)
          {
            double v12 = 0.0;
            if (v85 == 1) {
              *(float *)&double v12 = 1.0;
            }
            if (v85 == 7) {
              *(float *)&double v12 = 1.0;
            }
          }
          [v11 setDpadUpValue:v12];
          if ((*(_DWORD *)a6 & 0xF) == 5) {
            *(float *)&double v86 = 1.0;
          }
          else {
            *(float *)&double v86 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 3 < 2) {
            *(float *)&double v86 = 1.0;
          }
          [v13 setDpadDownValue:v86];
          if ((*(_DWORD *)a6 & 0xF) == 7) {
            *(float *)&double v87 = 1.0;
          }
          else {
            *(float *)&double v87 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 5 < 2) {
            *(float *)&double v87 = 1.0;
          }
          [v13 setDpadLeftValue:v87];
          if ((*(_DWORD *)a6 & 0xF) == 3) {
            *(float *)&double v88 = 1.0;
          }
          else {
            *(float *)&double v88 = 0.0;
          }
          if ((*(_DWORD *)a6 & 0xFu) - 1 < 2) {
            *(float *)&double v88 = 1.0;
          }
          [v13 setDpadRightValue:v88];
          if ((*(_DWORD *)a6 & 0x10) != 0) {
            *(float *)&double v89 = 1.0;
          }
          else {
            *(float *)&double v89 = 0.0;
          }
          [v13 setButtonAValue:v89];
          if ((*(_DWORD *)a6 & 0x40) != 0) {
            *(float *)&double v90 = 1.0;
          }
          else {
            *(float *)&double v90 = 0.0;
          }
          [v13 setButtonBValue:v90];
          if ((*(_DWORD *)a6 & 0x80) != 0) {
            *(float *)&double v91 = 1.0;
          }
          else {
            *(float *)&double v91 = 0.0;
          }
          [v13 setButtonYValue:v91];
          if ((*(_DWORD *)a6 & 0x20) != 0) {
            *(float *)&double v92 = 1.0;
          }
          else {
            *(float *)&double v92 = 0.0;
          }
          [v13 setButtonXValue:v92];
          if ((*(_DWORD *)a6 & 0x800) != 0) {
            *(float *)&double v93 = 1.0;
          }
          else {
            *(float *)&double v93 = 0.0;
          }
          [v13 setLeftTrigger:v93];
          if ((*(_DWORD *)a6 & 0x400) != 0) {
            *(float *)&double v94 = 1.0;
          }
          else {
            *(float *)&double v94 = 0.0;
          }
          [v13 setRightTrigger:v94];
          if ((*(_DWORD *)a6 & 0x8000) != 0) {
            *(float *)&double v95 = 1.0;
          }
          else {
            *(float *)&double v95 = 0.0;
          }
          [v13 setLeftThumbstickButton:v95];
          if ((*(_DWORD *)a6 & 0x4000) != 0) {
            *(float *)&double v96 = 1.0;
          }
          else {
            *(float *)&double v96 = 0.0;
          }
          [v13 setRightThumbstickButton:v96];
          if ((*(_DWORD *)a6 & 0x200) != 0) {
            *(float *)&double v97 = 1.0;
          }
          else {
            *(float *)&double v97 = 0.0;
          }
          [v13 setButtonLeftShoulder:v97];
          if ((*(_DWORD *)a6 & 0x100) != 0) {
            *(float *)&double v98 = 1.0;
          }
          else {
            *(float *)&double v98 = 0.0;
          }
          [v13 setButtonRightShoulder:v98];
          if ((*(_DWORD *)a6 & 0x10000000) != 0) {
            *(float *)&double v99 = 1.0;
          }
          else {
            *(float *)&double v99 = 0.0;
          }
          [v13 setButtonHome:v99];
          if ((*(_DWORD *)a6 & 0x2000) != 0) {
            *(float *)&double v100 = 1.0;
          }
          else {
            *(float *)&double v100 = 0.0;
          }
          [v13 setButtonOptions:v100];
          if ((*(_DWORD *)a6 & 0x1000) != 0) {
            *(float *)&double v101 = 1.0;
          }
          else {
            *(float *)&double v101 = 0.0;
          }
          [v13 setButtonSpecial15:v101];
          *(float *)&double v102 = (float)(*(unsigned __int8 *)(a6 + 6) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial0:v102];
          *(float *)&double v103 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          [v13 setButtonSpecial1:v103];
          *(float *)&double v104 = (float)(~(*(unsigned __int8 *)(a6 + 8) << 16) >> 16) / 255.0;
          [v13 setButtonSpecial2:v104];
          *(float *)&double v105 = (float)(*(unsigned __int16 *)(a6 + 4) - 0x7FFF) / 32767.0;
          [v13 setButtonSpecial3:v105];
          unsigned int v84 = *(_WORD *)(a6 + 2) & 0x7F;
          if (v84 > 0xF)
          {
LABEL_265:
            switch(v84)
            {
              case 0x10u:
LABEL_272:
                float v37 = 5.0;
                break;
              case 0x20u:
LABEL_271:
                float v37 = 6.0;
                break;
              case 0x40u:
                float v37 = -1.0;
                break;
              default:
LABEL_273:
                float v37 = 0.0;
                break;
            }
          }
          else
          {
            switch(*(_WORD *)(a6 + 2) & 0x7F)
            {
              case 1:
                break;
              case 2:
LABEL_264:
                float v37 = 2.0;
                break;
              case 4:
LABEL_269:
                float v37 = 3.0;
                break;
              case 8:
                goto LABEL_270;
              default:
                goto LABEL_273;
            }
          }
LABEL_274:
          *(float *)&double v35 = v37;
          [v13 setButtonSpecial4:v35];
          v38 = objc_getProperty(v10, v106, 144, 1);
          long long v112 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          uint64_t v107 = [v38 countByEnumeratingWithState:&v112 objects:v116 count:16];
          if (v107)
          {
            uint64_t v108 = v107;
            uint64_t v109 = *(void *)v113;
            do
            {
              for (uint64_t i = 0; i != v108; ++i)
              {
                if (*(void *)v113 != v109) {
                  objc_enumerationMutation(v38);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v112 + 1) + 8 * i) + 16))();
              }
              uint64_t v108 = [v38 countByEnumeratingWithState:&v112 objects:v116 count:16];
            }
            while (v108);
          }
        }
LABEL_281:

        goto LABEL_282;
      default:
        goto LABEL_282;
    }
  }
LABEL_283:
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

__CFString *GCInputBackLeftButton(uint64_t a1)
{
  if (a1 < 0)
  {
    +[NSString stringWithFormat:@"*** Back button names begin at position '0'.  Position '%zd' is not valid.", a1];
    id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v1 = @"Back Left Button 1";
    }
    else
    {
      uint64_t v1 = +[NSString stringWithFormat:@"Back Left Button %ld", a1];
    }
  }
  else
  {
    uint64_t v1 = @"Back Left Button 0";
  }

  return v1;
}

__CFString *GCInputBackRightButton(uint64_t a1)
{
  if (a1 < 0)
  {
    +[NSString stringWithFormat:@"*** Back button names begin at position '0'.  Position '%zd' is not valid.", a1];
    id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v1 = @"Back Right Button 1";
    }
    else
    {
      uint64_t v1 = +[NSString stringWithFormat:@"Back Right Button %ld", a1];
    }
  }
  else
  {
    uint64_t v1 = @"Back Right Button 0";
  }

  return v1;
}

GCInputButtonName GCInputArcadeButtonName(NSInteger row, NSInteger column)
{
  return +[NSString stringWithFormat:@"Arcade Button %ld, %ld", row, column];
}

NSString *GCInputAuxiliaryMouseButtonName(uint64_t a1)
{
  return +[NSString stringWithFormat:@"Button %ld", a1];
}

id GCControllerServiceRemoteClientInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29A0C0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v1, objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_publishControllers_ argumentIndex:0 ofReply:0];

  id v3 = GCIPCObjectIdentifier_Classes();
  uint64_t v7 = objc_opt_class();
  uint64_t v4 = +[NSArray arrayWithObjects:&v7 count:1];
  int v5 = [v3 setByAddingObjectsFromArray:v4];
  [v0 setClasses:v5 forSelector:sel_unpublishControllersWithIdentifiers_ argumentIndex:0 ofReply:0];

  return v0;
}

id GCControllerServiceRemoteServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E710];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v1, objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_fetchControllerDescriptionsWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_2209C0854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209C108C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCMotionXPCProxyRemoteClientEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D290C48];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCMotionXPCProxyRemoteServerEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D290D50];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCMotionXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A570];
}

id GCMotionXPCProxyServiceRemoteServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E980];
  uint64_t v1 = GCMotionXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_motionXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  uint64_t v2 = GCMotionXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_motionXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id GCIPCObjectIdentifier_Classes()
{
  if (GCIPCObjectIdentifier_Classes_onceToken != -1) {
    dispatch_once(&GCIPCObjectIdentifier_Classes_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)GCIPCObjectIdentifier_Classes_IPCObjectIdentifierTypes;

  return v0;
}

void sub_2209C21A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_2209C23FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209C51F4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_2209C5420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209C5650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2209C5A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_2209C5BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_2209C5E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

NSXPCInterface *GCUserDefaultsXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B3D48];
}

id GCUserDefaultsXPCProxyServiceRemoteServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D299E38];
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", +[NSXPCInterface interfaceWithProtocol:](&off_26D2B7D08, "interfaceWithProtocol:", &unk_26D2B3D48), sel_userDefaultsCheckIn_, 0, 0);

  return v0;
}

void sub_2209C959C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209C9648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2209C97B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209C98B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209C9A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209C9B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _GCHIDEventSourceDescription_Classes()
{
  if (_GCHIDEventSourceDescription_Classes_onceToken != -1) {
    dispatch_once(&_GCHIDEventSourceDescription_Classes_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)_GCHIDEventSourceDescription_Classes_Classes;

  return v0;
}

void sub_2209CC7C8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_2209CCE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2209CD134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2209CDD74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void DecodeJoyConRGBColor(void *a1, unsigned char *a2)
{
  id v8 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v8;
  if (isKindOfClass)
  {
    int v5 = [v8 objectForKeyedSubscript:@"red"];
    unsigned int v6 = [v8 objectForKeyedSubscript:@"green"];
    uint64_t v7 = [v8 objectForKeyedSubscript:@"blue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          *a2 = [v5 intValue];
          a2[1] = [v6 intValue];
          a2[2] = [v7 intValue];
        }
      }
    }

    uint64_t v4 = v8;
  }
}

void sub_2209CE658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 56));
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_2209CE7CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209CF550(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209CFB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2209D06F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209D0F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCGameIntentXPCProxyRemoteClientEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D293980];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCGameIntentXPCProxyRemoteServerEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D293A10];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCGameIntentXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A8A0];
}

id GCGameIntentXPCProxyServiceRemoteServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29EAB0];
  uint64_t v1 = GCGameIntentXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_gameIntentXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  uint64_t v2 = GCGameIntentXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_gameIntentXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __deprecated_GCGamepad_Class()
{
  return objc_opt_class();
}

id getGCLogger()
{
  if (getGCLogger_onceToken != -1) {
    dispatch_once(&getGCLogger_onceToken, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)gcLogger;

  return v0;
}

void __getGCLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController", "default");
  uint64_t v1 = (void *)gcLogger;
  gcLogger = (uint64_t)v0;
}

id getGCAppStateMonitorLogger()
{
  if (getGCAppStateMonitorLogger_onceToken != -1) {
    dispatch_once(&getGCAppStateMonitorLogger_onceToken, &__block_literal_global_38);
  }
  os_log_t v0 = (void *)gcAppStateMonitorLogger;

  return v0;
}

void __getGCAppStateMonitorLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController", "monitor");
  uint64_t v1 = (void *)gcAppStateMonitorLogger;
  gcAppStateMonitorLogger = (uint64_t)v0;
}

id getGCInitLogger()
{
  if (getGCInitLogger_onceToken != -1) {
    dispatch_once(&getGCInitLogger_onceToken, &__block_literal_global_41);
  }
  os_log_t v0 = (void *)gcInitializationLogger;

  return v0;
}

void __getGCInitLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController", "init");
  uint64_t v1 = (void *)gcInitializationLogger;
  gcInitializationLogger = (uint64_t)v0;
}

id getGCAnalyticsLogger()
{
  if (getGCAnalyticsLogger_onceToken != -1) {
    dispatch_once(&getGCAnalyticsLogger_onceToken, &__block_literal_global_44);
  }
  os_log_t v0 = (void *)gcAnalyticsLogger;

  return v0;
}

void __getGCAnalyticsLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController", "analytics");
  uint64_t v1 = (void *)gcAnalyticsLogger;
  gcAnalyticsLogger = (uint64_t)v0;
}

id getGCDLogger()
{
  if (getGCDLogger_onceToken != -1) {
    dispatch_once(&getGCDLogger_onceToken, &__block_literal_global_47);
  }
  os_log_t v0 = (void *)gcdLogger;

  return v0;
}

void __getGCDLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController.Daemon", "default");
  uint64_t v1 = (void *)gcdLogger;
  gcdLogger = (uint64_t)v0;
}

void setGCHIDLoggerCategory(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  uint64_t v2 = (void *)gcHIDLogger;
  gcHIDLogger = (uint64_t)v1;
}

id getGCHIDLogger()
{
  if (getGCHIDLogger_onceToken != -1) {
    dispatch_once(&getGCHIDLogger_onceToken, &__block_literal_global_51);
  }
  os_log_t v0 = (void *)gcHIDLogger;

  return v0;
}

void __getGCHIDLogger_block_invoke()
{
  if (!gcHIDLogger) {
    objc_storeStrong((id *)&gcHIDLogger, &_os_log_default);
  }
}

id getGCSettingsLogger()
{
  if (getGCSettingsLogger_onceToken != -1) {
    dispatch_once(&getGCSettingsLogger_onceToken, &__block_literal_global_53);
  }
  os_log_t v0 = (void *)gcSettingsLogger;

  return v0;
}

void __getGCSettingsLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController.Settings", "default");
  os_log_t v1 = (void *)gcSettingsLogger;
  gcSettingsLogger = (uint64_t)v0;
}

id getGCHapticsLogger()
{
  if (getGCHapticsLogger_onceToken != -1) {
    dispatch_once(&getGCHapticsLogger_onceToken, &__block_literal_global_56);
  }
  os_log_t v0 = (void *)gcHapticsLogger;

  return v0;
}

void __getGCHapticsLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController.Haptics", "default");
  os_log_t v1 = (void *)gcHapticsLogger;
  gcHapticsLogger = (uint64_t)v0;
}

id getGCSignpostLogger()
{
  if (getGCSignpostLogger_onceToken != -1) {
    dispatch_once(&getGCSignpostLogger_onceToken, &__block_literal_global_59);
  }
  os_log_t v0 = (void *)gcSignpostLogger;

  return v0;
}

void __getGCSignpostLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.gamecontroller", "Signposts");
  os_log_t v1 = (void *)gcSignpostLogger;
  gcSignpostLogger = (uint64_t)v0;
}

id getGCRuntimeIssuesLogger()
{
  if (getGCRuntimeIssuesLogger_onceToken != -1) {
    dispatch_once(&getGCRuntimeIssuesLogger_onceToken, &__block_literal_global_62);
  }
  os_log_t v0 = (void *)gcRuntimeIssuesLogger;

  return v0;
}

void __getGCRuntimeIssuesLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runtime-issues", "GameController");
  os_log_t v1 = (void *)gcRuntimeIssuesLogger;
  gcRuntimeIssuesLogger = (uint64_t)v0;
}

void sub_2209D5CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209D66C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

uint64_t _publishCustomController(void *a1)
{
  id v1 = a1;
  int IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
  if ((IsGameControllerDaemon & 1) == 0)
  {
    uint64_t v3 = +[_GCControllerManager sharedInstance];
    uint64_t v4 = [v1 physicalInputProfile];
    int v5 = +[_GCXRComponent componentWithPhysicalInputProfile:v4];

    if (v5)
    {
      if (gc_isInternalBuild())
      {
        id v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "XR Component: adding", (uint8_t *)location, 2u);
        }
      }
      [v1 _addComponent:v5];
    }
    objc_initWeak(location, v3);
    unsigned int v6 = [v3 controllersQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = ___publishCustomController_block_invoke;
    v9[3] = &unk_26D22B950;
    objc_copyWeak(&v11, location);
    id v10 = v1;
    dispatch_barrier_async(v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  return IsGameControllerDaemon ^ 1u;
}

void sub_2209D72E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void ___publishCustomController_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_publishCustomController:", *(void *)(a1 + 32));
}

uint64_t _unpublishCustomController(void *a1)
{
  id v1 = a1;
  int IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
  if ((IsGameControllerDaemon & 1) == 0)
  {
    uint64_t v3 = +[_GCControllerManager sharedInstance];
    objc_initWeak(&location, v3);
    uint64_t v4 = [v3 controllersQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___unpublishCustomController_block_invoke;
    block[3] = &unk_26D22B950;
    objc_copyWeak(&v8, &location);
    id v7 = v1;
    dispatch_barrier_async(v4, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return IsGameControllerDaemon ^ 1u;
}

void sub_2209D7458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void ___unpublishCustomController_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_unpublishCustomController:", *(void *)(a1 + 32));
}

void ConnectToDriverService(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (&unk_26D2B3DA8 == v7)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __ConnectToDriverService_block_invoke;
    v25[3] = &unk_26D22BA68;
    uint64_t v12 = &v26;
    id v26 = v10;
    [v8 connectToNintendoJoyConFusionGestureServiceWithClient:v9 reply:v25];
  }
  else if (&unk_26D2B3EC8 == v7)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __ConnectToDriverService_block_invoke_2;
    v23[3] = &unk_26D22BA90;
    uint64_t v12 = &v24;
    id v24 = v10;
    [v8 connectToLightServiceWithClient:v9 reply:v23];
  }
  else if (&unk_26D2B3F28 == v7)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __ConnectToDriverService_block_invoke_3;
    v21[3] = &unk_26D22BAB8;
    uint64_t v12 = &v22;
    id v22 = v10;
    [v8 connectToAdaptiveTriggersServiceWithClient:v9 reply:v21];
  }
  else if (&unk_26D2B3F88 == v7)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __ConnectToDriverService_block_invoke_4;
    v19[3] = &unk_26D22BAE0;
    uint64_t v12 = &v20;
    id v20 = v10;
    [v8 connectToMotionServiceWithClient:v9 reply:v19];
  }
  else if (&unk_26D2B3E08 == v7)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __ConnectToDriverService_block_invoke_5;
    v17[3] = &unk_26D22BB08;
    uint64_t v12 = &v18;
    id v18 = v10;
    [v8 connectToBatteryServiceWithClient:v9 reply:v17];
  }
  else if (&unk_26D2B3FE8 == v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __ConnectToDriverService_block_invoke_6;
    v15[3] = &unk_26D22BB30;
    uint64_t v12 = &v16;
    id v16 = v10;
    [v8 connectToGameIntentServiceWithClient:v9 reply:v15];
  }
  else
  {
    if (&unk_26D2B4078 != v7) {
      ConnectToDriverService_cold_1((uint64_t)v7);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __ConnectToDriverService_block_invoke_7;
    v13[3] = &unk_26D22BB58;
    uint64_t v12 = &v14;
    id v14 = v10;
    [v8 connectToGenericDeviceDriverConfigurationServiceWithClient:v9 reply:v13];
  }
}

void sub_2209D7DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __ConnectToDriverService_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2209D883C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209D890C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2209D8A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

NSXPCInterface *GCLightServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B40D8];
}

NSXPCInterface *GCLightServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4138];
}

void LogError(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(4, a1, va);
}

id GCControllerComponent_Classes()
{
  if (GCControllerComponent_Classes_onceToken != -1) {
    dispatch_once(&GCControllerComponent_Classes_onceToken, &__block_literal_global_231);
  }
  os_log_t v0 = (void *)GCControllerComponent_Classes_Classes;

  return v0;
}

id _GCControllerComponentDescription_Classes()
{
  if (_GCControllerComponentDescription_Classes_onceToken != -1) {
    dispatch_once(&_GCControllerComponentDescription_Classes_onceToken, &__block_literal_global_250);
  }
  os_log_t v0 = (void *)_GCControllerComponentDescription_Classes_Classes;

  return v0;
}

void sub_2209DC518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_GCHapticServerManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2209DC73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  double v17 = v16;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2209DCB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2209DCF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2209DD0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DD21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DD434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DD600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DDA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DDB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2209DDC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2209DE0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2209DE258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DE318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2209DE678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL HapticSharedMemory::readCommand(HapticSharedMemory *this, HapticCommand *a2)
{
  mBuffer = this->mBuffer;
  int v3 = mBuffer[1];
  uint64_t v4 = (int)mBuffer[2];
  if (v4 != v3)
  {
    unsigned int v6 = (unsigned __int16 *)((char *)mBuffer + v4 + 16);
    NSLog(&cfstr_AboutToCopyUBy.isa, *v6, v4);
    size_t v7 = *v6;
    if (!*v6) {
      HapticSharedMemory::readCommand();
    }
    if ((int)v4 + (int)v7 >= *mBuffer) {
      int v8 = *mBuffer;
    }
    else {
      int v8 = 0;
    }
    uint64_t v9 = (v4 + v7 - v8);
    if ((int)v9 <= (int)v4)
    {
      size_t v12 = (*mBuffer - v4);
      memcpy(a2, (char *)mBuffer + v4 + 16, v12);
      unsigned int v13 = *v6;
      if (v12 >= v13)
      {
LABEL_11:
        NSLog(&cfstr_UpdatingRbRead.isa, v9);
        mBuffer[2] = v9;
        return v4 != v3;
      }
      id v10 = (HapticCommand *)((char *)a2 + v12);
      size_t v7 = v13 - v12;
      id v11 = (char *)(mBuffer + 4);
    }
    else
    {
      id v10 = a2;
      id v11 = (char *)mBuffer + v4 + 16;
    }
    memcpy(v10, v11, v7);
    goto LABEL_11;
  }
  return v4 != v3;
}

void sub_2209DE970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DEB04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DF450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_2209DF704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209DFAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2209DFF04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2209E01A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209E04B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209E0834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2209E0B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2209E1510(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id _gc_log_device_physicalinput()
{
  if (_gc_log_device_physicalinput_onceToken != -1) {
    dispatch_once(&_gc_log_device_physicalinput_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)_gc_log_device_physicalinput_Log;

  return v0;
}

void ___gc_log_device_physicalinput_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.gamecontroller", "PhysicalInput");
  uint64_t v1 = (void *)_gc_log_device_physicalinput_Log;
  _gc_log_device_physicalinput_Log = (uint64_t)v0;
}

void sub_2209E4E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)(&a13 + i));
  _Unwind_Resume(a1);
}

void sub_2209E5D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

void sub_2209EA8A8(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_2209EAB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSXPCInterface *GCVideoRelocationXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B41F8];
}

NSXPCInterface *GCVideoRelocationXPCProxyServiceRemoteServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4258];
}

void sub_2209EB7A8(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_2209ECCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

void sub_2209EF554(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void __handleAncillaryButtonEvent_block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    size_t v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(a1 + 32) controller];
      uint64_t v9 = [v8 debugName];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) controller];
  int v3 = objc_msgSend(v2, "__deprecated_controllerPausedHandler");

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) controller];
    objc_msgSend(v4, "__deprecated_controllerPausedHandler");
    int v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    unsigned int v6 = [*(id *)(a1 + 32) controller];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

void __handleAncillaryButtonEvent_block_invoke_101(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    int v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [*(id *)(a1 + 32) controller];
      size_t v7 = [v6 debugName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  int v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void __handleGameControllerExtendedEvent_block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    int v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [*(id *)(a1 + 32) controller];
      size_t v7 = [v6 debugName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  int v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void __handleGameControllerEvent_block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    int v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [*(id *)(a1 + 32) controller];
      size_t v7 = [v6 debugName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  int v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void sub_2209F0C4C(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_2209F12C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209F1A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 56));
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_2209F1BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2209F3598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)(&a27 + i));
  _Unwind_Resume(a1);
}

void sub_2209F3D18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2209F4C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

uint64_t xAxisUpdateContext(uint64_t a1)
{
  unsigned int v2 = xAxisUpdateContext_Offset;
  if (xAxisUpdateContext_Offset == -1)
  {
    xAxisUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    unsigned int v2 = xAxisUpdateContext_Offset + v5;
    xAxisUpdateContext_Offset += v5;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = xAxisUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t yAxisUpdateContext(uint64_t a1)
{
  unsigned int v2 = yAxisUpdateContext_Offset;
  if (yAxisUpdateContext_Offset == -1)
  {
    yAxisUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    yAxisUpdateContext_Offset += v5;
    int v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    unsigned int v2 = yAxisUpdateContext_Offset + v6;
    yAxisUpdateContext_Offset += v6;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = yAxisUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t upButtonUpdateContext(uint64_t a1)
{
  unsigned int v2 = upButtonUpdateContext_Offset;
  if (upButtonUpdateContext_Offset == -1)
  {
    upButtonUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    upButtonUpdateContext_Offset += v5;
    int v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    upButtonUpdateContext_Offset += v6;
    int v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    unsigned int v2 = upButtonUpdateContext_Offset + v7;
    upButtonUpdateContext_Offset += v7;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = upButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t downButtonUpdateContext(uint64_t a1)
{
  unsigned int v2 = downButtonUpdateContext_Offset;
  if (downButtonUpdateContext_Offset == -1)
  {
    downButtonUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    downButtonUpdateContext_Offset += v5;
    int v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    downButtonUpdateContext_Offset += v6;
    int v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    downButtonUpdateContext_Offset += v7;
    int v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    unsigned int v2 = downButtonUpdateContext_Offset + v8;
    downButtonUpdateContext_Offset += v8;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = downButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t leftButtonUpdateContext(uint64_t a1)
{
  unsigned int v2 = leftButtonUpdateContext_Offset;
  if (leftButtonUpdateContext_Offset == -1)
  {
    leftButtonUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    leftButtonUpdateContext_Offset += v5;
    int v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    leftButtonUpdateContext_Offset += v6;
    int v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    leftButtonUpdateContext_Offset += v7;
    int v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    leftButtonUpdateContext_Offset += v8;
    int v9 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    unsigned int v2 = leftButtonUpdateContext_Offset + v9;
    leftButtonUpdateContext_Offset += v9;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = leftButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t rightButtonUpdateContext(uint64_t a1)
{
  unsigned int v2 = rightButtonUpdateContext_Offset;
  if (rightButtonUpdateContext_Offset == -1)
  {
    rightButtonUpdateContext_Offset = 2;
    int v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
    rightButtonUpdateContext_Offset += v5;
    int v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    rightButtonUpdateContext_Offset += v6;
    int v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
    rightButtonUpdateContext_Offset += v7;
    int v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    rightButtonUpdateContext_Offset += v8;
    int v9 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    rightButtonUpdateContext_Offset += v9;
    int v10 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
    unsigned int v2 = rightButtonUpdateContext_Offset + v10;
    rightButtonUpdateContext_Offset += v10;
  }
  unsigned int v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v3 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v3;
    unsigned int v2 = rightButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

void sub_2209FA108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

void sub_2209FC244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2209FD6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

__CFString *NSStringFromGCPoint2(float a1, float a2)
{
  unsigned int v2 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g}", 6, a1, 6, a2);

  return v2;
}

void sub_2209FF63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A00080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCLightXPCProxyRemoteClientEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D297628];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCLightXPCProxyRemoteServerEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D297750];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCLightXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A348];
}

id GCLightXPCProxyServiceRemoteServerInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E848];
  uint64_t v1 = GCLightXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_lightXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  unsigned int v2 = GCLightXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_lightXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSXPCInterface *GCAdaptiveTriggersServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D298AD0];
}

NSXPCInterface *GCAdaptiveTriggersServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4318];
}

NSXPCInterface *GCNintendoJoyConFusionGestureServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D293230];
}

NSXPCInterface *GCNintendoJoyConFusionGestureServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4378];
}

id _GCGamepadEventSourceDescription_Classes()
{
  if (_GCGamepadEventSourceDescription_Classes_onceToken != -1) {
    dispatch_once(&_GCGamepadEventSourceDescription_Classes_onceToken, &__block_literal_global_21);
  }
  os_log_t v0 = (void *)_GCGamepadEventSourceDescription_Classes_Classes;

  return v0;
}

NSXPCInterface *GCPhotoVideoXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B43D8];
}

id GCPhotoVideoXPCProxyServiceRemoteServerInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4438];
  uint64_t v1 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_onVideoRecordingStart_ argumentIndex:0 ofReply:1];

  unsigned int v2 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_onVideoRecordingStopWithURL_reply_ argumentIndex:0 ofReply:0];

  unsigned int v3 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_onVideoRecordingStopWithURL_reply_ argumentIndex:0 ofReply:1];

  uint64_t v4 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_takeScreenshotWithReply_ argumentIndex:0 ofReply:1];

  int v5 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_generateURLFor_withReply_ argumentIndex:0 ofReply:0];

  uint64_t v6 = objc_opt_class();
  int v7 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v6, objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_generateURLFor_withReply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_220A03A2C(_Unwind_Exception *a1)
{
}

id getGKDaemonProxyClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getGKDaemonProxyClass_softClass;
  uint64_t v7 = getGKDaemonProxyClass_softClass;
  if (!getGKDaemonProxyClass_softClass)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __getGKDaemonProxyClass_block_invoke;
    v3[3] = &unk_26D22C150;
    v3[4] = &v4;
    __getGKDaemonProxyClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220A04050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKLocalPlayerClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getGKLocalPlayerClass_softClass;
  uint64_t v7 = getGKLocalPlayerClass_softClass;
  if (!getGKLocalPlayerClass_softClass)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __getGKLocalPlayerClass_block_invoke;
    v3[3] = &unk_26D22C150;
    v3[4] = &v4;
    __getGKLocalPlayerClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220A04134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKGameClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getGKGameClass_softClass;
  uint64_t v7 = getGKGameClass_softClass;
  if (!getGKGameClass_softClass)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __getGKGameClass_block_invoke;
    v3[3] = &unk_26D22C150;
    v3[4] = &v4;
    __getGKGameClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220A04218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKDashboardLaunchContextGameController()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  os_log_t v0 = (void **)getGKDashboardLaunchContextGameControllerSymbolLoc_ptr;
  uint64_t v7 = getGKDashboardLaunchContextGameControllerSymbolLoc_ptr;
  if (!getGKDashboardLaunchContextGameControllerSymbolLoc_ptr)
  {
    id v1 = (void *)GameCenterFoundationLibrary();
    v5[3] = (uint64_t)dlsym(v1, "GKDashboardLaunchContextGameController");
    getGKDashboardLaunchContextGameControllerSymbolLoc_ptr = v5[3];
    os_log_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getGKDashboardLaunchContextGameController_cold_1();
  }
  unsigned int v2 = *v0;

  return v2;
}

void sub_220A04320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A05104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A0571C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A05974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A05AF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A05D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_220A05FCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A0605C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_220A061A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A062A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A063BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A064DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A069D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A06C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A07FBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A08324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A085AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getGKDaemonProxyClass_block_invoke(uint64_t a1)
{
  GameCenterFoundationLibrary();
  Class result = objc_getClass("GKDaemonProxy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGKDaemonProxyClass_block_invoke_cold_1();
  }
  getGKDaemonProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GameCenterFoundationLibrary()
{
  v2[0] = 0;
  if (!GameCenterFoundationLibraryCore_frameworkLibrary)
  {
    v2[1] = _NSConcreteStackBlock;
    _DWORD v2[2] = (void *)3221225472;
    v2[3] = __GameCenterFoundationLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26D22C170;
    uint64_t v4 = 0;
    GameCenterFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = GameCenterFoundationLibraryCore_frameworkLibrary;
  if (!GameCenterFoundationLibraryCore_frameworkLibrary) {
    GameCenterFoundationLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __GameCenterFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GameCenterFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getGKLocalPlayerClass_block_invoke(uint64_t a1)
{
  GameCenterFoundationLibrary();
  Class result = objc_getClass("GKLocalPlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGKLocalPlayerClass_block_invoke_cold_1();
  }
  getGKLocalPlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getGKGameClass_block_invoke(uint64_t a1)
{
  GameCenterFoundationLibrary();
  Class result = objc_getClass("GKGame");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGKGameClass_block_invoke_cold_1();
  }
  getGKGameClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getGKDashboardLaunchContextGameControllerSymbolLoc_block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)GameCenterFoundationLibrary();
  Class result = dlsym(v2, "GKDashboardLaunchContextGameController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGKDashboardLaunchContextGameControllerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id getLogger()
{
  if (getLogger_once != -1) {
    dispatch_once(&getLogger_once, &__block_literal_global_174);
  }
  uint64_t v0 = (void *)getLogger_logger;

  return v0;
}

void sub_220A09DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void __onqueue_3PSyntheticControllersChanged(void *a1, uint64_t a2)
{
  long long v3 = a1;
  dispatch_assert_queue_V2(v3[2]);
  uint64_t v4 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] Third-party synthetic game controllers changed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  if (a2) {
    __3PSyntheticControllersDrainIterator(v3, a2);
  }
  __onqueue_3PSyntheticControllersScan(v3);
  os_activity_scope_leave(&v5);
}

void sub_220A09E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void __3PSyntheticControllersDrainIterator(void *a1, uint64_t a2)
{
  id v4 = a1;
  while (1)
  {
    while (1)
    {
      io_object_t v3 = IOIteratorNext(a2);
      if (!v3) {
        break;
      }
      IOObjectRelease(v3);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    MEMORY[0x223C6D9B0](a2);
  }
}

void __onqueue_3PSyntheticControllersScan(void *a1)
{
  id v1 = a1;
  io_iterator_t existing = 0;
  CFDictionaryRef v2 = (const __CFDictionary *)CFRetain(v1[8]);
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing))
  {
    io_object_t v3 = getLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __onqueue_3PSyntheticControllersScan_cold_1();
    }
  }
  io_iterator_t v4 = existing;
  if (existing)
  {
    os_activity_scope_state_s v5 = 0;
    while (1)
    {
      io_object_t v6 = IOIteratorNext(v4);
      if (v6)
      {
        ++v5;
        IOObjectRelease(v6);
      }
      else
      {
        if (IOIteratorIsValid(existing)) {
          goto LABEL_13;
        }
        MEMORY[0x223C6D9B0](existing);
        os_activity_scope_state_s v5 = 0;
      }
      io_iterator_t v4 = existing;
    }
  }
  os_activity_scope_state_s v5 = 0;
LABEL_13:
  v1[10] = v5;
  -[GCSyntheticDeviceManager _onqueue_refreshSyntheticControllersEnabled]((uint64_t)v1);
}

void sub_220A0A42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void __getLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GameController", "SyntheticDeviceManager");
  id v1 = (void *)getLogger_logger;
  getLogger_logger = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_220A0B924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_220A0DD7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220A0E2B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220A0E554(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220A0E7F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220A0EA00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220A0F800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A0FC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_220A10134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A10760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A10BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A10E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_220A11BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

NSXPCInterface *GCMotionServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4498];
}

NSXPCInterface *GCMotionServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B44F8];
}

id _gc_log_virtualcontroller()
{
  if (_gc_log_virtualcontroller_onceToken != -1) {
    dispatch_once(&_gc_log_virtualcontroller_onceToken, &__block_literal_global_23);
  }
  os_log_t v0 = (void *)_gc_log_virtualcontroller_Log;

  return v0;
}

void ___gc_log_virtualcontroller_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.gamecontroller", "VirtualController");
  id v1 = (void *)_gc_log_virtualcontroller_Log;
  _gc_log_virtualcontroller_Log = (uint64_t)v0;
}

void GCAnalyticsSendVirtualControllerConnectedEvent(void *a1, void *a2, char a3)
{
  id v5 = a1;
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3254779904;
    v6[2] = __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke;
    v6[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w1_e30___NSObject_OS_xpc_object__8__0l;
    id v7 = a2;
    char v8 = a3;
    [v5 sendEvent:@"com.apple.GameController.VirtualController.connected" withXPCPayloadBuilder:v6];
  }
}

void sub_220A13FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

xpc_object_t __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = +[NSBundle mainBundle];
  io_object_t v3 = [v2 bundleIdentifier];
  io_iterator_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    io_object_t v6 = +[NSProcessInfo processInfo];
    id v5 = [v6 processName];
  }
  int v7 = *(unsigned __int8 *)(a1 + 40);
  char v8 = [*(id *)(a1 + 32) containsObject:@"Left Thumbstick"];
  char v9 = [*(id *)(a1 + 32) containsObject:@"Right Thumbstick"];
  char v10 = [*(id *)(a1 + 32) containsObject:@"Direction Pad"];
  if ([*(id *)(a1 + 32) containsObject:@"Left Shoulder"]) {
    char v11 = 1;
  }
  else {
    char v11 = [*(id *)(a1 + 32) containsObject:@"Right Shoulder"];
  }
  if ([*(id *)(a1 + 32) containsObject:@"Left Trigger"]) {
    char v12 = 1;
  }
  else {
    char v12 = [*(id *)(a1 + 32) containsObject:@"Right Trigger"];
  }
  *(_OWORD *)keys = xmmword_26D22C370;
  long long v26 = *(_OWORD *)&off_26D22C380;
  long long v27 = xmmword_26D22C390;
  xpc_object_t v19 = xpc_BOOL_create(v7 != 0);
  xpc_object_t v20 = xpc_BOOL_create(v8);
  xpc_object_t v21 = xpc_BOOL_create(v9);
  xpc_object_t v22 = xpc_BOOL_create(v10);
  xpc_object_t v23 = xpc_BOOL_create(v11);
  xpc_object_t v24 = xpc_BOOL_create(v12);
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, &v19, 6uLL);
  if (v13)
  {
    id v14 = v5;
    uint64_t v15 = (const char *)objc_msgSend(v14, "UTF8String", v19, v20, v21, v22, v23);
    if (v15) {
      xpc_dictionary_set_string(v13, "bundleID", v15);
    }
    id v16 = v13;
  }

  for (uint64_t i = 40; i != -8; i -= 8)
  return v13;
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w1(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{
}

void sub_220A14528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A14EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCSettingsXPCProxyRemoteClientEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2997A8];
  id v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCSettingsXPCProxyRemoteServerEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D299890];
  id v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCSettingsXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A790];
}

id GCSettingsXPCProxyServiceRemoteServerInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29EC18];
  id v1 = GCSettingsXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_settingsXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  CFDictionaryRef v2 = GCSettingsXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_settingsXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_220A16A10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220A18708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A1BBBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A1BE18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A1C074(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getRPScreenRecorderClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getRPScreenRecorderClass_softClass;
  uint64_t v7 = getRPScreenRecorderClass_softClass;
  if (!getRPScreenRecorderClass_softClass)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __getRPScreenRecorderClass_block_invoke;
    v3[3] = &unk_26D22C150;
    v3[4] = &v4;
    __getRPScreenRecorderClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220A1CAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A1CFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRPScreenRecorderClass_block_invoke(uint64_t a1)
{
  v3[0] = 0;
  if (!ReplayKitLibraryCore_frameworkLibrary)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = __ReplayKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26D22C700;
    uint64_t v5 = 0;
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReplayKitLibraryCore_frameworkLibrary) {
    __getRPScreenRecorderClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("RPScreenRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRPScreenRecorderClass_block_invoke_cold_2();
  }
  getRPScreenRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReplayKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReplayKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_220A1F308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A1FACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_220A1FC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A1FE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A1FF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A20004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_220A200A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A20C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t clientParamToSynthParam(int a1, float a2, unsigned int *a3, float *a4)
{
  if (a1 <= 1019)
  {
    switch(a1)
    {
      case 1000:
        float v4 = fminf(a2, 1.0);
        BOOL v5 = a2 <= 0.0;
        float v6 = 0.0;
        if (!v5) {
          float v6 = v4;
        }
        a1 = 5000;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1001:
        float v12 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v13 = -1.0;
        }
        else {
          float v13 = v12;
        }
        float v6 = v13 * 0.5 + 0.5;
        a1 = 5001;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1010:
        float v14 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v15 = -1.0;
        }
        else {
          float v15 = v14;
        }
        float v6 = (float)(v15 * 63.5) + 63.5;
        a1 = 73;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1011:
        float v16 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v17 = -1.0;
        }
        else {
          float v17 = v16;
        }
        float v6 = (float)(v17 * 63.5) + 63.5;
        a1 = 75;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1012:
        float v18 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v19 = -1.0;
        }
        else {
          float v19 = v18;
        }
        float v6 = (float)(v19 * 63.5) + 63.5;
        a1 = 72;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1013:
        float v20 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v21 = -1.0;
        }
        else {
          float v21 = v20;
        }
        float v6 = v21 * 0.5 + 0.5;
        a1 = 5004;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 1015:
        float v22 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v23 = -1.0;
        }
        else {
          float v23 = v22;
        }
        float v6 = v23 * 0.5 + 0.5;
        a1 = 5011;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      default:
        goto LABEL_25;
    }
  }
  uint64_t v7 = 4294967292;
  if (a1 <= 2009)
  {
    switch(a1)
    {
      case 1020:
        return v7;
      case 2000:
        float v26 = fminf(a2, 1.0);
        BOOL v5 = a2 <= 0.0;
        float v6 = 0.0;
        if (!v5) {
          float v6 = v26;
        }
        a1 = 5002;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
      case 2001:
        float v10 = fminf(a2, 1.0);
        if (a2 <= -1.0) {
          float v11 = -1.0;
        }
        else {
          float v11 = v10;
        }
        float v6 = v11 * 0.5 + 0.5;
        a1 = 5003;
        if (!a3) {
          goto LABEL_71;
        }
        goto LABEL_70;
    }
    goto LABEL_25;
  }
  if (a1 > 2011)
  {
    if (a1 == 2012)
    {
      float v27 = fminf(a2, 1.0);
      if (a2 <= -1.0) {
        float v28 = -1.0;
      }
      else {
        float v28 = v27;
      }
      float v6 = (float)(v28 * 63.5) + 63.5;
      a1 = 81;
      if (!a3) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
    if (a1 == 2020) {
      return v7;
    }
LABEL_25:
    if (a1 > 0xFF) {
      return 4294962494;
    }
    float v30 = 127.0;
    if (a2 < 1.0) {
      float v30 = a2 * 127.0;
    }
    BOOL v5 = a2 <= 0.0;
    float v6 = 0.0;
    if (!v5) {
      float v6 = v30;
    }
    if (!a3) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  if (a1 == 2010)
  {
    float v24 = fminf(a2, 1.0);
    if (a2 <= -1.0) {
      float v25 = -1.0;
    }
    else {
      float v25 = v24;
    }
    float v6 = (float)(v25 * 63.5) + 63.5;
    a1 = 79;
    if (!a3) {
      goto LABEL_71;
    }
  }
  else
  {
    float v8 = fminf(a2, 1.0);
    if (a2 <= -1.0) {
      float v9 = -1.0;
    }
    else {
      float v9 = v8;
    }
    float v6 = (float)(v9 * 63.5) + 63.5;
    a1 = 80;
    if (!a3) {
      goto LABEL_71;
    }
  }
LABEL_70:
  *a3 = a1;
LABEL_71:
  uint64_t v7 = 0;
  if (a4) {
    *a4 = v6;
  }
  return v7;
}

void sub_220A21398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)_GCHapticPlayer;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_19(uint64_t result, uint64_t a2, double a3, float a4)
{
  *(float *)uint64_t result = a4;
  *(void *)(result + 4) = a2;
  *(_WORD *)(result + 12) = 2048;
  *(double *)(result + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t result, double a2, float a3)
{
  *(float *)uint64_t result = a3;
  *(double *)(result + 4) = a2;
  return result;
}

id _gc_log_keyboard_and_mouse()
{
  if (_gc_log_keyboard_and_mouse_onceToken != -1) {
    dispatch_once(&_gc_log_keyboard_and_mouse_onceToken, &__block_literal_global_27);
  }
  os_log_t v0 = (void *)_gc_log_keyboard_and_mouse_Log;

  return v0;
}

void ___gc_log_keyboard_and_mouse_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.gamecontroller", "Keyboard+Mouse");
  uint64_t v1 = (void *)_gc_log_keyboard_and_mouse_Log;
  _gc_log_keyboard_and_mouse_Log = (uint64_t)v0;
}

void sub_220A22C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A24170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A24598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_220A24710(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _HIDEventCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5 = a2;
  IOHIDEventGetSenderID();
  IOHIDEventGetTimeStamp();
  IOHIDEventGetType();
  kdebug_trace();
  [v5 publishHIDEvent:a4];
}

uint64_t _IOObjectCFRetain(int a1, uint64_t object)
{
  if (IOObjectRetain(object)) {
    return 0;
  }
  else {
    return object;
  }
}

uint64_t _IOObjectCFRelease(int a1, io_object_t object)
{
  return IOObjectRelease(object);
}

void DeviceMatched(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 1));
  uint64_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    while (1)
    {
      uint64_t entryID = 0;
      IORegistryEntryGetRegistryEntryID(v5, &entryID);
      if (!entryID)
      {
        if (!gc_isInternalBuild()) {
          goto LABEL_23;
        }
        float v15 = getGCLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          DeviceMatched_cold_1();
        }
        goto LABEL_16;
      }
      float v6 = (void *)*((void *)v3 + 5);
      uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:](&off_26D2B68C8, "numberWithUnsignedLongLong:");
      float v8 = [v6 objectForKeyedSubscript:v7];

      if (v8) {
        goto LABEL_23;
      }
      float v9 = [[_GCLogitechRacingWheel alloc] initWithService:v5];
      if (!v9) {
        break;
      }
      io_object_t notification = 0;
      if (IOServiceAddInterestNotification(*((IONotificationPortRef *)v3 + 2), v5, "IOGeneralInterest", (IOServiceInterestCallback)DeviceGeneralNotification, v3, &notification))
      {
        if (gc_isInternalBuild())
        {
          float v16 = getGCLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            DeviceMatched_cold_3();
          }
        }
        goto LABEL_23;
      }
      CFSetAddValue(*((CFMutableSetRef *)v3 + 4), (const void *)notification);
      id v10 = v3;
      objc_sync_enter(v10);
      float v11 = (void *)*((void *)v3 + 5);
      float v12 = +[NSNumber numberWithUnsignedLongLong:entryID];
      [v11 setObject:v9 forKeyedSubscript:v12];

      objc_sync_exit(v10);
      if (gc_isInternalBuild())
      {
        float v14 = getGCLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          float v22 = v9;
          _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "Steering Wheel Device Matched: %@", buf, 0xCu);
        }
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __DeviceMatched_block_invoke;
      block[3] = &unk_26D22A8C0;
      float v18 = v9;
      float v13 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      uint64_t v5 = IOIteratorNext(a2);
      if (!v5) {
        goto LABEL_23;
      }
    }
    if (gc_isInternalBuild())
    {
      float v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        DeviceMatched_cold_2();
      }
LABEL_16:
    }
  }
LABEL_23:
}

void sub_220A253B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A25448(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DeviceGeneralNotification(void *a1, io_registry_entry_t a2, int a3)
{
  uint64_t v5 = a1;
  if (a3 == -536870896)
  {
    uint64_t entryID = 0;
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    if (entryID)
    {
      float v6 = (void *)v5[5];
      uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:](&off_26D2B68C8, "numberWithUnsignedLongLong:");
      float v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        if (gc_isInternalBuild())
        {
          float v12 = getGCLogger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            float v17 = v8;
            _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "Steering Wheel Device Removed: %@", buf, 0xCu);
          }
        }
        float v9 = v5;
        objc_sync_enter(v9);
        id v10 = (void *)v5[5];
        float v11 = +[NSNumber numberWithUnsignedLongLong:entryID];
        [v10 setObject:0 forKeyedSubscript:v11];

        objc_sync_exit(v9);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = __DeviceGeneralNotification_block_invoke;
        v13[3] = &unk_26D22A8C0;
        float v8 = v8;
        float v14 = v8;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
      }
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_8;
      }
      float v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        DeviceGeneralNotification_cold_1();
      }
    }
  }
LABEL_8:
}

void sub_220A256AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DeviceMatched_block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "Posting GCRacingWheelDidConnectNotification for: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"GCRacingWheelDidConnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __DeviceGeneralNotification_block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "Posting GCRacingWheelDidDisconnectNotification for: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"GCRacingWheelDidDisconnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void OUTLINED_FUNCTION_0_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void GCExtendedGamepadInitInfoMake(void *a1@<X8>)
{
  bzero(a1, 0x638uLL);
  for (uint64_t i = 8; i != 1160; i += 72)
    *((unsigned char *)a1 + i) = 1;
  GCExtendedGamepadInitInfoPopulateNames((uint64_t)a1);
}

void sub_220A2590C(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void GCExtendedGamepadInitInfoPopulateNames(uint64_t a1)
{
  objc_storeStrong((id *)a1, @"Direction Pad");
  objc_storeStrong((id *)(a1 + 72), @"Button A");
  objc_storeStrong((id *)(a1 + 144), @"Button B");
  objc_storeStrong((id *)(a1 + 216), @"Button X");
  objc_storeStrong((id *)(a1 + 288), @"Button Y");
  objc_storeStrong((id *)(a1 + 360), @"Left Thumbstick");
  objc_storeStrong((id *)(a1 + 432), @"Right Thumbstick");
  objc_storeStrong((id *)(a1 + 504), @"Left Shoulder");
  objc_storeStrong((id *)(a1 + 576), @"Right Shoulder");
  objc_storeStrong((id *)(a1 + 648), @"Left Trigger");
  objc_storeStrong((id *)(a1 + 720), @"Right Trigger");
  objc_storeStrong((id *)(a1 + 792), @"Left Thumbstick Button");
  objc_storeStrong((id *)(a1 + 864), @"Right Thumbstick Button");
  objc_storeStrong((id *)(a1 + 936), @"Button Home");
  objc_storeStrong((id *)(a1 + 1008), @"Button Menu");
  objc_storeStrong((id *)(a1 + 1080), @"Button Options");
  objc_storeStrong((id *)(a1 + 1152), @"Left Bumper");
  objc_storeStrong((id *)(a1 + 1224), @"Right Bumper");
  objc_storeStrong((id *)(a1 + 1296), @"Back Left Button 0");
  objc_storeStrong((id *)(a1 + 1368), @"Back Left Button 1");
  objc_storeStrong((id *)(a1 + 1440), @"Back Right Button 0");
  objc_storeStrong((id *)(a1 + 1512), @"Back Right Button 1");
  uint64_t v2 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = @"DIRECTION_PAD";

  id v3 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = @"BUTTON_A";

  uint64_t v4 = *(void **)(a1 + 200);
  *(void *)(a1 + 200) = @"BUTTON_B";

  int v5 = *(void **)(a1 + 272);
  *(void *)(a1 + 272) = @"BUTTON_X";

  uint64_t v6 = *(void **)(a1 + 344);
  *(void *)(a1 + 344) = @"BUTTON_Y";

  uint64_t v7 = *(void **)(a1 + 560);
  *(void *)(a1 + 560) = @"LEFT_SHOULDER";

  float v8 = *(void **)(a1 + 632);
  *(void *)(a1 + 632) = @"RIGHT_SHOULDER";

  uint64_t v9 = *(void **)(a1 + 704);
  *(void *)(a1 + 704) = @"LEFT_TRIGGER";

  id v10 = *(void **)(a1 + 776);
  *(void *)(a1 + 776) = @"RIGHT_TRIGGER";

  float v11 = *(void **)(a1 + 416);
  *(void *)(a1 + 416) = @"LEFT_THUMBSTICK";

  float v12 = *(void **)(a1 + 488);
  *(void *)(a1 + 488) = @"RIGHT_THUMBSTICK";

  float v13 = *(void **)(a1 + 848);
  *(void *)(a1 + 848) = @"BUTTON_LEFT_THUMBSTICK";

  float v14 = *(void **)(a1 + 920);
  *(void *)(a1 + 920) = @"BUTTON_RIGHT_THUMBSTICK";

  float v15 = *(void **)(a1 + 1208);
  *(void *)(a1 + 1208) = @"BUTTON_L4";

  float v16 = *(void **)(a1 + 1280);
  *(void *)(a1 + 1280) = @"BUTTON_R4";

  float v17 = *(void **)(a1 + 1496);
  *(void *)(a1 + 1496) = @"BUTTON_M1";

  float v18 = *(void **)(a1 + 1568);
  *(void *)(a1 + 1568) = @"BUTTON_M3";

  float v19 = *(void **)(a1 + 1352);
  *(void *)(a1 + 1352) = @"BUTTON_M2";

  float v20 = *(void **)(a1 + 1424);
  *(void *)(a1 + 1424) = @"BUTTON_M4";

  float v21 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = @"dpad";

  float v22 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = @"a.circle";

  float v23 = *(void **)(a1 + 192);
  *(void *)(a1 + 192) = @"b.circle";

  float v24 = *(void **)(a1 + 336);
  *(void *)(a1 + 336) = @"y.circle";

  float v25 = *(void **)(a1 + 264);
  *(void *)(a1 + 264) = @"x.circle";

  float v26 = *(void **)(a1 + 552);
  *(void *)(a1 + 552) = @"l1.rectangle.roundedbottom";

  float v27 = *(void **)(a1 + 624);
  *(void *)(a1 + 624) = @"r1.rectangle.roundedbottom";

  float v28 = *(void **)(a1 + 696);
  *(void *)(a1 + 696) = @"l2.rectangle.roundedtop";

  double v29 = *(void **)(a1 + 768);
  *(void *)(a1 + 768) = @"r2.rectangle.roundedtop";

  float v30 = *(void **)(a1 + 408);
  *(void *)(a1 + 408) = @"l.joystick";

  double v31 = *(void **)(a1 + 480);
  *(void *)(a1 + 480) = @"r.joystick";

  double v32 = *(void **)(a1 + 840);
  *(void *)(a1 + 840) = @"l.joystick.down";

  double v33 = *(void **)(a1 + 912);
  *(void *)(a1 + 912) = @"r.joystick.press.down";

  double v34 = *(void **)(a1 + 1200);
  *(void *)(a1 + 1200) = @"l4.button.horizontal";

  double v35 = *(void **)(a1 + 1272);
  *(void *)(a1 + 1272) = @"r4.button.horizontal";

  unsigned int v36 = *(void **)(a1 + 1488);
  *(void *)(a1 + 1488) = @"m1.button.horizontal";

  float v37 = *(void **)(a1 + 1560);
  *(void *)(a1 + 1560) = @"m3.button.horizontal";

  v38 = *(void **)(a1 + 1344);
  *(void *)(a1 + 1344) = @"m2.button.horizontal";

  __int16 v39 = *(void **)(a1 + 1416);
  *(void *)(a1 + 1416) = @"m4.button.horizontal";

  *(unsigned char *)(a1 + 44) = 1;
  *(unsigned char *)(a1 + 116) = 1;
  *(unsigned char *)(a1 + 188) = 1;
  *(unsigned char *)(a1 + 332) = 1;
  *(unsigned char *)(a1 + 260) = 1;
  *(unsigned char *)(a1 + 548) = 1;
  *(unsigned char *)(a1 + 620) = 1;
  *(unsigned char *)(a1 + 692) = 1;
  *(unsigned char *)(a1 + 764) = 1;
  *(unsigned char *)(a1 + 404) = 1;
  *(unsigned char *)(a1 + 476) = 1;
  *(unsigned char *)(a1 + 836) = 1;
  *(unsigned char *)(a1 + 908) = 1;
  *(unsigned char *)(a1 + 1196) = 1;
  *(unsigned char *)(a1 + 1268) = 1;
  *(unsigned char *)(a1 + 1340) = 1;
  *(unsigned char *)(a1 + 1412) = 1;
  *(unsigned char *)(a1 + 1484) = 1;
  *(unsigned char *)(a1 + 1556) = 1;
  *(_OWORD *)(a1 + 16) = xmmword_220A94090;
  *(_DWORD *)(a1 + 88) = 4;
  *(_DWORD *)(a1 + 160) = 5;
  *(_DWORD *)(a1 + 304) = 7;
  *(_DWORD *)(a1 + 232) = 6;
  *(_DWORD *)(a1 + 520) = 8;
  *(_DWORD *)(a1 + 592) = 9;
  *(_OWORD *)(a1 + 376) = xmmword_220A940A0;
  *(_OWORD *)(a1 + 448) = xmmword_220A940B0;
  *(_DWORD *)(a1 + 664) = 18;
  *(_DWORD *)(a1 + 736) = 19;
  *(_DWORD *)(a1 + 808) = 20;
  *(_DWORD *)(a1 + 880) = 21;
  *(_DWORD *)(a1 + 1168) = 41;
  *(_DWORD *)(a1 + 1240) = 42;
  *(_DWORD *)(a1 + 1312) = 43;
  *(_DWORD *)(a1 + 1384) = 44;
  *(_DWORD *)(a1 + 1456) = 45;
  *(_DWORD *)(a1 + 1528) = 46;
  *(_DWORD *)(a1 + 40) = 1;
  *(_DWORD *)(a1 + 112) = 1;
  *(_DWORD *)(a1 + 184) = 1;
  *(_DWORD *)(a1 + 328) = 1;
  *(_DWORD *)(a1 + 256) = 1;
  *(_DWORD *)(a1 + 544) = 1;
  *(_DWORD *)(a1 + 616) = 1;
  *(_DWORD *)(a1 + 400) = 1;
  *(_DWORD *)(a1 + 472) = 1;
  *(_DWORD *)(a1 + 688) = 1;
  *(_DWORD *)(a1 + 760) = 1;
  *(_DWORD *)(a1 + 832) = 1;
  *(_DWORD *)(a1 + 904) = 1;
  *(_DWORD *)(a1 + 1192) = 1;
  *(_DWORD *)(a1 + 1264) = 1;
  *(_DWORD *)(a1 + 1336) = 1;
  *(_DWORD *)(a1 + 1408) = 1;
  *(_DWORD *)(a1 + 1480) = 1;
  *(_DWORD *)(a1 + 1552) = 1;
  uint64_t v40 = +[NSSet setWithObject:@"Paddle 3"];
  v41 = *(void **)(a1 + 1360);
  *(void *)(a1 + 1360) = v40;

  uint64_t v42 = +[NSSet setWithObject:@"Paddle 4"];
  int v43 = *(void **)(a1 + 1432);
  *(void *)(a1 + 1432) = v42;

  uint64_t v44 = +[NSSet setWithObject:@"Paddle 1"];
  int v45 = *(void **)(a1 + 1504);
  *(void *)(a1 + 1504) = v44;

  uint64_t v46 = +[NSSet setWithObject:@"Paddle 2"];
  int v47 = *(void **)(a1 + 1576);
  *(void *)(a1 + 1576) = v46;
}

void sub_220A260C8(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_220A270E4(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_220A27400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  __destructor_8_s0_s48_s56_s64((uint64_t)&a38);
  __destructor_8_s0_s48_s56_s64(v38 - 160);
  _Unwind_Resume(a1);
}

void sub_220A2A554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)(&a40 + i));
  _Unwind_Resume(a1);
}

id allCodes()
{
  if (allCodes_onceToken != -1) {
    dispatch_once(&allCodes_onceToken, &__block_literal_global_29);
  }
  os_log_t v0 = (void *)allCodes_codes;

  return v0;
}

void __allCodes_block_invoke()
{
  os_log_t v0 = (void *)allCodes_codes;
  allCodes_codes = (uint64_t)&unk_26D287A10;
}

void sub_220A2AED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

double __timestampToSecondsMultiplier_block_invoke()
{
  mach_timebase_info((mach_timebase_info_t)&timestampToSecondsMultiplier_timebaseInfo);
  LODWORD(v0) = timestampToSecondsMultiplier_timebaseInfo;
  LODWORD(v1) = *(_DWORD *)algn_267F28F4C;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  timestampToSecondsMultiplier_multiplier = *(void *)&result;
  return result;
}

NSXPCInterface *GCHapticClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B47D8];
}

NSXPCInterface *GCHapticServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2A08A8];
}

void sub_220A32858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A35664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_21(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _GCKeyboardEventSourceDescription_Classes()
{
  if (_GCKeyboardEventSourceDescription_Classes_onceToken != -1) {
    dispatch_once(&_GCKeyboardEventSourceDescription_Classes_onceToken, &__block_literal_global_32);
  }
  unint64_t v0 = (void *)_GCKeyboardEventSourceDescription_Classes_Classes;

  return v0;
}

void sub_220A36E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

id _gc_log_ui()
{
  if (_gc_log_ui_onceToken != -1) {
    dispatch_once(&_gc_log_ui_onceToken, &__block_literal_global_33);
  }
  unint64_t v0 = (void *)_gc_log_ui_Log;

  return v0;
}

void ___gc_log_ui_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.gamecontroller", "UI");
  unint64_t v1 = (void *)_gc_log_ui_Log;
  _gc_log_ui_Log = (uint64_t)v0;
}

void sub_220A38808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A39328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E0E8];
  unint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  uint64_t v2 = objc_opt_class();
  id v3 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_newStatuses_ argumentIndex:0 ofReply:0];

  return v0;
}

id GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E210];
  unint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  uint64_t v2 = objc_opt_class();
  id v3 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_fetchStatusesWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCAdaptiveTriggersXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A468];
}

id GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E8E8];
  unint64_t v1 = GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  uint64_t v2 = GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSXPCInterface *GCGameIntentServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D298C90];
}

NSXPCInterface *GCGameIntentServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4838];
}

void sub_220A3ADCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A3B36C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double NSTimeIntervalFromMachAbsoluteTime(uint64_t a1)
{
  if (NSTimeIntervalFromMachAbsoluteTime_once != -1) {
    dispatch_once(&NSTimeIntervalFromMachAbsoluteTime_once, &__block_literal_global_34);
  }
  return (double)((unint64_t)NSTimeIntervalFromMachAbsoluteTime_sTimebaseInfo
                * a1
                / *(unsigned int *)algn_267F28FCC)
       / 1000000000.0;
}

uint64_t __NSTimeIntervalFromMachAbsoluteTime_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&NSTimeIntervalFromMachAbsoluteTime_sTimebaseInfo);
}

void sub_220A3C7DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A3CD40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A3CEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_220A3D0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_220A3DCF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220A3DDDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A3DF6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A3F870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_220A3FE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __setActiveDevices_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = 0;
  return result;
}

Class __getRPScreenRecorderClass_block_invoke_0(uint64_t a1)
{
  v3[0] = 0;
  if (!ReplayKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = __ReplayKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26D22CA30;
    uint64_t v5 = 0;
    ReplayKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReplayKitLibraryCore_frameworkLibrary_0) {
    __getRPScreenRecorderClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("RPScreenRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRPScreenRecorderClass_block_invoke_cold_2_0();
  }
  getRPScreenRecorderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReplayKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ReplayKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getSSUIServiceClass_block_invoke(uint64_t a1)
{
  v3[0] = 0;
  if (!ScreenshotServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = __ScreenshotServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26D22CA48;
    uint64_t v5 = 0;
    ScreenshotServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ScreenshotServicesLibraryCore_frameworkLibrary) {
    __getSSUIServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SSUIService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSSUIServiceClass_block_invoke_cold_2();
  }
  getSSUIServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenshotServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenshotServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_19(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_220A40468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A429E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_220A42CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A42F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A43234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A434F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A437EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A43AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A43DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A440A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220A44434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A446BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A449B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A44BA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A44DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A451B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

void sub_220A47B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_220A48654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void GCControllerMBDelegateBTSessionEventCallback(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v7 = a4;
  if (a3 | a2)
  {
    if (a2 == 3)
    {
      if (gc_isInternalBuild())
      {
        float v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v9 = "BT session failed";
          goto LABEL_21;
        }
LABEL_23:
      }
    }
    else if (a2 == 2)
    {
      if (gc_isInternalBuild())
      {
        float v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v9 = "BT session terminated";
          goto LABEL_21;
        }
        goto LABEL_23;
      }
    }
    else if (a2 == 1 && gc_isInternalBuild())
    {
      float v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v9 = "BT session detached";
LABEL_21:
        float v13 = buf;
        float v14 = v8;
        uint32_t v15 = 2;
LABEL_22:
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, v9, v13, v15);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (gc_isInternalBuild())
    {
      float v18 = getGCLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_DEFAULT, "BT session attached", buf, 2u);
      }
    }
    if (!v7[1])
    {
      v7[1] = a1;
      int v10 = BTDiscoveryAgentCreate();
      if (v10)
      {
        int v11 = v10;
        if (gc_isInternalBuild())
        {
          float v12 = getGCLogger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v11;
            _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, "BT discovery agent create failed (%d)", buf, 8u);
          }
        }
      }
      else
      {
        BTDiscoveryAgentStartScan();
      }
      float v25 = GCControllerMBDelegateBTPairingAgentLocalOOBDataReadyCallback;
      *(void *)buf = GCControllerMBDelegateBTPairingAgentStatusEventCallback;
      float v21 = GCControllerMBDelegateBTPairingAgentPincodeCallback;
      float v22 = GCControllerMBDelegateBTPairingAgentAuthorizationCallback;
      float v23 = GCControllerMBDelegateBTPairingAgentUserConfirmationCallback;
      float v24 = GCControllerMBDelegateBTPairingAgentPassKeyDisplayCallback;
      int v16 = BTPairingAgentCreate();
      if (!v16)
      {
        BTPairingAgentStart();
        goto LABEL_30;
      }
      int v17 = v16;
      if (gc_isInternalBuild())
      {
        float v8 = getGCLogger();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        v19[0] = 67109120;
        v19[1] = v17;
        uint64_t v9 = "BT pairing agent create failed (%d)";
        float v13 = (uint8_t *)v19;
        float v14 = v8;
        uint32_t v15 = 8;
        goto LABEL_22;
      }
    }
  }
LABEL_30:
}

void sub_220A4939C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void GCControllerMBDelegateBTDiscoveryAgentStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  switch(a2)
  {
    case 0:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v10 = 0;
        uint64_t v5 = "BT discovery scan started";
        uint64_t v6 = (uint8_t *)&v10;
        goto LABEL_15;
      }
      break;
    case 1:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v9 = 0;
        uint64_t v5 = "BT discovery scan stopped";
        uint64_t v6 = (uint8_t *)&v9;
        goto LABEL_15;
      }
      break;
    case 2:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v8 = 0;
        uint64_t v5 = "BT discovery query started";
        uint64_t v6 = (uint8_t *)&v8;
        goto LABEL_15;
      }
      break;
    case 3:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v7 = 0;
          uint64_t v5 = "BT discovery query stopped";
          uint64_t v6 = (uint8_t *)&v7;
LABEL_15:
          _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
LABEL_16:
      }
      break;
    default:
      return;
  }
}

void GCControllerMBDelegateBTDiscoveryAgentDiscoveryEventCallback(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 2:
      if (!gc_isInternalBuild()) {
        return;
      }
      uint64_t v2 = getGCLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v3 = "BT discovery device changed";
LABEL_13:
        _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
      }
LABEL_26:

      return;
    case 1:
      if (!gc_isInternalBuild()) {
        return;
      }
      uint64_t v2 = getGCLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v3 = "BT discovery device lost";
        goto LABEL_13;
      }
      goto LABEL_26;
    case 0:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "BT discovery device found", buf, 2u);
        }
      }
      BTDeviceGetDeviceClass();
      if (gc_isInternalBuild())
      {
        uint64_t v5 = getGCLogger();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v8 = 0;
          _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "-> deviceClass: %x", buf, 8u);
        }
      }
      BTDeviceGetDeviceType();
      if (gc_isInternalBuild())
      {
        uint64_t v6 = getGCLogger();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v8 = 0;
          _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "-> deviceType: %x (Generic)", buf, 8u);
        }
      }
      BTDeviceConnectServices();
      break;
  }
}

void GCControllerMBDelegateBTPairingAgentLocalOOBDataReadyCallback()
{
  if (gc_isInternalBuild())
  {
    os_log_t v0 = getGCLogger();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_220998000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing local OOB data generated", v1, 2u);
    }
  }
}

void GCControllerMBDelegateBTPairingAgentStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  switch(a2)
  {
    case 0:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v10 = 0;
        uint64_t v5 = "BT pairing agent started";
        uint64_t v6 = (uint8_t *)&v10;
        goto LABEL_15;
      }
      break;
    case 1:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v9 = 0;
        uint64_t v5 = "BT pairing agent stopped";
        uint64_t v6 = (uint8_t *)&v9;
        goto LABEL_15;
      }
      break;
    case 2:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        __int16 v8 = 0;
        uint64_t v5 = "BT pairing attempt started";
        uint64_t v6 = (uint8_t *)&v8;
        goto LABEL_15;
      }
      break;
    case 3:
      if (gc_isInternalBuild())
      {
        uint64_t v4 = getGCLogger();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v7 = 0;
          uint64_t v5 = "BT pairing attempt complete";
          uint64_t v6 = (uint8_t *)&v7;
LABEL_15:
          _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
LABEL_16:
      }
      break;
    default:
      return;
  }
}

void GCControllerMBDelegateBTPairingAgentPincodeCallback()
{
  if (gc_isInternalBuild())
  {
    os_log_t v0 = getGCLogger();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_220998000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing pincodeRequest", v1, 2u);
    }
  }
}

void GCControllerMBDelegateBTPairingAgentAuthorizationCallback()
{
  if (gc_isInternalBuild())
  {
    os_log_t v0 = getGCLogger();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_220998000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing authorizationRequest", v1, 2u);
    }
  }
}

uint64_t GCControllerMBDelegateBTPairingAgentUserConfirmationCallback()
{
  if (gc_isInternalBuild())
  {
    uint64_t v1 = getGCLogger();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_DEFAULT, "BT pairing userConfirmationRequest", buf, 2u);
    }
  }
  return BTDeviceGetDeviceClass();
}

void GCControllerMBDelegateBTPairingAgentPassKeyDisplayCallback()
{
  if (gc_isInternalBuild())
  {
    os_log_t v0 = getGCLogger();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_220998000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing passKeyRequest", v1, 2u);
    }
  }
}

void sub_220A4A194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A4AE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCSystemGestureXPCProxyRemoteClientEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29FA40];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCSystemGestureXPCProxyRemoteServerEndpointInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29FB80];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCSystemGestureXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A9B8];
}

id GCSystemGestureXPCProxyServiceRemoteServerInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29EB50];
  uint64_t v1 = GCSystemGestureXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_systemGestureXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  uint64_t v2 = GCSystemGestureXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_systemGestureXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_220A4C660(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

void sub_220A4C7CC(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

id GCDriverClientInterface()
{
  os_log_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4898];
  uint64_t v1 = GCNintendoJoyConFusionGestureServiceClientInterface();
  [v0 setInterface:v1 forSelector:sel_connectToNintendoJoyConFusionGestureServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v2 = GCNintendoJoyConFusionGestureServiceServerInterface();
  [v0 setInterface:v2 forSelector:sel_connectToNintendoJoyConFusionGestureServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v3 = GCLightServiceClientInterface();
  [v0 setInterface:v3 forSelector:sel_connectToLightServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v4 = GCLightServiceServerInterface();
  [v0 setInterface:v4 forSelector:sel_connectToLightServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v5 = GCAdaptiveTriggersServiceClientInterface();
  [v0 setInterface:v5 forSelector:sel_connectToAdaptiveTriggersServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v6 = GCAdaptiveTriggersServiceServerInterface();
  [v0 setInterface:v6 forSelector:sel_connectToAdaptiveTriggersServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  __int16 v7 = GCMotionServiceClientInterface();
  [v0 setInterface:v7 forSelector:sel_connectToMotionServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  __int16 v8 = GCMotionServiceServerInterface();
  [v0 setInterface:v8 forSelector:sel_connectToMotionServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v9 = GCBatteryServiceClientInterface();
  [v0 setInterface:v9 forSelector:sel_connectToBatteryServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  __int16 v10 = GCBatteryServiceServerInterface();
  [v0 setInterface:v10 forSelector:sel_connectToBatteryServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v11 = GCGameIntentServiceClientInterface();
  [v0 setInterface:v11 forSelector:sel_connectToGameIntentServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v12 = GCGameIntentServiceServerInterface();
  [v0 setInterface:v12 forSelector:sel_connectToGameIntentServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  float v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:sel_connectToGenericDeviceDriverConfigurationServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  float v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:sel_connectToGenericDeviceDriverConfigurationServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCDriverServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B48F8];
}

double dqIdentity()
{
  return *(double *)&_PromotedConst;
}

float32x4_t dqMakeDualQuaternion(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float32x2_t v2 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  if (vaddv_f32(v2) == 0.0)
  {
    return (float32x4_t)xmmword_220A91FE0;
  }
  else
  {
    unsigned __int32 v4 = vadd_f32(v2, (float32x2_t)vdup_lane_s32((int32x2_t)v2, 1)).u32[0];
    float32x2_t v5 = vrsqrte_f32((float32x2_t)v4);
    float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4, vmul_f32(v5, v5)));
    return vmulq_n_f32(a1, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4, vmul_f32(v6, v6))).f32[0]);
  }
}

double dqAdd(float32x4_t a1, double a2, float32x4_t a3)
{
  *(void *)&double result = vaddq_f32(a1, a3).u64[0];
  return result;
}

double dqNormalize(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float v2 = vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL)));
  if (v2 <= 0.000001) {
    dqNormalize_cold_1();
  }
  *(void *)&double result = vmulq_n_f32(a1, 1.0 / v2).u64[0];
  return result;
}

double dqMul(float32x4_t a1, double a2, float32x4_t a3)
{
  int32x4_t v3 = (int32x4_t)vnegq_f32(a1);
  int8x16_t v4 = (int8x16_t)vtrn2q_s32((int32x4_t)a1, vtrn1q_s32((int32x4_t)a1, v3));
  float32x4_t v5 = (float32x4_t)vrev64q_s32((int32x4_t)a1);
  v5.i32[0] = v3.i32[1];
  v5.i32[3] = v3.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a1, (int8x16_t)v3, 8uLL), *(float32x2_t *)a3.f32, 1), (float32x4_t)vextq_s8(v4, v4, 8uLL), a3.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(a1, a3, 3), v5, a3, 2)).u64[0];
  return result;
}

double dqMulConst(float32x4_t a1, double a2, float a3)
{
  *(void *)&double result = vmulq_n_f32(a1, a3).u64[0];
  return result;
}

double dqDLB(float32x4_t a1, double a2, float32x4_t a3, double a4, float a5)
{
  float32x4_t v5 = vaddq_f32(vmulq_n_f32(a3, a5), vmulq_n_f32(a1, 1.0 - a5));
  int8x16_t v6 = (int8x16_t)vmulq_f32(v5, v5);
  float v7 = vaddv_f32(vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)));
  if (v7 <= 0.000001) {
    dqDLB_cold_1();
  }
  *(void *)&double result = vmulq_n_f32(v5, 1.0 / v7).u64[0];
  return result;
}

double dqConjugate(float32x4_t a1)
{
  *(void *)&double result = vmulq_f32(a1, (float32x4_t)xmmword_220A94580).u64[0];
  return result;
}

void dqScLERP(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float a5)
{
  if ((vminvq_u32((uint32x4_t)vceqq_f32(a1, a3)) & 0x80000000) == 0
    || (vminvq_u32((uint32x4_t)vceqq_f32(a2, a4)) & 0x80000000) == 0)
  {
    int8x16_t v6 = (int8x16_t)vmulq_f32(a1, a3);
    float32x4_t v7 = a1;
    float32x4_t v8 = (float32x4_t)vextq_s8(v6, v6, 8uLL);
    *(float32x2_t *)a1.f32 = vadd_f32(*(float32x2_t *)v6.i8, *(float32x2_t *)v8.f32);
    a1.f32[0] = vaddv_f32(*(float32x2_t *)a1.f32);
    v8.i64[0] = 0;
    float32x4_t v9 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v8, a1), 0), (int8x16_t)vnegq_f32(a3), (int8x16_t)a3);
    float32x4_t v10 = vmulq_f32(v7, (float32x4_t)xmmword_220A94580);
    int32x4_t v11 = (int32x4_t)vnegq_f32(v10);
    int8x16_t v12 = (int8x16_t)vtrn2q_s32((int32x4_t)v10, vtrn1q_s32((int32x4_t)v10, v11));
    float32x4_t v13 = (float32x4_t)vrev64q_s32((int32x4_t)v10);
    v13.i32[0] = v11.i32[1];
    v13.i32[3] = v11.i32[2];
    float v14 = acosf(COERCE_FLOAT(vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8(*(int8x16_t *)&v10, *(int8x16_t *)&v11, 8uLL), *(float32x2_t *)&v9, 1), (float32x4_t)vextq_s8(v12, v12, 8uLL), *(float *)&v9), vmlaq_laneq_f32(vmulq_laneq_f32(v10, v9, 3), v13, v9, 2)).i32[3]));
    __sincosf_stret((float)((float)(v14 + v14) * a5) * 0.5);
  }
}

double dqGetTranslation(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vaddq_f32(a2, a2);
  float32x4_t v3 = vmulq_f32(a1, (float32x4_t)xmmword_220A94580);
  int32x4_t v4 = (int32x4_t)vnegq_f32(v3);
  int8x16_t v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
  float32x4_t v6 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), *(float32x2_t *)v2.f32, 1), (float32x4_t)vextq_s8(v5, v5, 8uLL), v2.f32[0]);
  float32x4_t v7 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
  v7.i32[0] = v4.i32[1];
  v7.i32[3] = v4.i32[2];
  *(void *)&double result = vaddq_f32(v6, vmlaq_laneq_f32(vmulq_laneq_f32(v3, v2, 3), v7, v2, 2)).u64[0];
  return result;
}

__n64 dqGetMatrix(float32x4_t a1)
{
  int8x16_t v2 = (int8x16_t)vmulq_f32(a1, a1);
  float v3 = vaddv_f32(vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)));
  if (v3 <= 0.000001) {
    dqGetMatrix_cold_1();
  }
  _Q4 = vmulq_n_f32(a1, 1.0 / v3);
  _S6 = _Q4.i32[3];
  _S5 = _Q4.f32[1];
  _S16 = _Q4.i32[2];
  __asm
  {
    FMLA            S17, S6, V4.S[3]
    FMLS            S17, S5, V4.S[1]
    FMLS            S17, S16, V4.S[2]
  }
  result.n64_u32[0] = _S17;
  _S17 = _Q4.f32[0] + _Q4.f32[0];
  __asm { FMLA            S19, S17, V4.S[1] }
  result.n64_u32[1] = _S19;
  __asm
  {
    FMLA            S19, S17, V4.S[2]
    FMLA            S19, S17, V4.S[1]
    FMLA            S19, S6, V4.S[3]
    FMLS            S19, S4, V4.S[0]
    FMLS            S19, S16, V4.S[2]
  }
  _S19 = _S5 + _S5;
  __asm
  {
    FMLA            S20, S19, V4.S[2]
    FMLA            S7, S17, V4.S[2]
    FMLA            S7, S19, V4.S[2]
    FMLA            S7, S6, V4.S[3]
    FMLS            S7, S4, V4.S[0]
    FMLS            S7, S5, V4.S[1]
  }
  return result;
}

void sub_220A5070C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A50814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSString *hapticParamCurveSegmentToString(unsigned int *a1)
{
  return +[NSString stringWithFormat:@"HapticParamCurveSegment = {\n\tchannel = %d,\n\tparameter = %d\n\tstartTime = %f\n\tendTime = %f\n\tstartCFNumberRef Value = %f\n\tendCFNumberRef Value = %f\n}", *a1, a1[1], *((void *)a1 + 1), *((void *)a1 + 2), *((void *)a1 + 3), *((void *)a1 + 4)];
}

void sub_220A525E4(_Unwind_Exception *a1)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64(v1 + i);
  _Unwind_Resume(a1);
}

id AllControllerProfiles()
{
  if (AllControllerProfiles_onceToken != -1) {
    dispatch_once(&AllControllerProfiles_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = (void *)AllControllerProfiles_ControllerProfiles;

  return v0;
}

void __AllControllerProfiles_block_invoke()
{
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  _DWORD v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  uint64_t v0 = +[NSArray arrayWithObjects:v2 count:8];
  uint64_t v1 = (void *)AllControllerProfiles_ControllerProfiles;
  AllControllerProfiles_ControllerProfiles = v0;
}

id hexStringFromByteArray(uint64_t a1, int a2)
{
  int32x4_t v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        float32x4_t v6 = &stru_26D27BBB8;
      }
      else {
        float32x4_t v6 = @":";
      }
      float32x4_t v7 = +[NSString stringWithFormat:@"%02x%@", *(unsigned __int8 *)(a1 + (v5 - 2)), v6];
      [v4 appendString:v7];

      --v5;
    }
    while (v5 > 1);
  }
  float32x4_t v8 = +[NSString stringWithString:v4];
  float32x4_t v9 = [v8 uppercaseString];

  return v9;
}

uint64_t isPartnerSupportEnabled()
{
  if (isPartnerSupportEnabled_onceToken != -1) {
    dispatch_once(&isPartnerSupportEnabled_onceToken, &__block_literal_global_41);
  }
  return isPartnerSupportEnabled__partnerSupportEnabled;
}

void __isPartnerSupportEnabled_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
  isPartnerSupportEnabled__partnerSupportEnabled = [v0 BOOLForKey:@"GCPartnersEnable"];
  uint64_t v1 = getGCHIDLogger();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = isPartnerSupportEnabled__partnerSupportEnabled;
    _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v2, 8u);
  }
}

uint64_t SharableMemoryBase::AllocNonShared(SharableMemoryBase *this, size_t size)
{
  *((unsigned char *)this + _Block_object_dispose(&a9, 8) = 1;
  int32x4_t v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    float32x4_t v7 = std::bad_alloc::bad_alloc(exception);
  }
  *((void *)this + 2) = size;
  *((void *)this + 3) = v4;
  if (v4) {
    return 0;
  }
  else {
    return 4294967188;
  }
}

uint64_t SharableMemoryBase::Set(uint64_t this, void *a2, uint64_t a3)
{
  *(unsigned char *)(this + _Block_object_dispose(&a9, 8) = 0;
  *(void *)(this + 16) = a3;
  *(void *)(this + 24) = a2;
  return this;
}

uint64_t SharableMemoryBlock::InitServer(uint64_t a1, size_t a2, _DWORD *a3)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v6 = a3[2];
  if (v6 == 2)
  {
    unsigned int v10 = atomic_fetch_add_explicit(SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum, 1u, memory_order_relaxed)+ 1;
    *(_DWORD *)(a1 + 40) = v10;
    pid_t v11 = getpid();
    snprintf((char *)address, 0x40uLL, "AppleABL.%x.%x", v11, v10);
    int v12 = shm_open((const char *)address, 514, 511);
    *(_DWORD *)(a1 + 36) = v12;
    if (v12 != -1)
    {
      ftruncate(v12, a2);
      *(void *)(a1 + 16) = a2;
      float32x4_t v13 = mmap(0, a2, 3, 1, *(_DWORD *)(a1 + 36), 0);
      *(void *)(a1 + 24) = v13;
      if ((unint64_t)v13 + 1 <= 1)
      {
        uint64_t v8 = *__error();
        close(*(_DWORD *)(a1 + 36));
        *(_DWORD *)(a1 + 36) = -1;
        shm_unlink((const char *)address);
        return v8;
      }
      uint64_t v8 = 0;
      *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 257;
      a3[3] = *(void *)(a1 + 16);
      int v15 = *(_DWORD *)(a1 + 36);
LABEL_18:
      a3[4] = v15;
      return v8;
    }
    return *__error();
  }
  if (v6 == 1)
  {
    *(void *)(a1 + 16) = a2;
    float v14 = mmap(0, a2, 3, 4097, -1, 0);
    *(void *)(a1 + 24) = v14;
    if ((unint64_t)v14 + 1 > 1)
    {
      *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 257;
      xpc_object_t v17 = xpc_shmem_create(v14, *(void *)(a1 + 16));
      uint64_t v8 = 0;
      *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = v17;
      a3[3] = *(void *)(a1 + 16);
      *((void *)a3 + 2) = v17;
      return v8;
    }
    return *__error();
  }
  if (v6) {
    return 0;
  }
  address[0] = 0;
  vm_size_t v7 = (a2 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  if (!v7)
  {
    int v15 = 0;
    vm_address_t v16 = 0;
    *(_DWORD *)(a1 + 32) = 0;
LABEL_15:
    uint64_t v8 = 0;
    *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 257;
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v16;
    a3[3] = v7;
    goto LABEL_18;
  }
  uint64_t v8 = vm_allocate(mach_task_self_, address, (a2 + vm_page_size - 1) & -(uint64_t)vm_page_size, 1);
  if (!v8)
  {
    memory_object_size_t size = v7;
    uint64_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, address[0], 3, (mach_port_t *)(a1 + 32), 0);
    if (memory_entry_64)
    {
      uint64_t v8 = memory_entry_64;
      MEMORY[0x223C6E880](mach_task_self_, address[0], v7);
      return v8;
    }
    ++debugSerial;
    vm_address_t v16 = address[0];
    *(_DWORD *)address[0] = debugSerial;
    int v15 = *(_DWORD *)(a1 + 32);
    goto LABEL_15;
  }
  return v8;
}

uint64_t SharableMemoryBlock::InitClient(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = *(_DWORD *)(a2 + 8);
  if (v4 == 2)
  {
    int v8 = *(_DWORD *)(a2 + 20);
    *(_DWORD *)(a1 + 36) = v8;
    *(_DWORD *)(a2 + 20) = -1;
    size_t v9 = *(unsigned int *)(a2 + 12);
    *(void *)(a1 + 16) = v9;
    unsigned int v10 = mmap(0, v9, 3, 1, v8, 0);
    *(void *)(a1 + 24) = v10;
    if ((unint64_t)v10 + 1 < 2)
    {
      uint64_t v7 = *__error();
      close(*(_DWORD *)(a1 + 36));
      *(_DWORD *)(a1 + 36) = -1;
      return v7;
    }
LABEL_9:
    uint64_t v7 = 0;
    *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 256;
    return v7;
  }
  if (v4 == 1)
  {
    pid_t v11 = *(void **)(a2 + 24);
    *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = v11;
    *(void *)(a2 + 24) = 0;
    size_t v12 = xpc_shmem_map(v11, (void **)(a1 + 24));
    *(void *)(a1 + 16) = v12;
    if (!v12)
    {
      xpc_release(*(xpc_object_t *)(a1 + 48));
      *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = 0;
      return 0xFFFFFFFFLL;
    }
    goto LABEL_9;
  }
  if (v4) {
    return 0;
  }
  vm_address_t address = 0;
  vm_size_t v5 = (vm_page_size + *(unsigned int *)(a2 + 12) - 1) & -(uint64_t)vm_page_size;
  mem_entry_name_port_t v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 32) = v6;
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v7 = vm_map(mach_task_self_, &address, v5, 0xFuLL, 1, v6, 0, 0, 3, 3, 1u);
  if (v7)
  {
    mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 32));
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 256;
    vm_address_t v13 = address;
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v13;
  }
  return v7;
}

void SharableMemoryBlock::Free(SharableMemoryBlock *this)
{
  int8x16_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    if (*((unsigned char *)this + 9))
    {
      if (*((_DWORD *)this + 8))
      {
        MEMORY[0x223C6E880](mach_task_self_);
        mach_port_name_t v3 = *((_DWORD *)this + 8);
        if (v3) {
          mach_port_deallocate(mach_task_self_, v3);
        }
        *((unsigned char *)this + 9) = 0;
        *((_DWORD *)this + _Block_object_dispose(&a9, 8) = 0;
      }
      else
      {
        int v4 = (void *)*((void *)this + 6);
        if (v4)
        {
          xpc_release(v4);
          *((void *)this + 6) = 0;
          munmap(*((void **)this + 3), *((void *)this + 2));
        }
        else if (*((_DWORD *)this + 9) != -1)
        {
          munmap(v2, *((void *)this + 2));
          close(*((_DWORD *)this + 9));
          if (*((unsigned char *)this + 8))
          {
            int v5 = *((_DWORD *)this + 10);
            pid_t v6 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v6, v5);
            shm_unlink(__str);
          }
          *((_DWORD *)this + 9) = -1;
        }
      }
    }
    else if (*((unsigned char *)this + 8))
    {
      free(*((void **)this + 3));
    }
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::MachClientToken::Reset(uint64_t this)
{
  uint64_t v1 = this;
  mach_port_name_t v2 = *(_DWORD *)(this + 20);
  if (v2)
  {
    this = mach_port_deallocate(mach_task_self_, v2);
    *(_DWORD *)(v1 + 20) = 0;
  }
  *(_DWORD *)(v1 + 12) = 0;
  return this;
}

void SharableMemoryBlock::XPCClientToken::Reset(SharableMemoryBlock::XPCClientToken *this)
{
  mach_port_name_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    xpc_release(v2);
    *((void *)this + 3) = 0;
  }
  *((_DWORD *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::FDClientToken::Reset(SharableMemoryBlock::FDClientToken *this)
{
  uint64_t result = *((unsigned int *)this + 5);
  if (result != -1)
  {
    uint64_t result = close(result);
    *((_DWORD *)this + 5) = -1;
  }
  *((_DWORD *)this + 3) = 0;
  return result;
}

void SharableMemoryBlock::XPCServerToken::~XPCServerToken(SharableMemoryBlock::XPCServerToken *this)
{
}

void SharableMemoryBlock::XPCClientToken::~XPCClientToken(SharableMemoryBlock::XPCClientToken *this)
{
  *(void *)this = &unk_26D285908;
  if (*((unsigned char *)this + 16))
  {
    mach_port_name_t v2 = (void *)*((void *)this + 3);
    if (v2)
    {
      xpc_release(v2);
      *((void *)this + 3) = 0;
    }
    *((_DWORD *)this + 3) = 0;
  }
}

{
  uint64_t vars8;

  SharableMemoryBlock::XPCClientToken::~XPCClientToken(this);

  JUMPOUT(0x223C6DBB0);
}

BOOL SharableMemoryBlock::XPCClientToken::IsValid(SharableMemoryBlock::XPCClientToken *this)
{
  return *((void *)this + 3) != 0;
}

void SharableMemoryBlock::~SharableMemoryBlock(SharableMemoryBlock *this)
{
  SharableMemoryBlock::~SharableMemoryBlock(this);

  JUMPOUT(0x223C6DBB0);
}

{
  *(void *)this = &unk_26D2859C0;
  SharableMemoryBlock::Free(this);
}

void sub_220A562C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A565C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_220A56660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_220A566A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A56898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)_GCHapticClientProxy;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_220A569BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A56AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A56C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A56E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A56F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A570C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A571B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5730C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5784C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_220A5797C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A57D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_220A58594()
{
}

void sub_220A5888C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A58ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A59078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A59150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A592E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A593F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A59844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A599C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A59BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A59EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NSErrorFromOSStatus(int a1)
{
  if (a1)
  {
    mach_port_name_t v2 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:a1 userInfo:0];
  }
  else
  {
    mach_port_name_t v2 = 0;
  }
  return v2;
}

void sub_220A5A088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5A8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5AA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5AB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5AC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5ADC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5AF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5B14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5B308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_220A5B414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HapticSharedMemory::~HapticSharedMemory(HapticSharedMemory *this)
{
  SharableMemoryBlock::~SharableMemoryBlock((SharableMemoryBlock *)this);

  JUMPOUT(0x223C6DBB0);
}

void sub_220A5BA08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __refcountZeroed_block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

id GC_IOHIDServiceClientGetStringProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  mach_port_name_t v2 = (void *)IOHIDServiceClientCopyProperty(a1, a2);

  return v2;
}

id GC_IOHIDServiceClientGetNumberProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  mach_port_name_t v2 = (void *)IOHIDServiceClientCopyProperty(a1, a2);

  return v2;
}

id GC_IOHIDServiceClientGetDictionaryProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  mach_port_name_t v2 = (void *)IOHIDServiceClientCopyProperty(a1, a2);

  return v2;
}

void GC_IOHIDSetLEDs(const void *a1, uint64_t a2)
{
  if (a1)
  {
    CFRetain(a1);
    int v4 = dispatch_get_global_queue(0, 0);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __GC_IOHIDSetLEDs_block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async(v4, v5);
  }
}

double NormalizedLogicalAxisValueRaw(double a1, double a2, double a3)
{
  double result = round(((a1 - a2 + a1 - a2) / (a3 - a2) + -1.0) * 1024.0) * 0.0009765625;
  if (result < -1.0) {
    double result = -1.0;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

double NormalizedLogicalButtonValueRaw(double a1, double a2, double a3)
{
  double result = round((a1 - a2) / (a3 - a2) * 1024.0) * 0.0009765625;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

CFIndex NormalizedLogicalAxisValue(__IOHIDValue *a1)
{
  Element = IOHIDValueGetElement(a1);
  IOHIDValueGetIntegerValue(a1);
  IOHIDElementGetLogicalMin(Element);
  return IOHIDElementGetLogicalMax(Element);
}

CFIndex NormalizedLogicalButtonValue(__IOHIDValue *a1)
{
  Element = IOHIDValueGetElement(a1);
  IOHIDValueGetIntegerValue(a1);
  IOHIDElementGetLogicalMin(Element);
  return IOHIDElementGetLogicalMax(Element);
}

double NormalizedPhysicalButtonValue(__IOHIDValue *a1)
{
  return round(IOHIDValueGetScaledValue(a1, 1u) * 256.0) * 0.00390625;
}

void sub_220A5C290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_220A5EBD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A5EDD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_220A5EFE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _DescendantPointerEvent_0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 && IOHIDEventGetType() != 17)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (CFArrayRef v3 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        uint64_t v8 = _DescendantPointerEvent_0(ValueAtIndex);
        if (v8) {
          break;
        }
        if (v5 == ++v6) {
          return 0;
        }
      }
      return v8;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

id defaultMapping(int a1)
{
  v99[0] = &unk_26D287918;
  v97[0] = @"Buttons";
  unsigned int v84 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[0] = v84;
  v96[0] = &unk_26D287698;
  double v83 = +[NSNumber numberWithLong:9];
  v95[1] = v83;
  v96[1] = &unk_26D2876B0;
  double v82 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[2] = v82;
  v96[2] = &unk_26D2876C8;
  double v81 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[3] = v81;
  v96[3] = &unk_26D2876E0;
  double v80 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[4] = v80;
  v96[4] = &unk_26D2876F8;
  double v79 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[5] = v79;
  v96[5] = &unk_26D287710;
  double v78 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[6] = v78;
  v96[6] = &unk_26D287728;
  double v77 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[7] = v77;
  v96[7] = &unk_26D287740;
  double v76 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[8] = v76;
  v96[8] = &unk_26D287758;
  double v75 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[9] = v75;
  v96[9] = &unk_26D287770;
  double v74 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[10] = v74;
  v96[10] = &unk_26D287788;
  double v73 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[11] = v73;
  v96[11] = &unk_26D2877A0;
  double v72 = +[NSNumber numberWithLong:225];
  v95[12] = v72;
  v96[12] = &unk_26D287830;
  double v71 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[13] = v71;
  v96[13] = &unk_26D2877B8;
  double v70 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[14] = v70;
  v96[14] = &unk_26D2877D0;
  double v69 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[15] = v69;
  v96[15] = &unk_26D2877E8;
  double v68 = +[NSNumber numberWithLong:11];
  v95[16] = v68;
  v96[16] = &unk_26D2876B0;
  double v67 = +[NSNumber numberWithLong:18];
  v95[17] = v67;
  v96[17] = &unk_26D2876E0;
  double v66 = +[NSNumber numberWithLong:24];
  v95[18] = v66;
  v96[18] = &unk_26D2876C8;
  double v65 = +[NSNumber numberWithLong:12];
  v95[19] = v65;
  v96[19] = &unk_26D2876F8;
  double v64 = +[NSNumber numberWithLong:13];
  v95[20] = v64;
  v96[20] = &unk_26D287710;
  double v62 = +[NSNumber numberWithLong:14];
  v95[21] = v62;
  v96[21] = &unk_26D287728;
  double v61 = +[NSNumber numberWithLong:15];
  v95[22] = v61;
  v96[22] = &unk_26D287740;
  double v60 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[23] = v60;
  v96[23] = &unk_26D2877B8;
  double v59 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[24] = v59;
  v96[24] = &unk_26D2877D0;
  double v58 = +[NSNumber numberWithLong:45];
  v95[25] = v58;
  v96[25] = &unk_26D2877E8;
  double v57 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:");
  v95[26] = v57;
  v96[26] = &unk_26D287830;
  double v56 = +[NSNumber numberWithLong:45];
  v95[27] = v56;
  v96[27] = &unk_26D2877E8;
  double v55 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:28];
  v98[0] = v55;
  v98[1] = &unk_26D287940;
  v97[1] = @"Config";
  v97[2] = @"LeftThumbstickSensitivity";
  v98[2] = &unk_26D287B18;
  double v54 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];
  v99[1] = v54;
  v93[0] = @"Buttons";
  double v53 = +[NSNumber numberWithLong:44];
  v91[0] = v53;
  v92[0] = &unk_26D287698;
  double v52 = +[NSNumber numberWithLong:11];
  v91[1] = v52;
  v92[1] = &unk_26D2876B0;
  double v51 = +[NSNumber numberWithLong:18];
  v91[2] = v51;
  v92[2] = &unk_26D2876C8;
  double v49 = +[NSNumber numberWithLong:24];
  v91[3] = v49;
  v92[3] = &unk_26D2876E0;
  int v47 = +[NSNumber numberWithLong:12];
  v91[4] = v47;
  v92[4] = &unk_26D2876F8;
  uint64_t v46 = +[NSNumber numberWithLong:13];
  v91[5] = v46;
  v92[5] = &unk_26D287710;
  int v45 = +[NSNumber numberWithLong:14];
  v91[6] = v45;
  v92[6] = &unk_26D287728;
  uint64_t v44 = +[NSNumber numberWithLong:15];
  v91[7] = v44;
  v92[7] = &unk_26D287740;
  int v43 = +[NSNumber numberWithLong:82];
  v91[8] = v43;
  v92[8] = &unk_26D287758;
  uint64_t v38 = +[NSNumber numberWithLong:80];
  v91[9] = v38;
  v92[9] = &unk_26D287770;
  float v37 = +[NSNumber numberWithLong:81];
  v91[10] = v37;
  v92[10] = &unk_26D287788;
  unsigned int v36 = +[NSNumber numberWithLong:79];
  v91[11] = v36;
  v92[11] = &unk_26D2877A0;
  double v35 = +[NSNumber numberWithLong:230];
  v91[12] = v35;
  v92[12] = &unk_26D2877B8;
  double v33 = +[NSNumber numberWithLong:229];
  v91[13] = v33;
  v92[13] = &unk_26D2877D0;
  double v31 = +[NSNumber numberWithLong:28];
  v91[14] = v31;
  v92[14] = &unk_26D2877B8;
  float v30 = +[NSNumber numberWithLong:19];
  v91[15] = v30;
  v92[15] = &unk_26D2877D0;
  double v29 = +[NSNumber numberWithLong:56];
  v91[16] = v29;
  v92[16] = &unk_26D2877E8;
  float v28 = +[NSNumber numberWithLong:45];
  v91[17] = v28;
  v92[17] = &unk_26D2877E8;
  float v27 = +[NSNumber numberWithLong:38];
  v91[18] = v27;
  v92[18] = &unk_26D287818;
  float v26 = +[NSNumber numberWithLong:39];
  v91[19] = v26;
  v92[19] = &unk_26D287800;
  float v25 = +[NSNumber numberWithLong:62];
  v91[20] = v25;
  v92[20] = &unk_26D287848;
  float v24 = +[NSNumber numberWithLong:17];
  v91[21] = v24;
  v92[21] = &unk_26D287830;
  float v23 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:22];
  v94[0] = v23;
  v94[1] = &unk_26D287968;
  v93[1] = @"Config";
  v93[2] = @"LeftThumbstickSensitivity";
  v94[2] = &unk_26D287B60;
  float v22 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
  v99[2] = v22;
  v89[0] = @"Buttons";
  double v86 = +[NSNumber numberWithLong:44];
  v87[0] = v86;
  v88[0] = &unk_26D287698;
  float v21 = +[NSNumber numberWithLong:25];
  v87[1] = v21;
  v88[1] = &unk_26D2876C8;
  float v20 = +[NSNumber numberWithLong:5];
  v87[2] = v20;
  v88[2] = &unk_26D2876E0;
  uint64_t v16 = +[NSNumber numberWithLong:17];
  v87[3] = v16;
  v88[3] = &unk_26D2876B0;
  int v15 = +[NSNumber numberWithLong:82];
  v87[4] = v15;
  v88[4] = &unk_26D287758;
  float v14 = +[NSNumber numberWithLong:80];
  v87[5] = v14;
  v88[5] = &unk_26D287770;
  vm_address_t v13 = +[NSNumber numberWithLong:81];
  v87[6] = v13;
  v88[6] = &unk_26D287788;
  size_t v12 = +[NSNumber numberWithLong:79];
  v87[7] = v12;
  v88[7] = &unk_26D2877A0;
  uint64_t v42 = +[NSNumber numberWithLong:26];
  v87[8] = v42;
  v88[8] = &unk_26D2876F8;
  v41 = +[NSNumber numberWithLong:4];
  v87[9] = v41;
  v88[9] = &unk_26D287710;
  uint64_t v40 = +[NSNumber numberWithLong:22];
  v87[10] = v40;
  v88[10] = &unk_26D287728;
  __int16 v39 = +[NSNumber numberWithLong:7];
  v87[11] = v39;
  v88[11] = &unk_26D287740;
  double v32 = +[NSNumber numberWithLong:43];
  v87[12] = v32;
  v88[12] = &unk_26D287830;
  double v50 = +[NSNumber numberWithLong:20];
  v87[13] = v50;
  v88[13] = &unk_26D2877B8;
  double v48 = +[NSNumber numberWithLong:8];
  v87[14] = v48;
  v88[14] = &unk_26D2877D0;
  double v34 = +[NSNumber numberWithLong:21];
  v87[15] = v34;
  v88[15] = &unk_26D287860;
  float v19 = +[NSNumber numberWithLong:12];
  v87[16] = v19;
  v88[16] = &unk_26D2876F8;
  float v18 = +[NSNumber numberWithLong:13];
  v87[17] = v18;
  v88[17] = &unk_26D287710;
  xpc_object_t v17 = +[NSNumber numberWithLong:14];
  v87[18] = v17;
  v88[18] = &unk_26D287728;
  uint64_t v1 = +[NSNumber numberWithLong:15];
  v87[19] = v1;
  v88[19] = &unk_26D287740;
  mach_port_name_t v2 = +[NSNumber numberWithLong:28];
  v87[20] = v2;
  v88[20] = &unk_26D287830;
  CFArrayRef v3 = +[NSNumber numberWithLong:24];
  v87[21] = v3;
  v88[21] = &unk_26D2877B8;
  int v4 = +[NSNumber numberWithLong:18];
  v87[22] = v4;
  v88[22] = &unk_26D2877D0;
  CFIndex v5 = +[NSNumber numberWithLong:19];
  v87[23] = v5;
  v88[23] = &unk_26D287860;
  CFIndex v6 = +[NSNumber numberWithLong:53];
  v87[24] = v6;
  v88[24] = &unk_26D2877E8;
  uint64_t v7 = +[NSNumber numberWithLong:45];
  v87[25] = v7;
  v88[25] = &unk_26D2877E8;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:26];
  v90[0] = v8;
  v90[1] = &unk_26D287990;
  v89[1] = @"Config";
  v89[2] = @"LeftThumbstickSensitivity";
  v90[2] = &unk_26D287BA8;
  size_t v9 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
  v99[3] = v9;
  unsigned int v10 = +[NSArray arrayWithObjects:v99 count:4];
  id v85 = [v10 objectAtIndexedSubscript:a1];

  return v85;
}

NSObject *createDispatchTimer(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

id GetProperty(void *a1)
{
  uint64_t v1 = GetProperties_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&GetProperties_onceToken, &__block_literal_global_42);
  }
  CFArrayRef v3 = [(id)GetProperties_properties objectForKey:v2];

  return v3;
}

void sub_220A62AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)(&a11 + i));
  _Unwind_Resume(a1);
}

void __GetProperties_block_invoke()
{
  xpc_object_t v17 = +[NSBundle mainBundle];
  uint64_t v0 = [v17 pathForResource:@"EmulatedController" ofType:@"plist"];
  uint64_t v1 = [@"~/Downloads/" stringByAppendingPathComponent:@"EmulatedController.plist"];
  id v2 = [v1 stringByStandardizingPath];

  CFArrayRef v3 = [@"/tmp/" stringByAppendingPathComponent:@"EmulatedController.plist"];
  int v4 = [v3 stringByStandardizingPath];

  CFIndex v5 = +[NSMutableArray array];
  CFIndex v6 = v5;
  if (v0) {
    [v5 addObject:v0];
  }
  if (v2) {
    [v6 addObject:v2];
  }
  if (v4) {
    [v6 addObject:v4];
  }
  id v7 = (void *)[v6 copy];
  uint64_t v8 = +[NSFileManager defaultManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v14 && [v8 fileExistsAtPath:*(void *)(*((void *)&v18 + 1) + 8 * i)])
        {
          uint64_t v15 = +[NSDictionary dictionaryWithContentsOfFile:v14];
          uint64_t v16 = (void *)GetProperties_properties;
          GetProperties_properties = v15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

NSXPCInterface *GCAppClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29AAF8];
}

id GCAppServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29EEC8];
  uint64_t v1 = GCControllerServiceRemoteClientInterface();
  [v0 setInterface:v1 forSelector:sel_connectToControllerServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  id v2 = GCControllerServiceRemoteServerInterface();
  [v0 setInterface:v2 forSelector:sel_connectToControllerServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  CFArrayRef v3 = GCPlayerIndicatorXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v3 forSelector:sel_connectToPlayerIndicatorXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  int v4 = GCPlayerIndicatorXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v4 forSelector:sel_connectToPlayerIndicatorXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  CFIndex v5 = GCLightXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v5 forSelector:sel_connectToLightXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  CFIndex v6 = GCLightXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v6 forSelector:sel_connectToLightXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  id v7 = GCAdaptiveTriggersXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v7 forSelector:sel_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v8 = GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v8 forSelector:sel_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  id v9 = GCMotionXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v9 forSelector:sel_connectToMotionXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v10 = GCMotionXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v10 forSelector:sel_connectToMotionXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v11 = GCBatteryXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v11 forSelector:sel_connectToBatteryXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v12 = GCBatteryXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v12 forSelector:sel_connectToBatteryXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  vm_address_t v13 = GCSettingsXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v13 forSelector:sel_connectToSettingsXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v14 = GCSettingsXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v14 forSelector:sel_connectToSettingsXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  uint64_t v15 = GCPhotoVideoXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v15 forSelector:sel_connectToPhotoVideoXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  uint64_t v16 = GCPhotoVideoXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v16 forSelector:sel_connectToPhotoVideoXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  xpc_object_t v17 = GCGameIntentXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v17 forSelector:sel_connectToGameIntentXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  long long v18 = GCGameIntentXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v18 forSelector:sel_connectToGameIntentXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  long long v19 = GCSystemGestureXPCProxyServiceRemoteClientInterface();
  [v0 setInterface:v19 forSelector:sel_connectToSystemGestureXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:0];

  long long v20 = GCSystemGestureXPCProxyServiceRemoteServerInterface();
  [v0 setInterface:v20 forSelector:sel_connectToSystemGestureXPCProxyServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_220A664CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_22(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_220A692A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_220A694F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A69CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_27(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _GCMotionEventSourceDescription_Classes()
{
  if (_GCMotionEventSourceDescription_Classes_onceToken != -1) {
    dispatch_once(&_GCMotionEventSourceDescription_Classes_onceToken, &__block_literal_global_47);
  }
  uint64_t v0 = (void *)_GCMotionEventSourceDescription_Classes_Classes;

  return v0;
}

void sub_220A6C498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A6CCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2A9FC8];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id GCPlayerIndicatorXPCProxyRemoteServerEndpointInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2AA0B0];
  uint64_t v1 = GCIPCObjectIdentifier_Classes();
  [v0 setClasses:v1 forSelector:sel_fetchObjectIdentifierWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *GCPlayerIndicatorXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D29A240];
}

id GCPlayerIndicatorXPCProxyServiceRemoteServerInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26D29E7B0];
  uint64_t v1 = GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface();
  [v0 setInterface:v1 forSelector:sel_playerIndicatorXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:0];

  id v2 = GCPlayerIndicatorXPCProxyRemoteServerEndpointInterface();
  [v0 setInterface:v2 forSelector:sel_playerIndicatorXPCProxyServiceClientEndpointConnect_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void OUTLINED_FUNCTION_0_28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_220A6DA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220A6E178(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_220A6E444(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

__CFString *stringFromState(int a1)
{
  uint64_t v1 = @"nil";
  if (a1 == 2) {
    uint64_t v1 = @"digital";
  }
  if (a1 == 1) {
    return @"analog";
  }
  else {
    return v1;
  }
}

NSNumber *numberFromInt(int a1)
{
  return +[NSNumber numberWithInteger:a1];
}

id convertToDict(unsigned int *a1, void (*a2)(void))
{
  v21[0] = @"buttonA";
  long long v20 = a2(*a1);
  v22[0] = v20;
  v21[1] = @"buttonB";
  long long v19 = a2(a1[1]);
  v22[1] = v19;
  v21[2] = @"buttonX";
  long long v18 = a2(a1[2]);
  v22[2] = v18;
  v21[3] = @"buttonY";
  xpc_object_t v17 = a2(a1[3]);
  v22[3] = v17;
  void v21[4] = @"buttonMenu";
  uint64_t v16 = a2(a1[4]);
  v22[4] = v16;
  v21[5] = @"buttonOptions";
  uint64_t v15 = a2(a1[5]);
  v22[5] = v15;
  v21[6] = @"leftShoulder";
  uint64_t v4 = a2(a1[6]);
  v22[6] = v4;
  v21[7] = @"rightShoulder";
  CFIndex v5 = a2(a1[7]);
  v22[7] = v5;
  v21[8] = @"leftTrigger";
  CFIndex v6 = a2(a1[8]);
  v22[8] = v6;
  v21[9] = @"rightTrigger";
  id v7 = a2(a1[9]);
  v22[9] = v7;
  v21[10] = @"dpad";
  uint64_t v8 = a2(a1[10]);
  v22[10] = v8;
  v21[11] = @"leftThumbstick";
  uint64_t v9 = a2(a1[11]);
  v22[11] = v9;
  v21[12] = @"rightThumbstick";
  uint64_t v10 = a2(a1[12]);
  v22[12] = v10;
  v21[13] = @"leftThumbstickButton";
  uint64_t v11 = a2(a1[13]);
  v22[13] = v11;
  v21[14] = @"rightThumbstickButton";
  uint64_t v12 = a2(a1[14]);
  v22[14] = v12;
  vm_address_t v13 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:15];

  return v13;
}

void *getElementTimePressed(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 getAndResetTimesPressed];
  }
  return a1;
}

uint64_t getElementCapability(uint64_t result)
{
  if (result)
  {
    if ([(id)result isAnalog]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

void mapToAnalytics(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 44) = 0u;
  id v59 = v5;
  CFIndex v6 = [v5 extendedGamepad];

  if (v6)
  {
    id v7 = [v59 extendedGamepad];
    uint64_t v8 = [v7 buttonA];
    *(_DWORD *)a3 = a2();

    uint64_t v9 = [v59 extendedGamepad];
    uint64_t v10 = [v9 buttonB];
    *(_DWORD *)(a3 + 4) = a2();

    uint64_t v11 = [v59 extendedGamepad];
    uint64_t v12 = [v11 buttonX];
    *(_DWORD *)(a3 + _Block_object_dispose(&a9, 8) = a2();

    vm_address_t v13 = [v59 extendedGamepad];
    uint64_t v14 = [v13 buttonY];
    *(_DWORD *)(a3 + 12) = a2();

    uint64_t v15 = [v59 extendedGamepad];
    uint64_t v16 = [v15 buttonMenu];
    *(_DWORD *)(a3 + 16) = a2();

    xpc_object_t v17 = [v59 extendedGamepad];
    long long v18 = [v17 buttonOptions];
    *(_DWORD *)(a3 + 20) = a2();

    long long v19 = [v59 extendedGamepad];
    long long v20 = [v19 leftShoulder];
    *(_DWORD *)(a3 + 24) = a2();

    long long v21 = [v59 extendedGamepad];
    float v22 = [v21 rightShoulder];
    *(_DWORD *)(a3 + 2_Block_object_dispose(&a9, 8) = a2();

    float v23 = [v59 extendedGamepad];
    float v24 = [v23 leftTrigger];
    *(_DWORD *)(a3 + 32) = a2();

    float v25 = [v59 extendedGamepad];
    float v26 = [v25 rightTrigger];
    *(_DWORD *)(a3 + 36) = a2();

    float v27 = [v59 extendedGamepad];
    float v28 = [v27 dpad];
    *(_DWORD *)(a3 + 40) = a2();

    double v29 = [v59 extendedGamepad];
    float v30 = [v29 leftThumbstick];
    *(_DWORD *)(a3 + 44) = a2();

    double v31 = [v59 extendedGamepad];
    double v32 = [v31 rightThumbstick];
    *(_DWORD *)(a3 + 4_Block_object_dispose(&a9, 8) = a2();

    double v33 = [v59 extendedGamepad];
    double v34 = [v33 leftThumbstickButton];
    *(_DWORD *)(a3 + 52) = a2();

    double v35 = [v59 extendedGamepad];
    unsigned int v36 = [v35 rightThumbstickButton];
    *(_DWORD *)(a3 + 56) = a2();
  }
  else
  {
    float v37 = [v59 gamepad];

    if (v37)
    {
      uint64_t v38 = [v59 gamepad];
      __int16 v39 = [v38 buttonA];
      *(_DWORD *)a3 = a2();

      uint64_t v40 = [v59 gamepad];
      v41 = [v40 buttonB];
      *(_DWORD *)(a3 + 4) = a2();

      uint64_t v42 = [v59 gamepad];
      int v43 = [v42 buttonX];
      *(_DWORD *)(a3 + _Block_object_dispose(&a9, 8) = a2();

      uint64_t v44 = [v59 gamepad];
      int v45 = [v44 buttonY];
      *(_DWORD *)(a3 + 12) = a2();

      uint64_t v46 = [v59 gamepad];
      int v47 = [v46 leftShoulder];
      *(_DWORD *)(a3 + 24) = a2();

      double v48 = [v59 gamepad];
      double v49 = [v48 rightShoulder];
      *(_DWORD *)(a3 + 2_Block_object_dispose(&a9, 8) = a2();

      double v50 = [v59 gamepad];
    }
    else
    {
      double v51 = [v59 microGamepad];

      double v52 = v59;
      if (!v51) {
        goto LABEL_9;
      }
      double v53 = [v59 microGamepad];
      double v54 = [v53 buttonA];
      *(_DWORD *)a3 = a2();

      double v55 = [v59 microGamepad];
      double v56 = [v55 buttonX];
      *(_DWORD *)(a3 + _Block_object_dispose(&a9, 8) = a2();

      double v57 = [v59 microGamepad];
      double v58 = [v57 buttonMenu];
      *(_DWORD *)(a3 + 16) = a2();

      double v50 = [v59 microGamepad];
    }
    double v35 = v50;
    unsigned int v36 = [v50 dpad];
    *(_DWORD *)(a3 + 40) = a2();
  }

  double v52 = v59;
LABEL_9:
}

void dataFromController(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 4_Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(void *)(a2 + 80) = 0;
  id v21 = v3;
  uint64_t v4 = [v3 detailedProductCategory];
  id v5 = (void *)v4;
  if (v4) {
    CFIndex v6 = (__CFString *)v4;
  }
  else {
    CFIndex v6 = &stru_26D27BBB8;
  }
  *(void *)a2 = v6;

  uint64_t v7 = [v21 vendorName];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_26D27BBB8;
  }
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v9;

  uint64_t v10 = [v21 physicalInputProfileName];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_26D27BBB8;
  }
  *(void *)(a2 + 16) = v12;

  *(unsigned char *)(a2 + 24) = [v21 isAttachedToDevice];
  int v13 = [v21 isATVRemote];
  *(unsigned char *)(a2 + 26) = v13;
  if (v13)
  {
    uint64_t v14 = [v21 hidServices];
    *(unsigned char *)(a2 + 27) = [v14 count] != 0;
  }
  else
  {
    *(unsigned char *)(a2 + 27) = 0;
  }
  uint64_t v15 = [v21 extendedGamepad];
  if (v15)
  {
    uint64_t v16 = [v21 extendedGamepad];
    xpc_object_t v17 = [v16 rightThumbstickButton];
    if (v17)
    {
      long long v18 = [v21 extendedGamepad];
      long long v19 = [v18 leftThumbstickButton];
      *(unsigned char *)(a2 + 25) = v19 != 0;
    }
    else
    {
      *(unsigned char *)(a2 + 25) = 0;
    }
  }
  else
  {
    *(unsigned char *)(a2 + 25) = 0;
  }

  mapToAnalytics(v21, (uint64_t (*)(void))getElementCapability, (uint64_t)v22);
  long long v20 = v22[1];
  *(_OWORD *)(a2 + 2_Block_object_dispose(&a9, 8) = v22[0];
  *(_OWORD *)(a2 + 44) = v20;
  *(_OWORD *)(a2 + 60) = *(_OWORD *)v23;
  *(_OWORD *)(a2 + 72) = *(_OWORD *)&v23[12];
}

void sub_220A6F588(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8_s16(v1);
  _Unwind_Resume(a1);
}

int32x2_t batchInputData(uint64_t a1, void *a2)
{
  int32x4_t v6 = 0u;
  memset(v7, 0, 28);
  int32x4_t v5 = 0u;
  mapToAnalytics(a2, (uint64_t (*)(void))getElementTimePressed, (uint64_t)&v5);
  int32x4_t v3 = vaddq_s32(*(int32x4_t *)(a1 + 16), v6);
  *(int32x4_t *)a1 = vaddq_s32(*(int32x4_t *)a1, v5);
  *(int32x4_t *)(a1 + 16) = v3;
  *(int32x4_t *)(a1 + 32) = vaddq_s32(*(int32x4_t *)(a1 + 32), v7[0]);
  int32x2_t result = vadd_s32(*(int32x2_t *)(a1 + 48), *(int32x2_t *)v7[1].i8);
  *(int32x2_t *)(a1 + 4_Block_object_dispose(&a9, 8) = result;
  *(_DWORD *)(a1 + 56) += v7[1].i32[2];
  return result;
}

void sub_220A6F6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSXPCInterface *GCBatteryServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D298B30];
}

NSXPCInterface *GCBatteryServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26D2B4958];
}

NSData *__cdecl NSDataFromGCGamepadSnapShotDataV100(GCGamepadSnapShotDataV100 *snapshotData)
{
  if (snapshotData)
  {
    id v2 = snapshotData;
    if (!snapshotData->version)
    {
      long long v3 = *(_OWORD *)&snapshotData->buttonB;
      long long v5 = *(_OWORD *)&snapshotData->version;
      long long v6 = v3;
      *(float *)&uint64_t v7 = snapshotData->rightShoulder;
      LODWORD(v5) = 2359552;
      id v2 = (GCGamepadSnapShotDataV100 *)&v5;
    }
    +[NSData dataWithBytes:length:](&off_26D2B69D0, "dataWithBytes:length:", v2, 36, v5, v6, v7);
    snapshotData = (GCGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return (NSData *)snapshotData;
}

BOOL GCGamepadSnapShotDataV100FromNSData(GCGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  long long v3 = data;
  uint64_t v4 = v3;
  BOOL v5 = 0;
  if (snapshotData && v3)
  {
    if ([(NSData *)v3 length] < 0x24
      || (int v7 = 0, [(NSData *)v4 getBytes:&v7 length:4], (unsigned __int16)v7 < 0x100u)
      || HIWORD(v7) < 0x24u)
    {
      BOOL v5 = 0;
    }
    else
    {
      [(NSData *)v4 getBytes:snapshotData length:36];
      BOOL v5 = 1;
    }
  }

  return v5;
}

void sub_220A73AB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_220A74744(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_220A748B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __destructor_8_s0_s48_s56_s64((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_220A74944(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_220A74ADC(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_220A74C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __destructor_8_s0_s48_s56_s64((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_220A74D90(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_220A74E64(_Unwind_Exception *a1)
{
  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_29(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id @objc UISceneConnectionOptions.gameControllerActivationContext.getter(void *a1)
{
  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  id v2 = a1;
  UISceneConnectionOptions.subscript.getter();

  return v4;
}

uint64_t UISceneConnectionOptions.gameControllerActivationContext.getter()
{
  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  UISceneConnectionOptions.subscript.getter();
  return v1;
}

unint64_t lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition()
{
  unint64_t result = lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition;
  if (!lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition);
  }
  return result;
}

uint64_t GCPhysicalInputElementCollection.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id GCPhysicalInputElementCollection.subscript.getter()
{
  uint64_t v1 = *v0;
  id v2 = (void *)MEMORY[0x223C6D1D0]();
  id v3 = objc_msgSend(v1, sel_elementForAlias_, v2);

  return v3;
}

{
  void **v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  uint64_t v1 = *v0;
  dispatch thunk of RawRepresentable.rawValue.getter();
  id v2 = v1;
  id v3 = (void *)MEMORY[0x223C6D1D0]();
  uint64_t v4 = objc_msgSend(v2, sel_elementForAlias_, v3);

  swift_bridgeObjectRelease();
  return v4;
}

BOOL static GCPhysicalInputElementCollection.Index.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL static GCPhysicalInputElementCollection.Index.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

uint64_t protocol witness for static Comparable.<= infix(_:_:) in conformance GCPhysicalInputElementCollection<A>.Index()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t protocol witness for static Comparable.>= infix(_:_:) in conformance GCPhysicalInputElementCollection<A>.Index()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t protocol witness for static Comparable.> infix(_:_:) in conformance GCPhysicalInputElementCollection<A>.Index()
{
  return MEMORY[0x270F9D4A0]();
}

id GCPhysicalInputElementCollection.subscript.getter(void *a1)
{
  id v2 = objc_msgSend(*v1, sel_elementAtIndex_, *a1);

  return v2;
}

void GCPhysicalInputElementCollection.startIndex.getter(void *a1@<X8>)
{
  *a1 = 0;
}

id GCPhysicalInputElementCollection.endIndex.getter@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(*v1, sel_count);
  *a1 = result;
  return result;
}

void *GCPhysicalInputElementCollection.index(after:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance GCPhysicalInputElementCollection<A>(void *a1@<X8>)
{
}

void (*protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>(void *a1, void *a2))(void *a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  BOOL v5 = GCPhysicalInputElementCollection.subscript.read(v4, a2);
  v4[4] = v6;
  v4[5] = v5;
  return protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>;
}

void protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 40))(*a1);

  free(v1);
}

uint64_t (*GCPhysicalInputElementCollection.subscript.read(void *a1, void *a2))()
{
  *a1 = objc_msgSend(*v2, sel_elementAtIndex_, *a2);
  return GCPhysicalInputElementCollection.subscript.read;
}

uint64_t GCPhysicalInputElementCollection.subscript.read()
{
  return swift_unknownObjectRelease();
}

uint64_t protocol witness for Collection.subscript.getter in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t protocol witness for Collection.indices.getter in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E1B8]();
}

uint64_t protocol witness for Collection.isEmpty.getter in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E178]();
}

uint64_t protocol witness for Collection.count.getter in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E138]();
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance GCPhysicalInputElementCollection<A>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 256;
}

uint64_t protocol witness for Collection.index(_:offsetBy:) in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E150]();
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E148]();
}

uint64_t protocol witness for Collection.distance(from:to:) in conformance GCPhysicalInputElementCollection<A>()
{
  return MEMORY[0x270F9E180]();
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance GCPhysicalInputElementCollection<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Range, (uint64_t (*)(char *, char *, uint64_t, uint64_t))&dispatch thunk of static Comparable.< infix(_:_:));
}

{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for ClosedRange, (uint64_t (*)(char *, char *, uint64_t, uint64_t))&dispatch thunk of static Comparable.<= infix(_:_:));
}

void *protocol witness for Collection.index(after:) in conformance GCPhysicalInputElementCollection<A>@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GCPhysicalInputElementCollection.index(after:)(a1, a2);
}

void *protocol witness for Collection.formIndex(after:) in conformance GCPhysicalInputElementCollection<A>(void *a1)
{
  id result = GCPhysicalInputElementCollection.index(after:)(a1, &v3);
  *a1 = v3;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance GCPhysicalInputElementCollection<A>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  GCPhysicalInputElementCollection.startIndex.getter(a1 + 1);
  *a1 = v3;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance GCPhysicalInputElementCollection<A>(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance GCPhysicalInputElementCollection<A>()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance GCPhysicalInputElementCollection<A>()
{
  swift_getWitnessTable();
  uint64_t v1 = specialized Collection._copyToContiguousArray()();

  return v1;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance GCPhysicalInputElementCollection<A>()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

GameController::GCPhysicalInputElementName __swiftcall GCPhysicalInputElementName.init(rawValue:)(GameController::GCPhysicalInputElementName rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t GCPhysicalInputElementName.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for shifter()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCPhysicalInputElementName.shifter = result;
  unk_267F290C0 = v1;
  return result;
}

uint64_t *GCPhysicalInputElementName.shifter.unsafeMutableAddressor()
{
  if (one-time initialization token for shifter != -1) {
    swift_once();
  }
  return &static GCPhysicalInputElementName.shifter;
}

uint64_t static GCPhysicalInputElementName.shifter.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for shifter != -1) {
    swift_once();
  }
  uint64_t v2 = unk_267F290C0;
  *a1 = static GCPhysicalInputElementName.shifter;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCPhysicalInputElementName@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCPhysicalInputElementName@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCPhysicalInputElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCPhysicalInputElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCPhysicalInputElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCPhysicalInputElementName(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return MEMORY[0x270F9F7D0]();
  }
}

id GCPhysicalInputElementCollection<>.subscript.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *v1;
  swift_bridgeObjectRetain();
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x223C6D1D0](v2, v3);
  id v7 = objc_msgSend(v5, sel_elementForAlias_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

uint64_t GCPhysicalInputElementCollection.subscript.getter()
{
  uint64_t v1 = *v0;
  dispatch thunk of RawRepresentable.rawValue.getter();
  id v2 = v1;
  id v3 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
  swift_getAssociatedTypeWitness();
  if (swift_dynamicCast()) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t base witness table accessor for Equatable in GCPhysicalInputElementCollection<A>.Index()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Sequence in GCPhysicalInputElementCollection<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in GCPhysicalInputElementCollection<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in GCPhysicalInputElementCollection<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in GCPhysicalInputElementCollection<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in GCPhysicalInputElementCollection<A>()
{
  return swift_getWitnessTable();
}

unint64_t lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName()
{
  unint64_t result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCPhysicalInputElementName(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName();
  unint64_t result = lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t type metadata instantiation function for GCPhysicalInputElementCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for GCPhysicalInputElementCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for GCPhysicalInputElementCollection.Index(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for GCPhysicalInputElementCollection.Index()
{
  return __swift_instantiateGenericMetadata();
}

void *initializeBufferWithCopyOfBuffer for GCPhysicalInputElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCPhysicalInputElementName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GCPhysicalInputElementName(void *a1, void *a2)
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

void *assignWithTake for GCPhysicalInputElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCPhysicalInputElementName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GCPhysicalInputElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCPhysicalInputElementName()
{
  return &type metadata for GCPhysicalInputElementName;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = type metadata accessor for Range();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = dispatch thunk of static Comparable.<= infix(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = dispatch thunk of static Comparable.<= infix(_:_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  float v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13);
  long long v18 = (char *)&v22 - v17;
  char v19 = dispatch thunk of static Comparable.<= infix(_:_:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t specialized Collection._copyToContiguousArray()()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

NSEnumerator_optional __swiftcall GCDevicePhysicalInputStateDiff.changedElements()()
{
  id v1 = objc_msgSend(v0, sel_changedElements);

  unint64_t v2 = (objc_class *)v1;
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

id GCDevicePhysicalInputStateDiff.changedElements()@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(v1, sel_changedElements);
  if (result)
  {
    uint64_t v4 = specialized closure #2 in LazySequenceProtocol.compactMap<A>(_:);
    uint64_t v5 = specialized closure #1 in LazySequenceProtocol.compactMap<A>(_:);
    uint64_t v6 = closure #1 in GCDevicePhysicalInputStateDiff.changedElements();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  *a1 = result;
  a1[1] = v6;
  a1[2] = 0;
  a1[3] = v5;
  a1[4] = 0;
  a1[5] = v4;
  a1[6] = 0;
  return result;
}

uint64_t closure #1 in GCDevicePhysicalInputStateDiff.changedElements()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  outlined init with copy of Any(a1, (uint64_t)&v4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for GCPhysicalInputElement);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    *a2 = 0;
  }
  return result;
}

BOOL specialized closure #1 in LazySequenceProtocol.compactMap<A>(_:)(void *a1)
{
  return *a1 != 0;
}

uint64_t specialized closure #2 in LazySequenceProtocol.compactMap<A>(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = *a1;
  if (result)
  {
    *a2 = result;
    return swift_unknownObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>;
  if (!lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>);
  }
  return result;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

GameController::GCAxisElementName __swiftcall GCAxisElementName.init(rawValue:)(GameController::GCAxisElementName rawValue)
{
  *id v1 = rawValue;
  return rawValue;
}

uint64_t GCAxisElementName.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for steeringWheel()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCAxisElementName.steeringWheel = result;
  unk_267F295E0 = v1;
  return result;
}

uint64_t *GCAxisElementName.steeringWheel.unsafeMutableAddressor()
{
  if (one-time initialization token for steeringWheel != -1) {
    swift_once();
  }
  return &static GCAxisElementName.steeringWheel;
}

uint64_t static GCAxisElementName.steeringWheel.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for steeringWheel != -1) {
    swift_once();
  }
  uint64_t v2 = unk_267F295E0;
  *a1 = static GCAxisElementName.steeringWheel;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCAxisElementName@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCAxisElementName@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCAxisElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCAxisElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCAxisElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCAxisElementName(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return MEMORY[0x270F9F7D0]();
  }
}

id GCPhysicalInputElementCollection<>.subscript.getter()
{
  uint64_t v4 = *v0;
  swift_bridgeObjectRetain();
  id v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCAxisElement>);
  id v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  uint64_t v4 = *v0;
  swift_bridgeObjectRetain();
  id v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCDirectionPadElement>);
  id v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  uint64_t v4 = *v0;
  swift_bridgeObjectRetain();
  id v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCSwitchElement>);
  id v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  uint64_t v4 = *v0;
  swift_bridgeObjectRetain();
  id v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCButtonElement>);
  id v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

unint64_t lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName()
{
  unint64_t result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCAxisElementName(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName();
  unint64_t result = lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName();
  *(void *)(a1 + 16) = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GCAxisElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCAxisElementName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GCAxisElementName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for GCAxisElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCAxisElementName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GCAxisElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCAxisElementName()
{
  return &type metadata for GCAxisElementName;
}

uint64_t GCDevicePhysicalInputState.elements.getter@<X0>(void *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_elements, (uint64_t *)&demangling cache variable for type metadata for GCPhysicalInputElement, a1);
}

uint64_t GCDevicePhysicalInputState.buttons.getter@<X0>(void *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_buttons, &demangling cache variable for type metadata for GCButtonElement, a1);
}

uint64_t GCDevicePhysicalInputState.axes.getter@<X0>(void *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_axes, &demangling cache variable for type metadata for GCAxisElement, a1);
}

uint64_t GCDevicePhysicalInputState.switches.getter@<X0>(void *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_switches, &demangling cache variable for type metadata for GCSwitchElement, a1);
}

uint64_t GCDevicePhysicalInputState.dpads.getter@<X0>(void *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_dpads, (uint64_t *)&demangling cache variable for type metadata for GCDirectionPadElement, a1);
}

uint64_t GCDevicePhysicalInputState.elements.getter@<X0>(SEL *a1@<X1>, uint64_t *a2@<X2>, void *a3@<X8>)
{
  uint64_t v5 = v3;
  id v7 = [v5 *a1];
  __swift_instantiateConcreteTypeFromMangledName(a2);

  return GCPhysicalInputElementCollection.init(_:)((uint64_t)v7, a3);
}

uint64_t (*implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod(uint64_t a1))()
{
  *(void *)(swift_allocObject() + 16) = a1;
  swift_unknownObjectRetain();
  return implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethodpartial apply;
}

uint64_t (**GCGameControllerConnectingOptionDefinition.sceneDelegateMethod.unsafeMutableAddressor())()
{
  return &static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
}

uint64_t (*(*static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod.getter())(uint64_t a1))()
{
  return implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
}

uint64_t static GCGameControllerConnectingOptionDefinition.invokeSceneDelegate(_:scene:payload:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t lazy protocol witness table accessor for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box()
{
  unint64_t result = lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box;
  if (!lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box;
  if (!lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box);
  }
  return result;
}

uint64_t (*protocol witness for static UISceneConnectionOptionDefinition.sceneDelegateMethod.getter in conformance GCGameControllerConnectingOptionDefinition())@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return _sSo29GCGameControllerSceneDelegate_pSo7UISceneCSo0aB17ActivationContextCIeggg_Ieggo_SoAA_pxq_q0_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lyAcEytIsegnnr_Iegnr_TR020_s14GameController06a37B26ConnectingOptionDefinitionO19scened11MethodyySo7e9C_So0cB17fg9CtcSo0cb5C28H0_pcvpZfiyAF_AHtcSoAI_pcfu_Tf3nnpf_n;
}

uint64_t _sSo29GCGameControllerSceneDelegate_pSo7UISceneCSo0aB17ActivationContextCIeggg_Ieggo_SoAA_pxq_q0_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lyAcEytIsegnnr_Iegnr_TR020_s14GameController06a37B26ConnectingOptionDefinitionO19scened11MethodyySo7e9C_So0cB17fg9CtcSo0cb5C28H0_pcvpZfiyAF_AHtcSoAI_pcfu_Tf3nnpf_n@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
  *(void *)(v5 + 24) = v4;
  *a2 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed UIScene, @guaranteed GCGameControllerActivationContext) -> ();
  a2[1] = v5;

  return swift_unknownObjectRetain();
}

uint64_t protocol witness for static UISceneConnectionOptionDefinition.invokeSceneDelegate(_:scene:payload:) in conformance GCGameControllerConnectingOptionDefinition(uint64_t (**a1)(uint64_t *, uint64_t *), uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  uint64_t v5 = *a3;
  uint64_t v6 = a2;
  return v3(&v6, &v5);
}

uint64_t protocol witness for static UISceneConnectionOptionDefinition.didFinishHandling(payload:for:) in conformance GCGameControllerConnectingOptionDefinition()
{
  return MEMORY[0x270F82258]();
}

ValueMetadata *type metadata accessor for GCGameControllerConnectingOptionDefinition()
{
  return &type metadata for GCGameControllerConnectingOptionDefinition;
}

uint64_t sub_220A7A258()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id partial apply for implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(v2 + 16), sel_scene_didActivateGameControllerWithContext_, a1, a2);
}

uint64_t sub_220A7A2A8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed UIScene, @guaranteed GCGameControllerActivationContext) -> ()(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

GameController::GCDirectionPadElementName __swiftcall GCDirectionPadElementName.init(rawValue:)(GameController::GCDirectionPadElementName rawValue)
{
  *id v1 = rawValue;
  return rawValue;
}

uint64_t GCDirectionPadElementName.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for directionPad()
{
  uint64_t result = GCInputDirectionPad.getter();
  static GCDirectionPadElementName.directionPad = result;
  unk_267F29880 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.directionPad.unsafeMutableAddressor()
{
  if (one-time initialization token for directionPad != -1) {
    swift_once();
  }
  return &static GCDirectionPadElementName.directionPad;
}

uint64_t static GCDirectionPadElementName.directionPad.getter@<X0>(void *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for directionPad, &static GCDirectionPadElementName.directionPad, &qword_267F29880, a1);
}

uint64_t one-time initialization function for leftThumbstick()
{
  uint64_t result = GCInputLeftThumbstick.getter();
  static GCDirectionPadElementName.leftThumbstick = result;
  *(void *)algn_267F29898 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.leftThumbstick.unsafeMutableAddressor()
{
  if (one-time initialization token for leftThumbstick != -1) {
    swift_once();
  }
  return &static GCDirectionPadElementName.leftThumbstick;
}

uint64_t static GCDirectionPadElementName.leftThumbstick.getter@<X0>(void *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for leftThumbstick, &static GCDirectionPadElementName.leftThumbstick, (uint64_t *)algn_267F29898, a1);
}

uint64_t one-time initialization function for rightThumbstick()
{
  uint64_t result = GCInputRightThumbstick.getter();
  static GCDirectionPadElementName.rightThumbstick = result;
  *(void *)algn_267F298B0 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.rightThumbstick.unsafeMutableAddressor()
{
  if (one-time initialization token for rightThumbstick != -1) {
    swift_once();
  }
  return &static GCDirectionPadElementName.rightThumbstick;
}

uint64_t static GCDirectionPadElementName.rightThumbstick.getter@<X0>(void *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for rightThumbstick, &static GCDirectionPadElementName.rightThumbstick, (uint64_t *)algn_267F298B0, a1);
}

uint64_t static GCDirectionPadElementName.directionPad.getter@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCDirectionPadElementName@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCDirectionPadElementName@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCDirectionPadElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCDirectionPadElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCDirectionPadElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCDirectionPadElementName(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return MEMORY[0x270F9F7D0]();
  }
}

unint64_t lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName()
{
  unint64_t result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCDirectionPadElementName(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName();
  unint64_t result = lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName();
  *(void *)(a1 + 16) = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GCDirectionPadElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCDirectionPadElementName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GCDirectionPadElementName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for GCDirectionPadElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCDirectionPadElementName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GCDirectionPadElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCDirectionPadElementName()
{
  return &type metadata for GCDirectionPadElementName;
}

uint64_t GCInputButtonA.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonB.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonX.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonY.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDirectionPad.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftThumbstick.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightThumbstick.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftShoulder.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightShoulder.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftTrigger.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightTrigger.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftThumbstickButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightThumbstickButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonHome.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonMenu.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonOptions.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonShare.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleOne.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleTwo.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleThree.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleFour.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadOne.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadTwo.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputSteeringWheel.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputShifter.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalAccelerator.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalBrake.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalClutch.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftPaddle.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightPaddle.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

GameController::GCSwitchElementName __swiftcall GCSwitchElementName.init(rawValue:)(GameController::GCSwitchElementName rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t GCSwitchElementName.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCSwitchElementName@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCSwitchElementName@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCSwitchElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCSwitchElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCSwitchElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCSwitchElementName(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return MEMORY[0x270F9F7D0]();
  }
}

unint64_t lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName()
{
  unint64_t result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCSwitchElementName(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName();
  unint64_t result = lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName();
  *(void *)(a1 + 16) = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GCSwitchElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCSwitchElementName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GCSwitchElementName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for GCSwitchElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSwitchElementName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GCSwitchElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSwitchElementName()
{
  return &type metadata for GCSwitchElementName;
}

uint64_t GCGameControllerActivationContext.asBSAction(with:)()
{
  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  id v1 = v0;
  uint64_t v2 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)();

  return v2;
}

id GCGameControllerActivationContext._Box.init(from:)(void *a1)
{
  return specialized GCGameControllerActivationContext._Box.init(from:)(a1);
}

uint64_t GCGameControllerActivationContext._Box.encode(to:)(void *a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  id v3 = objc_msgSend(a2, sel_previousApplicationBundleID);
  if (v3)
  {
    uint64_t v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  lazy protocol witness table accessor for type String? and conformance <A> A?(&lazy protocol witness table cache variable for type String? and conformance <A> A?);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

id protocol witness for Decodable.init(from:) in conformance GCGameControllerActivationContext._Box@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = specialized GCGameControllerActivationContext._Box.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GCGameControllerActivationContext._Box(void *a1)
{
  return GCGameControllerActivationContext._Box.encode(to:)(a1, *v1);
}

id specialized GCGameControllerActivationContext._Box.init(from:)(void *a1)
{
  id v3 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v3);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    lazy protocol witness table accessor for type String? and conformance <A> A?((unint64_t *)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    if (v6)
    {
      uint64_t v5 = (void *)MEMORY[0x223C6D1D0]();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v3 = objc_msgSend(objc_allocWithZone((Class)GCGameControllerActivationContext), sel_initWithPreviousApplication_, v5);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v3;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for GCGameControllerActivationContext._Box()
{
  return &type metadata for GCGameControllerActivationContext._Box;
}

uint64_t lazy protocol witness table accessor for type String? and conformance <A> A?(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for String?);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

GameController::GCButtonElementName __swiftcall GCButtonElementName.init(rawValue:)(GameController::GCButtonElementName rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t GCButtonElementName.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for a()
{
  uint64_t result = GCInputButtonA.getter();
  static GCButtonElementName.a = result;
  unk_267F29DD0 = v1;
  return result;
}

uint64_t *GCButtonElementName.a.unsafeMutableAddressor()
{
  if (one-time initialization token for a != -1) {
    swift_once();
  }
  return &static GCButtonElementName.a;
}

uint64_t static GCButtonElementName.a.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for a, &static GCButtonElementName.a, &qword_267F29DD0, a1);
}

uint64_t one-time initialization function for b()
{
  uint64_t result = GCInputButtonB.getter();
  static GCButtonElementName.b = result;
  *(void *)algn_267F29DE8 = v1;
  return result;
}

uint64_t *GCButtonElementName.b.unsafeMutableAddressor()
{
  if (one-time initialization token for b != -1) {
    swift_once();
  }
  return &static GCButtonElementName.b;
}

uint64_t static GCButtonElementName.b.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for b, &static GCButtonElementName.b, (uint64_t *)algn_267F29DE8, a1);
}

uint64_t one-time initialization function for x()
{
  uint64_t result = GCInputButtonX.getter();
  static GCButtonElementName.x = result;
  unk_267F29E00 = v1;
  return result;
}

uint64_t *GCButtonElementName.x.unsafeMutableAddressor()
{
  if (one-time initialization token for x != -1) {
    swift_once();
  }
  return &static GCButtonElementName.x;
}

uint64_t static GCButtonElementName.x.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for x, &static GCButtonElementName.x, &qword_267F29E00, a1);
}

uint64_t one-time initialization function for y()
{
  uint64_t result = GCInputButtonY.getter();
  static GCButtonElementName.y = result;
  *(void *)algn_267F29E18 = v1;
  return result;
}

uint64_t *GCButtonElementName.y.unsafeMutableAddressor()
{
  if (one-time initialization token for y != -1) {
    swift_once();
  }
  return &static GCButtonElementName.y;
}

uint64_t static GCButtonElementName.y.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for y, &static GCButtonElementName.y, (uint64_t *)algn_267F29E18, a1);
}

uint64_t one-time initialization function for leftShoulder()
{
  uint64_t result = GCInputLeftShoulder.getter();
  static GCButtonElementName.leftShoulder = result;
  unk_267F29E30 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftShoulder.unsafeMutableAddressor()
{
  if (one-time initialization token for leftShoulder != -1) {
    swift_once();
  }
  return &static GCButtonElementName.leftShoulder;
}

uint64_t static GCButtonElementName.leftShoulder.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftShoulder, &static GCButtonElementName.leftShoulder, &qword_267F29E30, a1);
}

uint64_t one-time initialization function for rightShoulder()
{
  uint64_t result = GCInputRightShoulder.getter();
  static GCButtonElementName.rightShoulder = result;
  *(void *)algn_267F29E48 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightShoulder.unsafeMutableAddressor()
{
  if (one-time initialization token for rightShoulder != -1) {
    swift_once();
  }
  return &static GCButtonElementName.rightShoulder;
}

uint64_t static GCButtonElementName.rightShoulder.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightShoulder, &static GCButtonElementName.rightShoulder, (uint64_t *)algn_267F29E48, a1);
}

uint64_t one-time initialization function for leftBumper()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.leftBumper = result;
  unk_267F29E60 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftBumper.unsafeMutableAddressor()
{
  if (one-time initialization token for leftBumper != -1) {
    swift_once();
  }
  return &static GCButtonElementName.leftBumper;
}

uint64_t static GCButtonElementName.leftBumper.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftBumper, &static GCButtonElementName.leftBumper, &qword_267F29E60, a1);
}

uint64_t one-time initialization function for rightBumper()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.rightBumper = result;
  *(void *)algn_267F29E78 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightBumper.unsafeMutableAddressor()
{
  if (one-time initialization token for rightBumper != -1) {
    swift_once();
  }
  return &static GCButtonElementName.rightBumper;
}

uint64_t static GCButtonElementName.rightBumper.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightBumper, &static GCButtonElementName.rightBumper, (uint64_t *)algn_267F29E78, a1);
}

uint64_t one-time initialization function for leftTrigger()
{
  uint64_t result = GCInputLeftTrigger.getter();
  static GCButtonElementName.leftTrigger = result;
  unk_267F29E90 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftTrigger.unsafeMutableAddressor()
{
  if (one-time initialization token for leftTrigger != -1) {
    swift_once();
  }
  return &static GCButtonElementName.leftTrigger;
}

uint64_t static GCButtonElementName.leftTrigger.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftTrigger, &static GCButtonElementName.leftTrigger, &qword_267F29E90, a1);
}

uint64_t one-time initialization function for rightTrigger()
{
  uint64_t result = GCInputRightTrigger.getter();
  static GCButtonElementName.rightTrigger = result;
  *(void *)algn_267F29EA8 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightTrigger.unsafeMutableAddressor()
{
  if (one-time initialization token for rightTrigger != -1) {
    swift_once();
  }
  return &static GCButtonElementName.rightTrigger;
}

uint64_t static GCButtonElementName.rightTrigger.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightTrigger, &static GCButtonElementName.rightTrigger, (uint64_t *)algn_267F29EA8, a1);
}

uint64_t one-time initialization function for leftThumbstickButton()
{
  uint64_t result = GCInputLeftThumbstickButton.getter();
  static GCButtonElementName.leftThumbstickButton = result;
  unk_267F29EC0 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftThumbstickButton.unsafeMutableAddressor()
{
  if (one-time initialization token for leftThumbstickButton != -1) {
    swift_once();
  }
  return &static GCButtonElementName.leftThumbstickButton;
}

uint64_t static GCButtonElementName.leftThumbstickButton.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftThumbstickButton, &static GCButtonElementName.leftThumbstickButton, &qword_267F29EC0, a1);
}

uint64_t one-time initialization function for rightThumbstickButton()
{
  uint64_t result = GCInputRightThumbstickButton.getter();
  static GCButtonElementName.rightThumbstickButton = result;
  *(void *)algn_267F29ED8 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightThumbstickButton.unsafeMutableAddressor()
{
  if (one-time initialization token for rightThumbstickButton != -1) {
    swift_once();
  }
  return &static GCButtonElementName.rightThumbstickButton;
}

uint64_t static GCButtonElementName.rightThumbstickButton.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightThumbstickButton, &static GCButtonElementName.rightThumbstickButton, (uint64_t *)algn_267F29ED8, a1);
}

void static GCButtonElementName.backLeftButton(position:)(uint64_t *a1@<X8>)
{
}

void static GCButtonElementName.backRightButton(position:)(uint64_t *a1@<X8>)
{
}

uint64_t one-time initialization function for home()
{
  uint64_t result = GCInputButtonHome.getter();
  static GCButtonElementName.home = result;
  unk_267F29EF0 = v1;
  return result;
}

uint64_t *GCButtonElementName.home.unsafeMutableAddressor()
{
  if (one-time initialization token for home != -1) {
    swift_once();
  }
  return &static GCButtonElementName.home;
}

uint64_t static GCButtonElementName.home.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for home, &static GCButtonElementName.home, &qword_267F29EF0, a1);
}

uint64_t one-time initialization function for menu()
{
  uint64_t result = GCInputButtonMenu.getter();
  static GCButtonElementName.menu = result;
  *(void *)algn_267F29F08 = v1;
  return result;
}

uint64_t *GCButtonElementName.menu.unsafeMutableAddressor()
{
  if (one-time initialization token for menu != -1) {
    swift_once();
  }
  return &static GCButtonElementName.menu;
}

uint64_t static GCButtonElementName.menu.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for menu, &static GCButtonElementName.menu, (uint64_t *)algn_267F29F08, a1);
}

uint64_t one-time initialization function for options()
{
  uint64_t result = GCInputButtonOptions.getter();
  static GCButtonElementName.options = result;
  unk_267F29F20 = v1;
  return result;
}

uint64_t *GCButtonElementName.options.unsafeMutableAddressor()
{
  if (one-time initialization token for options != -1) {
    swift_once();
  }
  return &static GCButtonElementName.options;
}

uint64_t static GCButtonElementName.options.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for options, &static GCButtonElementName.options, &qword_267F29F20, a1);
}

uint64_t one-time initialization function for share()
{
  uint64_t result = GCInputButtonShare.getter();
  static GCButtonElementName.share = result;
  *(void *)algn_267F29F38 = v1;
  return result;
}

uint64_t *GCButtonElementName.share.unsafeMutableAddressor()
{
  if (one-time initialization token for share != -1) {
    swift_once();
  }
  return &static GCButtonElementName.share;
}

uint64_t static GCButtonElementName.share.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for share, &static GCButtonElementName.share, (uint64_t *)algn_267F29F38, a1);
}

uint64_t one-time initialization function for pedalAccelerator()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalAccelerator = result;
  unk_267F29F50 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalAccelerator.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalAccelerator != -1) {
    swift_once();
  }
  return &static GCButtonElementName.pedalAccelerator;
}

uint64_t static GCButtonElementName.pedalAccelerator.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalAccelerator, &static GCButtonElementName.pedalAccelerator, &qword_267F29F50, a1);
}

uint64_t one-time initialization function for pedalBrake()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalBrake = result;
  *(void *)algn_267F29F68 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalBrake.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalBrake != -1) {
    swift_once();
  }
  return &static GCButtonElementName.pedalBrake;
}

uint64_t static GCButtonElementName.pedalBrake.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalBrake, &static GCButtonElementName.pedalBrake, (uint64_t *)algn_267F29F68, a1);
}

uint64_t one-time initialization function for pedalClutch()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalClutch = result;
  unk_267F29F80 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalClutch.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalClutch != -1) {
    swift_once();
  }
  return &static GCButtonElementName.pedalClutch;
}

uint64_t static GCButtonElementName.pedalClutch.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalClutch, &static GCButtonElementName.pedalClutch, &qword_267F29F80, a1);
}

uint64_t one-time initialization function for leftPaddle()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.leftPaddle = result;
  *(void *)algn_267F29F98 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftPaddle.unsafeMutableAddressor()
{
  if (one-time initialization token for leftPaddle != -1) {
    swift_once();
  }
  return &static GCButtonElementName.leftPaddle;
}

uint64_t static GCButtonElementName.leftPaddle.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftPaddle, &static GCButtonElementName.leftPaddle, (uint64_t *)algn_267F29F98, a1);
}

uint64_t one-time initialization function for rightPaddle()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.rightPaddle = result;
  unk_267F29FB0 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightPaddle.unsafeMutableAddressor()
{
  if (one-time initialization token for rightPaddle != -1) {
    swift_once();
  }
  return &static GCButtonElementName.rightPaddle;
}

uint64_t static GCButtonElementName.rightPaddle.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightPaddle, &static GCButtonElementName.rightPaddle, &qword_267F29FB0, a1);
}

uint64_t static GCButtonElementName.a.getter@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void static GCButtonElementName.arcadeButton(row:column:)(NSInteger a1@<X0>, NSInteger a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = GCInputArcadeButtonName(a1, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    *a3 = v6;
    a3[1] = v8;
  }
  else
  {
    __break(1u);
  }
}

uint64_t one-time initialization function for primaryMouseButton()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.primaryMouseButton = result;
  unk_267F2A1F0 = v1;
  return result;
}

uint64_t *GCButtonElementName.primaryMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for primaryMouseButton != -1) {
    swift_once();
  }
  return &static GCButtonElementName.primaryMouseButton;
}

uint64_t static GCButtonElementName.primaryMouseButton.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for primaryMouseButton, &static GCButtonElementName.primaryMouseButton, &qword_267F2A1F0, a1);
}

uint64_t one-time initialization function for secondaryMouseButton()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.secondaryMouseButton = result;
  unk_267F2A200 = v1;
  return result;
}

uint64_t *GCButtonElementName.secondaryMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for secondaryMouseButton != -1) {
    swift_once();
  }
  return &static GCButtonElementName.secondaryMouseButton;
}

uint64_t static GCButtonElementName.secondaryMouseButton.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for secondaryMouseButton, &static GCButtonElementName.secondaryMouseButton, &qword_267F2A200, a1);
}

uint64_t one-time initialization function for thirdMouseButton()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.thirdMouseButton = result;
  unk_267F2A210 = v1;
  return result;
}

uint64_t *GCButtonElementName.thirdMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for thirdMouseButton != -1) {
    swift_once();
  }
  return &static GCButtonElementName.thirdMouseButton;
}

uint64_t static GCButtonElementName.thirdMouseButton.getter@<X0>(void *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for thirdMouseButton, &static GCButtonElementName.thirdMouseButton, &qword_267F2A210, a1);
}

uint64_t static GCButtonElementName.primaryMouseButton.getter@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void static GCButtonElementName.auxiliaryMouseButon(_:)(uint64_t *a1@<X8>)
{
}

void static GCButtonElementName.backLeftButton(position:)(uint64_t (*a1)(void)@<X1>, uint64_t *a2@<X8>)
{
  id v3 = (id)a1();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    *a2 = v5;
    a2[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCButtonElementName@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCButtonElementName@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCButtonElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCButtonElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCButtonElementName()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCButtonElementName(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return MEMORY[0x270F9F7D0]();
  }
}

unint64_t lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName()
{
  unint64_t result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCButtonElementName(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName();
  unint64_t result = lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName();
  *(void *)(a1 + 16) = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GCButtonElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCButtonElementName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GCButtonElementName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for GCButtonElementName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCButtonElementName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GCButtonElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCButtonElementName()
{
  return &type metadata for GCButtonElementName;
}

void VirtualControllerBundle_cold_1(void *a1)
{
  uint64_t v1 = [a1 bundleURL];
  unint64_t v2 = [v1 path];
  OUTLINED_FUNCTION_0_2(&dword_220998000, v3, v4, "Failed locate VirtualGameController bundle in '%{public}@'.", v5, v6, v7, v8, 2u);
}

void VirtualControllerBundle_cold_2(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_2(&dword_220998000, v2, v3, "Failed to load bundle at path '%{public}@'.", v4, v5, v6, v7, 2u);
}

void VirtualControllerBundle_cold_3(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_220998000, a2, OS_LOG_TYPE_FAULT, "Failed to load bundle: '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

void loadNSDictionaryFromJSON_cold_1()
{
}

void HandleReport_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_220998000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
}

void HandleReport_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_220998000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
}

void HandleReport_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_220998000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
}

void HandleReport_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_220998000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
}

void HandleReport_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_220998000, v1, OS_LOG_TYPE_DEBUG, "Racing wheel input report: id=0x%x length=%zu", v2, 0x12u);
}

void ConnectToDriverService_cold_1(uint64_t a1)
{
  uint64_t v2 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  __int16 v3 = +[NSString stringWithUTF8String:"void ConnectToDriverService(Protocol *__strong, __strong id, __strong id, void (^__strong)(__strong id, NSError *__strong))"];
  [v2 handleFailureInFunction:v3, @"GCDriverConnection.m", 63, @"Unknown service: %@", a1 file lineNumber description];

  __break(1u);
}

void HapticSharedMemory::readCommand()
{
  __assert_rtn("readCommand", "HapticSharedMemory.h", 520, "srcCmd->head.mSize != 0");
}

void getGKDashboardLaunchContextGameController_cold_1()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  os_log_t v1 = +[NSString stringWithUTF8String:"NSString *getGKDashboardLaunchContextGameController(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_GCDefaultLogicalDevice.m", 54, @"%s", dlerror());

  __break(1u);
}

void __getGKDaemonProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getGKDaemonProxyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_GCDefaultLogicalDevice.m", 52, @"Unable to find class %s", "GKDaemonProxy");

  __break(1u);
}

void GameCenterFoundationLibrary_cold_1(void *a1)
{
  uint64_t v2 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  __int16 v3 = +[NSString stringWithUTF8String:"void *GameCenterFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_GCDefaultLogicalDevice.m", 50, @"%s", *a1);

  __break(1u);
}

void __getGKLocalPlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getGKLocalPlayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_GCDefaultLogicalDevice.m", 51, @"Unable to find class %s", "GKLocalPlayer");

  __break(1u);
}

void __getGKGameClass_block_invoke_cold_1()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getGKGameClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_GCDefaultLogicalDevice.m", 53, @"Unable to find class %s", "GKGame");

  __break(1u);
}

void __onqueue_3PSyntheticControllersScan_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#IOKit Failed to match 3rd party synthetic game controllers: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

void __getRPScreenRecorderClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ReplayKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GCControllerManagerApp.m", 40, @"%s", *a1);

  __break(1u);
}

void __getRPScreenRecorderClass_block_invoke_cold_2()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getRPScreenRecorderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GCControllerManagerApp.m", 41, @"Unable to find class %s", "RPScreenRecorder");

  __break(1u);
}

void DeviceMatched_cold_1()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_20(&dword_220998000, v0, v1, "Ignoring matched device - invalid registry entry ID", v2, v3, v4, v5, v6);
}

void DeviceMatched_cold_2()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_20(&dword_220998000, v0, v1, "Ignoring matched device - unknown device", v2, v3, v4, v5, v6);
}

void DeviceMatched_cold_3()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_20(&dword_220998000, v0, v1, "Ignoring matched device - failed to register removal notification", v2, v3, v4, v5, v6);
}

void DeviceGeneralNotification_cold_1()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_20(&dword_220998000, v0, v1, "Ignoring removed device - invalid registry entry ID", v2, v3, v4, v5, v6);
}

void __getRPScreenRecorderClass_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ReplayKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GCAppClientProxy.m", 27, @"%s", *a1);

  __break(1u);
}

void __getRPScreenRecorderClass_block_invoke_cold_2_0()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getRPScreenRecorderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GCAppClientProxy.m", 28, @"Unable to find class %s", "RPScreenRecorder");

  __break(1u);
}

void __getSSUIServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ScreenshotServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GCAppClientProxy.m", 20, @"%s", *a1);

  __break(1u);
}

void __getSSUIServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getSSUIServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GCAppClientProxy.m", 21, @"Unable to find class %s", "SSUIService");

  __break(1u);
}

void dqNormalize_cold_1()
{
}

void dqDLB_cold_1()
{
}

void dqGetMatrix_cold_1()
{
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t static UISceneConnectionOptionDefinition.createAction(payload:responder:)()
{
  return MEMORY[0x270F82250]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D948]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

uint64_t UISceneConnectionOptions.subscript.getter()
{
  return MEMORY[0x270F82700]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F818]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BKSHIDEventGetPointerAttributes()
{
  return MEMORY[0x270F10490]();
}

uint64_t BTDeviceConnectServices()
{
  return MEMORY[0x270F4AB48]();
}

uint64_t BTDeviceGetDeviceClass()
{
  return MEMORY[0x270F4AB88]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x270F4AB98]();
}

uint64_t BTDiscoveryAgentCreate()
{
  return MEMORY[0x270F4AC48]();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return MEMORY[0x270F4AC50]();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return MEMORY[0x270F4AC60]();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return MEMORY[0x270F4AC68]();
}

uint64_t BTPairingAgentAcceptSSP()
{
  return MEMORY[0x270F4AD38]();
}

uint64_t BTPairingAgentCreate()
{
  return MEMORY[0x270F4AD48]();
}

uint64_t BTPairingAgentDestroy()
{
  return MEMORY[0x270F4AD58]();
}

uint64_t BTPairingAgentStart()
{
  return MEMORY[0x270F4AD68]();
}

uint64_t BTPairingAgentStop()
{
  return MEMORY[0x270F4AD70]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x270F4AD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return MEMORY[0x270F2E4F0]();
}

uint64_t GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return MEMORY[0x270F2E4F8]();
}

uint64_t GCLookupService()
{
  return MEMORY[0x270F2E500]();
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x270EF3EF0](object, options);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F08](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF4050](device, *(void *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x270EF4060](device, matching, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4070](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x270EF40F0](device, *(void *)&reportType, reportID, report, reportLength);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x270EF4130](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x270EF4138](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x270EF4150](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x270EF4158](element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x270EF4168](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x270EF4178](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A8](element);
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x270EF41F8]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x270EF4318]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x270EF4320]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x270EF4368]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x270EF4400]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x270EF4408]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x270EF4438]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x270EF4450]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x270EF4480]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x270EF4488]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x270EF4498]();
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x270EF4648](service, *(void *)&usagePage, *(void *)&usage);
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4658](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x270EF4660](service);
}

uint64_t IOHIDServiceClientRegisterRemovalBlock()
{
  return MEMORY[0x270EF4668]();
}

uint64_t IOHIDServiceClientSetElementValue()
{
  return MEMORY[0x270EF4678]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF4680](service, key, property);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x270EF4760](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x270EF4768](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  MEMORY[0x270EF4778](value, *(void *)&type);
  return result;
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x270EF4920]();
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x270EF4998]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x270EF49A8]();
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SBSSuspendFrontmostApplication()
{
  return MEMORY[0x270F771F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _CFNotificationCenterRegisterDependentNotificationList()
{
  return MEMORY[0x270EE5650]();
}

uint64_t _GCFConvertStringToLocalizedString()
{
  return MEMORY[0x270F2E510]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _objc_rootRelease()
{
  return MEMORY[0x270F9A3E0]();
}

uint64_t _objc_rootRetainCount()
{
  return MEMORY[0x270F9A3E8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x270F76310]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint64_t analytics_send_event()
{
  return MEMORY[0x270F18A68]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x270F9A448](cls, extraBytes);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x270ED93C8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x270ED93D8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x270ED9698]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x270ED96A0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDA180](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x270EDA618](__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_clear_deallocating()
{
  return MEMORY[0x270F9A5B0]();
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
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

void objc_removeAssociatedObjects(id object)
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x270F9AA50](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDB470](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x270EDB478](a1);
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDBA98](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x270EDBF48]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x270EDC3C8]();
}