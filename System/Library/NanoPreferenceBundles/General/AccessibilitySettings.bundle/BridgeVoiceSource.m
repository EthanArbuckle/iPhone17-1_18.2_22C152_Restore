@interface BridgeVoiceSource
- (void)resourceCacheDidReceiveUpdate;
@end

@implementation BridgeVoiceSource

- (void)resourceCacheDidReceiveUpdate
{
  swift_retain();
  BridgeVoiceSource.resourceCacheDidReceiveUpdate()();

  swift_release();
}

@end