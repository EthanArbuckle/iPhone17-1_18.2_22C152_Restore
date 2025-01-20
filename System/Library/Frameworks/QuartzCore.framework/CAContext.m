@interface CAContext
+ (CAContext)contextWithId:(unsigned int)a3;
+ (id)allContexts;
+ (id)createCacheBlock;
+ (id)currentContext;
+ (id)drawInContextBlock;
+ (id)finalizeContextBlock;
+ (id)localContext;
+ (id)localContextWithOptions:(id)a3;
+ (id)objectForSlot:(unsigned int)a3;
+ (id)remoteContext;
+ (id)remoteContextWithOptions:(id)a3;
+ (void)setClientPort:(unsigned int)a3;
+ (void)setCreateCacheBlock:(id)a3;
+ (void)setDrawInContextBlock:(id)a3;
+ (void)setFinalizeContextBlock:(id)a3;
- (BOOL)addFence:(id)a3;
- (BOOL)addFence:(id)a3 completionHandler:(id)a4;
- (BOOL)colorMatchUntaggedContent;
- (BOOL)isSecure;
- (BOOL)valid;
- (BOOL)waitForCommitId:(unsigned int)a3 timeout:(double)a4;
- (BOOL)waitForRenderingWithTimeout:(double)a3;
- (CAContext)initWithOptions:(id)a3 localContext:(BOOL)a4;
- (CALayer)layer;
- (CGColorSpace)colorSpace;
- (NSDictionary)options;
- (NSDictionary)payload;
- (NSString)annotation;
- (NSString)contentsFormat;
- (float)desiredDynamicRange;
- (float)level;
- (id)debugDescription;
- (id)initRemoteWithOptions:(id)a3;
- (unsigned)commitId;
- (unsigned)commitPriority;
- (unsigned)contextId;
- (unsigned)createFencePort;
- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4;
- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4 extendedColors:(BOOL)a5;
- (unsigned)createSlot;
- (unsigned)displayId;
- (unsigned)hitTestContext:(CGPoint)a3;
- (void)contextImpl;
- (void)dealloc;
- (void)deleteSlot:(unsigned int)a3;
- (void)invalidate;
- (void)invalidateFences;
- (void)orderAbove:(unsigned int)a3;
- (void)orderBelow:(unsigned int)a3;
- (void)renderContext;
- (void)requestClientGlitch:(double)a3;
- (void)requestServerGlitch:(double)a3;
- (void)retainRenderContext;
- (void)setAnnotation:(id)a3;
- (void)setColorMatchUntaggedContent:(BOOL)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setCommitPriority:(unsigned int)a3;
- (void)setContentsFormat:(id)a3;
- (void)setDesiredDynamicRange:(float)a3;
- (void)setFence:(unsigned int)a3 count:(unsigned int)a4;
- (void)setFencePort:(unsigned int)a3;
- (void)setFencePort:(unsigned int)a3 commitHandler:(id)a4;
- (void)setLayer:(id)a3;
- (void)setLevel:(float)a3;
- (void)setObject:(id)a3 forSlot:(unsigned int)a4;
- (void)setPayload:(id)Copy;
- (void)setSecure:(BOOL)a3;
- (void)transferSlot:(unsigned int)a3 toContextWithId:(unsigned int)a4;
@end

@implementation CAContext

- (void)renderContext
{
  return (void *)*((void *)self->_impl + 13);
}

- (CALayer)layer
{
  return (CALayer *)*((void *)self->_impl + 12);
}

- (void)setLevel:(float)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  float valuePtr = a3;
  if (*((float *)impl + 50) != a3)
  {
    *((float *)impl + 50) = a3;
    CFNumberRef v4 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
    CA::Transaction::add_command((CA::Transaction *)0xA, *((_DWORD *)impl + 2), (unint64_t)valuePtr, v4, v5);
    CFRelease(v4);
  }
}

- (float)level
{
  return *((float *)self->_impl + 50);
}

- (BOOL)addFence:(id)a3
{
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    v5 = (CA::Transaction *)CA::Transaction::create(0);
  }
  int v6 = *((_DWORD *)self->_impl + 2);

  return CA::Transaction::add_fence(v5, v6, (uint64_t)a3, 0);
}

- (unsigned)contextId
{
  return *((_DWORD *)self->_impl + 1);
}

- (BOOL)waitForCommitId:(unsigned int)a3 timeout:(double)a4
{
  if (a4 >= INFINITY) {
    int v6 = 0x7FFFFFFF;
  }
  else {
    int v6 = (int)(a4 * 1000.0 + 0.5);
  }
  BOOL v7 = CA::Context::synchronize((CA::Context *)self->_impl, a3, v6, 0);
  if (v7) {
    CA::Context::ping((CA::Context *)self->_impl);
  }
  return v7;
}

+ (CAContext)contextWithId:(unsigned int)a3
{
  v3 = CA::Context::retain_context_with_client_id(*(CA::Context **)&a3);
  if (!v3) {
    return 0;
  }
  CFNumberRef v4 = v3;
  v5 = (id *)(v3 + 20);
  if (*((unsigned char *)v4 + 88)) {
    Weak = (CAContext *)objc_loadWeak(v5);
  }
  else {
    Weak = (CAContext *)*v5;
  }
  CA::Context::unref((CA::Context *)v4, 0);
  return Weak;
}

- (void)setLayer:(id)a3
{
}

- (void)setCommitPriority:(unsigned int)a3
{
  *((_DWORD *)self->_impl + 35) = a3;
}

- (unsigned)displayId
{
  return *((_DWORD *)self->_impl + 37);
}

