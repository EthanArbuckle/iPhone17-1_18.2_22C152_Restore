@interface SharingInteractionController
- (_TtC13DeviceSharing28SharingInteractionController)init;
- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didDisableAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didEnableAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToDisableDeviceForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToEnableDeviceForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4;
@end

@implementation SharingInteractionController

- (_TtC13DeviceSharing28SharingInteractionController)init
{
  return (_TtC13DeviceSharing28SharingInteractionController *)SharingInteractionController.init()();
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  uint64_t v5 = sub_24CCBB520();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBB500();
  id v9 = a3;
  swift_retain();
  sub_24CC6B2BC((uint64_t)v8);

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
}

- (void)manager:(id)a3 didEnableAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailToEnableDeviceForSessionWithID:(id)a4 error:(id)a5
{
}

- (void)manager:(id)a3 didDisableAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailToDisableDeviceForSessionWithID:(id)a4 error:(id)a5
{
}

@end