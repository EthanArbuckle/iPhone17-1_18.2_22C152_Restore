@interface CAFenceHandle
+ (BOOL)supportsSecureCoding;
+ (id)handleForPort:(unsigned int)a3 fenceId:(unint64_t)a4;
+ (id)handleFromXPCRepresentation:(id)a3;
+ (id)newFenceFromDefaultServer;
+ (id)newFenceFromServer:(unsigned int)a3;
+ (void)_newEphemeralHandleWithPort:(uint64_t)a1;
+ (void)_newFenceFromServer:(uint64_t)a1;
+ (void)_newFenceWithPort:(uint64_t)a3 name:;
- (BOOL)isInvalidated;
- (BOOL)isUsable;
- (CAFenceHandle)init;
- (CAFenceHandle)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createXPCRepresentation;
- (id)description;
- (os_unfair_lock_s)_copyPort;
- (os_unfair_lock_s)_copyUntrackedPort;
- (uint64_t)_accessMachPort:(uint64_t)result;
- (unint64_t)fenceId;
- (void)_initWithPort:(uint64_t)a3 name:(int)a4 tracing:;
- (void)_initWithXPCRepresentation:(void *)a1;
- (void)accessMachPort:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation CAFenceHandle

- (void)invalidate
{
  p_invalidation_mutex = &self->_invalidation_mutex;
  pthread_mutex_lock(&self->_invalidation_mutex._m);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
    pthread_mutex_unlock(&p_invalidation_mutex->_m);
  }
  else
  {
    self->_invalidated = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
    pthread_mutex_unlock(&p_invalidation_mutex->_m);
    mach_port_name_t port = self->_port;
    if (port) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], port);
    }
    if (self->_handle_name)
    {
      kdebug_trace();
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (![(CAFenceHandle *)self isInvalidated]) {
    __assert_rtn("-[CAFenceHandle dealloc]", "CAFenceHandle.mm", 138, "[self isInvalidated]");
  }
  v3.receiver = self;
  v3.super_class = (Class)CAFenceHandle;
  [(CAFenceHandle *)&v3 dealloc];
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return (char)v2;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 24) = 0;
  return self;
}

- (BOOL)isUsable
{
  if (self->_port + 1 < 2) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  BOOL v2 = !self->_invalidated;
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v2;
}

+ (id)handleFromXPCRepresentation:(id)a3
{
  objc_super v3 = -[CAFenceHandle _initWithXPCRepresentation:]([CAFenceHandle alloc], a3);

  return v3;
}

- (void)_initWithXPCRepresentation:(void *)a1
{
  BOOL v2 = a1;
  if (a1)
  {
    if (a2 && object_getClass(a2) == (Class)MEMORY[0x1E4F14590])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(a2, "f");
      xpc_dictionary_get_uint64(a2, "e");
      int v5 = xpc_dictionary_copy_mach_send();
    }
    else
    {
      uint64_t uint64 = 0;
      int v5 = 0;
    }
    BOOL v2 = -[CAFenceHandle _initWithPort:name:tracing:](v2, v5, uint64, 2);
    kdebug_trace();
  }
  return v2;
}

+ (id)newFenceFromDefaultServer
{
  mach_port_name_t ServerPort = CARenderServerGetServerPort(0);
  if (ServerPort - 1 <= 0xFFFFFFFD)
  {
    objc_super v3 = +[CAFenceHandle _newFenceFromServer:]((uint64_t)CAFenceHandle, ServerPort);
    if (v3) {
      goto LABEL_5;
    }
  }
  uint64_t v4 = [CAFenceHandle alloc];
  if (!v4)
  {
    objc_super v3 = 0;
    if (!ServerPort) {
      return v3;
    }
    goto LABEL_5;
  }
  objc_super v3 = -[CAFenceHandle _initWithPort:name:tracing:](v4, 0, 0, 2);
  if (ServerPort) {
LABEL_5:
  }
    mach_port_deallocate(*MEMORY[0x1E4F14960], ServerPort);
  return v3;
}

