@interface CLKClockTimer
+ (CLKClockTimer)sharedInstance;
+ (id)now;
- (BOOL)_hasHandlers;
- (BOOL)ignoreScreenState;
- (CLKClockTimer)init;
- (CLKClockTimer)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (double)_timeUntilNextHighAccuracyEventFromHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 nanosecond:(int64_t)a6;
- (double)_timeUntilNextHighAccuracyEventFromNow;
- (id)_nextTokenWithUpdateFrequency:(int64_t)a3 wantsCommit:(BOOL)a4 wantsHighAccuracy:(BOOL)a5 identificationLog:(id)a6 handler:(id)a7;
- (id)description;
- (id)start15fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4;
- (id)start30fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4;
- (id)start60fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4;
- (id)startMinuteUpdatesWithHandler:(id)a3 identificationLog:(id)a4;
- (id)startSecondUpdatesWithHandler:(id)a3 identificationLog:(id)a4;
- (id)startUpdatesWithUpdateFrequency:(int64_t)a3 withHandler:(id)a4 identificationLog:(id)a5;
- (int64_t)_minimumPossibleUpdateFrequency;
- (void)_cancelWaitTimer;
- (void)_createDisplayLinkIfNeeded;
- (void)_handleTimePassed;
- (void)_maybeClearLastSeenTimeComponents;
- (void)_setDisplayLinkFrameInterval:(int64_t)a3;
- (void)_updateDisplayLink;
- (void)_updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:(double)a3 withMinimumUpdateFrequency:(int64_t)a4;
- (void)_updateIsPermittedToRun;
- (void)dealloc;
- (void)pause;
- (void)setHandler:(id)a3 wantsCommit:(BOOL)a4;
- (void)setIgnoreScreenState:(BOOL)a3;
- (void)stopUpdatesForToken:(id)a3;
- (void)unpause;
@end

@implementation CLKClockTimer

+ (CLKClockTimer)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return (CLKClockTimer *)v2;
}

uint64_t __31__CLKClockTimer_sharedInstance__block_invoke()
{
  v0 = [[CLKClockTimer alloc] initWithIdentifier:@"sharedInstance"];
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)now
{
  v2 = CLKForcedTime();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF910] date];
  }
  v5 = v4;

  v6 = [v5 dateByAddingTimeInterval:0.05];

  return v6;
}

- (CLKClockTimer)init
{
  return [(CLKClockTimer *)self initWithIdentifier:@"<anonymous>"];
}

- (CLKClockTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKClockTimer;
  v5 = [(CLKClockTimer *)&v18 init];
  if (v5)
  {
    for (uint64_t i = 16; i != 56; i += 8)
    {
      uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      v8 = *(void **)&v5[i];
      *(void *)&v5[i] = v7;
    }
    uint64_t v9 = [v4 copy];
    v10 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v12 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v11;

    *((void *)v5 + 15) = 0x7FFFFFFFFFFFFFFFLL;
    int64x2_t v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v5 + 104) = v13;
    *(int64x2_t *)(v5 + 88) = v13;
    uint64_t v14 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    v15 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v14;

    v5[160] = 0;
    *((_DWORD *)v5 + 32) = 16843008;
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v5 selector:sel__handleTimePassed name:*MEMORY[0x263F83390] object:0];
  }
  return (CLKClockTimer *)v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLKClockTimer;
  [(CLKClockTimer *)&v2 dealloc];
}

- (id)startUpdatesWithUpdateFrequency:(int64_t)a3 withHandler:(id)a4 identificationLog:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 5)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [(CLKClockTimer *)self _nextTokenWithUpdateFrequency:a3 wantsCommit:0 wantsHighAccuracy:v8 identificationLog:a5 handler:a4];
  v10 = self->_handlersByUpdateFrequency[a3];
  [(NSHashTable *)v10 addObject:v9];
  [(NSHashTable *)self->_allHandlers addObject:v9];
  uint64_t v11 = CLKLoggingObjectForDomain(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(CLKClockTimer *)self identifier];
    NSUInteger v13 = [(NSHashTable *)self->_allHandlers count];
    int v15 = 138412802;
    v16 = v12;
    __int16 v17 = 2080;
    objc_super v18 = "-[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:]";
    __int16 v19 = 2048;
    NSUInteger v20 = v13;
    _os_log_impl(&dword_21C599000, v11, OS_LOG_TYPE_DEFAULT, "%@ - %s, _allHandlers.count = %lu", (uint8_t *)&v15, 0x20u);
  }
  [(CLKClockTimer *)self _updateDisplayLink];

