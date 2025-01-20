@interface AVAudioClock
- (AVAudioClock)init;
- (AVAudioClock)initWithNode:(void *)a3;
- (AVAudioTime)currentTime;
- (AudioTimeStamp)currentAudioTimeStamp;
- (id)awaitIOCycle:(unsigned int *)a3;
- (int64_t)currentIONumberFrames;
- (void)dealloc;
@end

@implementation AVAudioClock

- (id)awaitIOCycle:(unsigned int *)a3
{
  impl = self->_impl;
  atomic_ullong v5 = *(void *)impl;
  if (!*(void *)impl
    || *(unsigned char *)(v5 + 72)
    || (v9 = *(id **)(v5 + 8)) == 0
    || !*v9
    || ([*v9 isInManualRenderingMode] & 1) != 0)
  {
    char v6 = 0;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = *((void *)impl + 12);
  if (!v10) {
    operator new();
  }
  uint64_t v11 = *((void *)impl + 12);
  char v12 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16))(v10);
  *((unsigned char *)impl + 104) = 1;
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 64))(v10, 5000000000);
  *((unsigned char *)impl + 104) = 0;
  CADeprecated::CAGuard::Locker::~Locker((CADeprecated::CAGuard::Locker *)&v11);
  if (a3)
  {
LABEL_4:
    unsigned int v7 = atomic_load((unsigned int *)impl + 22);
    *a3 = v7;
  }
LABEL_5:
  if (v6) {
    return 0;
  }
  else {
    return AVAudioClockImpl::CurrentTime((atomic_ullong *)impl);
  }
}

- (int64_t)currentIONumberFrames
{
  return atomic_load((unsigned int *)self->_impl + 22);
}

- (AudioTimeStamp)currentAudioTimeStamp
{
  int v4 = 0;
  UInt64 mHostTime = self->mHostTime;
  while (1)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(mHostTime + 16), memory_order_acquire);
    if ((explicit & 1) == 0)
    {
      long long v7 = *(_OWORD *)(mHostTime + 40);
      *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)(mHostTime + 24);
      *(_OWORD *)&retstr->mRateScalar = v7;
      long long v8 = *(_OWORD *)(mHostTime + 72);
      *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)(mHostTime + 56);
      *(_OWORD *)&retstr->mSMPTETime.mHours = v8;
      if (explicit == atomic_load_explicit((atomic_ullong *volatile)(mHostTime + 16), memory_order_acquire)) {
        break;
      }
    }
    if (++v4 == 5)
    {
      self = (AudioTimeStamp *)sched_yield();
      int v4 = 0;
    }
  }
  return self;
}

- (AVAudioTime)currentTime
{
  return AVAudioClockImpl::CurrentTime((atomic_ullong *)self->_impl);
}

- (void)dealloc
{
  impl = (uint64_t *)self->_impl;
  if (impl)
  {
    uint64_t v4 = *impl;
    if (*impl)
    {
      v9[0] = AVAudioClockImpl::RenderCallback;
      v9[1] = impl;
      (*(void (**)(uint64_t, void *))(*(void *)v4 + 176))(v4, v9);
      uint64_t v5 = *impl;
      v8[0] = AVAudioClockImpl::StreamFormatListener;
      v8[1] = impl;
      (*(void (**)(uint64_t, void *))(*(void *)v5 + 208))(v5, v8);
    }
    uint64_t v6 = impl[12];
    if (v6) {
      (*(void (**)(uint64_t, SEL))(*(void *)v6 + 8))(v6, a2);
    }
    MEMORY[0x19F3ABB30](impl, 0x1020C40C17CD2A5);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAudioClock;
  [(AVAudioClock *)&v7 dealloc];
}

- (AVAudioClock)initWithNode:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVAudioClock;
  if ([(AVAudioClock *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (AVAudioClock)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioClock;
  if ([(AVAudioClock *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end