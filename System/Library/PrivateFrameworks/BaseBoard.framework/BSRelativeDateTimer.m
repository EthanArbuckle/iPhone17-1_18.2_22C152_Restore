@interface BSRelativeDateTimer
+ (void)initialize;
- (BSRelativeDateTimer)init;
- (BSRelativeDateTimerDelegate)delegate;
- (double)nextFireInterval;
- (id)_computeDifferenceCurrentAndNextFireInfoForDate:(uint64_t *)a3 newTimerResolution:(uint64_t *)a4 currentResolution:(uint64_t *)a5 currentValue:(uint64_t *)a6 comparedToNow:;
- (id)date;
- (id)nextFireAfterDate:(id)a3;
- (void)_fireAndUpdateTimerIfNecessary;
- (void)_fireForLocaleEvent:(id)a3;
- (void)_invalidateTimer;
- (void)dealloc;
- (void)fireAndSchedule;
- (void)powerMonitorSystemDidWakeFromSleep:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BSRelativeDateTimer

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4 = (void *)qword_1EB21B1A8;
    qword_1EB21B1A8 = (uint64_t)v3;
  }
}

uint64_t __45__BSRelativeDateTimer_addTimerToMainRunLoop___block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v0 = (id)qword_1EB21B1A8;
  uint64_t v1 = [v0 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v9;
    uint64_t v3 = *MEMORY[0x1E4F1C4B0];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v9 != v2) {
          objc_enumerationMutation(v0);
        }
        uint64_t v5 = *(void *)(*((void *)&v8 + 1) + 8 * v4);
        v6 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", (void)v8);
        [v6 addTimer:v5 forMode:v3];

        ++v4;
      }
      while (v1 != v4);
      uint64_t v1 = [v0 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v1);
  }

  uint64_t result = [(id)qword_1EB21B1A8 removeAllObjects];
  _MergedGlobals_19 = 0;
  return result;
}

- (BSRelativeDateTimer)init
{
  v12.receiver = self;
  v12.super_class = (Class)BSRelativeDateTimer;
  uint64_t v2 = [(BSRelativeDateTimer *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v4 = [v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    gregorian = v2->_gregorian;
    v2->_gregorian = (NSCalendar *)v4;

    v6 = v2->_gregorian;
    v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    [(NSCalendar *)v6 setLocale:v7];

    long long v8 = +[BSPowerMonitor sharedInstance];
    [v8 addObserver:v2];

    long long v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__fireForLocaleEvent_ name:*MEMORY[0x1E4F1C370] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_BSHandleSignificantTimeChange_0, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = +[BSPowerMonitor sharedInstance];
  [v5 removeObserver:self];

  [(BSRelativeDateTimer *)self invalidate];
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)BSRelativeDateTimer;
  [(BSRelativeDateTimer *)&v6 dealloc];
}

- (void)_fireForLocaleEvent:(id)a3
{
  gregorian = self->_gregorian;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", a3);
  [(NSCalendar *)gregorian setLocale:v5];

  if (self->_date)
  {
    [(BSRelativeDateTimer *)self fireAndSchedule];
  }
}

- (void)setDate:(id)a3
{
  uint64_t v4 = (NSDate *)a3;
  date = self->_date;
  long long v9 = v4;
  if (date != v4)
  {
    self->_date = 0;

    if (v9)
    {
      [(NSDate *)v9 timeIntervalSinceReferenceDate];
      v7 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)(v6 - fmod(v6, 1.0)));
      long long v8 = self->_date;
      self->_date = v7;

      [(BSRelativeDateTimer *)self _fireAndUpdateTimerIfNecessary];
    }
    else
    {
      [(BSRelativeDateTimer *)self invalidate];
    }
  }
}

- (id)date
{
  uint64_t v2 = (void *)[(NSDate *)self->_date copy];
  return v2;
}

- (double)nextFireInterval
{
  timer = self->_timer;
  if (!timer) {
    return 0.0;
  }
  [(NSTimer *)timer timeInterval];
  return result;
}

