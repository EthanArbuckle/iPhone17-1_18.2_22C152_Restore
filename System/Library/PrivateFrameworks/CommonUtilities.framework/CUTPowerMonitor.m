@interface CUTPowerMonitor
+ (id)sharedInstance;
- (BOOL)_initIOService;
- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3;
- (BOOL)isExternalPowerConnected;
- (double)batteryPercentRemaining;
- (id)_init;
- (void)_handlePowerChangedNotificationWithMessageType:(unsigned int)a3 notificationID:(void *)a4;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3;
- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3;
@end

@implementation CUTPowerMonitor

+ (id)sharedInstance
{
  if (qword_1EB272A98 != -1) {
    dispatch_once(&qword_1EB272A98, &unk_1EF6C4300);
  }
  v2 = (void *)qword_1EB272A68;
  return v2;
}

- (BOOL)isExternalPowerConnected
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = *((unsigned char *)v2->_internal + 64);
  objc_sync_exit(v2);

  return v3;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [*((id *)v5->_internal + 6) removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)*((void *)v5->_internal + 6);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      internal = v5->_internal;
      v9 = (void *)internal[6];
      internal[6] = v7;

      id v6 = (void *)*((void *)v5->_internal + 6);
    }
    [v6 addObject:v10];
    objc_sync_exit(v5);

    id v4 = v10;
  }
}

- (void)_handlePowerChangedNotificationWithMessageType:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 == -536870288 || a3 == -536870272)
  {
    io_connect_t v11 = *((_DWORD *)self->_internal + 7);
    IOAllowPowerChange(v11, (intptr_t)a4);
  }
  else if (a3 == -536870144)
  {
    id v4 = self;
    objc_sync_enter(v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *((id *)v4->_internal + 6);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v10 = dispatch_get_global_queue(0, 0);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = sub_1A3564094;
          v12[3] = &unk_1E5AFEC10;
          v12[4] = v9;
          v12[5] = v4;
          dispatch_async(v10, v12);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    objc_sync_exit(v4);
  }
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)CUTPowerMonitor;
  v2 = [(CUTPowerMonitor *)&v7 init];
  if (v2)
  {
    char v3 = objc_alloc_init(_CUTPowerMonitor);
    id internal = v2->_internal;
    v2->_id internal = v3;

    *((void *)v2->_internal + 7) = 0xBFF0000000000000;
    if (![(CUTPowerMonitor *)v2 _initIOService])
    {
      p_super = &v2->super;
      v2 = 0;
      goto LABEL_6;
    }
    *((_DWORD *)v2->_internal + 7) = IORegisterForSystemPower(0, (IONotificationPortRef *)v2->_internal + 4, (IOServiceInterestCallback)sub_1A35641D0, (io_object_t *)v2->_internal + 10);
    if (*((_DWORD *)v2->_internal + 7))
    {
      p_super = dispatch_queue_create("CUTPowerMonitor-IOPowerManagement", 0);
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v2->_internal + 4), p_super);
LABEL_6:
    }
  }
  return v2;
}

- (BOOL)_initIOService
{
  mach_port_t v3 = *MEMORY[0x1E4F2EF00];
  *((void *)self->_internal + 2) = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
  *((void *)self->_internal + 1) = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)self->_internal + 2));
  if (*((void *)self->_internal + 1))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, *((CFRunLoopSourceRef *)self->_internal + 1), (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
    uint64_t MatchingService = IOServiceGetMatchingService(v3, v5);
    if (!IOServiceAddInterestNotification(*((IONotificationPortRef *)self->_internal + 2), MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_1A3564350, 0, (io_object_t *)self->_internal + 6))
    {
      [(CUTPowerMonitor *)self updateBatteryLevelWithBatteryEntry:MatchingService];
      [(CUTPowerMonitor *)self _updateBatteryConnectedStateWithBatteryEntry:MatchingService];
      LOBYTE(v7) = 1;
      return v7;
    }
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v7)
    {
      sub_1A3565310();
LABEL_7:
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v7)
    {
      sub_1A35652C8();
      goto LABEL_7;
    }
  }
  return v7;
}

