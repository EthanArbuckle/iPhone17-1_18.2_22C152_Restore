@interface SARequestCompleted
- (BOOL)ad_shouldIgnoreCallbacksOnReply;
@end

@implementation SARequestCompleted

- (BOOL)ad_shouldIgnoreCallbacksOnReply
{
  return 1;
}

@end