+ (void)_newFenceWithPort:(uint64_t)a3 name:
{
  self;
  if ((a2 + 1) <= 1) {
    __assert_rtn("+[CAFenceHandle _newFenceWithPort:name:]", "CAFenceHandle.mm", 308, "MACH_PORT_VALID (port)");
  }
  if (!a3) {
    __assert_rtn("+[CAFenceHandle _newFenceWithPort:name:]", "CAFenceHandle.mm", 309, "name > 0");
  }
  int v5 = [CAFenceHandle alloc];
  if (v5) {
    v6 = -[CAFenceHandle _initWithPort:name:tracing:](v5, a2, a3, 2);
  }
  else {
    v6 = 0;
  }
  kdebug_trace();
  return v6;
}

+ (void)_newFenceFromServer:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  if ((a2 + 1) <= 1) {
    __assert_rtn("+[CAFenceHandle _newFenceFromServer:]", "CAFenceHandle.mm", 48, "MACH_PORT_VALID (port)");
  }
  mach_port_name_t v11 = 0;
  uint64_t v10 = 0;
  int v3 = _CASCreateFencePort(a2, &v11, &v10);
  if (v3 == -81182719)
  {
    x_log_crash("Unentitled call to server!");
    abort();
  }
  int v4 = v3;
  mach_port_name_t v5 = v11;
  if (v3 || v11 + 1 < 2)
  {
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v6 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = v4;
        _os_log_impl(&dword_184668000, v6, OS_LOG_TYPE_ERROR, "Server failed to create port for fence (%u)", buf, 8u);
      }
    }
    if (v5) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5);
    }
    return 0;
  }
  else
  {
    uint64_t v8 = v10;
    int v9 = v11;
    return +[CAFenceHandle _newFenceWithPort:name:]((uint64_t)CAFenceHandle, v9, v8);
  }
}

- (uint64_t)_accessMachPort:(uint64_t)result
{
  if (result && a2)
  {
    uint64_t v3 = result;
    int v4 = (pthread_mutex_t *)(result + 32);
    pthread_mutex_lock((pthread_mutex_t *)(result + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 96));
    uint64_t v5 = *(unsigned __int8 *)(v3 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 96));
    (*(void (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, *(unsigned int *)(v3 + 24), v5);
    return pthread_mutex_unlock(v4);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = -[CAFenceHandle _copyUntrackedPort]((os_unfair_lock_s *)self);
  v6 = +[CAFenceHandle allocWithZone:a3];
  if (v6) {
    v7 = -[CAFenceHandle _initWithPort:name:tracing:](v6, v5, self->_fence_name, 2);
  }
  else {
    v7 = 0;
  }
  kdebug_trace();
  return v7;
}

- (void)_initWithPort:(uint64_t)a3 name:(int)a4 tracing:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)CAFenceHandle;
  v7 = objc_msgSendSuper2(&v12, sel_init);
  if (!v7) {
    __assert_rtn("-[CAFenceHandle _initWithPort:name:tracing:]", "CAFenceHandle.mm", 79, "self");
  }
  uint64_t v8 = v7;
  if (a4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&-[CAFenceHandle _initWithPort:name:tracing:]::handle_name_lock);
    if (-[CAFenceHandle _initWithPort:name:tracing:]::last_handle_name == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -[CAFenceHandle _initWithPort:name:tracing:]::last_handle_name + 1;
    }
    -[CAFenceHandle _initWithPort:name:tracing:]::last_handle_name = v9;
    unint64_t v10 = v9 | 0x8000000000000000;
    if (a4 != 1) {
      unint64_t v10 = v9;
    }
    v8[1] = v10;
    os_unfair_lock_unlock((os_unfair_lock_t)&-[CAFenceHandle _initWithPort:name:tracing:]::handle_name_lock);
  }
  else
  {
    v7[1] = 0;
  }
  v8[2] = a3;
  pthread_mutex_init((pthread_mutex_t *)(v8 + 4), 0);
  *((_DWORD *)v8 + 6) = a2;
  *((unsigned char *)v8 + 100) = 0;
  if (v8[1]) {
    kdebug_trace();
  }
  return v8;
}

- (os_unfair_lock_s)_copyUntrackedPort
{
  os_unfair_lock_opaque = a1;
  if (a1)
  {
    if (a1[6]._os_unfair_lock_opaque + 1 >= 2)
    {
      BOOL v2 = a1 + 24;
      os_unfair_lock_lock(a1 + 24);
      if (LOBYTE(os_unfair_lock_opaque[25]._os_unfair_lock_opaque)
        || mach_port_insert_right(*MEMORY[0x1E4F14960], os_unfair_lock_opaque[6]._os_unfair_lock_opaque, os_unfair_lock_opaque[6]._os_unfair_lock_opaque, 0x13u))
      {
        os_unfair_lock_opaque = 0;
      }
      else
      {
        os_unfair_lock_opaque = (os_unfair_lock_s *)os_unfair_lock_opaque[6]._os_unfair_lock_opaque;
      }
      os_unfair_lock_unlock(v2);
    }
    else
    {
      return 0;
    }
  }
  return os_unfair_lock_opaque;
}