- (unsigned)createFencePort
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  impl = (unsigned int *)self->_impl;
  mach_port_name_t name = 0;
  *(void *)v20 = 0;
  if (*((void *)impl + 13))
  {
    if (CA::Render::Fence::create_fence_port((CA::Render::Fence *)&name, v20, v2))
    {
      mach_port_name_t v5 = name;
      goto LABEL_15;
    }
    return 0;
  }
  if ((*((unsigned char *)impl + 241) & 2) != 0) {
    return 0;
  }
  uint64_t v6 = _CASCreateFencePort(impl[40], &name, v20);
  if (v6)
  {
    uint64_t v7 = v6;
    if (v6 == 268435459)
    {
      *((unsigned char *)impl + 241) |= 2u;
    }
    else if (v6 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      uint64_t v8 = impl[1];
      uint64_t v18 = v7;
      v19 = mach_error_string(v7);
      uint64_t v17 = v8;
      x_log_();
    }
    else
    {
      v9 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        unsigned int v10 = impl[1];
        v11 = mach_error_string(v7);
        *(_DWORD *)buf = 67109634;
        unsigned int v23 = v10;
        __int16 v24 = 1024;
        int v25 = v7;
        __int16 v26 = 2080;
        v27 = v11;
        _os_log_impl(&dword_184668000, v9, OS_LOG_TYPE_ERROR, "Failed to create fence port (client=0x%x) [0x%x %s]", buf, 0x18u);
      }
    }
  }
  mach_port_name_t v5 = name;
  if (name - 1 > 0xFFFFFFFD)
  {
    if (name) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name);
    }
    return 0;
  }
LABEL_15:
  v12 = (os_unfair_lock_s *)+[CAFenceHandle _newFenceWithPort:name:]((uint64_t)CAFenceHandle, v5, *(uint64_t *)v20);
  v13 = v12;
  if (!v12) {
    return 0;
  }
  mach_port_name_t v14 = -[CAFenceHandle _copyPort](v12);
  if (v14)
  {
    v15 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v15) {
      v15 = (CA::Transaction *)CA::Transaction::create(0);
    }
    if (!CA::Transaction::add_fence(v15, *((_DWORD *)self->_impl + 2), (uint64_t)v13, 0))
    {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v14);
      mach_port_name_t v14 = 0;
    }
  }
  [(os_unfair_lock_s *)v13 invalidate];

  return v14;
}

- (void)setFencePort:(unsigned int)a3
{
  CFNumberRef v4 = +[CAFenceHandle _newEphemeralHandleWithPort:]((uint64_t)CAFenceHandle, a3);
  mach_port_name_t v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  uint64_t v6 = v4;
  if (!v5)
  {
    mach_port_name_t v5 = (CA::Transaction *)CA::Transaction::create(0);
    CFNumberRef v4 = v6;
  }
  CA::Transaction::add_fence(v5, *((_DWORD *)self->_impl + 2), (uint64_t)v4, 0);
  [v6 invalidate];
}

- (BOOL)valid
{
  return (*((unsigned char *)self->_impl + 241) & 2) == 0;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = (id *)self->_impl;
  if (impl)
  {
    CA::Context::set_objc_context(impl, 0);
    CA::Context::invalidate((CA::Context *)self->_impl);
    CA::Context::unref((CA::Context *)self->_impl, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAContext;
  [(CAContext *)&v4 dealloc];
}

+ (id)remoteContextWithOptions:(id)a3
{
  id v3 = [[CAContext alloc] initRemoteWithOptions:a3];

  return v3;
}

- (id)initRemoteWithOptions:(id)a3
{
  id v3 = [(CAContext *)self initWithOptions:a3 localContext:0];
  p_isa = &v3->super.isa;
  if (v3)
  {
    BOOL v5 = CA::Context::connect_remote((CA::Context *)v3->_impl);
    uint64_t v6 = p_isa[1];
    if (v5)
    {
      CA::Context::did_connect(v6);
    }
    else
    {
      CA::Context::set_objc_context((id *)v6, 0);
      CA::Context::unref(p_isa[1], 1);
      p_isa[1] = 0;

      return 0;
    }
  }
  return p_isa;
}

- (CAContext)initWithOptions:(id)a3 localContext:(BOOL)a4
{
  double v4 = MEMORY[0x1F4188790](self);
  int v6 = v5;
  uint64_t v8 = v7;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v23.receiver = v9;
  v23.super_class = (Class)CAContext;
  id v10 = [(CAContext *)&v23 init];
  if (!v10) {
    return (CAContext *)v10;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v12 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xF8uLL, 0x743898A5uLL);
  if (!v12)
  {
    *((void *)v10 + 1) = 0;

    return 0;
  }
  v13 = v12;
  *(_DWORD *)v12 = 1;
  *((void *)v12 + 10) = 0;
  v12[88] = 0;
  *((void *)v12 + 19) = 0;
  *((_DWORD *)v12 + 44) = 0;
  *((void *)v12 + 23) = 0;
  *((void *)v12 + 24) = 0;
  *((void *)v12 + 20) = 0;
  *((void *)v12 + 27) = &unk_1ED030250;
  *((void *)v12 + 28) = v12;
  v12[240] = 0;
  v12[241] |= 0x20u;
  x_thread_init_mutex((pthread_mutex_t *)(v12 + 16), 1);
  if (v8)
  {
    *((void *)v13 + 15) = v8;
    CFRetain(v8);
  }
  mach_port_name_t v14 = (CGColorSpace *)CAGetColorSpace(0x1Du);
  *((void *)v13 + 14) = CGColorSpaceRetain(v14);
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Context::_lock);
  ++CA::Context::_context_count;
  if (CADeviceHasInternalBuild::once[0] != -1) {
    dispatch_once(CADeviceHasInternalBuild::once, &__block_literal_global_153);
  }
  if (CADeviceHasInternalBuild::internal && CA::Context::_context_count >= 0x201)
  {
    pid_t v15 = getpid();
    bzero(buffer, 0x1000uLL);
    proc_pidpath(v15, buffer, 0x1000u);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v16 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v25 = buffer;
        __int16 v26 = 1024;
        pid_t v27 = v15;
        __int16 v28 = 1024;
        int v29 = CA::Context::_context_count;
        _os_log_impl(&dword_184668000, v16, OS_LOG_TYPE_FAULT, "Too many CAContexts! Biggest offender (%s [%d]) has %u contexts!", buf, 0x18u);
      }
    }
  }
  int v17 = CA::Context::_last_local_id;
  BOOL v18 = __CFADD__(CA::Context::_last_local_id++, 1);
  *((_DWORD *)v13 + 2) = CA::Context::_last_local_id;
  if (v18)
  {
    CA::Context::_last_local_id = v17 + 2;
    *((_DWORD *)v13 + 2) = v17 + 2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Context::_lock);
  *((void *)v10 + 1) = v13;
  CA::Context::set_objc_context((id *)v13, v10);
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v19 = *((void *)v10 + 1);
  v20 = (malloc_zone_t *)get_malloc_zone();
  v21 = (CA::Render::Context *)malloc_type_zone_calloc(v20, 1uLL, 0x2E8uLL, 0x743898A5uLL);
  if (!v21)
  {
    *(void *)(v19 + 104) = 0;
    CA::Context::set_objc_context(*((id **)v10 + 1), 0);
    CA::Context::unref(*((CA::Context **)v10 + 1), 1);
    *((void *)v10 + 1) = 0;

    return 0;
  }
  *(void *)(v19 + 104) = CA::Render::Context::Context(v21, *(const __CFDictionary **)(v19 + 120), 0, 0, 0);
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    *(_DWORD *)(*(void *)(v19 + 104) + 12) |= 0x800u;
  }
  *(_WORD *)(*(void *)(v19 + 104) + 552) &= ~0x40u;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(*(void *)(v19 + 104) + 16);
  CA::Context::did_connect(*((CA::Context **)v10 + 1));
