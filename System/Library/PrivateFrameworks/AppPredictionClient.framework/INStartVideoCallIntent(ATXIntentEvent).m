@interface INStartVideoCallIntent(ATXIntentEvent)
- (void)atx_getArgsInto:()ATXIntentEvent;
@end

@implementation INStartVideoCallIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4 = a3;
  id v6 = [a1 contacts];
  v5 = joinedDisplayNames(v6);
  [v4 setArg1:v5];
}

@end