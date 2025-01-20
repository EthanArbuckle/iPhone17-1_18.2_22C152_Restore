@interface CABatchInfo
+ (CABatchInfo)_newInfoWithUnownedPort:(unint64_t)a3 name:;
- (id).cxx_construct;
- (id)newBatchHandle;
- (id)newXPCBatchHandle;
- (void)dealloc;
@end

@implementation CABatchInfo

- (id).cxx_construct
{
  *((_DWORD *)self + 5) = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated) {
    __assert_rtn("-[CABatchInfo dealloc]", "CABatchHandle.mm", 129, "_invalidated");
  }
  v2.receiver = self;
  v2.super_class = (Class)CABatchInfo;
  [(CABatchInfo *)&v2 dealloc];
}

+ (CABatchInfo)_newInfoWithUnownedPort:(unint64_t)a3 name:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self;
  result = [CABatchInfo alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)CABatchInfo;
    result = (CABatchInfo *)objc_msgSendSuper2(&v6, sel_init);
    if (!result) {
      __assert_rtn("-[CABatchInfo _initWithUnownedPort:name:]", "CABatchHandle.mm", 83, "self");
    }
    if (a2 + 1 <= 1) {
      __assert_rtn("-[CABatchInfo _initWithUnownedPort:name:]", "CABatchHandle.mm", 84, "MACH_PORT_VALID (port)");
    }
    result->_batch_name = a3;
    result->_port = a2;
    result->_invalidated = 0;
  }
  return result;
}

- (id)newBatchHandle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  mach_port_name_t port = self->_port;
  if (port + 1 >= 2 && !self->_invalidated && !mach_port_insert_right(*MEMORY[0x1E4F14960], port, self->_port, 0x13u))
  {
    unsigned int v7 = self->_port;
    unint64_t batch_name = self->_batch_name;
    self;
    if (v7 + 1 < 2)
    {
      v9 = "MACH_PORT_VALID (port)";
      int v10 = 151;
    }
    else
    {
      if (batch_name)
      {
        v5 = -[CABatchHandle _initWithPort:name:]([CABatchHandle alloc], v7, batch_name);
        goto LABEL_5;
      }
      v9 = "name > 0";
      int v10 = 152;
    }
    __assert_rtn("+[CABatchHandle _newBatchWithPort:name:]", "CABatchHandle.mm", v10, v9);
  }
  v5 = 0;
LABEL_5:
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v5;
}

- (id)newXPCBatchHandle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  unsigned int port = self->_port;
  if (port + 1 < 2 || self->_invalidated) {
    xpc_object_t v5 = 0;
  }
  else {
    xpc_object_t v5 = encode_batch_handle_port(0, self->_batch_name, port);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v5;
}

@end