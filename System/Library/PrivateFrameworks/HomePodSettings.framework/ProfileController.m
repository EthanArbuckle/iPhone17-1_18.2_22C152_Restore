@interface ProfileController
- (void)profilesChangedForLocalDeviceWithProfiles:(id)a3;
@end

@implementation ProfileController

- (void)profilesChangedForLocalDeviceWithProfiles:(id)a3
{
  uint64_t v3 = sub_23D244E88();
  swift_retain();
  ProfileController.profilesChangedForLocalDevice(profiles:)((Swift::OpaquePointer)v3);
  swift_release();
  swift_bridgeObjectRelease();
}

@end