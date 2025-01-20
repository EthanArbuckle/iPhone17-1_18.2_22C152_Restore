@interface SNFileServerDiscoveryResult
- (SNFileServerDiscoveryResult)init;
- (SNFileServerInfo)serverInfo;
- (unint64_t)state;
@end

@implementation SNFileServerDiscoveryResult

- (SNFileServerInfo)serverInfo
{
  v2 = self;
  id v3 = sub_1DCA8D098();

  return (SNFileServerInfo *)v3;
}

- (unint64_t)state
{
  return sub_1DCA8D184();
}

- (SNFileServerDiscoveryResult)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end