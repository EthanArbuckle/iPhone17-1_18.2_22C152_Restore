@interface DefaultDaemonXPCService
- (_TtC19HealthRecordsDaemon23DefaultDaemonXPCService)init;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
@end

@implementation DefaultDaemonXPCService

- (_TtC19HealthRecordsDaemon23DefaultDaemonXPCService)init
{
  result = (_TtC19HealthRecordsDaemon23DefaultDaemonXPCService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  v7 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtC19HealthRecordsDaemon23DefaultDaemonXPCService_serverGenerator);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  v11 = (void *)v7(v9);

  return v11;
}

@end