@interface IAEventDispatcher
+ (void)dispatchEvent:(id)a3 payload:(id)a4;
- (void)dispatchEvent:(id)a3 payload:(id)a4;
@end

@implementation IAEventDispatcher

+ (void)dispatchEvent:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)dispatchEvent:(id)a3 payload:(id)a4
{
}

@end