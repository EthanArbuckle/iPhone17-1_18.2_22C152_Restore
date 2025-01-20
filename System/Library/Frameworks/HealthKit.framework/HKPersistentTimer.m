@interface HKPersistentTimer
+ (id)_prefixedKeyWithTimerKey:(id)a3;
+ (id)timerWithKey:(id)a3;
- (NSString)fullTimerKey;
- (id)timerValue;
- (unint64_t)elapsedMilliSeconds;
- (unint64_t)elapsedNanoseconds;
- (unint64_t)elapsedSeconds;
- (void)clear;
- (void)setFullTimerKey:(id)a3;
- (void)start;
@end

@implementation HKPersistentTimer

+ (id)timerWithKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKPersistentTimer);
  uint64_t v6 = [a1 _prefixedKeyWithTimerKey:v4];

  fullTimerKey = v5->_fullTimerKey;
  v5->_fullTimerKey = (NSString *)v6;

  return v5;
}

+ (id)_prefixedKeyWithTimerKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@", @"HKPersistentTimerPrefixKey", a3];
}

- (void)start
{
  uint64_t v3 = mach_absolute_time();
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [NSNumber numberWithUnsignedLongLong:v3];
  [v5 setObject:v4 forKey:self->_fullTimerKey];
}

- (void)clear
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObjectForKey:self->_fullTimerKey];
}

- (id)timerValue
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:self->_fullTimerKey];

  return v4;
}

- (unint64_t)elapsedSeconds
{
  return vcvtad_u64_f64((double)[(HKPersistentTimer *)self elapsedNanoseconds] / 1000000000.0);
}

- (unint64_t)elapsedMilliSeconds
{
  return vcvtad_u64_f64((double)[(HKPersistentTimer *)self elapsedNanoseconds] / 1000000.0);
}

- (unint64_t)elapsedNanoseconds
{
  v2 = [(HKPersistentTimer *)self timerValue];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 unsignedLongLongValue];
    uint64_t v5 = mach_absolute_time() - v4;
    unsigned int v6 = dword_1E93FC1DC;
    if (!dword_1E93FC1DC)
    {
      mach_timebase_info((mach_timebase_info_t)&elapsedNanoseconds_timebaseInfo);
      unsigned int v6 = dword_1E93FC1DC;
    }
    unint64_t v7 = v5 * elapsedNanoseconds_timebaseInfo / v6;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (NSString)fullTimerKey
{
  return self->_fullTimerKey;
}

- (void)setFullTimerKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end