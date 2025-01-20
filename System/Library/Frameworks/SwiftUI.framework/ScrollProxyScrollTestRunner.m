@interface ScrollProxyScrollTestRunner
- (void)incrementScrollTest;
@end

@implementation ScrollProxyScrollTestRunner

- (void)incrementScrollTest
{
  swift_retain();
  ScrollProxyScrollTestRunner.incrementScrollTest()();

  swift_release();
}

@end