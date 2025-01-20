@interface GCSyntheticDeviceManager
- (GCSyntheticDeviceManager)init;
- (GCSyntheticDeviceManager)initWithServer:(id)a3;
- (id)_onqueue_setupDeviceWithDescription:(void *)a1;
- (uint64_t)_kernel_close;
- (uint64_t)_kernel_createDeviceWithProperties:(_DWORD *)a3 service:;
- (uint64_t)_kernel_open:(uint64_t)result;
- (uint64_t)_kernel_terminateAllDevices:(uint64_t)result;
- (uint64_t)_kernel_terminateDeviceWithIdentifier:(uint64_t)a1;
- (uint64_t)_user_check:(void *)a3 device:(int *)a4 enabled:;
- (void)_onqueue_refreshSyntheticControllersEnabled;
- (void)_onqueue_setActiveDevices:(uint64_t)a1;
- (void)_onqueue_teardownDevice:(uint64_t)a1;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation GCSyntheticDeviceManager

- (GCSyntheticDeviceManager)initWithServer:(id)a3
{
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)GCSyntheticDeviceManager;
  v7 = [(GCSyntheticDeviceManager *)&v57 init];
  objc_storeStrong((id *)v7 + 1, a3);
  dispatch_queue_t v8 = dispatch_queue_create("SyntheticDeviceManager", 0);
  v9 = (void *)*((void *)v7 + 2);
  *((void *)v7 + 2) = v8;

  v10 = IONotificationPortCreate(kIOMainPortDefault);
  *((void *)v7 + 3) = v10;
  if (!v10)
  {
    v13 = getLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[GCSyntheticDeviceManager initWithServer:]();
    }
    goto LABEL_13;
  }
  IONotificationPortSetDispatchQueue(v10, *((dispatch_queue_t *)v7 + 2));
  CFDictionaryRef v11 = IOServiceMatching("AppleGCResource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  v7[8] = MatchingService;
  if (!MatchingService)
  {
    v13 = getLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[GCSyntheticDeviceManager initWithServer:]();
    }
    goto LABEL_13;
  }
  if (!IOServiceOpen(MatchingService, mach_task_self_, 0, v7 + 9))
  {
    if (-[GCSyntheticDeviceManager _kernel_open:]((uint64_t)v7, (uint64_t *)v7 + 5))
    {
      v13 = getLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[GCSyntheticDeviceManager initWithServer:].cold.9();
      }
      goto LABEL_13;
    }
    if (_os_feature_enabled_impl())
    {
      if (mach_port_allocate(mach_task_self_, 1u, v7 + 12))
      {
        if (!gc_isInternalBuild())
        {
          v14 = 0;
          goto LABEL_15;
        }
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[GCSyntheticDeviceManager initWithServer:].cold.8();
        }
        goto LABEL_13;
      }
      uint64_t v16 = v7[12];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke;
      v52[3] = &unk_26D22C190;
      int v56 = v16;
      v54 = v7;
      SEL v55 = a2;
      v17 = v7;
      v53 = v17;
      v18 = (void *)MEMORY[0x223C6E420](v52);
      uint64_t v19 = dispatch_mach_create();
      v20 = (void *)*((void *)v17 + 7);
      *((void *)v17 + 7) = v19;

      if (!*((void *)v17 + 7))
      {
        v44 = getLogger();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[GCSyntheticDeviceManager initWithServer:]();
        }

        v14 = 0;
        v13 = v53;
        goto LABEL_14;
      }
      dispatch_mach_connect();
      if (MEMORY[0x223C6D6B0](v7[9], 1, v16, 0))
      {
        v21 = getLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[GCSyntheticDeviceManager initWithServer:].cold.7();
        }
      }
    }
    v22 = IOServiceMatching("IOHIDUserDevice");
    *((void *)v7 + 8) = v22;
    CFDictionarySetValue(v22, @"VendorID", &unk_26D2867F8);
    CFDictionarySetValue(*((CFMutableDictionaryRef *)v7 + 8), @"ProductID", &unk_26D286810);
    v23 = (IONotificationPort *)*((void *)v7 + 3);
    CFDictionaryRef v24 = (const __CFDictionary *)CFRetain(*((CFTypeRef *)v7 + 8));
    v25 = v7 + 18;
    if (IOServiceAddMatchingNotification(v23, "IOServicePublish", v24, (IOServiceMatchingCallback)__onqueue_3PSyntheticControllersChanged, v7, v7 + 18))
    {
      v26 = getLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[GCSyntheticDeviceManager initWithServer:].cold.6();
      }
    }
    v27 = (IONotificationPort *)*((void *)v7 + 3);
    CFDictionaryRef v28 = (const __CFDictionary *)CFRetain(*((CFTypeRef *)v7 + 8));
    v29 = v7 + 19;
    if (IOServiceAddMatchingNotification(v27, "IOServiceTerminate", v28, (IOServiceMatchingCallback)__onqueue_3PSyntheticControllersChanged, v7, v7 + 19))
    {
      v30 = getLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[GCSyntheticDeviceManager initWithServer:].cold.5();
      }
    }
    uint64_t v31 = *v25;
    if (v31)
    {
      if (*v29)
      {
        __3PSyntheticControllersDrainIterator(v7, v31);
        __3PSyntheticControllersDrainIterator(v7, v7[19]);
LABEL_40:
        v32 = *((void *)v7 + 2);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_109;
        block[3] = &unk_26D22A8C0;
        v33 = v7;
        v51 = v33;
        dispatch_async(v32, block);

        LOBYTE(v32) = _os_feature_enabled_impl() ^ 1;
        uint64_t v34 = GCLookupService();
        v35 = (void *)*((void *)v33 + 11);
        *((void *)v33 + 11) = v34;

        uint64_t v36 = GCLookupService();
        v37 = (void *)*((void *)v33 + 13);
        *((void *)v33 + 13) = v36;

        *((unsigned char *)v33 + 96) = (_BYTE)v32;
        v38 = (void *)*((void *)v33 + 11);
        if (v38)
        {
          [v38 addObserver:v33 forKeyPath:@"enableSyntheticDevices" options:5 context:0];
        }
        else
        {
          v45 = getLogger();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[GCSyntheticDeviceManager initWithServer:].cold.4();
          }
        }
        v39 = *((void *)v7 + 2);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_111;
        v48[3] = &unk_26D22A8C0;
        v40 = v33;
        v49 = v40;
        dispatch_async(v39, v48);
        dispatch_time_t v41 = dispatch_time(0, 5000000000);
        v42 = *((void *)v7 + 2);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_2;
        v46[3] = &unk_26D22A8C0;
        v43 = v40;
        v47 = v43;
        dispatch_after(v41, v42, v46);
        v14 = v43;

        v13 = v49;
        goto LABEL_14;
      }
      IOObjectRelease(*v25);
      io_object_t *v25 = 0;
    }
    if (*v29)
    {
      IOObjectRelease(*v29);
      io_object_t *v29 = 0;
    }
    goto LABEL_40;
  }
  v13 = getLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[GCSyntheticDeviceManager initWithServer:]0();
  }
