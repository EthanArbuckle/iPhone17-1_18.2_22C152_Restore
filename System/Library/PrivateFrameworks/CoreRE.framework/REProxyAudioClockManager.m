@interface REProxyAudioClockManager
+ (id)sharedInstance;
- (OpaqueCMClock)_copyAudioClock;
- (OpaqueCMClock)copyAudioClock;
- (REProxyAudioClockManager)init;
- (id).cxx_construct;
- (void)_addClock:(OpaqueCMClock *)a3;
- (void)_removeClock:(OpaqueCMClock *)a3;
- (void)_routeChangeOrMediaServicesReset:(id)a3;
- (void)_setAudioClock:(OpaqueCMClock *)a3;
- (void)_setUp;
- (void)_tearDown;
- (void)_updateClock:(OpaqueCMClock *)a3;
- (void)_updateClocks;
- (void)_updateClocksWithRate:(double)a3 ownTime:(id *)a4 referenceTime:(id *)a5;
- (void)addClock:(OpaqueCMClock *)a3;
- (void)dealloc;
- (void)removeClock:(OpaqueCMClock *)a3;
- (void)routeChangeOrMediaServicesReset:(id)a3;
- (void)simulateStall;
@end

@implementation REProxyAudioClockManager

+ (id)sharedInstance
{
  if (qword_26AF9F470 != -1) {
    dispatch_once(&qword_26AF9F470, &__block_literal_global_4_2);
  }
  v2 = (void *)qword_26AF9F478;
  return v2;
}

void __42__REProxyAudioClockManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(REProxyAudioClockManager);
  v1 = (void *)qword_26AF9F478;
  qword_26AF9F478 = (uint64_t)v0;
}

- (REProxyAudioClockManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)REProxyAudioClockManager;
  v2 = [(REProxyAudioClockManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("REProxyAudioClockManager audio clock update", v3);
    v5 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("REProxyAudioClockManager access", v6);
    v8 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v7;

    *((void *)v2 + 1) = 0x3FF0000000000000;
    uint64_t v9 = MEMORY[0x263F010E0];
    uint64_t v10 = *(void *)(MEMORY[0x263F010E0] + 16);
    long long v11 = *MEMORY[0x263F010E0];
    *((_OWORD *)v2 + 1) = *MEMORY[0x263F010E0];
    *((void *)v2 + 4) = v10;
    *(_OWORD *)(v2 + 40) = v11;
    *((void *)v2 + 7) = *(void *)(v9 + 16);
  }
  return (REProxyAudioClockManager *)v2;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__REProxyAudioClockManager_dealloc__block_invoke;
  block[3] = &unk_264BE2330;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)REProxyAudioClockManager;
  [(REProxyAudioClockManager *)&v4 dealloc];
}

uint64_t __35__REProxyAudioClockManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDown];
}

- (void)_setUp
{
  if (!self->_initialized)
  {
    objc_initWeak(&location, self);
    audioClockUpdateQueue = self->_audioClockUpdateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__REProxyAudioClockManager__setUp__block_invoke;
    block[3] = &unk_264BE8588;
    objc_copyWeak(&v15, &location);
    block[4] = self;
    dispatch_async(audioClockUpdateQueue, block);
    objc_super v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_audioClockUpdateQueue);
    timer = self->_timer;
    self->_timer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x3B9ACA00uLL, 0xF4240uLL);
    v6 = self->_timer;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    long long v11 = __34__REProxyAudioClockManager__setUp__block_invoke_9;
    v12 = &unk_264BE85B0;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v6, &v9);
    dispatch_resume((dispatch_object_t)self->_timer);
    dispatch_queue_t v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v9, v10, v11, v12);
    [v7 addObserver:self selector:sel_routeChangeOrMediaServicesReset_ name:*MEMORY[0x263F28D80] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_routeChangeOrMediaServicesReset_ name:*MEMORY[0x263F28D88] object:0];

    self->_initialized = 1;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __34__REProxyAudioClockManager__setUp__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMClockRef clockOut = 0;
    OSStatus v3 = CMAudioClockCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &clockOut);
    if (v3)
    {
      OSStatus v4 = v3;
      v5 = ManualClockLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v10 = v4;
        _os_log_error_impl(&dword_233120000, v5, OS_LOG_TYPE_ERROR, "Failed to create audio clock: %d. Falling back to host clock.", buf, 8u);
      }

      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      dispatch_queue_t v7 = (OpaqueCMClock *)CFRetain(HostTimeClock);
      CMClockRef clockOut = v7;
    }
    else
    {
      dispatch_queue_t v7 = clockOut;
    }
    [*(id *)(a1 + 32) _setAudioClock:v7];
    CFRelease(clockOut);
  }
}

