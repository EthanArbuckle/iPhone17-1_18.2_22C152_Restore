@interface OrgApacheLuceneStoreRateLimiter_SimpleRateLimiter
- (OrgApacheLuceneStoreRateLimiter_SimpleRateLimiter)initWithDouble:(double)a3;
- (double)getMBPerSec;
- (int64_t)getMinPauseCheckBytes;
- (int64_t)pauseWithLong:(int64_t)a3;
- (void)setMBPerSecWithDouble:(double)a3;
@end

@implementation OrgApacheLuceneStoreRateLimiter_SimpleRateLimiter

- (OrgApacheLuceneStoreRateLimiter_SimpleRateLimiter)initWithDouble:(double)a3
{
  self->lastNS_ = JavaLangSystem_nanoTime();
  return self;
}

- (void)setMBPerSecWithDouble:(double)a3
{
  atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->mbPerSec_);
  double v3 = a3 * 0.005 * 1024.0;
  unint64_t v4 = vcvtd_n_s64_f64(v3, 0xAuLL);
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 * 1024.0 < 0.0) {
    unint64_t v5 = 0x8000000000000000;
  }
  if (v4 == 0x8000000000000000) {
    unint64_t v4 = v5;
  }
  atomic_store(v4, (unint64_t *)&self->minPauseCheckBytes_);
}

- (int64_t)getMinPauseCheckBytes
{
  return atomic_load((unint64_t *)&self->minPauseCheckBytes_);
}

- (double)getMBPerSec
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->mbPerSec_));
}

- (int64_t)pauseWithLong:(int64_t)a3
{
  int64_t v5 = JavaLangSystem_nanoTime();
  double v6 = COERCE_DOUBLE(atomic_load((unint64_t *)&self->mbPerSec_));
  double v7 = (double)a3 * 0.0009765625 * 0.0009765625 / v6;
  objc_sync_enter(self);
  int64_t lastNS = self->lastNS_;
  uint64_t v9 = (uint64_t)(v7 * 1000000000.0);
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 * 1000000000.0 < 0.0) {
    unint64_t v10 = 0x8000000000000000;
  }
  if (v9 == 0x8000000000000000) {
    uint64_t v9 = v10;
  }
  uint64_t v11 = v9 + lastNS;
  if (v5 <= v9 + lastNS) {
    int64_t v12 = v9 + lastNS;
  }
  else {
    int64_t v12 = v5;
  }
  self->lastNS_ = v12;
  objc_sync_exit(self);
  unint64_t v13 = v11 - v5;
  if (v11 <= v5) {
    return 0;
  }
  if ((uint64_t)v13 < 1)
  {
    uint64_t v16 = v5;
  }
  else
  {
    do
    {
      if (v13 <= 0xC34FFFFE7960)
      {
        unint64_t v15 = v13 / 0xF4240;
        unint64_t v14 = v13 % 0xF4240;
      }
      else
      {
        unint64_t v14 = 0;
        unint64_t v15 = 0x7FFFFFFFLL;
      }
      JavaLangThread_sleepWithLong_withInt_(v15, v14);
      uint64_t v16 = JavaLangSystem_nanoTime();
      unint64_t v13 = v11 - v16;
    }
    while ((uint64_t)(v11 - v16) > 0);
  }
  return v16 - v5;
}

@end