LABEL_13:
  v14 = 0;
LABEL_14:

LABEL_15:
  return v14;
}

- (uint64_t)_kernel_open:(uint64_t)result
{
  if (result)
  {
    uint64_t output = 0;
    uint64_t input = 0;
    uint32_t outputCnt = 1;
    result = IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 0, &input, 1u, &output, &outputCnt);
    if (a2) {
      *a2 = output;
    }
  }
  return result;
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 != 2)
  {
    if (a2 == 8) {
      mach_port_mod_refs(mach_task_self_, *(_DWORD *)(a1 + 56), 1u, -1);
    }
    goto LABEL_38;
  }
  uint64_t v6 = dispatch_mach_msg_get_msg();
  uint64_t v7 = v6;
  memset(msg, 0, sizeof(msg));
  uint64_t v8 = v6 + 20;
  if (*(_DWORD *)(v6 + 20) != 1)
  {
    uint64_t v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_8(v8, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_27;
  }
  if ((*(_DWORD *)v6 & 0x80000000) == 0)
  {
    uint64_t v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_1();
    }
    goto LABEL_27;
  }
  if (*(_DWORD *)(v6 + 4) != 48)
  {
    uint64_t v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_7(v7 + 4, v19, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_27;
  }
  if (*(_DWORD *)(v6 + 24) != 1)
  {
    uint64_t v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_6(v7 + 24, v19, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_27;
  }
  if (*(unsigned char *)(v6 + 39) != 1 || (v9 = *(const char **)(v6 + 28)) == 0)
  {
    uint64_t v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_2();
    }
LABEL_27:

    mach_msg_destroy((mach_msg_header_t *)v7);
    goto LABEL_38;
  }
  int v49 = 0;
  CFStringRef errorString = 0;
  CFTypeRef v10 = IOCFUnserializeWithSize(v9, *(unsigned int *)(v7 + 40), 0, 0, &errorString);
  CFDictionaryRef v11 = (void *)v10;
  if (v10)
  {
    CFTypeID v12 = CFGetTypeID(v10);
    if (v12 != CFDictionaryGetTypeID())
    {
      CFRelease(v11);
      CFDictionaryRef v11 = 0;
      CFStringRef errorString = @"ClientAttributes not a CFDictionary";
    }
  }
  MEMORY[0x223C6E880](mach_task_self_, *(void *)(v7 + 28), *(unsigned int *)(v7 + 40));
  if (v11)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v13 = [*(id *)(*(void *)(a1 + 40) + 112) keyEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v45;
LABEL_16:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKey:*(void *)(*((void *)&v44 + 1) + 8 * v17)];
        if (!v18)
        {
          v43 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32), @"GCSyntheticDeviceManager.m", 202, @"Bug in %s", "-[GCSyntheticDeviceManager initWithServer:]_block_invoke");
        }
        if (-[_GCSyntheticDevice serviceIdentity]((uint64_t)v18) == *(_DWORD *)(v7 + 44)) {
          break;
        }

        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v51 count:16];
          if (v15) {
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }

      if (!v18) {
        goto LABEL_30;
      }
      -[GCSyntheticDeviceManager _user_check:device:enabled:](*(void *)(a1 + 40), v11, v18, &v49);
      int v26 = 0;
    }
    else
    {
LABEL_24:

LABEL_30:
      v18 = getLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_5();
      }
      int v26 = 4;
    }

    int v27 = v49;
  }
  else
  {
    CFDictionaryRef v28 = getLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_4((uint64_t *)&errorString, v28);
    }

    int v27 = 0;
    int v26 = 4;
  }
  *(_DWORD *)msg = *(_DWORD *)v7 & 0x1F;
  *(_DWORD *)&msg[4] = 32;
  unsigned int v29 = *(_DWORD *)(v7 + 20);
  *(_DWORD *)&msg[8] = *(_DWORD *)(v7 + 8);
  *(void *)&msg[20] = __PAIR64__(v26, v29);
  *(_DWORD *)&msg[28] = v27;
  if (mach_msg((mach_msg_header_t *)msg, 17, 0x20u, 0, 0, 0, 0))
  {
    v42 = getLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_3();
    }
  }