void __34__REProxyAudioClockManager__setUp__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateClocks];
    id WeakRetained = v2;
  }
}

- (void)_tearDown
{
  if (self->_initialized)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      OSStatus v4 = self->_timer;
      self->_timer = 0;
    }
    objc_initWeak(&location, self);
    audioClockUpdateQueue = self->_audioClockUpdateQueue;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    OSStatus v10 = __37__REProxyAudioClockManager__tearDown__block_invoke;
    uint64_t v11 = &unk_264BE85B0;
    objc_copyWeak(&v12, &location);
    dispatch_async(audioClockUpdateQueue, &v8);
    v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v8, v9, v10, v11);
    [v6 removeObserver:self name:*MEMORY[0x263F28D80] object:0];

    dispatch_queue_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x263F28D88] object:0];

    self->_initialized = 0;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __37__REProxyAudioClockManager__tearDown__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setAudioClock:0];
    id WeakRetained = v2;
  }
}

- (void)_routeChangeOrMediaServicesReset:(id)a3
{
  if (self->_initialized)
  {
    [(REProxyAudioClockManager *)self _tearDown];
    [(REProxyAudioClockManager *)self _setUp];
  }
}

- (void)_addClock:(OpaqueCMClock *)a3
{
  if (!self->_clocks.__table_.__p2_.__value_) {
    [(REProxyAudioClockManager *)self _setUp];
  }
  [(REProxyAudioClockManager *)self _updateClock:a3];
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ ((unint64_t)a3 >> 32));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= value) {
        unint64_t v3 = v8 % value;
      }
    }
    else
    {
      unint64_t v3 = (value - 1) & v8;
    }
    uint64_t v11 = (uint64_t ***)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v11)
    {
      for (i = *v11; i; i = (uint64_t **)*i)
      {
        unint64_t v13 = (unint64_t)i[1];
        if (v13 == v8)
        {
          if (i[2] == (uint64_t *)a3) {
            return;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= value) {
              v13 %= value;
            }
          }
          else
          {
            v13 &= value - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  void *v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  float v15 = (float)(self->_clocks.__table_.__p2_.__value_ + 1);
  float v16 = self->_clocks.__table_.__p3_.__value_;
  if (!value || (float)(v16 * (float)value) < v15)
  {
    BOOL v17 = 1;
    if (value >= 3) {
      BOOL v17 = (value & (value - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * value);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > value) {
      goto LABEL_32;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v27 = vcvtps_u32_f32((float)self->_clocks.__table_.__p2_.__value_ / self->_clocks.__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= value)
      {
        unint64_t value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v21 = (void **)operator new(8 * *(void *)&prime);
          v22 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
          self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
          while (*(void *)&prime != v23);
          next = self->_clocks.__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v25 = next[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v25] = &self->_clocks.__table_.__p1_;
            v30 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  v32 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v32[v31])
                  {
                    v32[v31] = next;
                    goto LABEL_57;
                  }
                  void *next = *v30;
                  void *v30 = *(void *)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v31];
                  *(void *)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
                  v30 = next;
                }
                unint64_t v31 = v25;
LABEL_57:
                next = v30;
                v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t value = (unint64_t)prime;
          goto LABEL_61;
        }
        v37 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
        self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t value = 0;
        self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_61:
    if ((value & (value - 1)) != 0)
    {
      if (v8 >= value) {
        unint64_t v3 = v8 % value;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (value - 1) & v8;
    }
  }
  v33 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  v34 = (void **)v33[v3];
  if (v34)
  {
    void *v14 = *v34;
LABEL_74:
    *v34 = v14;
    goto LABEL_75;
  }
  v35 = self->_clocks.__table_.__p1_.__value_.__next_;
  void *v14 = v35;
  self->_clocks.__table_.__p1_.__value_.__next_ = v14;
  v33[v3] = &self->_clocks.__table_.__p1_;
  if (v35)
  {
    unint64_t v36 = v35[1];
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value) {
        v36 %= value;
      }
    }
    else
    {
      v36 &= value - 1;
    }
    v34 = &self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_74;
  }
LABEL_75:
  ++self->_clocks.__table_.__p2_.__value_;
}

