@interface NSMachPort(NSMachPort)
+ (id)port;
+ (id)portWithMachPort:()NSMachPort;
+ (id)portWithMachPort:()NSMachPort options:;
+ (uint64_t)sendBeforeTime:()NSMachPort streamData:components:to:from:msgid:reserved:;
- (BOOL)isEqual:()NSMachPort;
- (BOOL)isValid;
- (CFHashCode)hash;
- (CFIndex)retainCount;
- (uint64_t)_isDeallocating;
- (uint64_t)_tryRetain;
- (uint64_t)delegate;
- (uint64_t)init;
- (uint64_t)initWithMachPort:()NSMachPort;
- (uint64_t)isKindOfClass:()NSMachPort;
- (uint64_t)isMemberOfClass:()NSMachPort;
- (uint64_t)machPort;
- (uint64_t)sendBeforeDate:()NSMachPort components:from:reserved:;
- (uint64_t)sendBeforeDate:()NSMachPort msgid:components:from:reserved:;
- (uint64_t)sendBeforeTime:()NSMachPort streamData:components:from:msgid:;
- (unint64_t)retain;
- (void)initWithMachPort:()NSMachPort options:;
- (void)invalidate;
- (void)release;
- (void)removeFromRunLoop:()NSMachPort forMode:;
- (void)scheduleInRunLoop:()NSMachPort forMode:;
- (void)setDelegate:()NSMachPort;
@end

@implementation NSMachPort(NSMachPort)

- (unint64_t)retain
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0)
  {
    return (unint64_t *)CFRetain(a1);
  }
  else
  {
    [a1 _increaseRetainCountWithLock:&_NSGlobalRetainLock];
    if (*MEMORY[0x1E4F1CBC0]) {
      __CFRecordAllocationEvent();
    }
    return a1;
  }
}

- (void)release
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v3 = atomic_load(a1 + 1)) != 0)
  {
    CFRelease(a1);
  }
  else
  {
    if (*MEMORY[0x1E4F1CBC0]) {
      __CFRecordAllocationEvent();
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__NSMachPort_NSMachPort__release__block_invoke;
    v4[3] = &unk_1E51F71D0;
    v4[4] = a1;
    [a1 _decreaseRetainCountAndMaybeDeallocWithLock:&_NSGlobalRetainLock andPerformWhenZero:v4];
  }
}

- (uint64_t)isKindOfClass:()NSMachPort
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3) {
        return 1;
      }
    }
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1ECAF4F08;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isKindOfClass_, a3);
}

- (uint64_t)machPort
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0)
  {
    return CFMachPortGetPort((CFMachPortRef)a1);
  }
  else
  {
    return [a1 _machPort];
  }
}

+ (id)port
{
  v1 = (void *)[objc_allocWithZone(a1) init];

  return v1;
}

- (uint64_t)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  mach_port_name_t name = 0;
  uint64_t v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name)) {
    goto LABEL_4;
  }
  if (mach_port_insert_right(*v2, name, name, 0x14u))
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
LABEL_4:
    v4.receiver = a1;
    v4.super_class = (Class)&off_1ECAF4F08;
    objc_msgSendSuper2(&v4, sel_dealloc);
    return 0;
  }
  uint64_t result = [a1 initWithMachPort:name options:3];
  if (!result)
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
    mach_port_deallocate(*v2, name);
    return 0;
  }
  return result;
}