LABEL_22:
  if (initialized != -1) {
    dispatch_once_f(&initialized, 0, (dispatch_function_t)init_debug);
  }
  return (CAContext *)v10;
}

- (void)setObject:(id)a3 forSlot:(unsigned int)a4
{
  CA::Transaction::add_command((CA::Transaction *)0xB, *((_DWORD *)self->_impl + 2), a4, a3, v4);
}

- (unsigned)commitId
{
  impl = (char *)self->_impl;
  id v3 = (pthread_mutex_t *)(impl + 16);
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  LODWORD(impl) = *((_DWORD *)impl + 32);
  pthread_mutex_unlock(v3);
  return impl;
}

- (NSDictionary)options
{
  return (NSDictionary *)*((void *)self->_impl + 15);
}

+ (id)objectForSlot:(unsigned int)a3
{
  id v3 = [[CASlotProxy alloc] initWithName:*(void *)&a3];

  return v3;
}

- (unsigned)createSlot
{
  mach_msg_return_t v8;
  mach_port_t msgh_remote_port;
  BOOL v10;
  NSObject *v11;
  mach_msg_size_t v12;
  char *v13;
  mach_msg_header_t msg[2];
  uint64_t v15;

  pid_t v15 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v3 = *((void *)impl + 13);
  if (v3)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
    unsigned int v4 = CA::Render::Context::new_slot(*((CA::Render::Context **)impl + 13));
    pthread_mutex_unlock((pthread_mutex_t *)(*((void *)impl + 13) + 72));
    return v4;
  }
  if ((*((unsigned char *)impl + 241) & 2) != 0) {
    return 0;
  }
  unsigned int v6 = *((_DWORD *)impl + 40);
  *(_OWORD *)&msg[1].msgh_remote_port = 0u;
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x9D1300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t reply_port = msg[0].msgh_local_port;
  }
  uint64_t v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
  msgh_remote_port = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg[0].msgh_local_port);
    if (!msgh_remote_port) {
      return msgh_remote_port;
    }
    goto LABEL_28;
  }
  if (v8)
  {
    mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
    if (msgh_remote_port == 268435459)
    {
      *((unsigned char *)impl + 241) |= 2u;
    }
    else if (msgh_remote_port == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(msgh_remote_port);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(msgh_remote_port);
        msg[0].msgh_bits = 67109634;
        msg[0].msgh_size = v12;
        LOWORD(msg[0].msgh_remote_port) = 1024;
        *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
        HIWORD(msg[0].msgh_local_port) = 2080;
        *(void *)&msg[0].msgh_voucher_port = v13;
        _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "Failed to create slot (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
      }
    }
    return 0;
  }
  if (msg[0].msgh_id == 71)
  {
    msgh_remote_port = -308;
    goto LABEL_27;
  }
  if (msg[0].msgh_id != 40311)
  {
    msgh_remote_port = -301;
    goto LABEL_27;
  }
  if ((msg[0].msgh_bits & 0x80000000) != 0) {
    goto LABEL_26;
  }
  if (msg[0].msgh_size != 40)
  {
    if (msg[0].msgh_size == 36)
    {
      if (msg[0].msgh_remote_port) {
        id v10 = 1;
      }
      else {
        id v10 = msg[1].msgh_remote_port == 0;
      }
      if (v10) {
        msgh_remote_port = -300;
      }
      else {
        msgh_remote_port = msg[1].msgh_remote_port;
      }
      goto LABEL_27;
    }
LABEL_26:
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  if (msg[0].msgh_remote_port) {
    goto LABEL_26;
  }
  msgh_remote_port = msg[1].msgh_remote_port;
  if (!msg[1].msgh_remote_port) {
    return msg[1].msgh_local_port;
  }
LABEL_27:
  mach_msg_destroy(msg);
  if (msgh_remote_port) {
    goto LABEL_28;
  }
  return msgh_remote_port;
}