- (void)_removeClock:(OpaqueCMClock *)a3
{
  unint64_t value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    goto LABEL_47;
  }
  unint64_t v5 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ ((unint64_t)a3 >> 32));
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v5 >> 47) ^ v5);
  unint64_t v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = v7;
    if (v7 >= value) {
      unint64_t v9 = v7 % value;
    }
  }
  else
  {
    unint64_t v9 = (value - 1) & v7;
  }
  uint8x8_t v10 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  uint64_t v11 = (void **)v10[v9];
  if (!v11) {
    goto LABEL_47;
  }
  id v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)*v11;
  if (!*v11) {
    goto LABEL_47;
  }
  unint64_t v13 = value - 1;
  while (1)
  {
    unint64_t next = (unint64_t)v12[1].__value_.__next_;
    if (next == v7) {
      break;
    }
    if (v8.u32[0] > 1uLL)
    {
      if (next >= value) {
        next %= value;
      }
    }
    else
    {
      next &= v13;
    }
    if (next != v9) {
      goto LABEL_47;
    }
LABEL_17:
    id v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
    if (!v12) {
      goto LABEL_47;
    }
  }
  if (v12[2].__value_.__next_ != a3) {
    goto LABEL_17;
  }
  float v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
  if (v8.u32[0] > 1uLL)
  {
    if (v7 >= value) {
      v7 %= value;
    }
  }
  else
  {
    v7 &= v13;
  }
  float v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v10[v7];
  do
  {
    BOOL v17 = v16;
    float v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v16->__value_.__next_;
  }
  while (v16 != v12);
  if (v17 == &self->_clocks.__table_.__p1_) {
    goto LABEL_36;
  }
  unint64_t v18 = (unint64_t)v17[1].__value_.__next_;
  if (v8.u32[0] > 1uLL)
  {
    if (v18 >= value) {
      v18 %= value;
    }
  }
  else
  {
    v18 &= v13;
  }
  if (v18 == v7)
  {
LABEL_38:
    if (v15)
    {
      unint64_t v19 = (unint64_t)v15[1].__value_.__next_;
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
    if (!v15) {
      goto LABEL_37;
    }
    unint64_t v19 = (unint64_t)v15[1].__value_.__next_;
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v20 = (unint64_t)v15[1].__value_.__next_;
      if (v19 >= value) {
        unint64_t v20 = v19 % value;
      }
    }
    else
    {
      unint64_t v20 = v19 & v13;
    }
    if (v20 != v7)
    {
LABEL_37:
      v10[v7] = 0;
      float v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
      goto LABEL_38;
    }
LABEL_40:
    if (v8.u32[0] > 1uLL)
    {
      if (v19 >= value) {
        v19 %= value;
      }
    }
    else
    {
      v19 &= v13;
    }
    if (v19 != v7)
    {
      self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v19] = v17;
      float v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
    }
  }
  v17->__value_.__next_ = v15;
  v12->__value_.__next_ = 0;
  --self->_clocks.__table_.__p2_.__value_;
  operator delete(v12);
LABEL_47:
  if (!self->_clocks.__table_.__p2_.__value_)
  {
    [(REProxyAudioClockManager *)self _tearDown];
  }
}

- (void)_updateClock:(OpaqueCMClock *)a3
{
  DerivedStorage = (os_unfair_lock_s *)FigDerivedClockGetDerivedStorage();
  if (DerivedStorage)
  {
    unint64_t v5 = DerivedStorage;
    os_unfair_lock_lock(DerivedStorage);
    *(double *)&v5[4]._os_unfair_lock_opaque = self->_rateRelativeToHost;
    long long v6 = *(_OWORD *)&self->_ownTimelineAnchor.value;
    *(void *)&v5[10]._os_unfair_lock_opaque = self->_ownTimelineAnchor.epoch;
    *(_OWORD *)&v5[6]._os_unfair_lock_opaque = v6;
    long long v7 = *(_OWORD *)&self->_referenceTimelineAnchor.value;
    *(void *)&v5[16]._os_unfair_lock_opaque = self->_referenceTimelineAnchor.epoch;
    *(_OWORD *)&v5[12]._os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock(v5);
  }
}

