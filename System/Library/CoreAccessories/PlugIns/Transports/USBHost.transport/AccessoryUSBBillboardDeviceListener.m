@interface AccessoryUSBBillboardDeviceListener
- (AccessoryUSBBillboardDeviceListener)initWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (BOOL)startDetectUSBBillboardDevice;
- (BOOL)started;
- (BOOL)stopDetectUSBBillboardDevice;
- (IONotificationPort)appleUSBHostBillboardDeviceNotify;
- (NSMutableSet)accessoryUSBBillboardDeviceRegistryIDs;
- (OS_dispatch_queue)accessoryUSBBillboardDeviceListenerQueue;
- (unsigned)accessoryUSBBillboardDeviceVIDPID;
- (unsigned)billboardAddedIterator;
- (unsigned)billboardRemovedIterator;
- (void)AppleUSBHostBillboardDeviceServiceArrived:(unsigned int)a3;
- (void)AppleUSBHostBillboardDeviceServiceTerminated:(unsigned int)a3;
- (void)dealloc;
- (void)setAccessoryUSBBillboardDeviceListenerQueue:(id)a3;
- (void)setAccessoryUSBBillboardDeviceRegistryIDs:(id)a3;
- (void)setAccessoryUSBBillboardDeviceVIDPID:(unsigned int)a3;
- (void)setAppleUSBHostBillboardDeviceNotify:(IONotificationPort *)a3;
- (void)setBillboardAddedIterator:(unsigned int)a3;
- (void)setBillboardRemovedIterator:(unsigned int)a3;
- (void)setStarted:(BOOL)a3;
- (void)startDetectUSBBillboardDevice;
@end

@implementation AccessoryUSBBillboardDeviceListener

