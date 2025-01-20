@interface ClimateSignpostManager
- (_TtC7Climate22ClimateSignpostManager)init;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation ClimateSignpostManager

- (_TtC7Climate22ClimateSignpostManager)init
{
  return (_TtC7Climate22ClimateSignpostManager *)sub_1000951D4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate22ClimateSignpostManager_car);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100096174(v5, (uint64_t)&unk_1000CC968, (uint64_t)sub_1000964F0, (uint64_t)&unk_1000CC980);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100096174(v5, (uint64_t)&unk_1000CC918, (uint64_t)sub_100096494, (uint64_t)&unk_1000CC930);
}

@end