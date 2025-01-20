@interface EKTimeZone
+ (id)timeZoneWithNSTimeZone:(id)a3;
+ (id)timeZoneWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (EKTimeZone)initWithNSTimeZone:(id)a3;
- (NSTimeZone)nsTimeZone;
- (double)nextDaylightSavingTimeTransitionAfterAbsoluteTime:(double)a3;
- (double)secondsFromGMTForAbsoluteTime:(double)a3;
- (id)description;
- (unint64_t)hash;
- (void)setNsTimeZone:(id)a3;
@end

@implementation EKTimeZone

+ (id)timeZoneWithName:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"UTC";
  }
  pthread_mutex_lock(&sTimeZonesLock);
  if (!sTimeZones
    || ([(id)sTimeZones objectForKey:v5], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v5];
    if (v7)
    {
      v6 = (void *)[objc_alloc((Class)a1) initWithNSTimeZone:v7];
      if (v6)
      {
        v8 = (void *)sTimeZones;
        if (!sTimeZones)
        {
          uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
          v10 = (void *)sTimeZones;
          sTimeZones = v9;

          v8 = (void *)sTimeZones;
        }
        [v8 setObject:v6 forKey:v5];
      }
    }
    else
    {
      v6 = 0;
    }
  }
  pthread_mutex_unlock(&sTimeZonesLock);

  return v6;
}

+ (id)timeZoneWithNSTimeZone:(id)a3
{
  v4 = [a3 name];
  v5 = [a1 timeZoneWithName:v4];

  return v5;
}

- (EKTimeZone)initWithNSTimeZone:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKTimeZone;
  v6 = [(EKTimeZone *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nsTimeZone, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 nsTimeZone];
    v6 = [(EKTimeZone *)self nsTimeZone];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EKTimeZone *)self nsTimeZone];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKTimeZone *)self nsTimeZone];
  v6 = [v5 name];
  char v7 = [v3 stringWithFormat:@"%@ <%p> {name = %@}", v4, self, v6];

  return v7;
}

- (double)secondsFromGMTForAbsoluteTime:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v5 = [(EKTimeZone *)self nsTimeZone];
  uint64_t v6 = [v5 secondsFromGMTForDate:v4];

  return (double)v6;
}

- (double)nextDaylightSavingTimeTransitionAfterAbsoluteTime:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v5 = [(EKTimeZone *)self nsTimeZone];
  uint64_t v6 = [v5 nextDaylightSavingTimeTransitionAfterDate:v4];

  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.79769313e308;
  }

  return v8;
}

- (NSTimeZone)nsTimeZone
{
  return self->_nsTimeZone;
}

- (void)setNsTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end