LABEL_38:
}

- (uint64_t)_user_check:(void *)a3 device:(int *)a4 enabled:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v9 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] Check Process Enabled", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v9, &v20);
    CFTypeRef v10 = getLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[GCSyntheticDeviceManager _user_check:device:enabled:]((uint64_t)v8, (uint64_t)v7, v10);
    }

    CFTypeID v12 = [(_GCSyntheticDevice *)v8 persistentIdentifier];
    v13 = [v7 objectForKeyedSubscript:@"BundleIdentifier"];
    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 104) games];
      uint64_t v15 = [v14 gameWithBundleIdentifier:v13];

      if (v15)
      {
        uint64_t v16 = [v15 controllerToCompatibilityModeMappings];
        uint64_t v17 = [v16 objectForKeyedSubscript:v12];
      }
      else
      {
        uint64_t v17 = 0;
      }
      if ([v17 isEqualToString:GCSCompatibilityModeXbox360])
      {
        int v18 = 2;
LABEL_12:
        *a4 = v18;

LABEL_15:
        os_activity_scope_leave(&v20);

        goto LABEL_16;
      }
      if ([v17 isEqualToString:GCSCompatibilityModeDisabled])
      {
        int v18 = 0;
        goto LABEL_12;
      }
    }
    *a4 = 0;
    goto LABEL_15;
  }
