@interface DMCEnrollmentAuthenticationCoordinator
- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38DMCEnrollmentAuthenticationCoordinator)init;
- (void)authenticationViewController:(id)a3 didReceivePassword:(id)a4 forUsername:(id)a5;
- (void)authenticationViewController:(id)a3 didReceiveUsername:(id)a4;
- (void)authenticationViewControllerDidCancel:(id)a3;
@end

@implementation DMCEnrollmentAuthenticationCoordinator

- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38DMCEnrollmentAuthenticationCoordinator)init
{
  result = (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38DMCEnrollmentAuthenticationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)authenticationViewController:(id)a3 didReceiveUsername:(id)a4
{
  uint64_t v6 = sub_10009DC80();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_10002694C(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)authenticationViewController:(id)a3 didReceivePassword:(id)a4 forUsername:(id)a5
{
  int v7 = sub_10009DC80();
  uint64_t v9 = v8;
  int v10 = sub_10009DC80();
  int v12 = v11;
  id v13 = a3;
  v14 = self;
  sub_100027178(v13, v7, v9, v10, v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)authenticationViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002746C();
}

@end