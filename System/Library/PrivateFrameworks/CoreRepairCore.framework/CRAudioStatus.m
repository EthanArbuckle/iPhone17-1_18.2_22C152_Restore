@interface CRAudioStatus
- (BOOL)isComponentFailed;
- (CRAudioStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRAudioStatus

- (CRAudioStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRAudioStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Audio", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (objc_msgSend_isComponentFailed(self, a2, v2, v3)) {
    return -1;
  }
  else {
    return 1;
  }
}

- (BOOL)isComponentFailed
{
  kern_return_t MatchingServices;
  kern_return_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v12;
  io_iterator_t existing;
  uint8_t buf[4];
  kern_return_t v15;
  void *v16;
  void *v17;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x263EF8340];
  values = @"Speaker";
  keys[0] = @"AudioHardwareError";
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  uint64_t v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v16 = v5;
  v17 = @"IOPropertyMatch";
  CFDictionaryRef v6 = CFDictionaryCreate(v2, (const void **)&v17, (const void **)&v16, 1, v3, v4);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v6, &existing);
  if (MatchingServices)
  {
    v8 = MatchingServices;
    v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v8;
      _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "No AudioHardwareError Speaker IO registry, error: %d", buf, 8u);
    }
  }
  else if (existing)
  {
    v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E390();
    }

    IOObjectRelease(existing);
    v10 = 1;
    if (v5) {
      goto LABEL_6;
    }
    return v10;
  }
  v10 = 0;
  if (v5) {
LABEL_6:
  }
    CFRelease(v5);
  return v10;
}

@end