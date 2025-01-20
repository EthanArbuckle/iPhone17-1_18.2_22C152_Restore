@interface CBKeyboardBacklightContainer
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)keyboardUsesNitUnits:(id)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4;
- (BOOL)start;
- (CBKeyboardBacklightContainer)initWithDevice:(id)a3;
- (HIDDevice)device;
- (id)copyIdentifiers;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyInternalForKey:(id)a3;
- (id)newKeyboardBacklightWithQueue:(id)a3 device:(id)a4;
- (void)dealloc;
- (void)keyboardBacklightInitialization;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)stop;
@end

@implementation CBKeyboardBacklightContainer

- (CBKeyboardBacklightContainer)initWithDevice:(id)a3
{
  v11 = self;
  SEL v10 = a2;
  id v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBKeyboardBacklightContainer;
  v11 = [(CBKeyboardBacklightContainer *)&v8 init];
  if (v11)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.KeyboardBacklightContainer", "default");
    v11->_logHandle = (OS_os_log *)v3;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.CoreBrightness.KeyboardBacklightContainer", 0);
    v11->super._queue = (OS_dispatch_queue *)v4;
    if (!v11->super._queue || !v9)
    {

      return 0;
    }
    v5 = (HIDDevice *)v9;
    v11->_device = v5;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v11->_properties = (NSMutableDictionary *)v6;
    v11->_userActive = 1;
  }
  return v11;
}

- (void)dealloc
{
  dispatch_queue_t v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBKeyboardBacklightContainer;
  [(CBContainer *)&v2 dealloc];
}

- (BOOL)start
{
  v11 = self;
  SEL v10 = a2;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __37__CBKeyboardBacklightContainer_start__block_invoke;
  objc_super v8 = &unk_1E6218FE0;
  id v9 = v11;
  dispatch_sync(queue, &block);
  return 1;
}

uint64_t __37__CBKeyboardBacklightContainer_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardBacklightInitialization", a1, a1);
}

- (void)stop
{
  SEL v10 = self;
  SEL v9 = a2;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __36__CBKeyboardBacklightContainer_stop__block_invoke;
  v7 = &unk_1E6218FE0;
  objc_super v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __36__CBKeyboardBacklightContainer_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) stop];
  [*(id *)(*(void *)(a1 + 32) + 48) unregisterNotificationBlock];

  uint64_t result = a1;
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  return result;
}

- (id)copyPropertyForKey:(id)a3
{
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 1375731712;
  int v17 = 48;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  uint64_t v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  SEL v9 = __51__CBKeyboardBacklightContainer_copyPropertyForKey___block_invoke;
  SEL v10 = &unk_1E6219300;
  id v11 = a3;
  v12 = v23;
  v13 = &v14;
  dispatch_sync(queue, &block);
  int v5 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __51__CBKeyboardBacklightContainer_copyPropertyForKey___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t result = [*(id *)(a1 + 32) getKeyKeyboardID];
    uint64_t v3 = result;
    if (result)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) keyboardID];
      if (v3 == result
        || v3 == 1 && (uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) builtIn], (result & 1) != 0)
        || v3 == 1
        || v3 == 3
        && (uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) supportsAuthentication], (result & 1) != 0))
      {
        uint64_t result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      }
      else if (v3 == 2)
      {
        uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) supportsAuthentication];
        if ((result & 1) == 0)
        {
          uint64_t result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 40) copyPropertyInternalForKey:*(void *)(a1 + 32)];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = a4;
  uint64_t v16 = 0;
  int v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  SEL v10 = __51__CBKeyboardBacklightContainer_setProperty_forKey___block_invoke;
  id v11 = &unk_1E6219790;
  id v12 = a4;
  v13 = v24;
  v15 = &v16;
  id v14 = a3;
  dispatch_sync(queue, &block);
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

