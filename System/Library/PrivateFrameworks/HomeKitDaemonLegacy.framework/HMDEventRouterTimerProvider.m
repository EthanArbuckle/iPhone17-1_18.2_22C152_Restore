@interface HMDEventRouterTimerProvider
- (id)currentDate;
- (id)dateWithTimeIntervalSinceNow:(double)a3;
- (id)timerWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5;
@end

@implementation HMDEventRouterTimerProvider

- (id)timerWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[HMDEventRouterTimer alloc] initWithQueue:v8 interval:v7 timerFireHandler:a4];

  return v9;
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
}

- (id)currentDate
{
  return (id)[MEMORY[0x1E4F1C9C8] now];
}

@end