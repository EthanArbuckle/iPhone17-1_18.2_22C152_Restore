@interface CAFrameRateRangeGroup
- (BOOL)hasCompatQuantaIntent;
- (CAFrameIntervalRange)arbitratedIntervalRange;
- (CAFrameRateRange)arbitratedRange;
- (CAFrameRateRangeGroup)initWithDisplay:(id)a3;
- (CAFrameRateRangeGroup)initWithHeartbeatRate:(double)a3 minimumFrameDuration:(unsigned __int8)a4 supportsVRR:(BOOL)a5 compatQuantaMode:(BOOL)a6 serverCompatQuantaMode:(BOOL)a7;
- (const)reasonsWithCount:(unsigned int *)a3;
- (void)addCompatQuantaIntent;
- (void)addFrameRateRange:(CAFrameRateRange)a3;
- (void)addReason:(unsigned int)a3;
- (void)dealloc;
- (void)removeFrameRateRange:(CAFrameRateRange)a3;
- (void)updateFrameRateRange:(CAFrameRateRange)a3 toRange:(CAFrameRateRange)a4;
@end

@implementation CAFrameRateRangeGroup

- (void)addCompatQuantaIntent
{
  *((unsigned char *)self->_impl + 129) |= 8u;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    if (impl[1])
    {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
      uint64_t v4 = CA::FrameRateRangeGroup::_list;
      if (CA::FrameRateRangeGroup::_list)
      {
        if ((void *)CA::FrameRateRangeGroup::_list == impl)
        {
          v6 = &CA::FrameRateRangeGroup::_list;
LABEL_9:
          uint64_t *v6 = impl[3];
        }
        else
        {
          while (1)
          {
            uint64_t v5 = v4;
            uint64_t v4 = *(void *)(v4 + 24);
            if (!v4) {
              break;
            }
            if ((void *)v4 == impl)
            {
              v6 = (uint64_t *)(v5 + 24);
              goto LABEL_9;
            }
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
    }
    v7 = (void *)impl[12];
    if (v7)
    {
      impl[13] = v7;
      operator delete(v7);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)(impl + 7));
    MEMORY[0x185323DC0](impl, 0x10A0C40DF5EECE8);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAFrameRateRangeGroup;
  [(CAFrameRateRangeGroup *)&v8 dealloc];
}

- (void)addReason:(unsigned int)a3
{
  if (a3)
  {
    uint64_t current_reason_count = self->_current_reason_count;
    if (current_reason_count)
    {
      if (current_reason_count != 8)
      {
        reasons = self->_reasons;
        uint64_t v5 = self->_current_reason_count;
        while (1)
        {
          int v6 = *reasons++;
          if (v6 == a3) {
            break;
          }
          if (!--v5) {
            goto LABEL_8;
          }
        }
      }
    }
    else
    {
LABEL_8:
      self->_uint64_t current_reason_count = current_reason_count + 1;
      self->_reasons[current_reason_count] = a3;
    }
  }
}

- (void)addFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v15.float minimum = minimum;
  v15.float maximum = maximum;
  v15.float preferred = preferred;
  CA::FrameRateRangeGroup::add((CA::FrameRateRangeGroup *)impl, v15);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v7, v8, v9, v10, v11, v12, v13);

  os_unfair_lock_unlock(impl);
}

- (CAFrameRateRangeGroup)initWithHeartbeatRate:(double)a3 minimumFrameDuration:(unsigned __int8)a4 supportsVRR:(BOOL)a5 compatQuantaMode:(BOOL)a6 serverCompatQuantaMode:(BOOL)a7
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAFrameRateRangeGroup;
  if ([(CAFrameRateRangeGroup *)&v8 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)hasCompatQuantaIntent
{
  return (*((unsigned __int8 *)self->_impl + 129) >> 3) & 1;
}

- (CAFrameIntervalRange)arbitratedIntervalRange
{
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  uint64_t v3 = *(void *)&impl[8]._os_unfair_lock_opaque;
  unsigned int os_unfair_lock_opaque = impl[10]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(impl);
  uint64_t v5 = v3;
  unsigned int v6 = os_unfair_lock_opaque;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  result.var2 = v6;
  return result;
}

- (const)reasonsWithCount:(unsigned int *)a3
{
  *a3 = self->_current_reason_count;
  return self->_reasons;
}

- (CAFrameRateRange)arbitratedRange
{
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  float v3 = *(float *)&impl[11]._os_unfair_lock_opaque;
  float v4 = *(float *)&impl[12]._os_unfair_lock_opaque;
  float v5 = *(float *)&impl[13]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(impl);
  float v6 = v3;
  float v7 = v4;
  float v8 = v5;
  result.float preferred = v8;
  result.float maximum = v7;
  result.float minimum = v6;
  return result;
}

- (void)updateFrameRateRange:(CAFrameRateRange)a3 toRange:(CAFrameRateRange)a4
{
  float preferred = a4.preferred;
  float maximum = a4.maximum;
  float minimum = a4.minimum;
  float v7 = a3.preferred;
  float v8 = a3.maximum;
  float v9 = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v19.float minimum = v9;
  v19.float maximum = v8;
  v19.float preferred = v7;
  CA::FrameRateRangeGroup::remove((int8x8_t *)impl, v19);
  v20.float minimum = minimum;
  v20.float maximum = maximum;
  v20.float preferred = preferred;
  CA::FrameRateRangeGroup::add((CA::FrameRateRangeGroup *)impl, v20);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v11, v12, v13, v14, v15, v16, v17);

  os_unfair_lock_unlock(impl);
}

- (void)removeFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v15.float minimum = minimum;
  v15.float maximum = maximum;
  v15.float preferred = preferred;
  CA::FrameRateRangeGroup::remove((int8x8_t *)impl, v15);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v7, v8, v9, v10, v11, v12, v13);

  os_unfair_lock_unlock(impl);
}

- (CAFrameRateRangeGroup)initWithDisplay:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CAFrameRateRangeGroup;
  float v3 = [(CAFrameRateRangeGroup *)&v5 init];
  if (v3) {
    operator new();
  }
  return v3;
}

@end