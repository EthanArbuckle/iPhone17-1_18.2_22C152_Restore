@interface BLSBacklightChangeEvent(BacklightServicesHost)
- (BOOL)isEnvironmentTransitionAnimated;
- (uint64_t)isAlwaysOnTransition;
- (uint64_t)isTransitionForcedUnanimated;
@end

@implementation BLSBacklightChangeEvent(BacklightServicesHost)

- (uint64_t)isAlwaysOnTransition
{
  uint64_t result = [a1 state];
  if (result != 1) {
    return [a1 previousState] == 1;
  }
  return result;
}

- (uint64_t)isTransitionForcedUnanimated
{
  uint64_t v2 = [a1 state];
  uint64_t v3 = [a1 previousState];
  v4 = [a1 changeRequest];
  uint64_t v5 = [v4 sourceEvent];

  BOOL v8 = v2 == 2 && v3 == 3 || v5 == 15;
  if (v5 == 7) {
    BOOL v8 = 1;
  }
  return v2 == v3 || v8;
}

- (BOOL)isEnvironmentTransitionAnimated
{
  if ([a1 isTransitionForcedUnanimated]) {
    return 0;
  }
  uint64_t v3 = [a1 state];
  uint64_t v4 = [a1 previousState];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5 && v3 != 3;
}

@end