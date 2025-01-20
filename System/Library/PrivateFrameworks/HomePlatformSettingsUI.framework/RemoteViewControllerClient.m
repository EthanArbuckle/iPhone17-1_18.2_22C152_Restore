@interface RemoteViewControllerClient
- (_TtC22HomePlatformSettingsUI26RemoteViewControllerClient)init;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4;
@end

@implementation RemoteViewControllerClient

- (_TtC22HomePlatformSettingsUI26RemoteViewControllerClient)init
{
  result = (_TtC22HomePlatformSettingsUI26RemoteViewControllerClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_232E4ACFC((uint64_t)self + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl);
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_232E4A51C();
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_232E4A668((uint64_t)a5);
}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_232E4A700((uint64_t)a5);
}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_232E4AB48();
}

@end