- (void)initWithMachPort:()NSMachPort options:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_1ECAF4F08;
    objc_msgSendSuper2(&v16, sel_dealloc);
    return 0;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class())
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1ECAF4F08;
    objc_super v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 _setFlags:a4 & 3];
    [v8 _setMachPort:a3];
    return v8;
  }

  unint64_t v10 = (unint64_t)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040E1DEC455uLL);
  if (!v10) {
    return 0;
  }
  v11 = (void *)v10;
  *(void *)(v10 + 8) = 0;
  *(void *)(v10 + 16) = a4 & 3;
  *(void *)(v10 + 24) = ~v10;
  *(void *)(v10 + 32) = v10;
  *(_DWORD *)(v10 + 40) = a3;
  Boolean shouldFreeInfo = 0;
  context.version = 0;
  context.info = (void *)v10;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))__destroyPortContext;
  context.copyDescription = 0;
  objc_super v8 = CFMachPortCreateWithPort(0, a3, (CFMachPortCallBack)__NSFireMachPort, &context, &shouldFreeInfo);
  if (v8 && (_cfmp_record_nsmachport_is_interested(), !shouldFreeInfo))
  {
    mach_port_type_t ptype = 0;
    if (!mach_port_type(*MEMORY[0x1E4F14960], a3, &ptype) && (ptype & 0x50000) != 0) {
      CFMachPortSetInvalidationCallBack((CFMachPortRef)v8, (CFMachPortInvalidationCallBack)_NSPortDeathNotify);
    }
  }
  else
  {
    free(v11);
  }
  return v8;
}

- (void)invalidate
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v8 = atomic_load(a1 + 1)) != 0)
  {
    if (CFMachPortIsValid((CFMachPortRef)a1))
    {
      CFMachPortInvalidate((CFMachPortRef)a1);
    }
  }
  else
  {
    [a1 setDelegate:0];
    mach_port_name_t v3 = [a1 _machPort];
    if (v3)
    {
      mach_port_name_t v4 = v3;
      char v5 = [a1 _flags];
      uint64_t v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
      if ((v5 & 2) != 0) {
        mach_port_mod_refs(*MEMORY[0x1E4F14960], v4, 1u, -1);
      }
      if (v5) {
        mach_port_deallocate(*v6, v4);
      }
      [a1 _setMachPort:0];
      uint64_t v7 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v7 postNotificationName:@"NSPortDidBecomeInvalidNotification" object:a1 userInfo:0];
    }
  }
}

- (void)setDelegate:()NSMachPort
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (unint64_t v6 = atomic_load(a1 + 1)) != 0)
  {
    memset(&v7.info, 0, 32);
    if (CFMachPortIsValid((CFMachPortRef)a1))
    {
      v7.version = 0;
      CFMachPortGetContext((CFMachPortRef)a1, &v7);
      if (v7.info)
      {
        if (*((void *)v7.info + 4) == ~*((void *)v7.info + 3)) {
          *((void *)v7.info + 1) = a3;
        }
      }
    }
  }
  else
  {
    [a1 _setDelegate:a3];
  }
}

- (void)scheduleInRunLoop:()NSMachPort forMode:
{
  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (unint64_t v9 = atomic_load(a1 + 1)) == 0)
    {
      objc_super v12 = NSClassFromString((NSString *)@"NSMachPort");
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }
    RunLoopSource = CFMachPortCreateRunLoopSource(0, (CFMachPortRef)a1, 200);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, a4);
      CFRelease(v11);
    }
  }
}

+ (id)portWithMachPort:()NSMachPort
{
  mach_port_name_t v3 = (void *)[objc_allocWithZone(a1) initWithMachPort:a3];

  return v3;
}

+ (id)portWithMachPort:()NSMachPort options:
{
  mach_port_name_t v4 = (void *)[objc_allocWithZone(a1) initWithMachPort:a3 options:a4];

  return v4;
}

- (BOOL)isEqual:()NSMachPort
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (unint64_t v7 = atomic_load(a1 + 1)) != 0) {
    return CFEqual(a1, a3) != 0;
  }
  else {
    return a1 == a3;
  }
}

- (CFHashCode)hash
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    return [a1 _machPort];
  }
  if (!atomic_load(a1 + 1)) {
    return [a1 _machPort];
  }

  return CFHash(a1);
}

- (uint64_t)_isDeallocating
{
  return 1;
}

- (uint64_t)_tryRetain
{
  return 0;
}

- (CFIndex)retainCount
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    return [a1 _retainCount] + 1;
  }
  if (!atomic_load(a1 + 1)) {
    return [a1 _retainCount] + 1;
  }

  return CFGetRetainCount(a1);
}

