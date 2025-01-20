@interface IOKService
+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withEnumerationBlock:(id)a7;
+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withHandler:(id)a7;
+ (id)bsdNameMatching:(id)a3;
+ (id)entryIDMatching:(unint64_t)a3;
+ (id)matchingService:(id)a3;
+ (id)matchingServices:(id)a3 error:(id *)a4;
+ (id)nameMatching:(id)a3;
+ (id)serviceMatching:(id)a3;
- (BOOL)isServiceAuthorizedForOpenAllowInteraction:(BOOL)a3;
- (BOOL)matchesPropertyTable:(id)a3 error:(id *)a4;
- (BOOL)requestProbeWithOptions:(unsigned int)a3 error:(id *)a4;
- (id)addInterestNotifcationOfType:(id)a3 usingNotificationPort:(id)a4 error:(id *)a5 withHandler:(id)a6;
- (id)connectToServiceOfType:(unsigned int)a3;
- (unsigned)busyState;
@end

@implementation IOKService

- (id)addInterestNotifcationOfType:(id)a3 usingNotificationPort:(id)a4 error:(id *)a5 withHandler:(id)a6
{
  kern_return_t v20;
  void *v21;
  NSObject *v23;
  io_object_t notification;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  uint64_t vars8;

  v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  notification = 0;
  if (!v11)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v26 = "notificationPort";
    v27 = 2048;
    v28 = 0;
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_22095DF33;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v35 = 1024;
    v36 = 304;
    v23 = &_os_log_internal;
LABEL_22:
    _os_log_impl(&dword_220957000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_23;
  }
  v13 = [v11 queue];

  if (!v13)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v26 = "notificationPort.queue";
    v27 = 2048;
    v28 = 0;
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_22095DF33;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v35 = 1024;
    v36 = 305;
    v23 = &_os_log_internal;
    goto LABEL_22;
  }
  if (!v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v26 = "handler";
      v27 = 2048;
      v28 = 0;
      v29 = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = &unk_22095DF33;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v35 = 1024;
      v36 = 306;
      v23 = &_os_log_internal;
      goto LABEL_22;
    }
LABEL_23:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = objc_alloc_init(IOKInterestNotification);
  v15 = (IONotificationPort *)[v11 port];
  io_service_t v16 = [(IOKObject *)self object];
  id v17 = v10;
  v18 = (const char *)[v10 UTF8String];
  v19 = [(IOKInterestNotification *)v14 notificationRef];
  v20 = IOServiceAddInterestNotification(v15, v16, v18, (IOServiceInterestCallback)ServiceInterestCallback, v19, &notification);

  if (v20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
    }
    id v10 = v17;
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v20 userInfo:0];
    }
    v21 = v14;
    v14 = 0;
  }
  else
  {
    [(IOKInterestNotification *)v14 setHandler:v12];
    [(IOKInterestNotification *)v14 setObject:notification];
    v21 = [v11 queue];
    [(IOKInterestNotification *)v14 setQueue:v21];
    id v10 = v17;
  }

  if (notification) {
    IOObjectRelease(notification);
  }
LABEL_13:

  return v14;
}

+ (id)serviceMatching:(id)a3
{
  CFMutableDictionaryRef v3 = IOServiceMatching((const char *)[a3 UTF8String]);

  return v3;
}

+ (id)nameMatching:(id)a3
{
  CFMutableDictionaryRef v3 = IOServiceNameMatching((const char *)[a3 UTF8String]);

  return v3;
}

+ (id)bsdNameMatching:(id)a3
{
  CFMutableDictionaryRef v3 = IOBSDNameMatching(*MEMORY[0x263F0EC90], 0, (const char *)[a3 UTF8String]);

  return v3;
}

+ (id)entryIDMatching:(unint64_t)a3
{
  CFMutableDictionaryRef v3 = IORegistryEntryIDMatching(a3);

  return v3;
}