uint64_t __51__CBKeyboardBacklightContainer_setProperty_forKey___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t result = [*(id *)(a1 + 32) getKeyKeyboardID];
    uint64_t v3 = result;
    if (result)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) keyboardID];
      if (v3 == result
        || v3 == 1 && (uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) builtIn], (result & 1) != 0)
        || v3 == 1
        || v3 == 3
        && (uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) supportsAuthentication], (result & 1) != 0))
      {
        uint64_t result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
      }
      else if (v3 == 2)
      {
        uint64_t result = [*(id *)(*(void *)(a1 + 40) + 48) supportsAuthentication];
        if ((result & 1) == 0)
        {
          uint64_t result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 40) setPropertyInternal:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
    }
  }
  return result;
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"CBUserActivityUpdate"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_userActive = [a3 BOOLValue] & 1;
    }
  }
  char v7 = [(KeyboardBacklight *)self->_keyboardBacklight setProperty:a3 forKey:a4];
  if (v7) {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v11, (uint64_t)a4, (uint64_t)a3, v7 & 1);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "key=%@ property=%@ result=%d", v11, 0x1Cu);
  }
  return v7 & 1;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  if ([a3 isEqualToString:@"StatusInfo"])
  {
    id v6 = +[CBStatusInfoHelper copyStatusInfoFor:self];
    if (v6) {
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"CBKeyboardBacklightContainer", 0);
    }
  }
  else
  {
    id v7 = [(KeyboardBacklight *)self->_keyboardBacklight copyPropertyForKey:a3];
    if (!v7) {
      id v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3), "copy");
    }
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a3, (uint64_t)v7);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "key=%@ result=%@", v10, 0x16u);
  }
  return v7;
}

- (id)copyIdentifiers
{
  int v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"KeyboardBacklightSuppressed", @"KeyboardBacklightSaturated", @"KeyboardBacklightBrightness", @"KeyboardBacklightLevel", @"KeyboardBacklightABSuspend", @"KeyboardBacklightABEnabled", @"KeyboardBacklightIdleDimActive", @"KeyboardBacklightIdleDimTime", @"KeyboardBacklightBuiltIn", 0);
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v45 = self;
  SEL v44 = a2;
  IOHIDServiceClientRef v43 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  int v40 = 0x20000000;
  int v41 = 32;
  char v42 = 0;
  if (a3)
  {
    char v34 = 0;
    if (IOHIDServiceClientConformsTo(v43, 0xFF00u, 4u))
    {
      char v34 = 1;
      os_log_t v33 = 0;
      if (v45->_logHandle)
      {
        logHandle = v45->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      os_log_t v33 = logHandle;
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v47, (uint64_t)v43);
        _os_log_impl(&dword_1BA438000, v33, v32, "ALS service %p", v47, 0xCu);
      }
    }
    else if (IOHIDServiceClientConformsTo(v43, 0x20u, 0x41u))
    {
      char v30 = 0;
      uint64_t v29 = 0;
      int v28 = 0;
      id v31 = (id)IOHIDServiceClientCopyProperty(v43, @"VendorID");
      if (v31)
      {
        CFTypeID TypeID = CFNumberGetTypeID();
        if (TypeID == CFGetTypeID(v31)) {
          int v28 = [v31 unsignedIntValue];
        }
      }
      if (v31) {
        CFRelease(v31);
      }
      id v31 = (id)IOHIDServiceClientCopyProperty(v43, @"Built-In");
      if (v31)
      {
        CFTypeID v10 = CFBooleanGetTypeID();
        if (v10 == CFGetTypeID(v31))
        {
          if (v31 == (id)*MEMORY[0x1E4F1CFD0]) {
            char v30 = 1;
          }
        }
        else
        {
          CFTypeID v9 = CFNumberGetTypeID();
          if (v9 == CFGetTypeID(v31)) {
            char v30 = [v31 BOOLValue] & 1;
          }
        }
        CFRelease(v31);
      }
      id v31 = (id)IOHIDServiceClientCopyProperty(v43, @"SensorLocation");
      if (v31)
      {
        CFTypeID v8 = CFNumberGetTypeID();
        if (v8 == CFGetTypeID(v31)) {
          uint64_t v29 = [v31 unsignedIntegerValue];
        }
        CFRelease(v31);
      }
      os_log_t v27 = 0;
      if (v45->_logHandle)
      {
        id v7 = v45->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v6 = init_default_corebrightness_log();
        }
        id v7 = v6;
      }
      os_log_t v27 = v7;
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v46, (uint64_t)v43, v30 & 1, v29);
        _os_log_impl(&dword_1BA438000, v27, v26, "ALS service %p: builtIn=%u location=%lu", v46, 0x1Cu);
      }
      if ((v30 & 1) != 0 && v28 == 1452) {
        char v34 = 1;
      }
    }
    if (v34)
    {
      queue = v45->super._queue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v19 = -1073741824;
      int v20 = 0;
      id v21 = __52__CBKeyboardBacklightContainer_addHIDServiceClient___block_invoke;
      id v22 = &unk_1E62197B8;
      SEL v23 = v45;
      IOHIDServiceClientRef v25 = v43;
      v24 = &v38;
      dispatch_sync(queue, &block);
    }
  }
  else
  {
    v37 = 0;
    if (v45->_logHandle)
    {
      int v17 = v45->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v16 = init_default_corebrightness_log();
      }
      int v17 = v16;
    }
    v37 = v17;
    char v36 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      log = v37;
      os_log_type_t type = v36;
      __os_log_helper_16_0_0(v35);
      _os_log_error_impl(&dword_1BA438000, log, type, "HID service client pointer is NULL", v35, 2u);
    }
  }
  char v5 = *((unsigned char *)v39 + 24);
  _Block_object_dispose(&v38, 8);
  return v5 & 1;
}

