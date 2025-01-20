@interface BSDateTimeCache
+ (id)sharedInstance;
- (BOOL)isToday:(double)a3;
- (BOOL)isTomorrow:(double)a3;
- (BOOL)isWithinNextWeek:(double)a3;
- (BOOL)isWithinPrevWeek:(double)a3;
- (BOOL)isWithinPrevWeek:(double)a3 includeToday:(BOOL)a4;
- (BOOL)isYesterday:(double)a3;
- (BSDateTimeCache)init;
- (double)nextWeek;
- (double)prevWeek;
- (double)today;
- (double)tomorrow;
- (double)yesterday;
- (id)description;
- (void)_resetAndConfigure;
- (void)_resetAndConfigureAndPostNotification:(uint64_t)a1;
- (void)_resetAndConfigureIfNecessary;
- (void)dealloc;
@end

@implementation BSDateTimeCache

- (BSDateTimeCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)BSDateTimeCache;
  v2 = [(BSDateTimeCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    -[BSDateTimeCache _resetAndConfigureAndPostNotification:]((uint64_t)v2, 0);
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__resetAndConfigure name:*MEMORY[0x1E4F1C370] object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_BSHandleSignificantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)_resetAndConfigureAndPostNotification:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 80))
  {
    *(unsigned char *)(a1 + 80) = 1;
    v4 = CFCalendarCopyCurrent();
    double Current = CFAbsoluteTimeGetCurrent();
    double v6 = Current;
    if (v4)
    {
      *(void *)(a1 + 16) = 0;
      CFCalendarGetTimeRangeOfUnit(v4, 0x10uLL, Current, (CFAbsoluteTime *)(a1 + 16), 0);
      *(void *)(a1 + 8) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 8), 0, "d", 0xFFFFFFFFLL);
      *(void *)(a1 + 24) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 24), 0, "d", 1);
      *(void *)(a1 + 32) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 32), 0, "d", 2);
      *(void *)(a1 + 48) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 48), 0, "d", 4294967289);
      *(void *)(a1 + 40) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 40), 0, "d", 4294967290);
      *(void *)(a1 + 56) = *(void *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 56), 0, "d", 7);
      if (a2)
      {
        objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v7 postNotificationName:@"BSDateTimeCacheChangedNotification" object:a1];
      }
      CFRelease(v4);
      *(double *)(a1 + 72) = v6;
      v8 = BSLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = objc_opt_class();
        uint64_t v10 = *(void *)(a1 + 16);
        uint64_t v11 = *(void *)(a1 + 24);
        *(_DWORD *)buf = 138544130;
        id v15 = v9;
        __int16 v16 = 2048;
        double v17 = v6;
        __int16 v18 = 2048;
        uint64_t v19 = v10;
        __int16 v20 = 2048;
        uint64_t v21 = v11;
        id v12 = v9;
        _os_log_debug_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_DEBUG, "Updated %{public}@ now=%f 'today'=%f 'tomorrow'=%f", buf, 0x2Au);
      }
    }
    else
    {
      v8 = BSLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2112;
        double v17 = 0.0;
        id v13 = v15;
        _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Couldn't update %{public}@ because we don't have a current calendar -> %@", buf, 0x16u);
      }
    }

    *(double *)(a1 + 64) = v6;
    *(unsigned char *)(a1 + 80) = 0;
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BSDateTimeCache;
  [(BSDateTimeCache *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (qword_1EB21B198 != -1) {
    dispatch_once(&qword_1EB21B198, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_18;
  return v2;
}

void __33__BSDateTimeCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BSDateTimeCache);
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)v0;
}

- (double)today
{
  return self->_today;
}

- (void)_resetAndConfigureIfNecessary
{
  if (a1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (a1[2] > Current || a1[3] <= Current)
    {
      [a1 _resetAndConfigure];
    }
  }
}

- (double)tomorrow
{
  return self->_tomorrow;
}

- (double)yesterday
{
  return self->_yesterday;
}

- (double)prevWeek
{
  return self->_prevWeek;
}

- (double)nextWeek
{
  return self->_nextWeek;
}

- (BOOL)isToday:(double)a3
{
  return self && self->_today <= a3 && self->_tomorrow > a3;
}

- (BOOL)isTomorrow:(double)a3
{
  return self->_tomorrow <= a3 && self->_2daysFromNow > a3;
}

- (BOOL)isYesterday:(double)a3
{
  return self->_yesterday <= a3 && self->_today > a3;
}

- (BOOL)isWithinPrevWeek:(double)a3
{
  return [(BSDateTimeCache *)self isWithinPrevWeek:0 includeToday:a3];
}

- (BOOL)isWithinPrevWeek:(double)a3 includeToday:(BOOL)a4
{
  BOOL v4 = a4;
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  if (v4)
  {
    if (self->_tomorrow > a3)
    {
      uint64_t v7 = 40;
      return *(double *)((char *)&self->super.isa + v7) <= a3;
    }
  }
  else if (self->_today > a3)
  {
    uint64_t v7 = 48;
    return *(double *)((char *)&self->super.isa + v7) <= a3;
  }
  return 0;
}

- (BOOL)isWithinNextWeek:(double)a3
{
  return self->_tomorrow <= a3 && self->_nextWeek > a3;
}

- (void)_resetAndConfigure
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"_lastAttemptedResetTime=%f", *(void *)&self->_lastAttemptedResetTime);
  [v3 addObject:v4];

  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"_lastSuccessfulResetTime=%f", *(void *)&self->_lastSuccessfulResetTime);
  [v3 addObject:v5];

  double v6 = objc_msgSend(NSString, "stringWithFormat:", @"_yesterday=%f", *(void *)&self->_yesterday);
  [v3 addObject:v6];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"_today=%f", *(void *)&self->_today);
  [v3 addObject:v7];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"_tomorrow=%f", *(void *)&self->_tomorrow);
  [v3 addObject:v8];

  v9 = [v3 description];

  return v9;
}

@end