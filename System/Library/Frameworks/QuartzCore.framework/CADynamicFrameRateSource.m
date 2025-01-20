@interface CADynamicFrameRateSource
- (BOOL)isPaused;
- (BOOL)shiftFramePhaseBy:(double)a3;
- (CADynamicFrameRateSource)initWithDisplay:(id)a3;
- (CAFrameRateRange)preferredFrameRateRange;
- (double)commitDeadline;
- (double)commitDeadlineAfterTimestamp:(double)a3;
- (void)dealloc;
- (void)setHighFrameRateReasons:(const unsigned int *)a3 count:(unint64_t)a4;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
@end

@implementation CADynamicFrameRateSource

- (void)setHighFrameRateReasons:(const unsigned int *)a3 count:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (a4 >= 4) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = a4;
  }
  size_t v7 = 4 * v6;
  if (v6 <= 3) {
    size_t v8 = 16 - v7;
  }
  else {
    size_t v8 = 0;
  }
  bzero(&__dst[v7], v8);
  memcpy(__dst, a3, v7);
  if (memcmp(impl->var8, __dst, v7))
  {
    memmove(impl->var8, a3, v7);
    if (*((unsigned char *)impl + 88)) {
      CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, impl->var8, 4u);
    }
    float minimum = impl->var2.minimum;
    float maximum = impl->var2.maximum;
    float preferred = impl->var2.preferred;
    CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)impl, *(CAFrameRateRange *)&minimum, 1);
  }
}

- (void)setPaused:(BOOL)a3
{
  impl = self->_impl;
  char v4 = *((unsigned char *)impl + 104);
  if (((((v4 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)impl + 104) = v4 & 0xFE | a3;
    if (a3)
    {
      if (*((unsigned char *)impl + 88))
      {
        CA::Display::DisplayTimingsControl::unregister_frame_interval_range((os_unfair_lock_s *)impl->var1, impl->var3);
        CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, 0, 0);
        *((unsigned char *)impl + 88) &= ~1u;
      }
    }
    else
    {
      float minimum = impl->var2.minimum;
      float maximum = impl->var2.maximum;
      float preferred = impl->var2.preferred;
      CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)impl, *(CAFrameRateRange *)&minimum, 1);
    }
  }
}

- (double)commitDeadlineAfterTimestamp:(double)a3
{
  impl = self->_impl;
  uint64_t v4 = CAHostTimeWithTime(a3);
  uint64_t v5 = CA::DynamicFrameRateSource::commit_deadline((CA::DynamicFrameRateSource *)impl);
  if (v5 <= v4) {
    uint64_t v5 = CA::DynamicFrameRateSource::_commit_deadline_at_timestamp((CA::DynamicFrameRateSource *)impl, v4);
  }

  return CATimeWithHostTime(v5);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  if (!CAFrameRateRangeIsValid(a3.minimum, a3.maximum, a3.preferred))
  {
    uint64_t v11 = [NSString stringWithFormat:@"invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)", minimum, maximum, preferred];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  impl = self->_impl;
  float v8 = minimum;
  float v9 = maximum;
  float v10 = preferred;

  CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)impl, *(CAFrameRateRange *)&v8, 1);
}

- (BOOL)isPaused
{
  return *((unsigned char *)self->_impl + 104) & 1;
}

- (CADynamicFrameRateSource)initWithDisplay:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CADynamicFrameRateSource;
  v3 = [(CADynamicFrameRateSource *)&v5 init];
  if (v3) {
    operator new();
  }
  return v3;
}