- (void)requestServerGlitch:(double)a3
{
  int v3 = *((_DWORD *)self->_impl + 2);
  unsigned int v4 = (const void *)[NSNumber numberWithDouble:a3];

  CA::Transaction::add_command((CA::Transaction *)0x1B, v3, 0, v4, v5);
}

- (void)requestClientGlitch:(double)a3
{
  int v3 = *((_DWORD *)self->_impl + 2);
  unsigned int v4 = (const void *)[NSNumber numberWithDouble:a3];

  CA::Transaction::add_command((CA::Transaction *)0x1A, v3, 0, v4, v5);
}

- (void)contextImpl
{
  return self->_impl;
}

- (void)retainRenderContext
{
  return (void *)CA::Context::retain_render_ctx((CA::Context *)self->_impl);
}

- (void)setAnnotation:(id)a3
{
  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  int v5 = (const void *)*((void *)impl + 29);
  if (v5) {
    CFRelease(v5);
  }
  if (a3) {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)a3);
  }
  else {
    CFStringRef Copy = 0;
  }
  *((void *)impl + 29) = Copy;
  impl[241] |= 0x40u;

  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (NSString)annotation
{
  return (NSString *)*((void *)self->_impl + 29);
}

- (unsigned)hitTestContext:(CGPoint)a3
{
  mach_msg_return_t v11;
  BOOL v12;
  NSObject *v13;
  int v14;
  char *v15;
  mach_msg_header_t msg;
  unsigned char v18[24];
  uint64_t v19;

  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v6 = *((void *)impl + 13);
  if (!v6)
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0) {
      return 0;
    }
    mach_port_t v9 = *((_DWORD *)impl + 40);
    *(void *)BOOL v18 = *MEMORY[0x1E4F14068];
    *(CGPoint *)&v18[8] = a3;
    mach_port_t reply_port = mig_get_reply_port();
    *(void *)&msg.msgh_bits = 5395;
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = reply_port;
    *(void *)&msg.msgh_voucher_port = 0x9D1B00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&msg);
      mach_port_t reply_port = msg.msgh_local_port;
    }
    v11 = mach_msg(&msg, 3, 0x30u, 0x30u, reply_port, 0, 0);
    int v8 = v11;
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
      if (!v8) {
        return v8;
      }
      goto LABEL_28;
    }
    if (v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
LABEL_28:
      if (v8 == 268435459)
      {
        *((unsigned char *)impl + 241) |= 2u;
      }
      else if (v8 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(v8);
        x_log_();
      }
      else
      {
        v13 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          mach_port_name_t v14 = *((_DWORD *)impl + 1);
          pid_t v15 = mach_error_string(v8);
          msg.msgh_bits = 134219010;
          *(CGFloat *)&msg.msgh_size = x;
          LOWORD(msg.msgh_local_port) = 2048;
          *(CGFloat *)((char *)&msg.msgh_local_port + 2) = y;
          HIWORD(msg.msgh_id) = 1024;
          *(_DWORD *)BOOL v18 = v14;
          *(_WORD *)&v18[4] = 1024;
          *(_DWORD *)&v18[6] = v8;
          *(_WORD *)&v18[10] = 2080;
          *(void *)&v18[12] = v15;
          _os_log_impl(&dword_184668000, v13, OS_LOG_TYPE_ERROR, "Failed to hit test (%g, %g) (client=0x%x) [0x%x %s]", (uint8_t *)&msg, 0x2Cu);
        }
      }
      return 0;
    }
    if (msg.msgh_id == 71)
    {
      int v8 = -308;
      goto LABEL_27;
    }
    if (msg.msgh_id != 40319)
    {
      int v8 = -301;
      goto LABEL_27;
    }
    if ((msg.msgh_bits & 0x80000000) == 0)
    {
      if (msg.msgh_size == 40)
      {
        if (!msg.msgh_remote_port)
        {
          int v8 = *(_DWORD *)&v18[8];
          if (!*(_DWORD *)&v18[8]) {
            return *(_DWORD *)&v18[12];
          }
LABEL_27:
          mach_msg_destroy(&msg);
          if (!v8) {
            return v8;
          }
          goto LABEL_28;
        }
      }
      else if (msg.msgh_size == 36)
      {
        if (msg.msgh_remote_port) {
          v12 = 1;
        }
        else {
          v12 = *(_DWORD *)&v18[8] == 0;
        }
        if (v12) {
          int v8 = -300;
        }
        else {
          int v8 = *(_DWORD *)&v18[8];
        }
        goto LABEL_27;
      }
    }
    int v8 = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 72));
  uint64_t v7 = *((void *)impl + 13);
  *(CGFloat *)&msg.msgh_bits = x;
  *(CGFloat *)&msg.msgh_remote_port = y;
  int v8 = CA::Render::Context::hit_test_context(v7);
  pthread_mutex_unlock((pthread_mutex_t *)(*((void *)impl + 13) + 72));
  return v8;
}

- (void)transferSlot:(unsigned int)a3 toContextWithId:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  unsigned int valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CA::Transaction::add_command((CA::Transaction *)0xD, impl[2], a3, v6, v7);
  CFRelease(v6);
}