- (AccessoryUSBBillboardDeviceListener)initWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AccessoryUSBBillboardDeviceListener;
  v6 = [(AccessoryUSBBillboardDeviceListener *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessoryUSBBillboardDeviceVIDPID = v4 | (v5 << 16);
    v6->_appleUSBHostBillboardDeviceNotify = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    accessoryUSBBillboardDeviceRegistryIDs = v7->_accessoryUSBBillboardDeviceRegistryIDs;
    v7->_accessoryUSBBillboardDeviceRegistryIDs = v8;

    objc_msgSend(NSString, "stringWithFormat:", @"%s-%x", "com.apple.coreaccessories.USBBillboardListener", v7->_accessoryUSBBillboardDeviceVIDPID);
    id v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    accessoryUSBBillboardDeviceListenerQueue = v7->_accessoryUSBBillboardDeviceListenerQueue;
    v7->_accessoryUSBBillboardDeviceListenerQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)dealloc
{
  [(AccessoryUSBBillboardDeviceListener *)self stopDetectUSBBillboardDevice];
  v3.receiver = self;
  v3.super_class = (Class)AccessoryUSBBillboardDeviceListener;
  [(AccessoryUSBBillboardDeviceListener *)&v3 dealloc];
}

- (BOOL)startDetectUSBBillboardDevice
{
  kern_return_t v20;
  BOOL v21;
  NSObject *v23;
  unsigned int v24;
  const char *v25;
  unsigned int v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  id v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int valuePtr;
  uint8_t buf[4];
  unsigned char v39[10];
  unsigned char v40[6];
  unsigned char v41[6];
  unsigned char v42[10];
  __int16 v43;
  __CFDictionary *v44;
  uint64_t v45;

  v45 = *MEMORY[0x263EF8340];
  unsigned int accessoryUSBBillboardDeviceVIDPID = self->_accessoryUSBBillboardDeviceVIDPID;
  v36 = (unsigned __int16)accessoryUSBBillboardDeviceVIDPID;
  valuePtr = HIWORD(accessoryUSBBillboardDeviceVIDPID);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = self->_accessoryUSBBillboardDeviceVIDPID;
    *(_DWORD *)buf = 136316162;
    *(void *)v39 = "-[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]";
    *(_WORD *)&v39[8] = 1024;
    *(_DWORD *)v40 = accessoryUSBBillboardDeviceVIDPID;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)v41 = valuePtr;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)v42 = v36;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v7;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s: vidpid = 0x%X (0x%x,0x%x), vs 0x%X", buf, 0x24u);
  }

  if (!self->_started)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (!v8->_appleUSBHostBillboardDeviceNotify)
    {
      v9 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
      v8->_appleUSBHostBillboardDeviceNotify = v9;
      IONotificationPortSetDispatchQueue(v9, (dispatch_queue_t)v8->_accessoryUSBBillboardDeviceListenerQueue);
    }
    id v10 = IOServiceMatching("AppleUSBHostBillboardDevice");
    if (v10)
    {
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        CFNumberRef v13 = CFNumberCreate(v11, kCFNumberSInt32Type, &valuePtr);
        CFDictionaryAddValue(Mutable, @"idVendor", v13);
        CFNumberRef v14 = CFNumberCreate(v11, kCFNumberSInt32Type, &v36);
        CFDictionaryAddValue(Mutable, @"idProduct", v14);
        v15 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        v16 = v15;
        if (!v15)
        {
          v23 = logObjectForModule();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v34 = self->_accessoryUSBBillboardDeviceVIDPID;
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v39 = accessoryUSBBillboardDeviceVIDPID;
            *(_WORD *)&v39[4] = 1024;
            *(_DWORD *)&v39[6] = valuePtr;
            *(_WORD *)v40 = 1024;
            *(_DWORD *)&v40[2] = v36;
            *(_WORD *)v41 = 1024;
            *(_DWORD *)&v41[2] = v34;
            _os_log_error_impl(&dword_222C74000, v23, OS_LOG_TYPE_ERROR, "Could not create parentMatchingDictionary, vidpid = 0x%X (0x%x,0x%x), vs 0x%X", buf, 0x1Au);
          }
          v16 = 0;
          goto LABEL_47;
        }
        CFDictionaryAddValue(v15, @"IOProviderClass", @"IOUSBHostInterface");
        CFDictionaryAddValue(v16, @"IOPropertyMatch", Mutable);
        CFDictionaryAddValue(v10, @"IOParentMatch", v16);
        CFRetain(v10);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v17 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = self->_accessoryUSBBillboardDeviceVIDPID;
          *(_DWORD *)buf = 136316418;
          *(void *)v39 = "-[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]";
          *(_WORD *)&v39[8] = 1024;
          *(_DWORD *)v40 = accessoryUSBBillboardDeviceVIDPID;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)v41 = valuePtr;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)v42 = v36;
          *(_WORD *)&v42[4] = 1024;
          *(_DWORD *)&v42[6] = v19;
          v43 = 2112;
          v44 = v10;
          _os_log_impl(&dword_222C74000, v17, OS_LOG_TYPE_DEFAULT, "%s: vidpid = 0x%X (0x%x,0x%x), vs 0x%X, matchingDictionary = %@", buf, 0x2Eu);
        }

        if (!IOServiceAddMatchingNotification(v8->_appleUSBHostBillboardDeviceNotify, "IOServicePublish", v10, (IOServiceMatchingCallback)__AppleUSBHostBillboardDeviceAdded, v8, &v8->_billboardAddedIterator))
        {
          __AppleUSBHostBillboardDeviceAdded(v8, v8->_billboardAddedIterator);
          CFRetain(v10);
          v20 = IOServiceAddMatchingNotification(v8->_appleUSBHostBillboardDeviceNotify, "IOServiceTerminate", v10, (IOServiceMatchingCallback)__AppleUSBHostBillboardDeviceTerminated, v8, &v8->_billboardRemovedIterator);
          if (!v20)
          {
            __AppleUSBHostBillboardDeviceTerminated(v8, v8->_billboardRemovedIterator);
            self->_started = 1;
            objc_sync_exit(v8);

            v21 = 1;
LABEL_28:
            CFRelease(v10);
            goto LABEL_29;
          }
          v23 = logObjectForModule();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_47;
          }
          v35 = self->_accessoryUSBBillboardDeviceVIDPID;
          *(_DWORD *)buf = 67110144;
          *(_DWORD *)v39 = v20;
          *(_WORD *)&v39[4] = 1024;
          *(_DWORD *)&v39[6] = accessoryUSBBillboardDeviceVIDPID;
          *(_WORD *)v40 = 1024;
          *(_DWORD *)&v40[2] = valuePtr;
          *(_WORD *)v41 = 1024;
          *(_DWORD *)&v41[2] = v36;
          *(_WORD *)v42 = 1024;
          *(_DWORD *)&v42[2] = v35;
          v27 = "Failed to AddMatchingNotification for Termination, ret 0x%x, vidpid = 0x%X (0x%x,0x%x), vs 0x%X";
          v28 = v23;
          v29 = 32;
          goto LABEL_61;
        }
        v23 = logObjectForModule();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v26 = self->_accessoryUSBBillboardDeviceVIDPID;
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v39 = accessoryUSBBillboardDeviceVIDPID;
          *(_WORD *)&v39[4] = 1024;
          *(_DWORD *)&v39[6] = valuePtr;
          *(_WORD *)v40 = 1024;
          *(_DWORD *)&v40[2] = v36;
          *(_WORD *)v41 = 1024;
          *(_DWORD *)&v41[2] = v26;
          *(_WORD *)v42 = 2112;
          *(void *)&v42[2] = v10;
          v27 = "Failed to GetMatchingNotification, vidpid = 0x%X (0x%x,0x%x), vs 0X%X, matchingDictionary %@";
          v28 = v23;
          v29 = 36;