- (BOOL)shiftFramePhaseBy:(double)a3
{
  mach_msg_return_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  int v17;
  unint64_t var6;
  mach_msg_header_t v19;
  uint64_t v20;
  int v21;
  pid_t v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  unint64_t v4 = CAHostTimeWithTime(a3);
  if (*((unsigned char *)impl + 104)) {
    return 0;
  }
  var1 = (os_unfair_lock_s *)impl->var1;
  if ((var1[58]._os_unfair_lock_opaque & 0x200) == 0) {
    return 0;
  }
  unint64_t v6 = v4;
  size_t v7 = var1 + 23;
  os_unfair_lock_lock(var1 + 23);
  if (0xAAAAAAAAAAAAAAABLL
     * ((uint64_t)(*(void *)&var1[30]._os_unfair_lock_opaque - *(void *)&var1[28]._os_unfair_lock_opaque) >> 2) >= 2)
    goto LABEL_32;
  mach_port_t ServerPort = CARenderServerGetServerPort(0);
  int os_unfair_lock_opaque = var1[2]._os_unfair_lock_opaque;
  pid_t v10 = getpid();
  v20 = *MEMORY[0x1E4F14068];
  v21 = os_unfair_lock_opaque;
  v22 = v10;
  v23 = v6;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v19.msgh_bits = 5395;
  v19.msgh_remote_port = ServerPort;
  v19.msgh_local_port = reply_port;
  *(void *)&v19.msgh_voucher_port = 0x9D5900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v19);
    mach_port_t reply_port = v19.msgh_local_port;
  }
  v12 = mach_msg(&v19, 3, 0x30u, 0x30u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v19.msgh_local_port);
    goto LABEL_28;
  }
  if (v12)
  {
    mig_dealloc_reply_port(v19.msgh_local_port);
    goto LABEL_27;
  }
  if (v19.msgh_id == 71)
  {
    uint64_t v13 = -308;
LABEL_26:
    mach_msg_destroy(&v19);
LABEL_27:
    if (!v13)
    {
LABEL_32:
      os_unfair_lock_unlock(v7);
      return 0;
    }
LABEL_28:
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v15 = x_log_category_frame_rate;
      if (os_log_type_enabled((os_log_t)x_log_category_frame_rate, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19.msgh_bits) = 0;
        _os_log_impl(&dword_184668000, v15, OS_LOG_TYPE_ERROR, "CAFrameRateClient: request_frame_phase_shift failed", (uint8_t *)&v19, 2u);
      }
    }
    goto LABEL_32;
  }
  if (v19.msgh_id != 40381)
  {
    uint64_t v13 = -301;
    goto LABEL_26;
  }
  if ((v19.msgh_bits & 0x80000000) != 0) {
    goto LABEL_25;
  }
  if (v19.msgh_size != 40)
  {
    if (v19.msgh_size == 36)
    {
      if (v19.msgh_remote_port) {
        v14 = 1;
      }
      else {
        v14 = v21 == 0;
      }
      if (v14) {
        uint64_t v13 = -300;
      }
      else {
        uint64_t v13 = v21;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v19.msgh_remote_port)
  {
LABEL_25:
    uint64_t v13 = -300;
    goto LABEL_26;
  }
  uint64_t v13 = v21;
  if (v21) {
    goto LABEL_26;
  }
  v17 = v22;
  os_unfair_lock_unlock(v7);
  if (!v17) {
    return 0;
  }
  impl->var4 = 0;
  var6 = impl->var6;
  if (var6) {
    impl->var6 = var6 + v6;
  }
  return 1;
}

- (double)commitDeadline
{
  uint64_t v2 = CA::DynamicFrameRateSource::commit_deadline((CA::DynamicFrameRateSource *)self->_impl);

  return CATimeWithHostTime(v2);
}

- (CAFrameRateRange)preferredFrameRateRange
{
  impl = self->_impl;
  float minimum = impl->var2.minimum;
  float maximum = impl->var2.maximum;
  float preferred = impl->var2.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    if (*((unsigned char *)impl + 88))
    {
      CA::Display::DisplayTimingsControl::unregister_frame_interval_range((os_unfair_lock_s *)impl->var1, impl->var3);
      CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, 0, 0);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    uint64_t v4 = CA::DynamicFrameRateSource::_list;
    if (CA::DynamicFrameRateSource::_list)
    {
      if ((DynamicFrameRateSource *)CA::DynamicFrameRateSource::_list == impl)
      {
        unint64_t v6 = &CA::DynamicFrameRateSource::_list;
LABEL_10:
        *unint64_t v6 = (uint64_t)impl->var10;
      }
      else
      {
        while (1)
        {
          uint64_t v5 = v4;
          uint64_t v4 = *(void *)(v4 + 96);
          if (!v4) {
            break;
          }
          if ((DynamicFrameRateSource *)v4 == impl)
          {
            unint64_t v6 = (uint64_t *)(v5 + 96);
            goto LABEL_10;
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    MEMORY[0x185323DC0](impl, 0x10A0C405234EED1);
  }
  v7.receiver = self;
  v7.super_class = (Class)CADynamicFrameRateSource;
  [(CADynamicFrameRateSource *)&v7 dealloc];
}

@end