@interface SATimerObject
- (id)_ad_timer;
- (id)_ad_timerWithState:(int64_t)a3;
- (void)_ad_setTimer:(id)a3;
@end

@implementation SATimerObject

- (void)_ad_setTimer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  if ((unint64_t)v5 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = *(id *)*(&off_1004FF758 + (void)v5);
  }
  id v8 = v6;
  [(SATimerObject *)self setState:v6];
  v7 = [v4 value];

  [(SATimerObject *)self setTimerValue:v7];
}

- (id)_ad_timer
{
  v3 = [(SATimerObject *)self state];
  if ([v3 isEqualToString:SATimerStatePausedValue])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:SATimerStateRunningValue])
  {
    uint64_t v4 = 1;
  }
  else
  {
    [v3 isEqualToString:SATimerStateStoppedValue];
    uint64_t v4 = 2;
  }
  id v5 = [(SATimerObject *)self _ad_timerWithState:v4];

  return v5;
}

- (id)_ad_timerWithState:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)STTimer);
  [v5 setState:a3];
  id v6 = [(SATimerObject *)self timerValue];
  [v5 setValue:v6];

  return v5;
}

@end