@interface CADisplayStateControl
- (char)_copyAllPowerAssertionInfo;
- (id).cxx_construct;
- (id)_initWithDisplayId:(unsigned int)a3;
- (id)createPowerAssertionWithReason:(int64_t)a3 identifier:(id)a4;
- (int64_t)displayState;
- (int64_t)powerState;
- (int64_t)targetDisplayState;
- (int64_t)targetPowerState;
- (void)dealloc;
- (void)didChangeToState:(int64_t)a3 seed:(unsigned __int8)a4 result:(int64_t)a5;
- (void)initializeClientPort;
- (void)transitionToDisplayState:(int64_t)a3 withCompletion:(id)a4;
@end

@implementation CADisplayStateControl

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 16) = 0;
  return self;
}

- (void)initializeClientPort
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__str = 0u;
  long long v6 = 0u;
  snprintf(__str, 0x40uLL, "CADisplayStateControl.%i", self->_display_id);
  uint64_t v3 = CA::MachPortUtil::ClientIPC::create((mach_port_context_t)&self->_client_ipc, __str);
  CA_CLIENT_MACH_PORT_ALLOCATE_FAILED(v3, self->_client_ipc._port);
  source = self->_client_ipc._source;
  if (source) {
    dispatch_activate(source);
  }
}

- (id)createPowerAssertionWithReason:(int64_t)a3 identifier:(id)a4
{
  long long v7 = [CADisplayPowerAssertion alloc];
  uint64_t display_id = self->_display_id;

  return [(CADisplayPowerAssertion *)v7 _initWithDisplayId:display_id reason:a3 identifier:a4];
}

- (void)transitionToDisplayState:(int64_t)a3 withCompletion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_callback_lock = &self->_callback_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  completion = (void (**)(id, int64_t, uint64_t))self->_completion;
  if (completion)
  {
    uint64_t seed = self->_seed;
    self->_completion = 0;
  }
  else
  {
    uint64_t seed = 0;
  }
  self->_target_state = a3;
  self->_completion = _Block_copy(a4);
  unsigned __int8 v10 = self->_seed + 1;
  self->_uint64_t seed = v10;
  os_unfair_lock_unlock((os_unfair_lock_t)p_callback_lock);
  if (completion)
  {
    if (x_log_hook_p())
    {
      uint64_t display_id = self->_display_id;
      uint64_t v20 = seed;
      x_log_();
    }
    else
    {
      v11 = x_log_category_display_state;
      if (os_log_type_enabled((os_log_t)x_log_category_display_state, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = self->_display_id;
        *(_DWORD *)buf = 67109376;
        LODWORD(v22) = v12;
        WORD2(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 6) = seed;
        _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_DEFAULT, "CADisplayStateControl transition display_id=%u seed=%u interrupted", buf, 0xEu);
      }
    }
    completion[2](completion, [(CADisplayStateControl *)self displayState], 3);
    _Block_release(completion);
  }
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v13 = x_log_category_display_state;
    if (os_log_type_enabled((os_log_t)x_log_category_display_state, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 0xBu) {
        v14 = "unknown";
      }
      else {
        v14 = off_1E5273AC0[a3];
      }
      unsigned int v15 = self->_display_id;
      *(_DWORD *)buf = 136315906;
      *(void *)&long long v22 = v14;
      WORD4(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 10) = v15;
      HIWORD(v22) = 1024;
      LODWORD(v23) = v10;
      WORD2(v23) = 2048;
      *(void *)((char *)&v23 + 6) = a4;
      _os_log_impl(&dword_184668000, v13, OS_LOG_TYPE_DEFAULT, "CADisplayStateControl transitionToDisplayState=%s, display_id=%u, seed=%u, completion=%p", buf, 0x22u);
    }
  }
  unsigned int server_port = self->_server_port;
  if (a4) {
    unsigned int port = self->_client_ipc._port;
  }
  else {
    unsigned int port = 0;
  }
  unsigned int v18 = self->_display_id;
  long long v23 = 0u;
  DWORD2(v23) = port;
  int v24 = 1245184;
  long long v22 = 0u;
  uint64_t v25 = *MEMORY[0x1E4F14068];
  unsigned int v26 = v18;
  char v27 = a3;
  __int16 v28 = 0;
  char v29 = 0;
  unsigned __int8 v30 = v10;
  __int16 v31 = 0;
  char v32 = 0;
  *(_DWORD *)buf = -2147483629;
  DWORD1(v22) = server_port;
  *(void *)&long long v23 = 0x100009D5BLL;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)buf);
  }
  mach_msg((mach_msg_header_t *)buf, 1, 0x3Cu, 0, 0, 0, 0);
}

- (int64_t)powerState
{
  return self->_display_state->var2;
}