- (uint64_t)isMemberOfClass:()NSMachPort
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3) {
        return 1;
      }
    }
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1ECAF4F08;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isMemberOfClass_, a3);
}

- (BOOL)isValid
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0) {
    int IsValid = CFMachPortIsValid((CFMachPortRef)a1);
  }
  else {
    int IsValid = [a1 _machPort];
  }
  return IsValid != 0;
}

- (uint64_t)delegate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0)
  {
    memset(&v5, 0, sizeof(v5));
    CFMachPortGetContext((CFMachPortRef)a1, &v5);
    uint64_t result = 0;
    if (*((void *)v5.info + 4) == ~*((void *)v5.info + 3)) {
      return *((void *)v5.info + 1);
    }
  }
  else
  {
    return [a1 _delegate];
  }
  return result;
}

+ (uint64_t)sendBeforeTime:()NSMachPort streamData:components:to:from:msgid:reserved:
{
  mach_msg_return_t v40;
  uint64_t result;
  void *v42;
  __CFString *v43;
  NSString *v44;
  unsigned char v49[128];
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  uint64_t v54;

  uint64_t v9 = a7;
  v11 = a4;
  v54 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    uint64_t v13 = a4 != 0;
    if (objc_opt_respondsToSelector())
    {
      size_t v17 = 40;
      goto LABEL_22;
    }
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      size_t v17 = 44;
      goto LABEL_22;
    }
LABEL_21:
    size_t v17 = 28;
    goto LABEL_22;
  }
  uint64_t v13 = [a5 count];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  uint64_t v14 = [a5 countByEnumeratingWithState:&v50 objects:v49 count:16];
  if (!v14) {
    goto LABEL_21;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v51;
  size_t v17 = 28;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(a5);
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = 12;
      }
      else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v19 = 16;
      }
      else
      {
        uint64_t v19 = 0;
      }
      v17 += v19;
    }
    uint64_t v15 = [a5 countByEnumeratingWithState:&v50 objects:v49 count:16];
  }
  while (v15);
  uint64_t v9 = a7;