- (void)deleteSlot:(unsigned int)a3
{
  CA::Transaction::add_command((CA::Transaction *)0xC, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4 extendedColors:(BOOL)a5
{
  return CA::Context::new_image_slot((CA::Context *)self->_impl, (CA::Render *)a3.width, a3.height, a4, a5);
}

- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4
{
  unsigned int v4 = a4;
  double height = a3.height;
  double width = a3.width;
  if (CADeviceUseCIF10::once != -1) {
    dispatch_once(&CADeviceUseCIF10::once, &__block_literal_global_12019);
  }
  unsigned int v8 = CADeviceUseCIF10::enable_cif10;
  impl = (CA::Context *)self->_impl;

  return CA::Context::new_image_slot(impl, (CA::Render *)width, height, v4, v8);
}

- (void)invalidateFences
{
  mach_msg_return_t v4;
  mach_error_t v5;
  NSObject *v6;
  mach_msg_size_t v7;
  char *v8;
  mach_msg_header_t msg;
  uint64_t v10;

  id v10 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((*((unsigned char *)impl + 241) & 2) == 0)
  {
    mach_port_t v3 = impl[40];
    msg.msgh_size = 0;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    *(void *)&msg.msgh_voucher_port = 0x9D1200000000;
    if (MEMORY[0x1E4F14B18]) {
      voucher_mach_msg_set(&msg);
    }
    unsigned int v4 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
    if (v4)
    {
      int v5 = v4;
      if (v4 == 268435459)
      {
        *((unsigned char *)impl + 241) |= 2u;
      }
      else if (v4 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(v5);
        x_log_();
      }
      else
      {
        CFNumberRef v6 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = impl[1];
          unsigned int v8 = mach_error_string(v5);
          msg.msgh_bits = 67109634;
          msg.msgh_size = v7;
          LOWORD(msg.msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg.msgh_remote_port + 2) = v5;
          HIWORD(msg.msgh_local_port) = 2080;
          *(void *)&msg.msgh_voucher_port = v8;
          _os_log_impl(&dword_184668000, v6, OS_LOG_TYPE_ERROR, "Failed to remove context from fences (client=0x%x) [0x%x %s]", (uint8_t *)&msg, 0x18u);
        }
      }
    }
  }
}

- (void)setFence:(unsigned int)a3 count:(unsigned int)a4
{
}

- (void)setFencePort:(unsigned int)a3 commitHandler:(id)a4
{
  CFNumberRef v6 = +[CAFenceHandle _newEphemeralHandleWithPort:]((uint64_t)CAFenceHandle, a3);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(CA::Transaction **)(StatusReg + 576);
  id v10 = v6;
  if (!v8)
  {
    unsigned int v8 = (CA::Transaction *)CA::Transaction::create(0);
    CFNumberRef v6 = v10;
  }
  if (CA::Transaction::add_fence(v8, *((_DWORD *)self->_impl + 2), (uint64_t)v6, 0))
  {
    uint64_t v9 = *(_OWORD **)(StatusReg + 576);
    if (!v9) {
      uint64_t v9 = CA::Transaction::create(0);
    }
    CA::Transaction::add_commit_handler((uint64_t)v9, a4, 3);
  }
  [v10 invalidate];
}

- (BOOL)addFence:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v7) {
    uint64_t v7 = (CA::Transaction *)CA::Transaction::create(0);
  }
  int v8 = *((_DWORD *)self->_impl + 2);

  return CA::Transaction::add_fence(v7, v8, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)waitForRenderingWithTimeout:(double)a3
{
  if (a3 <= 0.0)
  {
    int v4 = 0;
  }
  else if (a3 <= 2147483.0)
  {
    int v4 = (int)(a3 * 1000.0);
  }
  else
  {
    int v4 = 0x7FFFFFFF;
  }
  BOOL v5 = CA::Context::synchronize((CA::Context *)self->_impl, 0, v4, 0);
  if (v5) {
    CA::Context::ping((CA::Context *)self->_impl);
  }
  return v5;
}

- (float)desiredDynamicRange
{
  mach_msg_return_t v8;
  mach_port_t msgh_remote_port;
  BOOL v10;
  NSObject *v11;
  mach_msg_size_t v12;
  char *v13;
  mach_msg_header_t msg[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v3 = *((void *)impl + 13);
  if (v3)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
    uint64_t v4 = *((void *)impl + 13);
    float v5 = *(float *)(v4 + 308);
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
    return v5;
  }
  float v5 = 1.0;
  if ((*((unsigned char *)impl + 241) & 2) != 0) {
    return v5;
  }
  unsigned int v6 = *((_DWORD *)impl + 40);
  *(_OWORD *)&msg[1].msgh_remote_port = 0u;
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x9D1900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t reply_port = msg[0].msgh_local_port;
  }
  int v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
  msgh_remote_port = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg[0].msgh_local_port);
    if (!msgh_remote_port) {
      return v5;
    }
    goto LABEL_28;
  }
  if (!v8)
  {
    if (msg[0].msgh_id == 71)
    {
      msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40317)
    {
      msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port) {
            return *(float *)&msg[1].msgh_local_port;
          }
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port) {
            return v5;
          }
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port) {
          id v10 = 1;
        }
        else {
          id v10 = msg[1].msgh_remote_port == 0;
        }
        if (v10) {
          msgh_remote_port = -300;
        }
        else {
          msgh_remote_port = msg[1].msgh_remote_port;
        }
        goto LABEL_27;
      }
    }
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
  if (msgh_remote_port == 268435459)
  {
    *((unsigned char *)impl + 241) |= 2u;
  }
  else if (msgh_remote_port == -81182719)
  {
    x_log_crash("Unentitled call to server!");
    abort();
  }
  if (x_log_hook_p())
  {
    mach_error_string(msgh_remote_port);
    x_log_();
  }
  else
  {
    v11 = x_log_category_api;
    if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
    {
      v12 = *((_DWORD *)impl + 1);
      v13 = mach_error_string(msgh_remote_port);
      msg[0].msgh_bits = 67109634;
      msg[0].msgh_size = v12;
      LOWORD(msg[0].msgh_remote_port) = 1024;
      *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
      HIWORD(msg[0].msgh_local_port) = 2080;
      *(void *)&msg[0].msgh_voucher_port = v13;
      _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "Failed to query EDR headroom (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
    }
  }
  return v5;
}

