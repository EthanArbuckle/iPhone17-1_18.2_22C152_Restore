@interface SASendInstrumentation
+ (BOOL)ad_shouldClassLogToMetrics;
- (BOOL)ad_willHaveReply;
@end

@implementation SASendInstrumentation

- (BOOL)ad_willHaveReply
{
  return 1;
}

+ (BOOL)ad_shouldClassLogToMetrics
{
  return 0;
}

@end