LABEL_9:

  return v9;
}

- (void)stopUpdatesForToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setIsActive:0];
  [v4 setHandler:0];
  [v4 setLog:0];
  -[NSHashTable removeObject:](self->_handlersByUpdateFrequency[[v4 updateFrequency]], "removeObject:", v4);
  [(NSHashTable *)self->_allHandlers removeObject:v4];

  v5 = CLKLoggingObjectForDomain(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CLKClockTimer *)self identifier];
    NSUInteger v7 = [(NSHashTable *)self->_allHandlers count];
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    uint64_t v11 = "-[CLKClockTimer stopUpdatesForToken:]";
    __int16 v12 = 2048;
    NSUInteger v13 = v7;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %s, _allHandlers.count = %lu", (uint8_t *)&v8, 0x20u);
  }
  [(CLKClockTimer *)self _updateDisplayLink];
  [(CLKClockTimer *)self _maybeClearLastSeenTimeComponents];
}

- (id)_nextTokenWithUpdateFrequency:(int64_t)a3 wantsCommit:(BOOL)a4 wantsHighAccuracy:(BOOL)a5 identificationLog:(id)a6 handler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [[CLKClockTimerToken alloc] initWithID:self->_nextToken++];
  if (!v12) {
    id v12 = (id)[&__block_literal_global_90 copy];
  }
  [(CLKClockTimerToken *)v14 setWantsCommit:v9];
  [(CLKClockTimerToken *)v14 setWantsHighAccuracy:v8];
  [(CLKClockTimerToken *)v14 setUpdateFrequency:a3];
  [(CLKClockTimerToken *)v14 setLog:v12];
  [(CLKClockTimerToken *)v14 setHandler:v13];

  [(CLKClockTimerToken *)v14 setIsActive:1];
  [(CLKClockTimerToken *)v14 setOwner:self];

  return v14;
}

__CFString *__103__CLKClockTimer__nextTokenWithUpdateFrequency_wantsCommit_wantsHighAccuracy_identificationLog_handler___block_invoke()
{
  return @"No identification log provided";
}

- (void)setHandler:(id)a3 wantsCommit:(BOOL)a4
{
}

- (id)startMinuteUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CLKClockTimer_startMinuteUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_26440E970;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(CLKClockTimer *)self startUpdatesWithUpdateFrequency:0 withHandler:v10 identificationLog:a4];

  return v8;
}

void __65__CLKClockTimer_startMinuteUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)startSecondUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CLKClockTimer_startSecondUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_26440E970;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(CLKClockTimer *)self startUpdatesWithUpdateFrequency:1 withHandler:v10 identificationLog:a4];

  return v8;
}

void __65__CLKClockTimer_startSecondUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)start15fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start15fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_26440E970;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(CLKClockTimer *)self startUpdatesWithUpdateFrequency:2 withHandler:v10 identificationLog:a4];

  return v8;
}

void __64__CLKClockTimer_start15fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a3 + 32));
}

- (id)start30fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start30fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_26440E970;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(CLKClockTimer *)self startUpdatesWithUpdateFrequency:3 withHandler:v10 identificationLog:a4];

  return v8;
}

void __64__CLKClockTimer_start30fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)start60fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start60fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_26440E970;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = [(CLKClockTimer *)self startUpdatesWithUpdateFrequency:4 withHandler:v10 identificationLog:a4];

  return v8;
}

void __64__CLKClockTimer_start60fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasHandlers
{
  return [(NSHashTable *)self->_allHandlers count] != 0;
}