uint64_t __52__CBKeyboardBacklightContainer_addHIDServiceClient___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) keyboardBacklightInitialization];
  uint64_t result = a1;
  if (*(void *)(*(void *)(a1 + 32) + 48)) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) addHIDServiceClient:*(void *)(a1 + 48)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = a4;
  uint64_t v16 = 0;
  int v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  CFTypeID v10 = __52__CBKeyboardBacklightContainer_handleHIDEvent_from___block_invoke;
  uint64_t v11 = &unk_1E62197E0;
  v13 = &v16;
  uint64_t v12 = v24;
  id v14 = a3;
  v15 = a4;
  dispatch_sync(queue, &block);
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

uint64_t __52__CBKeyboardBacklightContainer_handleHIDEvent_from___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) handleHIDEvent:a1[6] from:a1[7]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result & 1;
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  id v21 = self;
  SEL v20 = a2;
  int v19 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __55__CBKeyboardBacklightContainer_removeHIDServiceClient___block_invoke;
  CFTypeID v10 = &unk_1E6219808;
  uint64_t v12 = &v14;
  uint64_t v11 = v21;
  v13 = a3;
  dispatch_sync(queue, &block);
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __55__CBKeyboardBacklightContainer_removeHIDServiceClient___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) removeHIDServiceClient:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result & 1;
  return result;
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  char v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  id v15 = a4;
  if (self->super._notificationQueue)
  {
    id v4 = v16;
    id v5 = v15;
    notificationQueue = v18->super._notificationQueue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v8 = -1073741824;
    int v9 = 0;
    CFTypeID v10 = __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke;
    uint64_t v11 = &unk_1E62192B0;
    uint64_t v12 = v18;
    id v13 = v16;
    id v14 = v15;
    dispatch_async(notificationQueue, &block);
  }
}

void __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v12 = a1;
  objc_super v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke_2;
  int v8 = &unk_1E62192B0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  dispatch_sync(v2, &block);
}

void __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    SEL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithPropertyKey:keyboardID:", *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "keyboardID"));
    if (v3) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
    }

    id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:*(void *)(a1 + 40) keyboardID:1];
    if (v2) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
    }
  }
}

- (id)newKeyboardBacklightWithQueue:(id)a3 device:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v9 = (void *)[a4 propertyForKey:@"ProductID"];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v15, (uint64_t)v9);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "PID = %{public}@", v15, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(CBKeyboardBacklightContainer *)self keyboardUsesNitUnits:a4])
    {
      uint64_t v10 = [[KeyboardBacklightHIDCurveNits alloc] initWithQueue:a3 device:a4];
    }
    else if (keyboardUsesAdjustedBrightnessCurve([v9 intValue]))
    {
      uint64_t v10 = [[KeyboardBacklightHIDCurve alloc] initWithQueue:a3 device:a4];
    }
    else
    {
      uint64_t v10 = [[KeyboardBacklight alloc] initWithQueue:a3 device:a4];
    }
  }
  if (self->_logHandle)
  {
    int v6 = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    int v6 = v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v14, 10);
    _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard backlight initialized for lgpVersion = %d", v14, 8u);
  }
  return v10;
}