- (void)_updateClocksWithRate:(double)a3 ownTime:(id *)a4 referenceTime:(id *)a5
{
  self->_rateRelativeToHost = a3;
  long long v5 = *(_OWORD *)&a4->var0;
  self->_ownTimelineAnchor.epoch = a4->var3;
  *(_OWORD *)&self->_ownTimelineAnchor.unint64_t value = v5;
  long long v6 = *(_OWORD *)&a5->var0;
  self->_referenceTimelineAnchor.epoch = a5->var3;
  *(_OWORD *)&self->_referenceTimelineAnchor.unint64_t value = v6;
  for (i = self->_clocks.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
    [(REProxyAudioClockManager *)self _updateClock:i[2]];
}

- (void)_updateClocks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(REProxyAudioClockManager *)self _copyAudioClock];
  if (v3)
  {
    OSStatus v4 = v3;
    Float64 outRelativeRate = 0.0;
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    OSStatus RelativeRateAndAnchorTime = CMSyncGetRelativeRateAndAnchorTime(v4, HostTimeClock, &outRelativeRate, &outOfClockOrTimebaseAnchorTime, &outRelativeToClockOrTimebaseAnchorTime);
    CFRelease(v4);
    if (RelativeRateAndAnchorTime)
    {
      long long v7 = ManualClockLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v16 = RelativeRateAndAnchorTime;
        _os_log_error_impl(&dword_233120000, v7, OS_LOG_TYPE_ERROR, "Failed to update proxy audio clock: %d", buf, 8u);
      }
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__REProxyAudioClockManager__updateClocks__block_invoke;
      block[3] = &unk_264BE85D8;
      block[4] = self;
      *(Float64 *)&void block[5] = outRelativeRate;
      CMTime v10 = outOfClockOrTimebaseAnchorTime;
      CMTime v11 = outRelativeToClockOrTimebaseAnchorTime;
      dispatch_sync(queue, block);
    }
  }
}

uint64_t __41__REProxyAudioClockManager__updateClocks__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v4 = *(_OWORD *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 88);
  return [v1 _updateClocksWithRate:&v6 ownTime:&v4 referenceTime:v2];
}

- (OpaqueCMClock)_copyAudioClock
{
  result = self->_audioClock;
  if (result) {
    return (OpaqueCMClock *)CFRetain(result);
  }
  return result;
}

- (OpaqueCMClock)copyAudioClock
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  audioClockUpdateQueue = self->_audioClockUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__REProxyAudioClockManager_copyAudioClock__block_invoke;
  v5[3] = &unk_264BE8600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioClockUpdateQueue, v5);
  unint64_t v3 = (OpaqueCMClock *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__REProxyAudioClockManager_copyAudioClock__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyAudioClock];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setAudioClock:(OpaqueCMClock *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  audioClock = self->_audioClock;
  self->_audioClock = a3;
  if (audioClock)
  {
    CFRelease(audioClock);
  }
}

- (void)routeChangeOrMediaServicesReset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__REProxyAudioClockManager_routeChangeOrMediaServicesReset___block_invoke;
  v7[3] = &unk_264BE8628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __60__REProxyAudioClockManager_routeChangeOrMediaServicesReset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _routeChangeOrMediaServicesReset:*(void *)(a1 + 40)];
}

- (void)addClock:(OpaqueCMClock *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__REProxyAudioClockManager_addClock___block_invoke;
  v4[3] = &unk_264BE2618;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __37__REProxyAudioClockManager_addClock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addClock:*(void *)(a1 + 40)];
}

- (void)removeClock:(OpaqueCMClock *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__REProxyAudioClockManager_removeClock___block_invoke;
  v4[3] = &unk_264BE2618;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __40__REProxyAudioClockManager_removeClock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeClock:*(void *)(a1 + 40)];
}

- (void)simulateStall
{
}

uint64_t __41__REProxyAudioClockManager_simulateStall__block_invoke()
{
  return usleep(0x2FAF080u);
}

- (void).cxx_destruct
{
  unint64_t next = self->_clocks.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      id v4 = (void *)*next;
      operator delete(next);
      unint64_t next = v4;
    }
    while (v4);
  }
  unint64_t value = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_audioClockUpdateQueue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end