- (void)setDesiredDynamicRange:(float)a3
{
  mach_msg_return_t v9;
  mach_error_t v10;
  NSObject *v11;
  int v12;
  char *v13;
  unsigned char msg[36];
  uint64_t v15;
  uint64_t v16;
  uint64_t vars8;

  v16 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    uint64_t v6 = impl[13];
    *(float *)(v6 + 308) = a3;
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 72));
  }
  else
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0) {
      return;
    }
    int v7 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    pid_t v15 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(void *)&msg[24] = *MEMORY[0x1E4F14068];
    *(float *)&msg[32] = a3;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v7;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(void *)&msg[16] = 0x9D1A00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = *(_DWORD *)&msg[12];
    }
    uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    id v10 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v10) {
        return;
      }
    }
    else if (v9)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        id v10 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40318)
      {
        id v10 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          id v10 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return;
          }
        }
      }
      else
      {
        id v10 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v10) {
        return;
      }
    }
    if (v10 == 268435459)
    {
      *((unsigned char *)impl + 241) |= 2u;
    }
    else if (v10 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v10);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(v10);
        *(_DWORD *)msg = 134218754;
        *(double *)&msg[4] = a3;
        *(_WORD *)&msg[12] = 1024;
        *(_DWORD *)&msg[14] = v12;
        *(_WORD *)&msg[18] = 1024;
        *(_DWORD *)&msg[20] = v10;
        *(_WORD *)&msg[24] = 2080;
        *(void *)&msg[26] = v13;
        _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "Failed to set EDR headroom=%g (client=0x%x) [0x%x %s]", msg, 0x22u);
      }
    }
  }
}

- (BOOL)isSecure
{
  mach_msg_return_t v8;
  BOOL v9;
  NSObject *v10;
  mach_msg_size_t v11;
  char *v12;
  mach_msg_header_t msg[2];
  uint64_t v15;

  pid_t v15 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v3 = *((void *)impl + 13);
  if (!v3)
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0)
    {
LABEL_36:
      LOBYTE(msgh_remote_port) = 0;
      return msgh_remote_port;
    }
    unsigned int v6 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[1].mach_port_t msgh_remote_port = 0u;
    *(_OWORD *)&msg[0].msgh_id = 0u;
    msg[0].msgh_size = 0;
    mach_port_t reply_port = mig_get_reply_port();
    *(void *)&msg[0].mach_port_t msgh_remote_port = __PAIR64__(reply_port, v6);
    msg[0].msgh_bits = 5395;
    *(void *)&msg[0].msgh_voucher_port = 0x9D1700000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(msg);
      mach_port_t reply_port = msg[0].msgh_local_port;
    }
    int v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
    mach_port_t msgh_remote_port = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      if (!msgh_remote_port) {
        return msgh_remote_port;
      }
      goto LABEL_28;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
      if (msgh_remote_port == 268435459)
      {
        *((unsigned char *)impl + 241) |= 2u;
      }
      else if (msgh_remote_port == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(msgh_remote_port);
        x_log_();
      }
      else
      {
        id v10 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v11 = *((_DWORD *)impl + 1);
          v12 = mach_error_string(msgh_remote_port);
          msg[0].msgh_bits = 67109634;
          msg[0].msgh_size = v11;
          LOWORD(msg[0].msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
          HIWORD(msg[0].msgh_local_port) = 2080;
          *(void *)&msg[0].msgh_voucher_port = v12;
          _os_log_impl(&dword_184668000, v10, OS_LOG_TYPE_ERROR, "Failed to query security (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
        }
      }
      goto LABEL_36;
    }
    if (msg[0].msgh_id == 71)
    {
      mach_port_t msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40315)
    {
      mach_port_t msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          mach_port_t msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port) {
            return msg[1].msgh_local_port != 0;
          }
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port) {
            return msgh_remote_port;
          }
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = msg[1].msgh_remote_port == 0;
        }
        if (v9) {
          mach_port_t msgh_remote_port = -300;
        }
        else {
          mach_port_t msgh_remote_port = msg[1].msgh_remote_port;
        }
        goto LABEL_27;
      }
    }
    mach_port_t msgh_remote_port = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  uint64_t v4 = *((void *)impl + 13);
  mach_port_t msgh_remote_port = (*(unsigned __int16 *)(v4 + 552) >> 2) & 1;
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  return msgh_remote_port;
}

- (void)setSecure:(BOOL)a3
{
  mach_msg_return_t v10;
  mach_error_t v11;
  NSObject *v12;
  int v13;
  char *v14;
  unsigned char msg[36];
  uint64_t v16;
  uint64_t v17;
  uint64_t vars8;

  BOOL v3 = a3;
  int v17 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    if (v3) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)(impl[13] + 552) = *(_WORD *)(impl[13] + 552) & 0xFFFB | v6;
    int v7 = (pthread_mutex_t *)(impl[13] + 72);
    pthread_mutex_unlock(v7);
  }
  else
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0) {
      return;
    }
    int v8 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    v16 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(void *)&msg[24] = *MEMORY[0x1E4F14068];
    *(_DWORD *)&msg[32] = a3;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v8;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(void *)&msg[16] = 0x9D1800000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = *(_DWORD *)&msg[12];
    }
    id v10 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    v11 = v10;
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v11) {
        return;
      }
    }
    else if (v10)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v11 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40316)
      {
        v11 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v11 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return;
          }
        }
      }
      else
      {
        v11 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v11) {
        return;
      }
    }
    if (v11 == 268435459)
    {
      *((unsigned char *)impl + 241) |= 2u;
    }
    else if (v11 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v11);
      x_log_();
    }
    else
    {
      v12 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v13 = *((_DWORD *)impl + 1);
        mach_port_name_t v14 = mach_error_string(v11);
        *(_DWORD *)msg = 67109890;
        *(_DWORD *)&msg[4] = v3;
        *(_WORD *)&msg[8] = 1024;
        *(_DWORD *)&msg[10] = v13;
        *(_WORD *)&msg[14] = 1024;
        *(_DWORD *)&msg[16] = v11;
        *(_WORD *)&msg[20] = 2080;
        *(void *)&msg[22] = v14;
        _os_log_impl(&dword_184668000, v12, OS_LOG_TYPE_ERROR, "Failed to set secure=%d (client=0x%x) [0x%x %s]", msg, 0x1Eu);
      }
    }
  }
}