+ (id)matchingService:(id)a3
{
  id v3 = a3;
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = (const __CFDictionary *)v3;
  uint64_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithServiceEntry:MatchingService];
    IOObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)matchingServices:(id)a3 error:(id *)a4
{
  kern_return_t MatchingServices;
  kern_return_t v9;
  IOKIterator *v10;
  IOKIterator *v11;
  io_iterator_t existing;
  uint64_t vars8;

  id v5 = a3;
  existing = 0;
  mach_port_t v6 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v7 = (const __CFDictionary *)v5;
  MatchingServices = IOServiceGetMatchingServices(v6, v7, &existing);
  if (MatchingServices)
  {
    v9 = MatchingServices;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    id v10 = 0;
  }
  else
  {
    id v11 = [IOKIterator alloc];
    id v10 = [(IOKIterator *)v11 initWithIterator:existing];
  }
LABEL_8:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v10;
}

+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withHandler:(id)a7
{
  kern_return_t v23;
  void *v24;
  IOKIterator *v25;
  IOKIterator *v26;
  NSObject *v28;
  io_iterator_t notification;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;
  uint64_t vars8;

  v42 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  notification = 0;
  if (!v13)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v31 = "notificationPort";
    v32 = 2048;
    v33 = 0;
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = &unk_22095DF33;
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v40 = 1024;
    v41 = 184;
    v28 = &_os_log_internal;
LABEL_22:
    _os_log_impl(&dword_220957000, v28, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_23;
  }
  v15 = [v13 queue];

  if (!v15)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v31 = "notificationPort.queue";
    v32 = 2048;
    v33 = 0;
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = &unk_22095DF33;
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v40 = 1024;
    v41 = 185;
    v28 = &_os_log_internal;
    goto LABEL_22;
  }
  if (!v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v31 = "handler";
      v32 = 2048;
      v33 = 0;
      v34 = 2048;
      v35 = 0;
      v36 = 2080;
      v37 = &unk_22095DF33;
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v40 = 1024;
      v41 = 186;
      v28 = &_os_log_internal;
      goto LABEL_22;
    }
LABEL_23:
    io_service_t v16 = 0;
    goto LABEL_13;
  }
  io_service_t v16 = objc_alloc_init(IOKMatchingNotification);
  id v17 = (IONotificationPort *)[v13 port];
  id v18 = v11;
  v19 = (const char *)[v11 UTF8String];
  id v20 = v12;
  CFDictionaryRef v21 = (const __CFDictionary *)v12;
  v22 = [(IOKMatchingNotification *)v16 notificationRef];
  v23 = IOServiceAddMatchingNotification(v17, v19, v21, (IOServiceMatchingCallback)ServiceMatchingCallback, v22, &notification);

  if (v23)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
    }
    id v11 = v18;
    id v12 = v20;
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v23 userInfo:0];
    }
    v24 = v16;
    io_service_t v16 = 0;
  }
  else
  {
    [(IOKMatchingNotification *)v16 setHandler:v14];
    v25 = [IOKIterator alloc];
    v26 = [(IOKIterator *)v25 initWithIterator:notification];
    [(IOKMatchingNotification *)v16 setIterator:v26];

    v24 = [v13 queue];
    [(IOKMatchingNotification *)v16 setQueue:v24];
    id v11 = v18;
    id v12 = v20;
  }

  if (notification) {
    IOObjectRelease(notification);
  }
LABEL_13:

  return v16;
}