- (int64_t)displayState
{
  return self->_display_state->var0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  mach_port_name_t server_port = self->_server_port;
  if (server_port + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], server_port);
  }
  CA::MachPortUtil::ClientIPC::destroy((CA::MachPortUtil::ClientIPC *)&self->_client_ipc);
  shmem = (atomic_uint *)self->_shmem;
  if (shmem)
  {
    self->_display_state = 0;
    if (atomic_fetch_add(shmem + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)shmem + 16))(shmem);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  _Block_release(self->_completion);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_callback_lock);
  os_unfair_lock_lock((os_unfair_lock_t)&_controls_lock);
  for (i = (CADisplayStateControl **)_controls; i != (CADisplayStateControl **)qword_1E8F83BC8; ++i)
  {
    if (*i == self)
    {
      *i = *(CADisplayStateControl **)(qword_1E8F83BC8 - 8);
      if (qword_1E8F83BC8 <= (unint64_t)_controls) {
        __assert_rtn("pop_back", "x-small-vector.h", 410, "_end > _begin && \"pop_back on empty container\"");
      }
      qword_1E8F83BC8 -= 8;
      break;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CADisplayStateControl;
  [(CADisplayStateControl *)&v6 dealloc];
  os_unfair_lock_unlock((os_unfair_lock_t)&_controls_lock);
}

- (void)didChangeToState:(int64_t)a3 seed:(unsigned __int8)a4 result:(int64_t)a5
{
  int v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_callback_lock = &self->_callback_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  if (self->_seed == v6)
  {
    completion = (void (**)(id, int64_t, int64_t))self->_completion;
    self->_completion = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)p_callback_lock);
    if (completion)
    {
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        v11 = x_log_category_display_state;
        if (os_log_type_enabled((os_log_t)x_log_category_display_state, OS_LOG_TYPE_DEFAULT))
        {
          if (a3 > 0xBu) {
            unsigned int v12 = "unknown";
          }
          else {
            unsigned int v12 = off_1E5273AC0[a3];
          }
          unsigned int display_id = self->_display_id;
          if ((a5 + 1) > 6u) {
            v14 = "unknown";
          }
          else {
            v14 = off_1E5273B20[(a5 + 1)];
          }
          *(_DWORD *)buf = 136315906;
          v16 = v12;
          __int16 v17 = 1024;
          unsigned int v18 = display_id;
          __int16 v19 = 1024;
          int v20 = v6;
          __int16 v21 = 2080;
          long long v22 = v14;
          _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_DEFAULT, "CADisplayStateControl didChangeToState=%s display_id=%u seed=%u result=%s", buf, 0x22u);
        }
      }
      completion[2](completion, a3, a5);
      _Block_release(completion);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)p_callback_lock);
  }
}

- (id)_initWithDisplayId:(unsigned int)a3
{
  mach_msg_return_t v9;
  mach_port_name_t v10;
  DisplayStateInfo **v11;
  CADisplayStateControl **v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  objc_super v27;
  void msg[9];

  msg[8] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CADisplayStateControl;
  v4 = [(CADisplayStateControl *)&v27 init];
  if (v4)
  {
    unsigned int ServerPort = CARenderServerGetServerPort(0);
    v4->_unsigned int server_port = ServerPort;
    if (!ServerPort) {
      goto LABEL_30;
    }
    v4->_unsigned int display_id = a3;
    [(CADisplayStateControl *)v4 initializeClientPort];
    unsigned int server_port = v4->_server_port;
    unsigned int display_id = v4->_display_id;
    memset((char *)msg + 4, 0, 60);
    msg[3] = *MEMORY[0x1E4F14068];
    LODWORD(msg[4]) = display_id;
    reply_unsigned int port = mig_get_reply_port();
    msg[1] = __PAIR64__(reply_port, server_port);
    LODWORD(msg[0]) = 5395;
    msg[2] = 0x9D5A00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_unsigned int port = HIDWORD(msg[1]);
    }
    uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(HIDWORD(msg[1]));
      goto LABEL_30;
    }
    if (v9)
    {
      mig_dealloc_reply_port(HIDWORD(msg[1]));
      goto LABEL_30;
    }
    if (HIDWORD(msg[2]) != 40382
      || (msg[0] & 0x80000000) == 0
      || LODWORD(msg[3]) != 1
      || *(void *)((char *)msg + 4) != 56
      || HIWORD(msg[4]) << 16 != 1114112)
    {
      mach_msg_destroy((mach_msg_header_t *)msg);
      goto LABEL_30;
    }
    unsigned __int8 v10 = HIDWORD(msg[3]);
    if (!HIDWORD(msg[3]))
    {
LABEL_30:

      return 0;
    }
    v11 = (DisplayStateInfo **)CA::Render::Shmem::new_shmem(HIDWORD(msg[3]), msg[6], 0, 3);
    if (!v11)
    {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v10);

      return 0;
    }
    v4->_shmem = v11;
    v4->_display_state = v11[3];
    os_unfair_lock_lock((os_unfair_lock_t)&_controls_lock);
    v13 = _controls;
    unsigned int v12 = (CADisplayStateControl **)qword_1E8F83BC8;
    v14 = (qword_1E8F83BC8 - (uint64_t)_controls) >> 3;
    if (qword_1E8F83BD8 < (unint64_t)(v14 + 1))
    {
      unsigned int v15 = qword_1E8F83BD0;
      v16 = (qword_1E8F83BD8 + 1) | ((unint64_t)(qword_1E8F83BD8 + 1) >> 1) | (((qword_1E8F83BD8 + 1) | ((unint64_t)(qword_1E8F83BD8 + 1) >> 1)) >> 2);
      __int16 v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
      unsigned int v18 = v17 | (v17 >> 16) | ((v17 | (v17 >> 16)) >> 32);
      if (v18 + 1 > v14 + 1) {
        __int16 v19 = v18 + 1;
      }
      else {
        __int16 v19 = v14 + 1;
      }
      int v20 = (char *)malloc_type_malloc(8 * v19, 0x80040B8603338uLL);
      __int16 v21 = v20;
      long long v22 = (uint64_t *)_controls;
      uint64_t v23 = qword_1E8F83BC8;
      if (_controls != (_UNKNOWN *)qword_1E8F83BC8)
      {
        int v24 = v20;
        do
        {
          uint64_t v25 = *v22++;
          *(void *)int v24 = v25;
          v24 += 8;
        }
        while (v22 != (uint64_t *)v23);
      }
      if (v13 != (void *)v15) {
        free(_controls);
      }
      unsigned int v12 = (CADisplayStateControl **)&v21[8 * v14];
      _controls = v21;
      qword_1E8F83BC8 = (uint64_t)v12;
      qword_1E8F83BD8 = v19;
    }
    *unsigned int v12 = v4;
    qword_1E8F83BC8 += 8;
    os_unfair_lock_unlock((os_unfair_lock_t)&_controls_lock);
  }
  return v4;
}

