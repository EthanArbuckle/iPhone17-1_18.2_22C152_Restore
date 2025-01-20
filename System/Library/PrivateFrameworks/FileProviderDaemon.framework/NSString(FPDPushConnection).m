@interface NSString(FPDPushConnection)
- (uint64_t)fp_isCloudDocsPushTopic;
- (uint64_t)fp_isTestPushTopic;
@end

@implementation NSString(FPDPushConnection)

- (uint64_t)fp_isCloudDocsPushTopic
{
  v2 = [@"com.apple.icloud-container." stringByAppendingString:@"clouddocs."];
  uint64_t v3 = [a1 hasPrefix:v2];

  return v3;
}

- (uint64_t)fp_isTestPushTopic
{
  return [a1 hasPrefix:@"com.apple.TestingHarness"];
}

@end