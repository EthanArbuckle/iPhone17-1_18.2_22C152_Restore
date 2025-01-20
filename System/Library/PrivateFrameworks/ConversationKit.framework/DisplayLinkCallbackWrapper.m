@interface DisplayLinkCallbackWrapper
- (void)displayLinkCallback:(id)a3;
@end

@implementation DisplayLinkCallbackWrapper

- (void)displayLinkCallback:(id)a3
{
  id v3 = a3;
  swift_retain();
  DisplayLinkCallbackWrapper.displayLinkCallback(_:)((uint64_t)v3);

  swift_release();
}

@end