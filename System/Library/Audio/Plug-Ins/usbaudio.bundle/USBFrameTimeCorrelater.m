@interface USBFrameTimeCorrelater
- (BOOL)start;
- (USBFrameTimeCorrelater)initWithIOUSBHostObject:(id)a3;
- (USBFrameTimeCorrelaterStatistics)getStatistics;
- (id).cxx_construct;
- (unint64_t)timeforUSBFrame:(unint64_t)a3;
- (unint64_t)updateTimes;
- (unint64_t)updateTimesWithRetries:(int)a3;
- (void)dealloc;
- (void)stop;
@end

@implementation USBFrameTimeCorrelater

- (USBFrameTimeCorrelater)initWithIOUSBHostObject:(id)a3
{
  id v5 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10012B320, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_10012B320))
  {
    mach_timebase_info(&info);
    qword_10012B318 = (uint64_t)info;
    __cxa_guard_release(&qword_10012B320);
  }
  if (qword_10012B318 == HIDWORD(qword_10012B318)) {
    unint64_t v6 = 40000;
  }
  else {
    unint64_t v6 = 40000 * (unint64_t)HIDWORD(qword_10012B318) / qword_10012B318;
  }
  self->_kPreemptionLimitMach = v6;
  objc_storeStrong((id *)&self->_usbHostObject, a3);
  v7 = objc_alloc_init(AUAPeriodicEventRT);
  timer = self->_timer;
  self->_timer = v7;

  self->_started = 0;
  *(void *)&self->_startLock._os_unfair_lock_opaque = 0;
  *(_OWORD *)&self->_wakeOffsetMachCurrent = 0u;
  *(_OWORD *)&self->_wakeErrorMachMax = 0u;
  *(_OWORD *)&self->_preemptedTimeMachMax = 0u;
  v11.receiver = self;
  v11.super_class = (Class)USBFrameTimeCorrelater;
  v9 = [(USBFrameTimeCorrelater *)&v11 init];

  return v9;
}

- (void)dealloc
{
  [(AUAPeriodicEventRT *)self->_timer stop];
  v3.receiver = self;
  v3.super_class = (Class)USBFrameTimeCorrelater;
  [(USBFrameTimeCorrelater *)&v3 dealloc];
}

- (USBFrameTimeCorrelaterStatistics)getStatistics
{
  unint64_t wakeOffsetMachCurrent = self->_wakeOffsetMachCurrent;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_10012B330, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_10012B330))
  {
    mach_timebase_info((mach_timebase_info_t)&info);
    qword_10012B328 = info.n128_u64[0];
    __cxa_guard_release(qword_10012B330);
  }
  if (qword_10012B328 != HIDWORD(qword_10012B328)) {
    unint64_t wakeOffsetMachCurrent = wakeOffsetMachCurrent * qword_10012B328 / HIDWORD(qword_10012B328);
  }
  retstr->var1 = wakeOffsetMachCurrent;
  unint64_t wakeOffsetMachPrevious = self->_wakeOffsetMachPrevious;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_10012B330, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_10012B330))
  {
    mach_timebase_info((mach_timebase_info_t)&info);
    qword_10012B328 = info.n128_u64[0];
    __cxa_guard_release(qword_10012B330);
  }
  if (qword_10012B328 != HIDWORD(qword_10012B328)) {
    unint64_t wakeOffsetMachPrevious = wakeOffsetMachPrevious * qword_10012B328 / HIDWORD(qword_10012B328);
  }
  retstr->var2 = wakeOffsetMachPrevious;
  sub_100005138((uint64_t)&self->_tc.timePairs.mSlots.__elems_[1], &info);
  retstr->var0 = v12;
  unint64_t wakeErrorMachMax = self->_wakeErrorMachMax;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_10012B330, memory_order_acquire) & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_10012B330);
    if (result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_10012B328 = info.n128_u64[0];
      __cxa_guard_release(qword_10012B330);
    }
  }
  if (qword_10012B328 != HIDWORD(qword_10012B328)) {
    unint64_t wakeErrorMachMax = wakeErrorMachMax * qword_10012B328 / HIDWORD(qword_10012B328);
  }
  retstr->var3 = wakeErrorMachMax;
  unint64_t measurementDurationMachMax = self->_measurementDurationMachMax;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_10012B330, memory_order_acquire) & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_10012B330);
    if (result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_10012B328 = info.n128_u64[0];
      __cxa_guard_release(qword_10012B330);
    }
  }
  if (qword_10012B328 != HIDWORD(qword_10012B328)) {
    unint64_t measurementDurationMachMax = measurementDurationMachMax * qword_10012B328 / HIDWORD(qword_10012B328);
  }
  retstr->var4 = measurementDurationMachMax;
  unint64_t preemptedTimeMachMax = self->_preemptedTimeMachMax;
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_10012B330, memory_order_acquire) & 1) == 0)
  {
    result = (USBFrameTimeCorrelaterStatistics *)__cxa_guard_acquire(qword_10012B330);
    if (result)
    {
      mach_timebase_info((mach_timebase_info_t)&info);
      qword_10012B328 = info.n128_u64[0];
      __cxa_guard_release(qword_10012B330);
    }
  }
  if (qword_10012B328 != HIDWORD(qword_10012B328)) {
    unint64_t preemptedTimeMachMax = preemptedTimeMachMax * qword_10012B328 / HIDWORD(qword_10012B328);
  }
  retstr->var5 = preemptedTimeMachMax;
  *(void *)&retstr->var6 = *(void *)&self->_failedMeasurementCount;
  *(_OWORD *)&self->_unint64_t wakeErrorMachMax = 0u;
  *(_OWORD *)&self->_unint64_t preemptedTimeMachMax = 0u;
  return result;
}