LABEL_22:
  v20 = (char *)malloc_type_calloc(1uLL, v17, 0x52B02C87uLL);
  v21 = (mach_msg_header_t *)v20;
  *(void *)(v20 + 4) = 28;
  *((_DWORD *)v20 + 3) = 0;
  *((_DWORD *)v20 + 5) = 0;
  *((_DWORD *)v20 + 6) = v13;
  if (!v13) {
    goto LABEL_37;
  }
  uint64_t v22 = 0;
  v23 = v20 + 28;
  do
  {
    v24 = v11;
    if (a5) {
      v24 = (void *)[a5 objectAtIndex:v22];
    }
    if (objc_opt_respondsToSelector())
    {
      *(_DWORD *)v23 = [v24 machPort];
      *((_WORD *)v23 + 5) = 19;
      v23 += 12;
    }
    else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v25 = v11;
      uint64_t v26 = [v24 length];
      uint64_t v27 = [v24 bytes];
      uint64_t v28 = a9;
      if (v22) {
        uint64_t v28 = 0;
      }
      unint64_t v29 = v26 - v28;
      v11 = v25;
      *(void *)v23 = v27 + v28;
      *((_DWORD *)v23 + 2) = ((v29 >= *MEMORY[0x1E4F14B00] >> 1) << 8) | (v23[10] << 16) | 0x1000000;
      *((_DWORD *)v23 + 3) = v29;
      v23 += 16;
    }
    else
    {
      uint64_t v30 = objc_opt_class();
      NSLog((NSString *)@"*** D.O. message send ignoring unknown component type '%@'", v30);
      --v21[1].msgh_bits;
    }
    ++v22;
  }
  while (v13 != v22);
  mach_msg_bits_t msgh_bits = v21[1].msgh_bits;
  v21->msgh_size += 16 * msgh_bits;
  uint64_t v9 = a7;
  if (msgh_bits) {
    unsigned int v32 = 0x80000000;
  }
  else {
LABEL_37:
  }
    unsigned int v32 = 0;
  v21->mach_msg_bits_t msgh_bits = v32;
  double v33 = a1 - CFAbsoluteTimeGetCurrent();
  mach_port_t v34 = a6;
  if (v33 < 0.0)
  {
    unint64_t v35 = 0;
    if (!a6) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v33 >= 4294967.29)
  {
    unint64_t v35 = 0xFFFFFFFFLL;
    if (!a6) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  unint64_t v35 = vcvtmd_u64_f64(v33 * 1000.0) + 3;
  if (a6) {
LABEL_45:
  }
    mach_port_t v34 = [a6 machPort];
LABEL_46:
  v21->msgh_remote_port = v34;
  if (v9)
  {
    mach_port_t v36 = [v9 machPort];
    v21->msgh_local_port = v36;
    v21->msgh_id = a8;
    if (v36)
    {
      int v37 = 5139;
      goto LABEL_51;
    }
  }
  else
  {
    v21->msgh_local_port = 0;
    v21->msgh_id = a8;
  }
  int v37 = 19;
LABEL_51:
  mach_msg_size_t msgh_size = v21->msgh_size;
  v21->msgh_bits |= v37;
  if (v35 == 0xFFFFFFFF) {
    mach_msg_option_t v39 = 1;
  }
  else {
    mach_msg_option_t v39 = 17;
  }
  v40 = mach_msg(v21, v39, msgh_size, 0, 0, v35, 0);
  free(v21);
  if (v40 <= 268435459)
  {
    if (!v40) {
      return 1;
    }
    if (v40 == 268435459)
    {
      [a6 invalidate];
      v42 = (void *)MEMORY[0x1E4F1CA00];
      v43 = @"NSInvalidSendPortException";
      v44 = (NSString *)@"[NSMachPort sendBeforeDate:] destination port invalid";
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  uint64_t result = 0;
  if (v40 != 268435460)
  {
    if (v40 == 268435465)
    {
      [v9 invalidate];
      v42 = (void *)MEMORY[0x1E4F1CA00];
      v43 = @"NSInvalidReceivePortException";
      v44 = (NSString *)@"[NSMachPort sendBeforeDate:] reply port invalid";
      goto LABEL_64;
    }
LABEL_63:
    v44 = +[NSString stringWithFormat:@"[NSMachPort sendBeforeDate:] Cannot send (%s)", mach_error_string(v40)];
    v42 = (void *)MEMORY[0x1E4F1CA00];
    v43 = @"NSPortSendException";
LABEL_64:
    objc_exception_throw((id)[v42 exceptionWithName:v43 reason:v44 userInfo:0]);
  }
  return result;
}

- (uint64_t)sendBeforeTime:()NSMachPort streamData:components:from:msgid:
{
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [a1 reservedSpaceLength];

  return [v13 sendBeforeTime:a4 streamData:a5 components:a1 to:a6 from:a7 msgid:v14 reserved:a2];
}

- (uint64_t)sendBeforeDate:()NSMachPort components:from:reserved:
{
  v11 = objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];

  return objc_msgSend(v11, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a4, a1, a5, 0, a6);
}

- (uint64_t)sendBeforeDate:()NSMachPort msgid:components:from:reserved:
{
  uint64_t v13 = objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];

  return objc_msgSend(v13, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a5, a1, a6, a4, a7);
}

- (void)removeFromRunLoop:()NSMachPort forMode:
{
  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (unint64_t v9 = atomic_load(a1 + 1)) == 0)
    {
      objc_super v12 = NSClassFromString((NSString *)@"NSMachPort");
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }
    RunLoopSource = CFMachPortCreateRunLoopSource(0, (CFMachPortRef)a1, 200);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopRemoveSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, a4);
      CFRelease(v11);
    }
  }
}

- (uint64_t)initWithMachPort:()NSMachPort
{
  return [a1 initWithMachPort:a3 options:3];
}

@end