LABEL_61:
          _os_log_error_impl(&dword_222C74000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
        }
LABEL_47:

        objc_sync_exit(v8);
        goto LABEL_48;
      }
      v23 = logObjectForModule();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_40:
        v16 = 0;
        Mutable = 0;
        goto LABEL_47;
      }
      v33 = self->_accessoryUSBBillboardDeviceVIDPID;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v39 = accessoryUSBBillboardDeviceVIDPID;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = valuePtr;
      *(_WORD *)v40 = 1024;
      *(_DWORD *)&v40[2] = v36;
      *(_WORD *)v41 = 1024;
      *(_DWORD *)&v41[2] = v33;
      v25 = "Could not create parentPropertyDictionary, vidpid = 0x%X (0x%x,0x%x), vs 0x%X";
    }
    else
    {
      v23 = logObjectForModule();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      v24 = self->_accessoryUSBBillboardDeviceVIDPID;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v39 = accessoryUSBBillboardDeviceVIDPID;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = valuePtr;
      *(_WORD *)v40 = 1024;
      *(_DWORD *)&v40[2] = v36;
      *(_WORD *)v41 = 1024;
      *(_DWORD *)&v41[2] = v24;
      v25 = "Could not create matchingDictionary, vidpid = 0x%X (0x%x,0x%x), vs 0x%X";
    }
    _os_log_error_impl(&dword_222C74000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0x1Au);
    goto LABEL_40;
  }
  logObjectForModule();
  v8 = (AccessoryUSBBillboardDeviceListener *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
  {
    v32 = self->_accessoryUSBBillboardDeviceVIDPID;
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v39 = accessoryUSBBillboardDeviceVIDPID;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = valuePtr;
    *(_WORD *)v40 = 1024;
    *(_DWORD *)&v40[2] = v36;
    *(_WORD *)v41 = 1024;
    *(_DWORD *)&v41[2] = v32;
    _os_log_error_impl(&dword_222C74000, &v8->super, OS_LOG_TYPE_ERROR, "Already started detecting billboard device, vidpid = 0x%X (0x%x,0x%x), vs 0x%X", buf, 0x1Au);
  }
  Mutable = 0;
  v16 = 0;
  id v10 = 0;
LABEL_48:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v30 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v30 = MEMORY[0x263EF8438];
    v31 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    [(AccessoryUSBBillboardDeviceListener *)accessoryUSBBillboardDeviceVIDPID startDetectUSBBillboardDevice];
  }

  [(AccessoryUSBBillboardDeviceListener *)self stopDetectUSBBillboardDevice];
  v21 = 0;
  if (v10) {
    goto LABEL_28;
  }
