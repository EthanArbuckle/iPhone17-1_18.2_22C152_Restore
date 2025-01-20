@interface DNDModeAssertionInvalidation(AssertionSyncManager)
- (BOOL)isUserInvalidated;
- (uint64_t)isInternalScheduled;
@end

@implementation DNDModeAssertionInvalidation(AssertionSyncManager)

- (uint64_t)isInternalScheduled
{
  v1 = [a1 source];
  v2 = [v1 clientIdentifier];
  uint64_t v3 = [v2 hasSuffix:@".private.schedule"];

  return v3;
}

- (BOOL)isUserInvalidated
{
  return DNDResolvedModeAssertionInvalidationReason() == 2;
}

@end