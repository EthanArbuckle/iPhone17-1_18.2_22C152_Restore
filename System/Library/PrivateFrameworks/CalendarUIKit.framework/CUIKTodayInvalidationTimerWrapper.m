@interface CUIKTodayInvalidationTimerWrapper
- (BOOL)todayChangedAfterInvalidation;
- (CUIKTodayInvalidationTimerWrapper)initWithCalendar:(id)a3;
- (void)_killTimeZoneTimer;
- (void)_setupTimeZoneTimerWithCalendar:(id)a3;
- (void)dealloc;
- (void)invalidateTodayAndNotifyIfChanged;
@end

@implementation CUIKTodayInvalidationTimerWrapper

- (CUIKTodayInvalidationTimerWrapper)initWithCalendar:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUIKTodayInvalidationTimerWrapper;
  v5 = [(CUIKTodayInvalidationTimerWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CUIKTodayInvalidationTimerWrapper *)v5 _setupTimeZoneTimerWithCalendar:v4];
  }

  return v6;
}

- (void)_setupTimeZoneTimerWithCalendar:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  char v7 = [v5 isEquivalentTo:v6];

  if (v7)
  {
    [(CUIKTodayInvalidationTimerWrapper *)self _killTimeZoneTimer];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v8 setDay:1];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [v4 dateByAddingComponents:v8 toDate:v9 options:0];

    v11 = [v4 components:30 fromDate:v10];
    v12 = [v4 dateFromComponents:v11];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__CUIKTodayInvalidationTimerWrapper__setupTimeZoneTimerWithCalendar___block_invoke;
    v14[3] = &unk_1E6369CC8;
    v14[4] = self;
    id v15 = v12;
    id v13 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

- (void)_killTimeZoneTimer
{
  tzSupportDayRolloverTimer = self->_tzSupportDayRolloverTimer;
  if (tzSupportDayRolloverTimer)
  {
    [(NSTimer *)tzSupportDayRolloverTimer invalidate];
    id v4 = self->_tzSupportDayRolloverTimer;
    self->_tzSupportDayRolloverTimer = 0;
  }
}

- (void)dealloc
{
  [(CUIKTodayInvalidationTimerWrapper *)self _killTimeZoneTimer];
  v3.receiver = self;
  v3.super_class = (Class)CUIKTodayInvalidationTimerWrapper;
  [(CUIKTodayInvalidationTimerWrapper *)&v3 dealloc];
}

void __69__CUIKTodayInvalidationTimerWrapper__setupTimeZoneTimerWithCalendar___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _killTimeZoneTimer];
  v2 = (void *)MEMORY[0x1E4F1CB00];
  objc_super v3 = *(void **)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:v7];
  uint64_t v4 = objc_msgSend(v2, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), sel_invalidateTodayAndNotifyIfChanged, 0, 0);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

- (BOOL)todayChangedAfterInvalidation
{
  objc_super v3 = CUIKTodayDate();
  CUIKInvalidateToday();
  uint64_t v4 = CUIKCalendar();
  [(CUIKTodayInvalidationTimerWrapper *)self _setupTimeZoneTimerWithCalendar:v4];
  if (v3)
  {
    uint64_t v5 = CUIKTodayDate();
    int v6 = [v3 isEqualToDate:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)invalidateTodayAndNotifyIfChanged
{
  if ([(CUIKTodayInvalidationTimerWrapper *)self todayChangedAfterInvalidation])
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"CalTodayChangedNotification" object:0];
  }
}

- (void).cxx_destruct
{
}

@end