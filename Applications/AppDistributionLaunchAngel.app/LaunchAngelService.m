@interface LaunchAngelService
- (_TtC26AppDistributionLaunchAngel18LaunchAngelService)init;
- (void)handleXPCRequest:(id)a3 reply:(id)a4;
@end

@implementation LaunchAngelService

- (void)handleXPCRequest:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_100031474(v8, v10, (uint64_t)sub_100030B34, v11);
  swift_release();
  sub_10000D70C(v8, v10);
}

- (_TtC26AppDistributionLaunchAngel18LaunchAngelService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LaunchAngelService();
  return [(LaunchAngelService *)&v3 init];
}

@end