- (void)orderBelow:(unsigned int)a3
{
  CA::Transaction::add_command((CA::Transaction *)9, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (void)orderAbove:(unsigned int)a3
{
  CA::Transaction::add_command((CA::Transaction *)8, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (void)setPayload:(id)Copy
{
  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  id v6 = (id)*((void *)impl + 19);
  if (v6 != Copy)
  {
    if (Copy)
    {
      CFStringRef Copy = CFDictionaryCreateCopy(0, (CFDictionaryRef)Copy);
      id v6 = (id)*((void *)impl + 19);
    }
    if (v6) {
      CFRelease(v6);
    }
    *((void *)impl + 19) = Copy;
    CA::Transaction::add_command((CA::Transaction *)7, *((_DWORD *)impl + 2), 0, Copy, v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (NSDictionary)payload
{
  return (NSDictionary *)*((void *)self->_impl + 19);
}

- (void)setContentsFormat:(id)a3
{
  uint64_t v4 = CA::Render::Layer::contents_format_from_string((__CFString *)a3, (const __CFString *)a2);
  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  if (impl[240] != v4)
  {
    impl[240] = v4;
    uint64_t v6 = *((void *)impl + 12);
    if (v6)
    {
      int v7 = (objc_selector *)CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel;
      if (!CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel)
      {
        int v7 = (objc_selector *)sel_registerName("_contentsFormatDidChange:");
        CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel = (uint64_t)v7;
        uint64_t v6 = *((void *)impl + 12);
      }
      CA::Layer::perform_selector(*(CA::Layer **)(v6 + 16), v7, (objc_object *)[NSNumber numberWithUnsignedChar:v4]);
    }
  }

  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (NSString)contentsFormat
{
  if (*((unsigned __int8 *)self->_impl + 240) - 1 > 4) {
    v2 = (NSString **)&kCAContentsFormatRGBA8Uint;
  }
  else {
    v2 = (NSString **)off_1E52733A8[(*((unsigned char *)self->_impl + 240) - 1)];
  }
  return *v2;
}

- (void)setColorMatchUntaggedContent:(BOOL)a3
{
  mach_msg_return_t v10;
  mach_error_t v11;
  NSObject *v12;
  int v13;
  char *v14;
  unsigned char msg[36];
  uint64_t v16;
  uint64_t v17;
  uint64_t vars8;

  BOOL v3 = a3;
  int v17 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    if (v3) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)(impl[13] + 552) = *(_WORD *)(impl[13] + 552) & 0xFFFD | v6;
    int v7 = (pthread_mutex_t *)(impl[13] + 72);
    pthread_mutex_unlock(v7);
  }
  else
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0) {
      return;
    }
    int v8 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    v16 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(void *)&msg[24] = *MEMORY[0x1E4F14068];
    *(_DWORD *)&msg[32] = a3;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v8;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(void *)&msg[16] = 0x9D1600000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = *(_DWORD *)&msg[12];
    }
    id v10 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    v11 = v10;
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v11) {
        return;
      }
    }
    else if (v10)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v11 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40314)
      {
        v11 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v11 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return;
          }
        }
      }
      else
      {
        v11 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v11) {
        return;
      }
    }
    if (v11 == 268435459)
    {
      *((unsigned char *)impl + 241) |= 2u;
    }
    else if (v11 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v11);
      x_log_();
    }
    else
    {
      v12 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v13 = *((_DWORD *)impl + 1);
        mach_port_name_t v14 = mach_error_string(v11);
        *(_DWORD *)msg = 67109890;
        *(_DWORD *)&msg[4] = v3;
        *(_WORD *)&msg[8] = 1024;
        *(_DWORD *)&msg[10] = v13;
        *(_WORD *)&msg[14] = 1024;
        *(_DWORD *)&msg[16] = v11;
        *(_WORD *)&msg[20] = 2080;
        *(void *)&msg[22] = v14;
        _os_log_impl(&dword_184668000, v12, OS_LOG_TYPE_ERROR, "Failed to set untagged matching = %d (client=0x%x) [0x%x %s]", msg, 0x1Eu);
      }
    }
  }
}

- (BOOL)colorMatchUntaggedContent
{
  mach_msg_return_t v8;
  BOOL v9;
  NSObject *v10;
  mach_msg_size_t v11;
  char *v12;
  mach_msg_header_t msg[2];
  uint64_t v15;

  pid_t v15 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  uint64_t v3 = *((void *)impl + 13);
  if (!v3)
  {
    if ((*((unsigned char *)impl + 241) & 2) != 0)
    {
LABEL_36:
      LOBYTE(msgh_remote_port) = 0;
      return msgh_remote_port;
    }
    unsigned int v6 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[1].mach_port_t msgh_remote_port = 0u;
    *(_OWORD *)&msg[0].msgh_id = 0u;
    msg[0].msgh_size = 0;
    mach_port_t reply_port = mig_get_reply_port();
    *(void *)&msg[0].mach_port_t msgh_remote_port = __PAIR64__(reply_port, v6);
    msg[0].msgh_bits = 5395;
    *(void *)&msg[0].msgh_voucher_port = 0x9D1500000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(msg);
      mach_port_t reply_port = msg[0].msgh_local_port;
    }
    int v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
    mach_port_t msgh_remote_port = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      if (!msgh_remote_port) {
        return msgh_remote_port;
      }
      goto LABEL_28;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
      if (msgh_remote_port == 268435459)
      {
        *((unsigned char *)impl + 241) |= 2u;
      }
      else if (msgh_remote_port == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(msgh_remote_port);
        x_log_();
      }
      else
      {
        id v10 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v11 = *((_DWORD *)impl + 1);
          v12 = mach_error_string(msgh_remote_port);
          msg[0].msgh_bits = 67109634;
          msg[0].msgh_size = v11;
          LOWORD(msg[0].msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
          HIWORD(msg[0].msgh_local_port) = 2080;
          *(void *)&msg[0].msgh_voucher_port = v12;
          _os_log_impl(&dword_184668000, v10, OS_LOG_TYPE_ERROR, "Failed to query untagged content matching (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
        }
      }
      goto LABEL_36;
    }
    if (msg[0].msgh_id == 71)
    {
      mach_port_t msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40313)
    {
      mach_port_t msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          mach_port_t msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port) {
            return msg[1].msgh_local_port != 0;
          }
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port) {
            return msgh_remote_port;
          }
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = msg[1].msgh_remote_port == 0;
        }
        if (v9) {
          mach_port_t msgh_remote_port = -300;
        }
        else {
          mach_port_t msgh_remote_port = msg[1].msgh_remote_port;
        }
        goto LABEL_27;
      }
    }
    mach_port_t msgh_remote_port = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  uint64_t v4 = *((void *)impl + 13);
  mach_port_t msgh_remote_port = (*(unsigned __int16 *)(v4 + 552) >> 1) & 1;
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  return msgh_remote_port;
}

