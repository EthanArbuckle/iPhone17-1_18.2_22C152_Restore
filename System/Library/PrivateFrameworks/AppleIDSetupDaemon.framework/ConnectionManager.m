@interface ConnectionManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC18AppleIDSetupDaemon17ConnectionManager)init;
- (void)dealloc;
@end

@implementation ConnectionManager

- (void)dealloc
{
  v2 = self;
  sub_24828CAB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener));
}

- (_TtC18AppleIDSetupDaemon17ConnectionManager)init
{
  result = (_TtC18AppleIDSetupDaemon17ConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_24828DA58(v7);

  return v9 & 1;
}

@end