- (void)dealloc
{
  Main = CFRunLoopGetMain();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D418];
  if (CFRunLoopContainsSource(Main, *((CFRunLoopSourceRef *)self->_internal + 1), (CFRunLoopMode)*MEMORY[0x1E4F1D418]))
  {
    CFDictionaryRef v5 = CFRunLoopGetMain();
    CFRunLoopRemoveSource(v5, *((CFRunLoopSourceRef *)self->_internal + 1), v4);
  }
  id internal = self->_internal;
  BOOL v7 = (IONotificationPort *)*((void *)internal + 2);
  if (v7)
  {
    IONotificationPortDestroy(v7);
    *((void *)self->_internal + 2) = 0;
    id internal = self->_internal;
  }
  io_object_t v8 = *((_DWORD *)internal + 6);
  if (v8)
  {
    IOObjectRelease(v8);
    *((_DWORD *)self->_internal + 6) = 0;
    id internal = self->_internal;
  }
  if (*((_DWORD *)internal + 7))
  {
    IODeregisterForSystemPower((io_object_t *)internal + 10);
    IONotificationPortDestroy(*((IONotificationPortRef *)self->_internal + 4));
    IOServiceClose(*((_DWORD *)self->_internal + 7));
    *((_DWORD *)self->_internal + 7) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CUTPowerMonitor;
  [(CUTPowerMonitor *)&v9 dealloc];
}

- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((_DWORD *)obj->_internal + 11) = a3;
  *((void *)obj->_internal + 7) = 0xBFF0000000000000;
  objc_sync_exit(obj);
}

- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  CFStringRef v4 = self;
  objc_sync_enter(v4);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v6 = CFProperty;
  if (CFProperty)
  {
    int v7 = [CFProperty BOOLValue];
    id internal = v4->_internal;
    int v9 = internal[64];
    BOOL v10 = v9 != v7;
    if (v9 != v7) {
      internal[64] = v7;
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v10 = 0;
  }
  objc_sync_exit(v4);

  return v10;
}

- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(CUTPowerMonitor *)self _updateBatteryConnectedStateWithBatteryEntry:*(void *)&a3])
  {
    CFStringRef v4 = self;
    objc_sync_enter(v4);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *((id *)v4->_internal + 6);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          BOOL v10 = dispatch_get_global_queue(0, 0);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = sub_1A35647CC;
          v11[3] = &unk_1E5AFEC10;
          v11[4] = v9;
          v11[5] = v4;
          dispatch_async(v10, v11);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    objc_sync_exit(v4);
  }
}

- (double)batteryPercentRemaining
{
  v2 = self;
  objc_sync_enter(v2);
  id internal = v2->_internal;
  if (*((double *)internal + 7) != -1.0) {
    goto LABEL_12;
  }
  io_registry_entry_t v4 = *((_DWORD *)internal + 11);
  if (!v4) {
    goto LABEL_12;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"MaxCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(v4, @"CurrentCapacity", v5, 0);
  uint64_t v8 = v7;
  if (CFProperty) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    *((void *)v2->_internal + 7) = 0xBFF0000000000000;
    if (!CFProperty) {
      goto LABEL_10;
    }
  }
  else
  {
    [v7 doubleValue];
    double v11 = v10;
    [CFProperty doubleValue];
    *((double *)v2->_internal + 7) = v11 / v12;
    *((_DWORD *)v2->_internal + 11) = 0;
  }
  CFRelease(CFProperty);
LABEL_10:
  if (v8) {
    CFRelease(v8);
  }
LABEL_12:
  double v13 = *((double *)v2->_internal + 7);
  objc_sync_exit(v2);

  return v13;
}

- (void).cxx_destruct
{
}

@end