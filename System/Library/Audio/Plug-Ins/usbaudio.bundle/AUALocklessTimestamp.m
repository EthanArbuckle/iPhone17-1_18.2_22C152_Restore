@interface AUALocklessTimestamp
- (id).cxx_construct;
- (unint64_t)seed;
- (void)reset:(unint64_t)a3;
- (void)timestamps;
- (void)write:(double)a3 hostTime:(unint64_t)a4;
@end

@implementation AUALocklessTimestamp

- (void)timestamps
{
  return &self->_timestamps;
}

- (void)write:(double)a3 hostTime:(unint64_t)a4
{
  unsigned int v4 = atomic_load((unsigned int *)&self->_timestamps.mIndex);
  BOOL v5 = (-++v4 & 0x80000000) != 0;
  int v6 = -v4 & 3;
  unsigned int v7 = v4 & 3;
  if (!v5) {
    unsigned int v7 = -v6;
  }
  v8 = (unint64_t *)(&self->super.isa + (int)v7);
  atomic_store(*(unint64_t *)&a3, v8 + 1);
  atomic_store(a4, v8 + 5);
  atomic_store(v7, (unsigned int *)&self->_timestamps.mIndex);
}

- (void)reset:(unint64_t)a3
{
  self->_seed = a3;
  atomic_store(0, (unsigned int *)&self->_timestamps.mIndex);
  atomic_store(0, (unint64_t *)&self->_timestamps);
  atomic_store(0, &self->_timestamps.mHostTime[0].__a_.__a_value);
  atomic_store(0, (unint64_t *)&self->_timestamps.mSampleTime[1]);
  atomic_store(0, &self->_timestamps.mHostTime[1].__a_.__a_value);
  atomic_store(0, (unint64_t *)&self->_timestamps.mSampleTime[2]);
  atomic_store(0, &self->_timestamps.mHostTime[2].__a_.__a_value);
  atomic_store(0, (unint64_t *)&self->_timestamps.mSampleTime[3]);
  atomic_store(0, &self->_timestamps.mHostTime[3].__a_.__a_value);
}

- (unint64_t)seed
{
  return self->_seed;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 18) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end