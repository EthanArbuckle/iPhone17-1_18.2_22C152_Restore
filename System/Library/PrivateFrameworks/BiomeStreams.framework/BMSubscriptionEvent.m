@interface BMSubscriptionEvent
- (id)endEvent;
@end

@implementation BMSubscriptionEvent

- (id)endEvent
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F502A8]);
    v3 = [v1 client];
    v4 = [v1 identifier];
    v5 = [v1 useCase];
    id v1 = (id)[v2 initWithClient:v3 identifier:v4 useCase:v5 starting:0];
  }

  return v1;
}

@end