@interface ITIdleTimerServiceProvider
+ (id)makeRequestHandlerWithDelegate:(id)a3;
@end

@implementation ITIdleTimerServiceProvider

+ (id)makeRequestHandlerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[ITIdleTimerStateClient alloc] initWithDelegate:v3];

  return v4;
}

@end