- (int64_t)_minimumPossibleUpdateFrequency
{
  if ([(NSHashTable *)self->_handlersByUpdateFrequency[4] count]) {
    return 4;
  }
  if ([(NSHashTable *)self->_handlersByUpdateFrequency[3] count]) {
    return 3;
  }
  if ([(NSHashTable *)self->_handlersByUpdateFrequency[2] count]) {
    return 2;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[1] count]) {
    [(NSHashTable *)self->_handlersByUpdateFrequency[0] count];
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)_timeUntilNextHighAccuracyEventFromHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 nanosecond:(int64_t)a6
{
  double v8 = (double)a6 / -1000000000.0 + 1.0;
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[1] count])
  {
    if ([(NSHashTable *)self->_handlersByUpdateFrequency[0] count]) {
      return v8 + (double)(59 - a5);
    }
    else {
      return INFINITY;
    }
  }
  return v8;
}

- (double)_timeUntilNextHighAccuracyEventFromNow
{
  v3 = +[CLKClockTimer now];
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  [(NSCalendar *)self->_calendar getHour:&v10 minute:&v9 second:&v8 nanosecond:&v7 fromDate:v3];
  [(CLKClockTimer *)self _timeUntilNextHighAccuracyEventFromHour:v10 minute:v9 second:v8 nanosecond:v7];
  double v5 = v4;

  return v5;
}

- (void)_cancelWaitTimer
{
  waitForNextEventTimer = self->_waitForNextEventTimer;
  if (waitForNextEventTimer)
  {
    dispatch_source_cancel(waitForNextEventTimer);
    double v4 = self->_waitForNextEventTimer;
    self->_waitForNextEventTimer = 0;

    waitTimerScheduledFireTime = self->_waitTimerScheduledFireTime;
    self->_waitTimerScheduledFireTime = 0;
  }
}

- (void)_createDisplayLinkIfNeeded
{
  if (!self->_displayLink)
  {
    v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__onDisplayLink_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    double v5 = self->_displayLink;
    id v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)_setDisplayLinkFrameInterval:(int64_t)a3
{
  [(CLKClockTimer *)self _createDisplayLinkIfNeeded];
  if ([(CADisplayLink *)self->_displayLink frameInterval] != a3)
  {
    [(CADisplayLink *)self->_displayLink setFrameInterval:a3];
    kdebug_trace();
  }
}

- (void)_updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:(double)a3 withMinimumUpdateFrequency:(int64_t)a4
{
  if (self->_permittedToRun && [(CLKClockTimer *)self _hasHandlers])
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v7 = CLKClockTimerFrameIntervalForUpdateFrequency[a4];
    }
    if (a3 <= 0.0833333333)
    {
      [(CLKClockTimer *)self _cancelWaitTimer];
      uint64_t v7 = 1;
    }
    else
    {
      if (a3 < INFINITY && v7 != 1)
      {
        uint64_t v8 = +[CLKClockTimer now];
        double v9 = a3 + -0.05 + -0.0166666667;
        uint64_t v10 = [v8 dateByAddingTimeInterval:v9];
        id v11 = v10;
        if (!self->_waitTimerScheduledFireTime
          || (objc_msgSend(v10, "timeIntervalSinceDate:"), fabs(v12) > 0.0166666667))
        {
          [(CLKClockTimer *)self _cancelWaitTimer];
          objc_storeStrong((id *)&self->_waitTimerScheduledFireTime, v11);
          objc_initWeak(&location, self);
          id v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, MEMORY[0x263EF83A0]);
          waitForNextEventTimer = self->_waitForNextEventTimer;
          self->_waitForNextEventTimer = v13;

          int v15 = self->_waitForNextEventTimer;
          uint64_t v19 = MEMORY[0x263EF8330];
          uint64_t v20 = 3221225472;
          uint64_t v21 = __97__CLKClockTimer__updateDisplayLinkWithTimeUntilNextHighAccuracyEvent_withMinimumUpdateFrequency___block_invoke;
          v22 = &unk_26440DAC8;
          objc_copyWeak(&v23, &location);
          dispatch_source_set_event_handler(v15, &v19);
          dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
          dispatch_source_set_timer((dispatch_source_t)self->_waitForNextEventTimer, v16, 0xFFFFFFFFFFFFFFFFLL, 0xFE502AuLL);
          dispatch_resume((dispatch_object_t)self->_waitForNextEventTimer);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        displayLink = self->_displayLink;
        uint64_t v18 = 1;
LABEL_19:
        -[CADisplayLink setPaused:](displayLink, "setPaused:", v18, v19, v20, v21, v22);
        return;
      }
    }
    -[CLKClockTimer _setDisplayLinkFrameInterval:](self, "_setDisplayLinkFrameInterval:", v7, v19, v20, v21, v22);
    displayLink = self->_displayLink;
    uint64_t v18 = 0;
    goto LABEL_19;
  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1, a3);

  [(CLKClockTimer *)self _cancelWaitTimer];
}