- (id)_computeDifferenceCurrentAndNextFireInfoForDate:(uint64_t *)a3 newTimerResolution:(uint64_t *)a4 currentResolution:(uint64_t *)a5 currentValue:(uint64_t *)a6 comparedToNow:
{
  id v11 = a2;
  objc_super v12 = v11;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_59;
  }
  id v29 = v11;
  [v11 timeIntervalSinceReferenceDate];
  v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)(v13 - fmod(v13, 1.0)));
  uint64_t v28 = [*(id *)(a1 + 24) compare:v14];
  id v15 = v14;
  v16 = [*(id *)(a1 + 8) components:240 fromDate:v15 toDate:*(void *)(a1 + 24) options:0];

  uint64_t v17 = [v16 day];
  uint64_t v18 = [v16 hour];
  uint64_t v19 = [v16 minute];
  uint64_t v20 = [v16 second];
  if (!v17)
  {
    if (v18)
    {
      if (v18 >= 1)
      {
        if (v18 == 1 && !v19 && !v20)
        {
          uint64_t v21 = 2;
          uint64_t v22 = 1;
LABEL_29:
          uint64_t v17 = 1;
          goto LABEL_50;
        }
        if (v19 > 0 || v20 >= 1)
        {
          uint64_t v22 = 2;
          if (v18 == 23) {
            uint64_t v21 = 3;
          }
          else {
            uint64_t v21 = 2;
          }
          if (v18 == 23) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = v18 + 1;
          }
          goto LABEL_50;
        }
      }
      uint64_t v22 = 2;
      uint64_t v21 = 2;
      uint64_t v17 = v18;
      goto LABEL_50;
    }
    if (!v19)
    {
      uint64_t v22 = 0;
      uint64_t v21 = 0;
      uint64_t v17 = v20;
      goto LABEL_50;
    }
    if (v19 < 1)
    {
      uint64_t v22 = 1;
      uint64_t v21 = 1;
      uint64_t v17 = v19;
      goto LABEL_50;
    }
    if (v19 != 1 || v20)
    {
      uint64_t v21 = 1;
      uint64_t v22 = 1;
      if (v19 == 59) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 1;
      }
      if (v19 == 59) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = v19 + 1;
      }
      if (v20 >= 1)
      {
        uint64_t v21 = v25;
        uint64_t v17 = v26;
      }
      else
      {
        uint64_t v22 = 1;
        uint64_t v17 = v19;
      }
      goto LABEL_50;
    }
    uint64_t v22 = 0;
    uint64_t v21 = 1;
    goto LABEL_29;
  }
  if (v17 < 1)
  {
LABEL_23:
    uint64_t v22 = 3;
    uint64_t v21 = 3;
    goto LABEL_50;
  }
  if (v17 != 1 || v18 || v19 || v20)
  {
    if (v18 > 0 || v19 > 0 || v20 > 0) {
      ++v17;
    }
    goto LABEL_23;
  }
  uint64_t v17 = 1;
  uint64_t v21 = 3;
  uint64_t v22 = 2;
LABEL_50:
  if (a3) {
    *a3 = v22;
  }
  if (a4) {
    *a4 = v21;
  }
  if (a5) {
    *a5 = v17;
  }
  if (a6) {
    *a6 = v28;
  }

  objc_super v12 = v29;
LABEL_59:

  return v16;
}

- (id)nextFireAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self)
  {
    [v4 timeIntervalSinceReferenceDate];
    v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)(v6 - fmod(v6, 1.0)));
    uint64_t v24 = 0;
    id v8 = -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v7, &v24, 0, 0, 0);
    uint64_t v9 = v24;
    id v10 = v5;
    id v11 = v10;
    if ((unint64_t)(v9 - 1) > 2)
    {
      id v15 = v10;
      id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v14 setSecond:1];
      [(NSCalendar *)self->_gregorian dateByAddingComponents:v14 toDate:v15 options:0];
    }
    else
    {
      uint64_t v12 = qword_18AB4C2E8[v9 - 1];
      id v13 = v10;
      id v14 = [(NSCalendar *)self->_gregorian components:v12 fromDate:self->_date];
      [(NSCalendar *)self->_gregorian nextDateAfterDate:v13 matchingComponents:v14 options:5120];
    v16 = };
  }
  else
  {
    v16 = 0;
  }

  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  id v17 = -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v16, 0, &v23, &v24, &v22);
  uint64_t v18 = [BSRelativeDateTimerFireInfo alloc];
  if ((int)v24 >= 0) {
    uint64_t v19 = v24;
  }
  else {
    uint64_t v19 = -(int)v24;
  }
  uint64_t v20 = [(BSRelativeDateTimerFireInfo *)v18 initWithValue:v19 resolution:v23 comparedToNow:v22 fireDate:v16];

  return v20;
}

