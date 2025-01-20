@interface DNDModeAssertion(AssertionSyncManager)
- (BOOL)isClientScheduled;
- (BOOL)isUserInitiated;
- (uint64_t)isInternalScheduled;
@end

@implementation DNDModeAssertion(AssertionSyncManager)

- (uint64_t)isInternalScheduled
{
  v1 = [a1 source];
  v2 = [v1 clientIdentifier];
  uint64_t v3 = [v2 hasSuffix:@".private.schedule"];

  return v3;
}

- (BOOL)isClientScheduled
{
  if ([a1 isInternalScheduled]) {
    return 0;
  }
  uint64_t v3 = [a1 details];
  BOOL v2 = [v3 reason] == 2;

  return v2;
}

- (BOOL)isUserInitiated
{
  BOOL v2 = [a1 details];
  if ([v2 reason] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 details];
    BOOL v3 = [v4 reason] == 3;
  }
  return v3;
}

@end