void __97__CLKClockTimer__updateDisplayLinkWithTimeUntilNextHighAccuracyEvent_withMinimumUpdateFrequency___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = (void *)WeakRetained[17];
    WeakRetained[17] = 0;
    id v3 = WeakRetained;

    [v3 _updateDisplayLink];
    WeakRetained = v3;
  }
}

- (void)_updateDisplayLink
{
  [(CLKClockTimer *)self _timeUntilNextHighAccuracyEventFromNow];
  double v4 = v3;
  int64_t v5 = [(CLKClockTimer *)self _minimumPossibleUpdateFrequency];

  [(CLKClockTimer *)self _updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:v5 withMinimumUpdateFrequency:v4];
}

- (void)_maybeClearLastSeenTimeComponents
{
  if (!self->_permittedToRun)
  {
    self->_last60fps = 0x7FFFFFFFFFFFFFFFLL;
    int64x2_t v4 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&self->_last15fps = v4;
    *(int64x2_t *)&self->_lastMinute = v4;
    uint64_t v3 = 80;
    goto LABEL_13;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[0] count]) {
    self->_lastMinute = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[1] count]) {
    self->_lastSecond = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[2] count]) {
    self->_last15fps = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[3] count]) {
    self->_last30fps = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSHashTable *)self->_handlersByUpdateFrequency[4] count])
  {
    uint64_t v3 = 120;
LABEL_13:
    *(Class *)((char *)&self->super.isa + v3) = (Class)0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_handleTimePassed
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  obuint64_t j = +[CLKClockTimer now];
  int64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
  objc_super v2 = self;
  [(NSDate *)self->_lastNow timeIntervalSinceReferenceDate];
  double v4 = v3;
  [obj timeIntervalSinceReferenceDate];
  if (!self->_lastNow
    || (int64_t lastHour = self->_lastHour, lastHour == 0x7FFFFFFFFFFFFFFFLL)
    || (int64_t lastMinute = self->_lastMinute, lastMinute == 0x7FFFFFFFFFFFFFFFLL)
    || (int64_t lastSecond = self->_lastSecond, lastSecond == 0x7FFFFFFFFFFFFFFFLL)
    || *(uint64_t *)&v4 != *(uint64_t *)&v5)
  {
    [(NSCalendar *)self->_calendar getHour:&v73 minute:&v72 second:&v71 nanosecond:&v70 fromDate:obj];
    uint64_t v8 = v70;
    int64_t v9 = v71;
    int64_t v11 = v72;
    int64_t v10 = v73;
    objc_super v2 = self;
    int64_t lastHour = self->_lastHour;
    int64_t lastMinute = self->_lastMinute;
    int64_t lastSecond = self->_lastSecond;
  }
  else
  {
    int64_t v72 = self->_lastMinute;
    int64_t v73 = lastHour;
    uint64_t v8 = (uint64_t)((v5 - (double)(uint64_t)v4) * 1000000000.0);
    uint64_t v70 = v8;
    int64_t v71 = lastSecond;
    int64_t v9 = lastSecond;
    int64_t v11 = lastMinute;
    int64_t v10 = lastHour;
  }
  uint64_t v13 = 0;
  char v14 = 0;
  double v15 = (double)v8 / 1000000000.0;
  int64_t v16 = (uint64_t)(v15 / 0.0666666667);
  int64_t v17 = (uint64_t)(v15 / 0.0333333333);
  int64_t v46 = v9;
  int64_t v47 = lastSecond;
  int64_t v18 = (uint64_t)(v15 / 0.0166666667);
  BOOL v19 = v11 == lastMinute && v10 == lastHour;
  int v20 = !v19;
  BOOL v21 = !v19 || v9 != lastSecond;
  char v22 = v2->_last15fps != v16 || v21;
  char v23 = v2->_last30fps != v17 || v21;
  v69[2] = v22;
  int64_t last60fps = v2->_last60fps;
  int v48 = v20;
  v69[0] = v20;
  v69[3] = v23;
  char v25 = last60fps != v18 || v21;
  BOOL v45 = v21;
  v69[1] = v21;
  v69[4] = v25;
  do
  {
    char v26 = v69[v13];
    if (v26)
    {
      char v26 = [(NSHashTable *)v2->_handlersByUpdateFrequency[v13] count] != 0;
      objc_super v2 = self;
    }
    v14 |= v26;
    ++v13;
  }
  while (v13 != 5);
  objc_storeStrong((id *)&self->_lastNow, obj);
  int64_t v27 = v72;
  v28 = self;
  self->_int64_t lastHour = v73;
  self->_int64_t lastMinute = v27;
  self->_int64_t lastSecond = v71;
  self->_last15fps = v16;
  self->_last30fps = v17;
  self->_int64_t last60fps = v18;
  if (v14)
  {
    id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    do
    {
      v30 |= v69[v29] << v29;
      ++v29;
    }
    while (v29 != 5);
    id v53 = obj;
    int64_t v31 = v72;
    int64_t v51 = v73;
    int64_t v32 = v71;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v50 = self->_allHandlers;
    char v33 = 0;
    uint64_t v34 = [(NSHashTable *)v50 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v66 != v35) {
            objc_enumerationMutation(v50);
          }
          v37 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          if ((v30 & (1 << [v37 updateFrequency])) != 0)
          {
            char v38 = [v37 wantsCommit];
            v59[0] = MEMORY[0x263EF8330];
            v59[1] = 3254779904;
            v59[2] = __34__CLKClockTimer__handleTimePassed__block_invoke;
            v59[3] = &unk_26CCC3C50;
            v59[4] = v37;
            v59[5] = self;
            id v60 = v53;
            int64_t v61 = v51;
            int64_t v62 = v31;
            int64_t v63 = v32;
            double v64 = v15;
            v39 = (void *)MEMORY[0x21D4AACC0](v59);
            [v52 addObject:v39];

            v33 |= v38;
          }
        }
        uint64_t v34 = [(NSHashTable *)v50 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v34);
    }

    if ((v48 | (v46 != v47)) == 1)
    {
      [v53 timeIntervalSinceReferenceDate];
      kdebug_trace();
    }
    if (v48 && [(NSHashTable *)self->_handlersByUpdateFrequency[0] count]) {
      kdebug_trace();
    }
    if (v45 && [(NSHashTable *)self->_handlersByUpdateFrequency[1] count]) {
      kdebug_trace();
    }
    if (v33) {
      [MEMORY[0x263F158F8] begin];
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v40 = v52;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v74 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(v40);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v55 + 1) + 8 * j) + 16))();
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v74 count:16];
      }
      while (v41);
    }

    if (v33) {
      [MEMORY[0x263F158F8] commit];
    }

    v28 = self;
  }
  -[CLKClockTimer _timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:](v28, "_timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:");
  [(CLKClockTimer *)self _updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:[(CLKClockTimer *)self _minimumPossibleUpdateFrequency] withMinimumUpdateFrequency:v44];
}