- (void)fireAndSchedule
{
  [(BSRelativeDateTimer *)self invalidate];
  if (self->_date)
  {
    [(BSRelativeDateTimer *)self _fireAndUpdateTimerIfNecessary];
  }
}

- (void)_invalidateTimer
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      id v3 = v2;
      self;
      [(id)qword_1EB21B1A8 removeObject:v3];

      [*(id *)(a1 + 16) invalidate];
      id v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (void)_fireAndUpdateTimerIfNecessary
{
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  p_currResolution = &self->_currResolution;
  uint64_t v5 = -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v3, &v30, (uint64_t *)&self->_currResolution, &self->_currValue, &v29);

  [(NSTimer *)self->_timer timeInterval];
  if (v6 != 1.0 || *p_currResolution)
  {
    -[BSRelativeDateTimer _invalidateTimer]((uint64_t)self);
    uint64_t v7 = v29;
    uint64_t v8 = v30;
    id v9 = v5;
    id v10 = v9;
    double v11 = 1.0;
    if (v8 && v7)
    {
      int v12 = [v9 hour];
      if (v12 >= 0) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = -v12;
      }
      int v14 = [v10 minute];
      if (v14 >= 0) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = -v14;
      }
      int v16 = [v10 second];
      if (v16 >= 0) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = -v16;
      }
      switch(v8)
      {
        case 1:
          double v18 = (double)v17;
          double v19 = 60.0;
          break;
        case 2:
          double v18 = (double)(v17 + 60 * v15);
          double v19 = 3600.0;
          break;
        case 3:
          double v18 = (double)(3600 * v13 + 60 * v15 + v17);
          double v19 = 86400.0;
          break;
        default:
          double v18 = 0.0;
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"UnsupportedDateResolutionException", @"Unknown resolution: %lu", v8);
          double v19 = 0.0;
          break;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v21 = v19 - v18;
      if (v7 == 1) {
        double v21 = v18;
      }
      if (v18 == 0.0) {
        double v21 = v19;
      }
      double v11 = fabs(v21) - fmod(v20, 1.0);
    }

    uint64_t v22 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__fireAndUpdateTimerIfNecessary selector:0 userInfo:1 repeats:v11];
    timer = self->_timer;
    self->_timer = v22;

    uint64_t v24 = self->_timer;
    self;
    if (v24)
    {
      if ((_MergedGlobals_19 & 1) == 0)
      {
        _MergedGlobals_19 = 1;
        Main = CFRunLoopGetMain();
        CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D418], &__block_literal_global_17);
      }
      [(id)qword_1EB21B1A8 addObject:v24];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int currValue = self->_currValue;
    if (currValue >= 0) {
      uint64_t v28 = currValue;
    }
    else {
      uint64_t v28 = -currValue;
    }
    [WeakRetained timerFiredWithValue:v28 forResolution:*p_currResolution comparedToNow:v29];
  }
}

- (void)powerMonitorSystemDidWakeFromSleep:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__BSRelativeDateTimer_powerMonitorSystemDidWakeFromSleep___block_invoke;
  v3[3] = &unk_1E5446210;
  objc_copyWeak(&v4, &location);
  BSDispatchMain(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__BSRelativeDateTimer_powerMonitorSystemDidWakeFromSleep___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3]) {
    [WeakRetained fireAndSchedule];
  }
}

- (BSRelativeDateTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BSRelativeDateTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_gregorian, 0);
}

@end