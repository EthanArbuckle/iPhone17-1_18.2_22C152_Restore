@interface CADisplayPowerAssertion
- (BOOL)isActive;
- (NSString)identifier;
- (id)_initWithDisplayId:(unsigned int)a3 reason:(int64_t)a4 identifier:(id)a5;
- (id)description;
- (int64_t)reason;
- (void)_acquireAndWait:(BOOL)a3;
- (void)_ensureValid;
- (void)acquire;
- (void)acquireAndWaitForPowerOn;
- (void)cancel;
- (void)dealloc;
- (void)initializeClientPort;
- (void)invalidate;
@end

@implementation CADisplayPowerAssertion

- (void)initializeClientPort
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v4.flags = xmmword_1849A8140;
  v4.reserved[1] = 0;
  uint64_t v3 = mach_port_construct(*MEMORY[0x1E4F14960], &v4, (mach_port_context_t)self->_identifier, &self->_client_port);
  CA_CLIENT_MACH_PORT_ALLOCATE_FAILED(v3, self->_client_port);
}

- (void)invalidate
{
  if (self->_active) {
    [(CADisplayPowerAssertion *)self cancel];
  }
  self->_invalidated = 1;
}

- (void)cancel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(CADisplayPowerAssertion *)self _ensureValid];
  if (!self->_active) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplayPowerAssertion", @"The %@ assertion (%@) is not active.", NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier format];
  }
  unsigned int display_id = self->_display_id;
  unsigned int server_port = self->_server_port;
  unsigned int client_port = self->_client_port;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[28] = client_port;
  int v7 = 1245184;
  *(_OWORD *)&msg[4] = 0u;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  unsigned int v9 = display_id;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = server_port;
  *(void *)&msg[20] = 0x100009D5ELL;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
  self->_active = 0;
}

- (void)acquireAndWaitForPowerOn
{
}

- (void)acquire
{
}

- (void)_acquireAndWait:(BOOL)a3
{
  mach_msg_return_t v11;
  unsigned char msg[36];
  int v13;
  uint64_t v14;
  unsigned int v15;
  pid_t v16;
  int v17;
  uint64_t v18;

  BOOL v3 = a3;
  v18 = *MEMORY[0x1E4F143B8];
  [(CADisplayPowerAssertion *)self _ensureValid];
  if (self->_active) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplayPowerAssertion", @"The %@ assertion (%@) is already active.", NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier format];
  }
  unsigned int server_port = self->_server_port;
  unsigned int display_id = self->_display_id;
  pid_t v7 = getpid();
  unsigned int client_port = self->_client_port;
  int reason = self->_reason;
  if (v3)
  {
    memset(&msg[4], 0, 32);
    *(_DWORD *)&msg[24] = 1;
    *(_DWORD *)&msg[28] = client_port;
    v13 = 1245184;
    v14 = *MEMORY[0x1E4F14068];
    v15 = display_id;
    v16 = v7;
    v17 = reason;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = server_port;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = -2147478253;
    *(void *)&msg[16] = 0x9D5D00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = *(_DWORD *)&msg[12];
    }
    v11 = mach_msg((mach_msg_header_t *)msg, 3, 0x3Cu, 0x2Cu, reply_port, 0, 0);
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if (v11)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if (*(_DWORD *)&msg[20] != 40385 {
           || (*(_DWORD *)msg & 0x80000000) != 0
    }
           || *(_DWORD *)&msg[4] != 36
           || *(_DWORD *)&msg[8]
           || *(_DWORD *)&msg[32])
    {
      mach_msg_destroy((mach_msg_header_t *)msg);
    }
  }
  else
  {
    memset(&msg[4], 0, 32);
    *(_DWORD *)&msg[28] = client_port;
    v13 = 1245184;
    v14 = *MEMORY[0x1E4F14068];
    v15 = display_id;
    v16 = v7;
    v17 = reason;
    *(_DWORD *)msg = -2147483629;
    *(_DWORD *)&msg[8] = server_port;
    *(void *)&msg[20] = 0x100009D5CLL;
    if (MEMORY[0x1E4F14B18]) {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
    }
    mach_msg((mach_msg_header_t *)msg, 1, 0x3Cu, 0, 0, 0, 0);
  }
  self->_active = 1;
}

- (void)_ensureValid
{
  if (self->_invalidated) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplayPowerAssertion", @"The %@ assertion (%@) is already invalidated.", NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier format];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)reason
{
  return self->_reason;
}

- (id)description
{
  BOOL v3 = (void *)[MEMORY[0x1E4F28E78] string];
  mach_port_options_t v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@:%p; ", NSStringFromClass(v4), self];
  [v3 appendFormat:@"active: %i, invalidated: %i, reason: %@, identifier: %@", self->_active, self->_invalidated, NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier];
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplayPowerAssertion", @"The %@ assertion (%@) is deallocated without calling -invalidate first.", NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier format];
  }
  mach_port_name_t server_port = self->_server_port;
  mach_port_options_t v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (server_port + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], server_port);
  }
  mach_port_destruct(*v4, self->_client_port, -1, (mach_port_context_t)self->_identifier);

  v5.receiver = self;
  v5.super_class = (Class)CADisplayPowerAssertion;
  [(CADisplayPowerAssertion *)&v5 dealloc];
}

- (id)_initWithDisplayId:(unsigned int)a3 reason:(int64_t)a4 identifier:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CADisplayPowerAssertion;
  uint64_t v8 = [(CADisplayPowerAssertion *)&v12 init];
  unsigned int v9 = v8;
  if (v8)
  {
    v8->_unsigned int display_id = a3;
    v8->_int reason = a4;
    v8->_identifier = (NSString *)[a5 copy];
    unsigned int ServerPort = CARenderServerGetServerPort(0);
    v9->_mach_port_name_t server_port = ServerPort;
    if (ServerPort)
    {
      [(CADisplayPowerAssertion *)v9 initializeClientPort];
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

@end