void __34__CLKClockTimer__handleTimePassed__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActive])
  {
    objc_super v2 = [*(id *)(a1 + 32) handler];
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    long long v4 = *(_OWORD *)(a1 + 72);
    long long v6 = *(_OWORD *)(a1 + 56);
    long long v7 = v4;
    ((void (**)(void, uint64_t, id *))v2)[2](v2, v3, &v5);
  }
}

- (void)_updateIsPermittedToRun
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v3 = !self->_paused;
  if (!self->_ignoreScreenState)
  {
    BOOL isForeground = self->_isForeground;
    if (self->_isForeground) {
      BOOL isForeground = self->_backlightOn;
    }
    BOOL v3 = !self->_paused && isForeground;
  }
  if (v3 || !self->_permittedToRun)
  {
    char v11 = !v3;
    if (self->_permittedToRun) {
      char v11 = 1;
    }
    if (v11)
    {
      int64_t v18 = CLKLoggingObjectForDomain(2);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = [(CLKClockTimer *)self identifier];
        NSUInteger v20 = [(NSHashTable *)self->_allHandlers count];
        BOOL v21 = self->_isForeground;
        BOOL backlightOn = self->_backlightOn;
        BOOL ignoreScreenState = self->_ignoreScreenState;
        int v24 = 138413826;
        char v25 = v19;
        __int16 v26 = 2080;
        int64_t v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
        __int16 v28 = 2048;
        NSUInteger v29 = v20;
        __int16 v30 = 1024;
        int v31 = v3;
        __int16 v32 = 1024;
        BOOL v33 = v21;
        __int16 v34 = 1024;
        BOOL v35 = backlightOn;
        __int16 v36 = 1024;
        BOOL v37 = ignoreScreenState;
        _os_log_impl(&dword_21C599000, v18, OS_LOG_TYPE_DEFAULT, "No update %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _BOOL isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);
      }
    }
    else
    {
      kdebug_trace();
      [(CLKClockTimer *)self _maybeClearLastSeenTimeComponents];
      self->_permittedToRun = 1;
      double v12 = CLKLoggingObjectForDomain(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(CLKClockTimer *)self identifier];
        NSUInteger v14 = [(NSHashTable *)self->_allHandlers count];
        BOOL v15 = self->_isForeground;
        BOOL v16 = self->_backlightOn;
        BOOL v17 = self->_ignoreScreenState;
        int v24 = 138413826;
        char v25 = v13;
        __int16 v26 = 2080;
        int64_t v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
        __int16 v28 = 2048;
        NSUInteger v29 = v14;
        __int16 v30 = 1024;
        int v31 = 1;
        __int16 v32 = 1024;
        BOOL v33 = v15;
        __int16 v34 = 1024;
        BOOL v35 = v16;
        __int16 v36 = 1024;
        BOOL v37 = v17;
        _os_log_impl(&dword_21C599000, v12, OS_LOG_TYPE_DEFAULT, "Resuming %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _BOOL isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);
      }
      [(CLKClockTimer *)self _updateDisplayLink];
      [(CLKClockTimer *)self _handleTimePassed];
    }
  }
  else
  {
    kdebug_trace();
    self->_permittedToRun = 0;
    id v5 = CLKLoggingObjectForDomain(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = [(CLKClockTimer *)self identifier];
      NSUInteger v7 = [(NSHashTable *)self->_allHandlers count];
      BOOL v8 = self->_isForeground;
      BOOL v9 = self->_backlightOn;
      BOOL v10 = self->_ignoreScreenState;
      int v24 = 138413826;
      char v25 = v6;
      __int16 v26 = 2080;
      int64_t v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
      __int16 v28 = 2048;
      NSUInteger v29 = v7;
      __int16 v30 = 1024;
      int v31 = 0;
      __int16 v32 = 1024;
      BOOL v33 = v8;
      __int16 v34 = 1024;
      BOOL v35 = v9;
      __int16 v36 = 1024;
      BOOL v37 = v10;
      _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "Pausing %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _BOOL isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);
    }
    [(CLKClockTimer *)self _updateDisplayLink];
  }
}

- (void)setIgnoreScreenState:(BOOL)a3
{
  self->_BOOL ignoreScreenState = a3;
  [(CLKClockTimer *)self _updateIsPermittedToRun];
}

- (void)unpause
{
  self->_paused = 0;
  [(CLKClockTimer *)self _updateIsPermittedToRun];
}

- (void)pause
{
  self->_paused = 1;
  [(CLKClockTimer *)self _updateIsPermittedToRun];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CLKClockTimer: %p-%@>", self, self->_identifier];
}

- (BOOL)ignoreScreenState
{
  return self->_ignoreScreenState;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_waitForNextEventTimer, 0);
  objc_storeStrong((id *)&self->_waitTimerScheduledFireTime, 0);
  objc_storeStrong((id *)&self->_lastNow, 0);
  objc_storeStrong((id *)&self->_allHandlers, 0);
  for (uint64_t i = 48; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end