- (char)_copyAllPowerAssertionInfo
{
  mach_msg_return_t v5;
  mach_port_t msgh_remote_port;
  size_t msgh_voucher_port;
  const void *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  mach_msg_header_t msg[3];
  uint64_t v14;

  v14 = *MEMORY[0x1E4F143B8];
  mach_port_t server_port = self->_server_port;
  mach_port_t display_id = self->_display_id;
  *(_OWORD *)&msg[0].msgh_id = 0u;
  memset(&msg[1].msgh_local_port, 0, 28);
  *(_OWORD *)&msg[0].msgh_size = 0u;
  *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14068];
  msg[1].msgh_remote_unsigned int port = display_id;
  reply_unsigned int port = mig_get_reply_port();
  msg[0].msgh_remote_unsigned int port = server_port;
  msg[0].msgh_local_unsigned int port = reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_unsigned int port = 0x9D5F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    reply_unsigned int port = msg[0].msgh_local_port;
  }
  v5 = mach_msg(msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  msgh_remote_unsigned int port = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg[0].msgh_local_port);
    goto LABEL_29;
  }
  if (v5)
  {
    mig_dealloc_reply_port(msg[0].msgh_local_port);
    goto LABEL_29;
  }
  if (msg[0].msgh_id == 71)
  {
    msgh_remote_unsigned int port = -308;
LABEL_28:
    mach_msg_destroy(msg);
LABEL_29:
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v11 = x_log_category_display_state;
      if (os_log_type_enabled((os_log_t)x_log_category_display_state, OS_LOG_TYPE_ERROR))
      {
        msg[0].msgh_bits = 67109120;
        msg[0].msgh_size = msgh_remote_port;
        _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "Unable to get power assertions %x", (uint8_t *)msg, 8u);
      }
    }
    return 0;
  }
  if (msg[0].msgh_id != 40387)
  {
    msgh_remote_unsigned int port = -301;
    goto LABEL_28;
  }
  if ((msg[0].msgh_bits & 0x80000000) == 0)
  {
    if (msg[0].msgh_size == 36)
    {
      msgh_remote_unsigned int port = -300;
      if (msg[1].msgh_remote_port)
      {
        if (msg[0].msgh_remote_port) {
          msgh_remote_unsigned int port = -300;
        }
        else {
          msgh_remote_unsigned int port = msg[1].msgh_remote_port;
        }
      }
      goto LABEL_28;
    }
LABEL_27:
    msgh_remote_unsigned int port = -300;
    goto LABEL_28;
  }
  msgh_remote_unsigned int port = -300;
  if (msg[1].msgh_bits != 1 || msg[0].msgh_size != 56 || msg[0].msgh_remote_port) {
    goto LABEL_28;
  }
  if (HIBYTE(msg[1].msgh_local_port) != 1) {
    goto LABEL_27;
  }
  msgh_voucher_unsigned int port = msg[1].msgh_voucher_port;
  if (msg[1].msgh_voucher_port != msg[2].msgh_size) {
    goto LABEL_27;
  }
  long long v8 = *(const void **)&msg[1].msgh_size;
  if (!*(void *)&msg[1].msgh_size) {
    return 0;
  }
  uint64_t v9 = (char *)malloc_type_malloc(msg[1].msgh_voucher_port + 1, 0x6723CF4CuLL);
  unsigned __int8 v10 = v9;
  if (v9)
  {
    memcpy(v9, v8, msgh_voucher_port);
    v10[msgh_voucher_port] = 0;
  }
  mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)v8, msgh_voucher_port);
  return v10;
}

- (int64_t)targetPowerState
{
  return self->_display_state->var3;
}

- (int64_t)targetDisplayState
{
  return self->_display_state->var1;
}

@end