LABEL_29:
  if (v16) {
    CFRelease(v16);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v21;
}

- (BOOL)stopDetectUSBBillboardDevice
{
  v2 = self;
  objc_sync_enter(v2);
  appleUSBHostBillboardDeviceNotify = v2->_appleUSBHostBillboardDeviceNotify;
  if (appleUSBHostBillboardDeviceNotify)
  {
    IONotificationPortDestroy(appleUSBHostBillboardDeviceNotify);
    v2->_appleUSBHostBillboardDeviceNotify = 0;
  }
  io_object_t billboardAddedIterator = v2->_billboardAddedIterator;
  if (billboardAddedIterator)
  {
    IOObjectRelease(billboardAddedIterator);
    v2->_io_object_t billboardAddedIterator = 0;
  }
  io_object_t billboardRemovedIterator = v2->_billboardRemovedIterator;
  if (billboardRemovedIterator)
  {
    IOObjectRelease(billboardRemovedIterator);
    v2->_io_object_t billboardRemovedIterator = 0;
  }
  v2->_started = 0;
  objc_sync_exit(v2);

  return 1;
}

- (void)AppleUSBHostBillboardDeviceServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int v5 = +[AccessoryUSBBillboardDevice parentServiceVidPid:](AccessoryUSBBillboardDevice, "parentServiceVidPid:");
  unint64_t v6 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:v3];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unsigned int accessoryUSBBillboardDeviceVIDPID = self->_accessoryUSBBillboardDeviceVIDPID;
    int v17 = 136316162;
    id v18 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceArrived:]";
    __int16 v19 = 1024;
    int v20 = v3;
    __int16 v21 = 2048;
    unint64_t v22 = v6;
    __int16 v23 = 1024;
    unsigned int v24 = v5;
    __int16 v25 = 1024;
    unsigned int v26 = accessoryUSBBillboardDeviceVIDPID;
    _os_log_debug_impl(&dword_222C74000, v9, OS_LOG_TYPE_DEBUG, "%s: service %d, registryID 0x%llx, vidpid 0x%X vs 0x%X", (uint8_t *)&v17, 0x28u);
  }

  if (v5 == self->_accessoryUSBBillboardDeviceVIDPID)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      id v18 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceArrived:]";
      __int16 v19 = 1024;
      int v20 = v3;
      __int16 v21 = 2048;
      unint64_t v22 = v6;
      __int16 v23 = 1024;
      unsigned int v24 = v5;
      _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, vidpid 0x%X", (uint8_t *)&v17, 0x22u);
    }

    v12 = [NSNumber numberWithUnsignedLongLong:v6];
    if ([(NSMutableSet *)self->_accessoryUSBBillboardDeviceRegistryIDs containsObject:v12])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        CFNumberRef v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        CFNumberRef v13 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = self->_accessoryUSBBillboardDeviceVIDPID;
        int v17 = 136315906;
        id v18 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceArrived:]";
        __int16 v19 = 1024;
        int v20 = v3;
        __int16 v21 = 2048;
        unint64_t v22 = v6;
        __int16 v23 = 1024;
        unsigned int v24 = v15;
        _os_log_impl(&dword_222C74000, v13, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, vidpid 0x%X, Already in registryID list!", (uint8_t *)&v17, 0x22u);
      }
    }
    else
    {
      [(NSMutableSet *)self->_accessoryUSBBillboardDeviceRegistryIDs addObject:v12];
      CFNumberRef v13 = +[AccessoryUSBBillboardDeviceManager sharedManager];
      [v13 AppleUSBHostBillboardDeviceServiceArrived:v3 vidpid:self->_accessoryUSBBillboardDeviceVIDPID];
    }
  }
}

- (void)AppleUSBHostBillboardDeviceServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:](AccessoryUSBBillboardDevice, "getRegistryEntryIDFromService:");
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int accessoryUSBBillboardDeviceVIDPID = self->_accessoryUSBBillboardDeviceVIDPID;
    int v21 = 136315906;
    unint64_t v22 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceTerminated:]";
    __int16 v23 = 1024;
    int v24 = v3;
    __int16 v25 = 2048;
    unint64_t v26 = v5;
    __int16 v27 = 1024;
    unsigned int v28 = accessoryUSBBillboardDeviceVIDPID;
    _os_log_debug_impl(&dword_222C74000, v8, OS_LOG_TYPE_DEBUG, "%s: service %d, registryID 0x%llx, 0x%X", (uint8_t *)&v21, 0x22u);
  }

  v9 = [NSNumber numberWithUnsignedLongLong:v5];
  int v10 = [(NSMutableSet *)self->_accessoryUSBBillboardDeviceRegistryIDs containsObject:v9];
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v10)
  {
    if (v12)
    {
      CFNumberRef v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      CFNumberRef v13 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = self->_accessoryUSBBillboardDeviceVIDPID;
      int v21 = 136315906;
      unint64_t v22 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceTerminated:]";
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 2048;
      unint64_t v26 = v5;
      __int16 v27 = 1024;
      unsigned int v28 = v16;
      _os_log_impl(&dword_222C74000, v13, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, 0x%X", (uint8_t *)&v21, 0x22u);
    }

    int v17 = +[AccessoryUSBBillboardDeviceManager sharedManager];
    [v17 AppleUSBHostBillboardDeviceServiceTerminated:v3 vidpid:self->_accessoryUSBBillboardDeviceVIDPID];

    [(NSMutableSet *)self->_accessoryUSBBillboardDeviceRegistryIDs removeObject:v9];
  }
  else
  {
    if (v12)
    {
      id v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = self->_accessoryUSBBillboardDeviceVIDPID;
      int v21 = 136315906;
      unint64_t v22 = "-[AccessoryUSBBillboardDeviceListener AppleUSBHostBillboardDeviceServiceTerminated:]";
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 2048;
      unint64_t v26 = v5;
      __int16 v27 = 1024;
      unsigned int v28 = v19;
      _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, vidpid 0x%X, Not in registryID list!", (uint8_t *)&v21, 0x22u);
    }
  }
}

- (IONotificationPort)appleUSBHostBillboardDeviceNotify
{
  return self->_appleUSBHostBillboardDeviceNotify;
}

- (void)setAppleUSBHostBillboardDeviceNotify:(IONotificationPort *)a3
{
  self->_appleUSBHostBillboardDeviceNotify = a3;
}

- (unsigned)billboardAddedIterator
{
  return self->_billboardAddedIterator;
}

- (void)setBillboardAddedIterator:(unsigned int)a3
{
  self->_io_object_t billboardAddedIterator = a3;
}

- (unsigned)billboardRemovedIterator
{
  return self->_billboardRemovedIterator;
}

- (void)setBillboardRemovedIterator:(unsigned int)a3
{
  self->_io_object_t billboardRemovedIterator = a3;
}

- (OS_dispatch_queue)accessoryUSBBillboardDeviceListenerQueue
{
  return self->_accessoryUSBBillboardDeviceListenerQueue;
}

- (void)setAccessoryUSBBillboardDeviceListenerQueue:(id)a3
{
}

- (unsigned)accessoryUSBBillboardDeviceVIDPID
{
  return self->_accessoryUSBBillboardDeviceVIDPID;
}

- (void)setAccessoryUSBBillboardDeviceVIDPID:(unsigned int)a3
{
  self->_unsigned int accessoryUSBBillboardDeviceVIDPID = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSMutableSet)accessoryUSBBillboardDeviceRegistryIDs
{
  return self->_accessoryUSBBillboardDeviceRegistryIDs;
}

- (void)setAccessoryUSBBillboardDeviceRegistryIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUSBBillboardDeviceRegistryIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUSBBillboardDeviceListenerQueue, 0);
}

- (void)startDetectUSBBillboardDevice
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_222C74000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end