+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withEnumerationBlock:(id)a7
{
  kern_return_t v23;
  IOKMatchingNotification *v24;
  IOKIterator *v25;
  IOKIterator *v26;
  void *v27;
  NSObject *v29;
  void v30[4];
  IOKMatchingNotification *v31;
  io_iterator_t notification;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;
  uint64_t vars8;

  v45 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  notification = 0;
  if (!v13)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v34 = "notificationPort";
    v35 = 2048;
    v36 = 0;
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_22095DF33;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v43 = 1024;
    v44 = 224;
    v29 = &_os_log_internal;
LABEL_22:
    _os_log_impl(&dword_220957000, v29, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_23;
  }
  v15 = [v13 queue];

  if (!v15)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316418;
    v34 = "notificationPort.queue";
    v35 = 2048;
    v36 = 0;
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_22095DF33;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v43 = 1024;
    v44 = 225;
    v29 = &_os_log_internal;
    goto LABEL_22;
  }
  if (!v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v34 = "iteratorEnumerationBlock";
      v35 = 2048;
      v36 = 0;
      v37 = 2048;
      v38 = 0;
      v39 = 2080;
      v40 = &unk_22095DF33;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v43 = 1024;
      v44 = 226;
      v29 = &_os_log_internal;
      goto LABEL_22;
    }
LABEL_23:
    io_service_t v16 = 0;
    goto LABEL_13;
  }
  io_service_t v16 = objc_alloc_init(IOKMatchingNotification);
  id v17 = (IONotificationPort *)[v13 port];
  id v18 = v11;
  v19 = (const char *)[v11 UTF8String];
  id v20 = v12;
  CFDictionaryRef v21 = (const __CFDictionary *)v12;
  v22 = [(IOKMatchingNotification *)v16 notificationRef];
  v23 = IOServiceAddMatchingNotification(v17, v19, v21, (IOServiceMatchingCallback)ServiceMatchingCallback, v22, &notification);

  if (v23)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
    }
    id v11 = v18;
    id v12 = v20;
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v23 userInfo:0];
    }
    v24 = v16;
    io_service_t v16 = 0;
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __97__IOKService_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock___block_invoke;
    v30[3] = &unk_26456E7F8;
    v31 = (IOKMatchingNotification *)v14;
    [(IOKMatchingNotification *)v16 setHandler:v30];
    v25 = [IOKIterator alloc];
    v26 = [(IOKIterator *)v25 initWithIterator:notification];
    [(IOKMatchingNotification *)v16 setIterator:v26];

    v27 = [v13 queue];
    [(IOKMatchingNotification *)v16 setQueue:v27];

    v24 = v31;
    id v11 = v18;
    id v12 = v20;
  }

  if (notification) {
    IOObjectRelease(notification);
  }
LABEL_13:

  return v16;
}

void __97__IOKService_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x223C6B730]();
  [v4 enumerateWithBlock:*(void *)(a1 + 32)];
}

- (BOOL)matchesPropertyTable:(id)a3 error:(id *)a4
{
  kern_return_t matched;
  id v8;
  BOOL result;
  BOOLean_t matches;

  matches = 0;
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  matched = IOServiceMatchPropertyTable([(IOKObject *)self object], v6, &matches);

  if (!matched) {
    return matches != 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[IOKConnection setNotificationPort:ofType:withReference:error:]();
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
LABEL_4:
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:matched userInfo:0];
    result = 0;
    *a4 = v8;
    return result;
  }
  return 0;
}

- (unsigned)busyState
{
  uint32_t busyState = 0;
  IOServiceGetBusyState([(IOKObject *)self object], &busyState);
  return busyState;
}

- (id)connectToServiceOfType:(unsigned int)a3
{
  id v3 = [[IOKConnection alloc] initWithService:self andType:*(void *)&a3];

  return v3;
}

- (BOOL)requestProbeWithOptions:(unsigned int)a3 error:(id *)a4
{
  int v5 = MEMORY[0x223C6B680]([(IOKObject *)self object], *(void *)&a3);
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a4) {
        return v5 == 0;
      }
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v5 userInfo:0];
    }
  }
  return v5 == 0;
}

- (BOOL)isServiceAuthorizedForOpenAllowInteraction:(BOOL)a3
{
  return IOServiceAuthorize([(IOKObject *)self object], a3) == 0;
}

@end