- (unsigned)commitPriority
{
  return *((_DWORD *)self->_impl + 35);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  uint64_t v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  impl = (char *)self->_impl;
  if (!a3)
  {
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      uint64_t v5 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        int v6 = *((_DWORD *)impl + 1);
        *(_DWORD *)buf = 67109120;
        int v10 = v6;
        _os_log_impl(&dword_184668000, v5, OS_LOG_TYPE_ERROR, "CoreAnimation: NULL color space set on context (%x)\n", buf, 8u);
      }
    }
    uint64_t v3 = (CGColorSpace *)CAGetColorSpace(0x1Du);
  }
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CGColorSpaceRelease(*((CGColorSpaceRef *)impl + 14));
    *((void *)impl + 14) = CGColorSpaceRetain(v3);
    impl[241] |= 0x20u;
    uint64_t v7 = *((void *)impl + 12);
    if (v7)
    {
      int v8 = (objc_selector *)CA::Context::set_colorspace(CGColorSpace *)::sel;
      if (!CA::Context::set_colorspace(CGColorSpace *)::sel)
      {
        int v8 = (objc_selector *)sel_registerName("_colorSpaceDidChange");
        CA::Context::set_colorspace(CGColorSpace *)::sel = (uint64_t)v8;
        uint64_t v7 = *((void *)impl + 12);
      }
      CA::Layer::perform_selector(*(CA::Layer **)(v7 + 16), v8, 0);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)*((void *)self->_impl + 14);
}

- (void)invalidate
{
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", @"<%@:%p; contextId = 0x%x",
    NSStringFromClass(v4),
    self,
    [(CAContext *)self contextId]);
  if ([(CAContext *)self colorSpace])
  {
    uint64_t v5 = CGColorSpaceCopyICCProfileDescription();
    if (v5)
    {
      int v6 = (const void *)v5;
      [v3 appendFormat:@"; colorSpace = %@", v5];
      CFRelease(v6);
    }
  }
  if ([(CAContext *)self commitPriority]) {
    objc_msgSend(v3, "appendFormat:", @"; commitPrioritCGFloat y = %u",
  }
      [(CAContext *)self commitPriority]);
  [v3 appendFormat:@"; contentsFormat = %@", -[CAContext contentsFormat](self, "contentsFormat")];
  [(CAContext *)self level];
  if (v7 != 0.0)
  {
    [(CAContext *)self level];
    objc_msgSend(v3, "appendFormat:", @"; level = %f", v8);
  }
  if ([(CAContext *)self isSecure]) {
    [v3 appendString:@"; secure"];
  }
  [v3 appendString:@">"];
  return v3;
}

+ (id)createCacheBlock
{
  return (id)CA::Context::_create_cache_callback;
}

+ (void)setCreateCacheBlock:(id)a3
{
  if ((id)CA::Context::_create_cache_callback != a3)
  {
    _Block_release((const void *)CA::Context::_create_cache_callback);
    CA::Context::_create_cache_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (id)finalizeContextBlock
{
  return (id)CA::Context::_finalize_context_callback;
}

+ (void)setFinalizeContextBlock:(id)a3
{
  if ((id)CA::Context::_finalize_context_callback != a3)
  {
    _Block_release((const void *)CA::Context::_finalize_context_callback);
    CA::Context::_finalize_context_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (id)drawInContextBlock
{
  return (id)CA::Context::_draw_in_context_callback;
}

+ (void)setDrawInContextBlock:(id)a3
{
  if ((id)CA::Context::_draw_in_context_callback != a3)
  {
    _Block_release((const void *)CA::Context::_draw_in_context_callback);
    CA::Context::_draw_in_context_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (void)setClientPort:(unsigned int)a3
{
  CA::Context::_user_client_port = a3;
}

+ (id)remoteContext
{
  return (id)[a1 remoteContextWithOptions:0];
}

+ (id)localContextWithOptions:(id)a3
{
  uint64_t v3 = [[CAContext alloc] initWithOptions:a3 localContext:1];

  return v3;
}

+ (id)localContext
{
  return (id)[a1 localContextWithOptions:0];
}

+ (id)currentContext
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 40);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (id *)(v3 + 80);
  if (*(unsigned char *)(v3 + 88)) {
    return objc_loadWeak(v4);
  }
  else {
    return *v4;
  }
}

+ (id)allContexts
{
  id result = CA::Context::retain_objc_contexts((CA::Context *)a1);
  if (result)
  {
    return result;
  }
  return result;
}

@end