- (BOOL)keyboardUsesNitUnits:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v46 = self;
  SEL v45 = a2;
  id v44 = a3;
  char v43 = 0;
  char v42 = &unk_1F1418468;
  id v41 = 0;
  id v41 = (id)[(HIDDevice *)self->_device elementsMatching:&unk_1F1418468];
  if (![v41 count])
  {
    int v40 = 0;
    if (v46->_logHandle)
    {
      logHandle = v46->_logHandle;
    }
    else
    {
      uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v28;
    }
    int v40 = logHandle;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v40;
      os_log_type_t v27 = type;
      __os_log_helper_16_0_0(v38);
      _os_log_error_impl(&dword_1BA438000, log, v27, "HID elements not found.", v38, 2u);
    }
  }
  memset(__b, 0, sizeof(__b));
  id obj = v41;
  uint64_t v25 = [v41 countByEnumeratingWithState:__b objects:v49 count:16];
  if (v25)
  {
    uint64_t v21 = *(void *)__b[2];
    uint64_t v22 = 0;
    unint64_t v23 = v25;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)__b[2] != v21) {
        objc_enumerationMutation(obj);
      }
      id v37 = 0;
      id v37 = *(id *)(__b[1] + 8 * v22);
      if ([v37 type] == 257)
      {
        os_log_t oslog = 0;
        if (v46->_logHandle)
        {
          int v19 = v46->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          int v19 = inited;
        }
        os_log_t oslog = v19;
        os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = oslog;
          os_log_type_t v17 = v34;
          uint64_t v10 = [v37 usage];
          uint64_t v11 = [v37 usagePage];
          uint64_t v12 = [v37 reportID];
          uint64_t v13 = [v37 unit];
          uint64_t v14 = [v37 reportSize];
          uint64_t v15 = [v37 logicalMax];
          __os_log_helper_16_0_7_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v48, v10, v11, v12, v13, v14, v15, [v37 logicalMin]);
          _os_log_debug_impl(&dword_1BA438000, v16, v17, "usage = 0x%lx, usage page = 0x%lx, reportID = %ld, unit = 0x%lx, reportSize = %ld, max logical = %ld, min logical = %ld", v48, 0x48u);
        }
        if ([v37 usage] == 1)
        {
          int v33 = 0;
          int v33 = [v37 unit];
          if (v33 == 16777441)
          {
            char v43 = 1;
            os_log_t v32 = 0;
            if (v46->_logHandle)
            {
              uint64_t v9 = v46->_logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v8 = init_default_corebrightness_log();
              }
              uint64_t v9 = v8;
            }
            os_log_t v32 = v9;
            os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              int v6 = v32;
              os_log_type_t v7 = v31;
              __os_log_helper_16_0_0(v30);
              _os_log_debug_impl(&dword_1BA438000, v6, v7, "found level element using nit units", v30, 2u);
            }
          }
        }
        else
        {
          if (v46->_logHandle)
          {
            uint64_t v5 = v46->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v4 = init_default_corebrightness_log();
            }
            uint64_t v5 = v4;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v47, [v37 usage]);
            _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "Unknown element with usage = %ld", v47, 0xCu);
          }
        }
      }
      ++v22;
      if (v20 + 1 >= v23)
      {
        uint64_t v22 = 0;
        unint64_t v23 = [obj countByEnumeratingWithState:__b objects:v49 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }
  return v43 & 1;
}

- (void)keyboardBacklightInitialization
{
  uint64_t v12 = self;
  SEL v11 = a2;
  if (!self->_keyboardBacklight)
  {
    uint64_t v10 = 0;
    if (v12->_logHandle)
    {
      logHandle = v12->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    uint64_t v10 = logHandle;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v10;
      os_log_type_t type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_impl(&dword_1BA438000, log, type, "KeyboardBacklight initialization", v8, 2u);
    }
    uint64_t v2 = [(CBKeyboardBacklightContainer *)v12 newKeyboardBacklightWithQueue:v12->super._queue device:v12->_device];
    v12->_keyboardBacklight = (KeyboardBacklight *)v2;
    [(KeyboardBacklight *)v12->_keyboardBacklight start];
    if (v12->_userActive) {
      uint64_t v3 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC28];
    }
    [(KeyboardBacklight *)v12->_keyboardBacklight setProperty:v3 forKey:@"DisplayBrightnessFactor"];
    -[CBModule registerNotificationBlock:](v12->_keyboardBacklight, "registerNotificationBlock:");
  }
}

uint64_t __63__CBKeyboardBacklightContainer_keyboardBacklightInitialization__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 40))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(result + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

- (HIDDevice)device
{
  return self->_device;
}

@end