LABEL_16:

  return 0;
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_109(uint64_t a1)
{
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_111(uint64_t a1)
{
}

- (void)_onqueue_refreshSyntheticControllersEnabled
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "Disabling synthetic game controllers because %zu third-party synthetic game controllers were found.", (uint8_t *)&v3, 0xCu);
}

uint64_t __43__GCSyntheticDeviceManager_initWithServer___block_invoke_2(uint64_t a1)
{
  return -[GCSyntheticDeviceManager _kernel_terminateAllDevices:](*(void *)(a1 + 32), 1);
}

- (uint64_t)_kernel_terminateAllDevices:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      uint64_t v2 = *(void *)(result + 40);
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t input = v2;
    return IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 4u, &input, 1u, 0, 0);
  }
  return result;
}

- (GCSyntheticDeviceManager)init
{
  return 0;
}

- (void)dealloc
{
  if (self->_syntheticDevices)
  {
    [(_GCControllerManagerServer *)self->_server removeObserver:self forKeyPath:@"activeControllerDevices" context:0];
    syntheticDevices = self->_syntheticDevices;
    self->_syntheticDevices = 0;
  }
  defaults = self->_defaults;
  if (defaults)
  {
    [(GCUserDefaults *)defaults removeObserver:self forKeyPath:@"enableSyntheticDevices"];
    id v5 = self->_defaults;
    self->_defaults = 0;
  }
  IOObjectRelease(self->_3pSyntheticControllerTerminatedNotification);
  self->_3pSyntheticControllerTerminatedNotification = 0;
  IOObjectRelease(self->_3pSyntheticControllerPublishedNotification);
  self->_3pSyntheticControllerPublishedNotification = 0;
  _3pSyntheticControllerMatchingCriteria = self->_3pSyntheticControllerMatchingCriteria;
  if (_3pSyntheticControllerMatchingCriteria)
  {
    CFRelease(_3pSyntheticControllerMatchingCriteria);
    self->_3pSyntheticControllerMatchingCriteria = 0;
  }
  if (self->_upcallMachChannel)
  {
    dispatch_mach_cancel();
    upcallMachChannel = self->_upcallMachChannel;
    self->_upcallMachChannel = 0;
  }
  IOConnectCallScalarMethod(self->_connect, 1u, 0, 0, 0, 0);
  IOServiceClose(self->_connect);
  self->_connect = 0;
  IOObjectRelease(self->_service);
  self->_service = 0;
  v8.receiver = self;
  v8.super_class = (Class)GCSyntheticDeviceManager;
  [(GCSyntheticDeviceManager *)&v8 dealloc];
}

- (uint64_t)_kernel_close
{
  if (result) {
    return IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 1u, 0, 0, 0, 0);
  }
  return result;
}

- (id)_onqueue_setupDeviceWithDescription:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] Setup Kernel Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = getLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v3 debugDescription];
      [(GCSyntheticDeviceManager *)v6 _onqueue_setupDeviceWithDescription:v5];
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __64__GCSyntheticDeviceManager__onqueue_setupDeviceWithDescription___block_invoke;
    v8[3] = &unk_26D22C1B8;
    v8[4] = a1;
    a1 = +[_GCSyntheticDevice deviceWithDescription:creator:]((uint64_t)_GCSyntheticXbox360Controller, v3, v8);
    os_activity_scope_leave(&state);
  }

  return a1;
}

uint64_t __64__GCSyntheticDeviceManager__onqueue_setupDeviceWithDescription___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v6 = 0;
  int v2 = -[GCSyntheticDeviceManager _kernel_createDeviceWithProperties:service:](*(void *)(a1 + 32), a2, &v6);
  if (!v2) {
    return v6;
  }
  int v3 = v2;
  uint64_t v4 = getLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "#KERNEL AppleGCResource create device failed: %{mach.errno}d.", buf, 8u);
  }

  return 0;
}

