@interface BSMonotonicReferenceTime
+ (double)_timeIntervalSinceInternalClockReference;
+ (id)distantFuture;
+ (id)distantPast;
+ (id)now;
+ (id)referenceTimeForDate:(id)a3;
+ (id)referenceTimeWithTimeIntervalSinceNow:(double)a3;
- (double)timeIntervalSinceNow;
- (double)timeIntervalSinceReferenceTime:(id)a3;
- (double)timeIntervalToNow;
- (id)date;
@end

@implementation BSMonotonicReferenceTime

+ (id)referenceTimeWithTimeIntervalSinceNow:(double)a3
{
  double v5 = +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]();
  v6 = (double *)objc_alloc((Class)a1);
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)BSMonotonicReferenceTime;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6) {
      v6[1] = v5 + a3;
    }
  }
  return v6;
}

+ (double)_timeIntervalSinceInternalClockReference
{
  self;
  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v1);
  return (double)v1.tv_sec + (double)v1.tv_nsec * 0.000000001;
}

+ (id)now
{
  id v2 = objc_alloc((Class)a1);
  double v3 = +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]();
  if (v2)
  {
    double v4 = v3;
    v7.receiver = v2;
    v7.super_class = (Class)BSMonotonicReferenceTime;
    double v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5) {
      *((double *)v5 + 1) = v4;
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

+ (id)distantPast
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BSMonotonicReferenceTime_distantPast__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_29 != -1) {
    dispatch_once(&_MergedGlobals_29, block);
  }
  id v2 = (void *)qword_1EB21B2B0;
  return v2;
}

void __39__BSMonotonicReferenceTime_distantPast__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) referenceTimeWithTimeIntervalSinceNow:-6.31152e10];
  id v2 = (void *)qword_1EB21B2B0;
  qword_1EB21B2B0 = v1;
}

+ (id)distantFuture
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BSMonotonicReferenceTime_distantFuture__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB21B2B8 != -1) {
    dispatch_once(&qword_1EB21B2B8, block);
  }
  id v2 = (void *)qword_1EB21B2C0;
  return v2;
}

void __41__BSMonotonicReferenceTime_distantFuture__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) referenceTimeWithTimeIntervalSinceNow:6.31152e10];
  id v2 = (void *)qword_1EB21B2C0;
  qword_1EB21B2C0 = v1;
}

+ (id)referenceTimeForDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceNow];
  double v5 = objc_msgSend(a1, "referenceTimeWithTimeIntervalSinceNow:");

  return v5;
}

- (double)timeIntervalToNow
{
  return +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]() - self->_startTimeStamp;
}

- (double)timeIntervalSinceNow
{
  [(BSMonotonicReferenceTime *)self timeIntervalToNow];
  return -v2;
}

- (double)timeIntervalSinceReferenceTime:(id)a3
{
  return self->_startTimeStamp - *((double *)a3 + 1);
}

- (id)date
{
  double v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(BSMonotonicReferenceTime *)self timeIntervalSinceNow];
  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceNow:");
}

@end