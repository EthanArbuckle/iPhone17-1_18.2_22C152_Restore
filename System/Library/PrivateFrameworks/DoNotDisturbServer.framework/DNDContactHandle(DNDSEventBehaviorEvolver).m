@interface DNDContactHandle(DNDSEventBehaviorEvolver)
- (BOOL)isPopulated;
@end

@implementation DNDContactHandle(DNDSEventBehaviorEvolver)

- (BOOL)isPopulated
{
  v2 = [a1 contactIdentifier];
  if ([v2 length])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 value];
    BOOL v3 = [v4 length] != 0;
  }
  return v3;
}

@end