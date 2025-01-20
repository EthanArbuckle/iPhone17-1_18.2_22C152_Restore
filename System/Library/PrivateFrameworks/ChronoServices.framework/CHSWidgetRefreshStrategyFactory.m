@interface CHSWidgetRefreshStrategyFactory
+ (CHSWidgetRefreshStrategy)defaultStrategy;
+ (CHSWidgetRefreshStrategy)disabledStrategy;
+ (id)rateLimitedWithPolicyIdentifier:(id)a3;
@end

@implementation CHSWidgetRefreshStrategyFactory

+ (CHSWidgetRefreshStrategy)defaultStrategy
{
  v2 = [[_CHSSimpleWidgetRefreshStrategy alloc] initWithDefaultStrategy];
  return (CHSWidgetRefreshStrategy *)v2;
}

+ (CHSWidgetRefreshStrategy)disabledStrategy
{
  v2 = [[_CHSSimpleWidgetRefreshStrategy alloc] initWithDisabledStrategy];
  return (CHSWidgetRefreshStrategy *)v2;
}

+ (id)rateLimitedWithPolicyIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"CHSWidgetRefreshStrategy.m", 27, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v6 = [[_CHSSimpleWidgetRefreshStrategy alloc] initWithRateLimitIdentifier:v5];

  return v6;
}

@end