- (BOOL)start
{
  p_startLock = &self->_startLock;
  os_unfair_lock_lock(&self->_startLock);
  ++self->_startCount;
  if (self->_started)
  {
    BOOL started = 1;
  }
  else
  {
    NSLog(@"USBFrameTimeCorrelater starting");
    self->_tc.machPerFrameFilter.index = 0;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[14] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.sum = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[10] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[12] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[6] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[8] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[2] = 0u;
    *(_OWORD *)&self->_tc.machPerFrameFilter.values[4] = 0u;
    *(_OWORD *)self->_tc.machPerFrameFilter.values = 0u;
    atomic_store(0, (unsigned int *)&self->_tc.timePairs.mSlots.__elems_[1].mGenerationAndValid + 1);
    atomic_store(0, &self->_tc.timePairs.mSlots.__elems_[3].mGenerationAndValid.__a_.__a_value);
    atomic_store(0, (unsigned int *)&self->_anon_160[32]);
    atomic_store(0, (unsigned int *)&self->_anon_160[96]);
    atomic_store(0, (unsigned int *)&self->_anon_160[160]);
    atomic_store(0, (unsigned __int8 *)&self->_tc.timePairs.mSlots.__elems_[1]);
    unint64_t v5 = [(USBFrameTimeCorrelater *)self updateTimesWithRetries:10];
    self->_BOOL started = v5 != 0;
    if (v5)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      uint64_t v19 = 0;
      uint64_t v19 = qword_10012B2F8 + mach_absolute_time();
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x2020000000;
      v17[3] = qword_10012B308;
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x5812000000;
      v16[3] = sub_1000048B0;
      v16[4] = nullsub_1;
      v16[5] = &unk_1000F0F21;
      v16[9] = qword_10012B308;
      v16[10] = 0;
      v16[6] = qword_10012B308;
      v16[7] = qword_10012B308;
      v16[8] = qword_10012B308;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v15[3] = 0;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      char v14 = 0;
      objc_initWeak(&location, self);
      timer = self->_timer;
      uint64_t v7 = qword_10012B2F8;
      uint64_t v8 = qword_10012B310;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000048C8;
      v10[3] = &unk_100111EF8;
      v10[4] = v15;
      objc_copyWeak(&v11, &location);
      v10[5] = v18;
      v10[6] = v13;
      v10[7] = v17;
      v10[8] = v16;
      [(AUAPeriodicEventRT *)timer start:v7 maxPeriodMach:v8 eventHandler:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      _Block_object_dispose(v13, 8);
      _Block_object_dispose(v15, 8);
      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v17, 8);
      _Block_object_dispose(v18, 8);
      BOOL started = self->_started;
    }
    else
    {
      BOOL started = 0;
    }
  }
  os_unfair_lock_unlock(p_startLock);
  return started;
}

