@interface DaemonConnectionServer
- (_TtC19HealthRecordsDaemon22DaemonConnectionServer)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchEndpointForServiceIdentifier:(id)a3 completion:(id)a4;
@end

@implementation DaemonConnectionServer

- (_TtC19HealthRecordsDaemon22DaemonConnectionServer)init
{
  result = (_TtC19HealthRecordsDaemon22DaemonConnectionServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)remote_fetchEndpointForServiceIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_22D2BCBD0();
  unint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_22D2BA9DC(v6, v8, (char *)v9, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (id)exportedInterface
{
  id v2 = (id)HKHealthRecordsDaemonConnectionServerInterface();
  return v2;
}

- (id)remoteInterface
{
  return 0;
}

@end