@interface HMDDiscoveryController
- (HMDDiscoveryController)init;
- (HMDDiscoveryController)initWithDiscoveryNeedsAssertion:(BOOL)a3;
- (id)obtainNetworkVisibleDevicesProto;
- (id)obtainSFVisibleDevicesProto;
- (void)start;
@end

@implementation HMDDiscoveryController

- (HMDDiscoveryController)initWithDiscoveryNeedsAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_allocWithZone((Class)type metadata accessor for DiscoveryController(0));
  v5 = (HMDDiscoveryController *)sub_22F62E4CC(v3, (uint64_t (*)(void))sub_22F62A050, 0, (uint64_t (*)(void))sub_22F62A084, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)start
{
  v2 = self;
  DiscoveryController.start()();
}

- (id)obtainNetworkVisibleDevicesProto
{
  return sub_22F62B4BC(self, (uint64_t)a2, (void (*)(void))DiscoveryController.obtainNetworkVisibleDevicesProto());
}

- (id)obtainSFVisibleDevicesProto
{
  return sub_22F62B4BC(self, (uint64_t)a2, (void (*)(void))DiscoveryController.obtainSFVisibleDevicesProto());
}

- (HMDDiscoveryController)init
{
  result = (HMDDiscoveryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___HMDDiscoveryController_logger;
  uint64_t v4 = sub_2302DD940();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end