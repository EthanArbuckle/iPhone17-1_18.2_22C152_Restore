@interface CABatchHandle
+ (BOOL)supportsSecureCoding;
+ (id)createFromXPCRepresentation:(id)a3;
- (CABatchHandle)init;
- (CABatchHandle)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createXPCRepresentation;
- (id)description;
- (void)_initWithPort:(uint64_t)a3 name:;
- (void)_initWithXPCRepresentation:(void *)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation CABatchHandle

- (void)_initWithPort:(uint64_t)a3 name:
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)CABatchHandle;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (!v5) {
    __assert_rtn("-[CABatchHandle _initWithPort:name:]", "CABatchHandle.mm", 162, "self");
  }
  v6 = v5;
  do
    unint64_t add = atomic_fetch_add(&-[CABatchHandle _initWithPort:name:]::last_handle_name, 1uLL);
  while (add == -1);
  v5[1] = add + 1;
  v5[2] = a3;
  *((_DWORD *)v5 + 6) = a2;
  kdebug_trace();
  return v6;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 7) = 0;
  return self;
}

- (id)description
{
  v3 = NSString;
  unint64_t handle_name = self->_handle_name;
  unint64_t batch_name = self->_batch_name;
  v6 = @"NO";
  if (self->_port + 1 >= 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
    BOOL invalidated = self->_invalidated;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
    if (!invalidated) {
      v6 = @"YES";
    }
    if (batch_name) {
      return (id)[v3 stringWithFormat:@"<CABatchHandle:%p name=%llx batch=%llx usable=%@>", self, handle_name, batch_name, v6];
    }
  }
  else if (batch_name)
  {
    return (id)[v3 stringWithFormat:@"<CABatchHandle:%p name=%llx batch=%llx usable=%@>", self, handle_name, batch_name, v6];
  }
  return (id)[v3 stringWithFormat:@"<CABatchHandle:%p name=%llx usable=%@>", self, handle_name, v6, v9];
}

- (CABatchHandle)initWithCoder:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x185324A30]();
    v6 = (void *)[a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"x"];
    id v7 = v6;
  }
  else
  {
    v6 = 0;
  }
  v8 = (CABatchHandle *)-[CABatchHandle _initWithXPCRepresentation:](self, v6);

  return v8;
}

- (void)_initWithXPCRepresentation:(void *)a1
{
  v2 = a1;
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
    v2 = -[CABatchHandle _initWithPort:name:](v2, v5, uint64);
    kdebug_trace();
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[CABatchHandle encodeWithCoder:]", "CABatchHandle.mm", 318, "[coder isKindOfClass:[NSXPCCoder class]]");
  }
  id v5 = [(CABatchHandle *)self createXPCRepresentation];
  if (v5)
  {
    v6 = v5;
    [a3 encodeXPCObject:v5 forKey:@"x"];
    xpc_release(v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self && self->_port + 1 >= 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
    if (self->_invalidated || mach_port_insert_right(*MEMORY[0x1E4F14960], self->_port, self->_port, 0x13u)) {
      unsigned int port = 0;
    }
    else {
      unsigned int port = self->_port;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
  }
  else
  {
    unsigned int port = 0;
  }
  v6 = -[CABatchHandle _initWithPort:name:](+[CABatchHandle allocWithZone:](CABatchHandle, "allocWithZone:", a3), port, self->_batch_name);
  kdebug_trace();
  return v6;
}

- (id)createXPCRepresentation
{
  if (self->_port + 1 < 2) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  if (self->_invalidated) {
    unsigned int port = 0;
  }
  else {
    unsigned int port = self->_port;
  }
  xpc_object_t v2 = encode_batch_handle_port(self->_handle_name, self->_batch_name, port);
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  }
  else
  {
    self->_BOOL invalidated = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
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

- (CABatchHandle)init
{
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self
    || (p_lock = &self->_lock,
        os_unfair_lock_lock((os_unfair_lock_t)&self->_lock),
        BOOL invalidated = self->_invalidated,
        os_unfair_lock_unlock((os_unfair_lock_t)p_lock),
        !invalidated))
  {
    __assert_rtn("-[CABatchHandle dealloc]", "CABatchHandle.mm", 207, "[self isInvalidated]");
  }
  v5.receiver = self;
  v5.super_class = (Class)CABatchHandle;
  [(CABatchHandle *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createFromXPCRepresentation:(id)a3
{
  v4 = [CABatchHandle alloc];

  return -[CABatchHandle _initWithXPCRepresentation:](v4, a3);
}

@end