- (uint64_t)_kernel_createDeviceWithProperties:(_DWORD *)a3 service:
{
  id v5 = a2;
  unsigned int v6 = v5;
  if (a1)
  {
    CFDataRef v7 = IOCFSerialize(v5, 0);
    if (v7)
    {
      CFDataRef v8 = v7;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      mach_port_t v9 = *(_DWORD *)(a1 + 36);
      BytePtr = CFDataGetBytePtr(v7);
      size_t Length = CFDataGetLength(v8);
      a1 = IOConnectCallMethod(v9, 2u, 0, 0, BytePtr, Length, &output, &outputCnt, 0, 0);
      if (!a1)
      {
        if (a3) {
          *a3 = output;
        }
        else {
          mach_port_deallocate(mach_task_self_, output);
        }
      }
      CFRelease(v8);
    }
    else
    {
      CFTypeID v12 = getLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "Serialization failed", buf, 2u);
      }

      a1 = 3758097097;
    }
  }

  return a1;
}

- (void)_onqueue_teardownDevice:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    uint64_t v4 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] Teardown Kernel Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &v15);
    id v5 = getLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[GCSyntheticDeviceManager _onqueue_teardownDevice:]((uint64_t)v3, v5);
    }

    CFDataRef v7 = [(_GCSyntheticDevice *)v3 identifier];
    int v8 = -[GCSyntheticDeviceManager _kernel_terminateDeviceWithIdentifier:](a1, v7);
    if (!v8) {
      goto LABEL_12;
    }
    int v9 = v8;
    if (v8 == -536870208)
    {
      CFTypeRef v10 = getLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v7;
        CFDictionaryRef v11 = "No kernel device with identifier '%@'.";
        CFTypeID v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        uint32_t v14 = 12;
LABEL_10:
        _os_log_impl(&dword_220998000, v12, v13, v11, buf, v14);
      }
    }
    else
    {
      CFTypeRef v10 = getLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v9;
        CFDictionaryRef v11 = "#KERNEL AppleGCResource terminate device failed: %{mach.errno}d.";
        CFTypeID v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 8;
        goto LABEL_10;
      }
    }

LABEL_12:
    os_activity_scope_leave(&v15);
  }
}

- (uint64_t)_kernel_terminateDeviceWithIdentifier:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    os_log_type_t v13 = @"_GCSyntheticDeviceIdentifier";
    uint32_t v14 = a2;
    id v3 = a2;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    CFDataRef v5 = IOCFSerialize(v4, 0);
    if (v5)
    {
      CFDataRef v6 = v5;
      mach_port_t v7 = *(_DWORD *)(v2 + 36);
      BytePtr = CFDataGetBytePtr(v5);
      size_t Length = CFDataGetLength(v6);
      uint64_t v2 = IOConnectCallMethod(v7, 3u, 0, 0, BytePtr, Length, 0, 0, 0, 0);
      CFRelease(v6);
    }
    else
    {
      CFTypeRef v10 = getLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "Serialization failed", buf, 2u);
      }

      uint64_t v2 = 3758097097;
    }
  }
  return v2;
}