+ (void)_newEphemeralHandleWithPort:(uint64_t)a1
{
  self;
  if (a2 - 1 > 0xFFFFFFFD)
  {
    a2 = 0;
  }
  else if (mach_port_insert_right(*MEMORY[0x1E4F14960], a2, a2, 0x13u))
  {
    a2 = 0;
  }
  uint64_t v3 = [CAFenceHandle alloc];

  return -[CAFenceHandle _initWithPort:name:tracing:](v3, a2, 0, 0);
}

- (os_unfair_lock_s)_copyPort
{
  if (result)
  {
    if (!*(void *)&result[2]._os_unfair_lock_opaque) {
      __assert_rtn("-[CAFenceHandle _copyPort]", "CAFenceHandle.mm", 361, "_handle_name");
    }
    v1 = -[CAFenceHandle _copyUntrackedPort](result);
    kdebug_trace();
    return v1;
  }
  return result;
}

- (id)createXPCRepresentation
{
  os_unfair_lock_lock((os_unfair_lock_t)&-[CAFenceHandle createXPCRepresentation]::encode_count_lock);
  if ((-[CAFenceHandle createXPCRepresentation]::last_encode_count + 1) > 1) {
    uint64_t v3 = (-[CAFenceHandle createXPCRepresentation]::last_encode_count + 1);
  }
  else {
    uint64_t v3 = 1;
  }
  -[CAFenceHandle createXPCRepresentation]::last_encode_count = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CAFenceHandle createXPCRepresentation]::encode_count_lock);
  uint64_t v4 = v3 | ((uint64_t)getpid() << 32);
  kdebug_trace();
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  uint64_t fence_name = self->_fence_name;
  if (fence_name) {
    xpc_dictionary_set_uint64(v5, "f", fence_name);
  }
  xpc_dictionary_set_uint64(v6, "e", v4);
  if (self->_port + 1 >= 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
    if (!self->_invalidated) {
      xpc_dictionary_set_mach_send();
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
  }
  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  unint64_t handle_name = self->_handle_name;
  unint64_t fence_name = self->_fence_name;
  BOOL v6 = [(CAFenceHandle *)self isUsable];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  if (fence_name) {
    return (id)[v3 stringWithFormat:@"<CAFenceHandle:%p name=%llx fence=%llx usable=%@>", self, handle_name, fence_name, v7];
  }
  else {
    return (id)[v3 stringWithFormat:@"<CAFenceHandle:%p name=%llx usable=%@>", self, handle_name, v7, v9];
  }
}

- (CAFenceHandle)initWithCoder:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v5 = (void *)MEMORY[0x185324A30]();
    BOOL v6 = (void *)[a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"x"];
    id v7 = v6;
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v8 = (CAFenceHandle *)-[CAFenceHandle _initWithXPCRepresentation:](self, v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[CAFenceHandle encodeWithCoder:]", "CAFenceHandle.mm", 426, "[coder isKindOfClass:[NSXPCCoder class]]");
  }
  id v5 = [(CAFenceHandle *)self createXPCRepresentation];
  if (v5)
  {
    BOOL v6 = v5;
    [a3 encodeXPCObject:v5 forKey:@"x"];
    xpc_release(v6);
  }
}

- (void)accessMachPort:(id)a3
{
}

- (unint64_t)fenceId
{
  return self->_fence_name;
}

- (CAFenceHandle)init
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)handleForPort:(unsigned int)a3 fenceId:(unint64_t)a4
{
  BOOL v6 = [CAFenceHandle alloc];
  if (v6) {
    BOOL v6 = (CAFenceHandle *)-[CAFenceHandle _initWithPort:name:tracing:](v6, a3, a4, 2);
  }

  return v6;
}

+ (id)newFenceFromServer:(unsigned int)a3
{
  return +[CAFenceHandle _newFenceFromServer:]((uint64_t)CAFenceHandle, a3);
}

@end