- (void)stop
{
  p_startLock = &self->_startLock;
  os_unfair_lock_lock(&self->_startLock);
  int startCount = self->_startCount;
  if (startCount <= 0)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"USBFrameTimeCorrelater.mm" lineNumber:387 description:@"USBFrameTimeCorrelater stop called without first being started"];

    int v9 = self->_startCount - 1;
    self->_int startCount = v9;
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    int v6 = startCount - 1;
    self->_int startCount = v6;
    if (v6) {
      goto LABEL_3;
    }
  }
  if (!self->_started)
  {
LABEL_3:
    uint64_t v7 = p_startLock;
    goto LABEL_5;
  }
  NSLog(@"USBFrameTimeCorrelater stopping");
  self->_BOOL started = 0;
  [(AUAPeriodicEventRT *)self->_timer stop];
  uint64_t v7 = p_startLock;

LABEL_5:
  os_unfair_lock_unlock(v7);
}

- (unint64_t)timeforUSBFrame:(unint64_t)a3
{
  sub_100005138((uint64_t)&self->_tc.timePairs.mSlots.__elems_[1], &v5);
  return v5.n128_u64[1] + (uint64_t)(v6 * (double)(uint64_t)(a3 - v5.n128_u64[0]));
}

- (unint64_t)updateTimesWithRetries:(int)a3
{
  int v4 = (a3 & ~(a3 >> 31)) + 1;
  while (--v4)
  {
    unint64_t result = [(USBFrameTimeCorrelater *)self updateTimes];
    if (result) {
      return result;
    }
  }
  return 0;
}

- (unint64_t)updateTimes
{
  long long v13 = 0uLL;
  uint64_t v14 = qword_10012B2F0;
  long long v11 = 0uLL;
  uint64_t v12 = qword_10012B2F0;
  objc_super v3 = self->_usbHostObject;
  *(void *)&long long v13 = [(IOUSBHostObject *)v3 frameNumberWithTime:(char *)&v13 + 8];
  mach_absolute_time();
  long long v4 = v13;

  if ((void)v4 && *((void *)&v4 + 1))
  {
    while (1)
    {
      __n128 v5 = self->_usbHostObject;
      *(void *)&long long v11 = [(IOUSBHostObject *)v5 frameNumberWithTime:(char *)&v11 + 8];
      uint64_t v6 = mach_absolute_time();
      long long v7 = v11;

      if (!(void)v7 || !*((void *)&v7 + 1)) {
        break;
      }
      if ((void)v11 - (void)v13 > 1uLL) {
        return 0;
      }
      if ((void)v11 - (void)v13 == 1)
      {
        unint64_t v9 = v6 - *((void *)&v13 + 1);
        unint64_t preemptedTimeMachMax = self->_preemptedTimeMachMax;
        if (v6 - *((void *)&v13 + 1) > preemptedTimeMachMax) {
          unint64_t preemptedTimeMachMax = v6 - *((void *)&v13 + 1);
        }
        self->_unint64_t preemptedTimeMachMax = preemptedTimeMachMax;
        if (v9 <= self->_kPreemptionLimitMach)
        {
          *((void *)&v11 + 1) = v6 - (v9 >> 1);
          sub_100004E98((uint64_t)&self->_tc, (double *)&v11);
          return *((void *)&v13 + 1);
        }
        return 0;
      }
      long long v13 = v11;
      uint64_t v14 = v12;
    }
  }
  NSLog(@"USBFrameTimeCorrelater updateTimes failed to read time pair, frame == 0 device terminated?");
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_usbHostObject, 0);
}

- (id).cxx_construct
{
  *((void *)self + 26) = 0;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((unsigned char *)self + 256) = 0;
  *((_DWORD *)self + 65) = 0;
  uint64_t v2 = qword_10012B2F0;
  *((_DWORD *)self + 80) = 0;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((void *)self + 43) = v2;
  *((_DWORD *)self + 96) = 0;
  *(_OWORD *)((char *)self + 392) = 0u;
  *((void *)self + 51) = v2;
  *((_DWORD *)self + 112) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((void *)self + 59) = v2;
  *((_DWORD *)self + 128) = 0;
  *(_OWORD *)((char *)self + 520) = 0u;
  *((void *)self + 67) = v2;
  return self;
}

@end