- (void)_onqueue_setActiveDevices:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v4 = (void *)[*(id *)(a1 + 112) copy];
    CFDataRef v5 = v4;
    if (v4)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      CFDataRef v6 = [v4 keyEnumerator];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        int v9 = sel__onqueue_setActiveDevices_;
        uint64_t v10 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            os_log_type_t v13 = [v3 member:v12];

            if (!v13)
            {
              uint32_t v14 = [v5 objectForKey:v12];
              if (!v14)
              {
                unk_26D2B54B8(&off_26D2B5620, "currentHandler");
                os_activity_scope_state_s v15 = v26 = v9;
                objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v26, a1, @"GCSyntheticDeviceManager.m", 449, @"Bug in %s", "-[GCSyntheticDeviceManager _onqueue_setActiveDevices:]");

                int v9 = v26;
              }
              -[GCSyntheticDeviceManager _onqueue_teardownDevice:](a1, v14);
              [*(id *)(a1 + 112) removeObjectForKey:v12];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v8);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v3;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
            uint64_t v22 = [v5 objectForKey:v21];

            if (!v22)
            {
              uint64_t v23 = [v21 makeSyntheticController];
              if (v23)
              {
                uint64_t v24 = -[GCSyntheticDeviceManager _onqueue_setupDeviceWithDescription:]((void *)a1, v23);
                [*(id *)(a1 + 112) setObject:v24 forKey:v21];
              }
              else
              {
                uint64_t v24 = getLogger();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v36 = v21;
                  _os_log_error_impl(&dword_220998000, v24, OS_LOG_TYPE_ERROR, "%@ did not return a synthetic device description.", buf, 0xCu);
                }
              }
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v25 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
          uint64_t v18 = v25;
        }
        while (v25);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  CFDictionaryRef v11 = (GCUserDefaults *)a4;
  id v12 = a5;
  if ((GCUserDefaults *)self->_server == v11
    && [v10 isEqualToString:@"activeControllerDevices"])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_log_type_t v13 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] 'activeControllerDevices' changed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    uint32_t v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_26D22A8E8;
    id v23 = v14;
    uint64_t v24 = self;
    id v16 = v14;
    dispatch_async(queue, block);
    os_activity_scope_leave(&state);
  }
  else
  {
    if (self->_defaults != v11 || ![v10 isEqualToString:@"enableSyntheticDevices"])
    {
      v20.receiver = self;
      v20.super_class = (Class)GCSyntheticDeviceManager;
      [(GCSyntheticDeviceManager *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_13;
    }
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_log_type_t v13 = _os_activity_create(&dword_220998000, "[Synthetic Device Manager] Preference changed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    uint64_t v17 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    uint64_t v18 = getLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[GCSyntheticDeviceManager observeValueForKeyPath:ofObject:change:context:]((uint64_t)v17, v18);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_disabledByPreference = [v17 BOOLValue] ^ 1;
    }
    uint64_t v19 = self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_128;
    v21[3] = &unk_26D22A8C0;
    v21[4] = self;
    dispatch_async(v19, v21);
    os_activity_scope_leave(&state);
  }
LABEL_13:
}

void __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSPredicate predicateWithBlock:&__block_literal_global_22];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  -[GCSyntheticDeviceManager _onqueue_setActiveDevices:](*(void *)(a1 + 40), v4);
}

uint64_t __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26D297A78];
}

void __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_128(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticDevices, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_upcallMachChannel, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)initWithServer:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#IOKit notification port creation failed.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#KERNEL 'AppleGCResource' kernel service not found.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#Mach channel creation failed.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.4()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "Failed to load user defaults.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#IOKit Failed to setup 3rd party synthetic game controller terminated notification: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#IOKit Failed to setup 3rd party synthetic game controller published notification: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#IOKit upcall port registration failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.8()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#Mach port allocation failed.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#KERNEL AppleGCResource open failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

- (void)initWithServer:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#KERNEL Connect to 'AppleGCResource' service failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#Mach message received with non-complex bits.", v2, v3, v4, v5, v6);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#Mach message received with invalid descriptor", v2, v3, v4, v5, v6);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_15(&dword_220998000, v0, v1, "#Mach message reply failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "#Mach message received with invalid client attributes: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_12(&dword_220998000, v0, v1, "#Mach message received for unknown device", v2, v3, v4, v5, v6);
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_user_check:(uint64_t)a1 device:(uint64_t)a2 enabled:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "Check %@ enabled: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_onqueue_setupDeviceWithDescription:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "Setup kernel synthetic device with description: %@", buf, 0xCu);
}

- (void)_onqueue_teardownDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "Teardown kernel synthetic device: %@", (uint8_t *)&v2, 0xCu);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = @"enableSyntheticDevices";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "New %{public}@ #preference is %{public}@.", (uint8_t *)&v2, 0x16u);
}

@end