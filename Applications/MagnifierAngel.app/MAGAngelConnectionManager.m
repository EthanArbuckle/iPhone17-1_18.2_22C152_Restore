@interface MAGAngelConnectionManager
- (_TtC14MagnifierAngel25MAGAngelConnectionManager)init;
- (id)currentState;
- (void)dealloc;
- (void)describeScene;
- (void)dismissUI;
- (void)hideUI;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentDetectionUI;
- (void)simulateEvent:(id)a3;
- (void)stopSpeech;
- (void)toggleDoorDetection;
- (void)toggleFurnitureDetection;
- (void)toggleImageDescriptions;
- (void)togglePeopleDetection;
- (void)togglePointAndSpeak;
- (void)toggleTextDetection;
- (void)toggleUI;
@end

@implementation MAGAngelConnectionManager

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener);
  v5 = self;
  if (v4)
  {
    [v4 invalidate];
    v6 = *(Class *)((char *)&self->super.isa + v3);
    *(Class *)((char *)&self->super.isa + v3) = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MAGAngelConnectionManager();
  [(MAGAngelConnectionManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10002D9F8(v8);

  swift_unknownObjectRelease();
}

- (_TtC14MagnifierAngel25MAGAngelConnectionManager)init
{
  result = (_TtC14MagnifierAngel25MAGAngelConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)presentDetectionUI
{
  v2 = self;
  sub_10002C880(0xD000000000000014, 0x8000000100039D20, 1);
}

- (void)dismissUI
{
  v2 = self;
  sub_10002C880(0x557373696D736964, 0xEB00000000292849, 2);
}

- (void)hideUI
{
  v2 = self;
  sub_10002C880(0x2928495565646968, 0xE800000000000000, 3);
}

- (void)toggleUI
{
  v2 = self;
  sub_10002C880(0x4955656C67676F74, 0xEA00000000002928, 4);
}

- (void)toggleTextDetection
{
  v2 = self;
  sub_10002C880(0xD000000000000015, 0x8000000100039D00, 5);
}

- (void)toggleFurnitureDetection
{
  v2 = self;
  sub_10002C880(0xD00000000000001ALL, 0x8000000100039CE0, 6);
}

- (void)togglePeopleDetection
{
  v2 = self;
  sub_10002C880(0xD000000000000017, 0x8000000100039CC0, 7);
}

- (void)toggleDoorDetection
{
  v2 = self;
  sub_10002C880(0xD000000000000015, 0x8000000100039CA0, 8);
}

- (void)toggleImageDescriptions
{
  v2 = self;
  sub_10002C880(0xD000000000000019, 0x8000000100039C80, 9);
}

- (void)togglePointAndSpeak
{
  v2 = self;
  sub_10002C880(0xD000000000000015, 0x8000000100039C60, 10);
}

- (void)describeScene
{
  v2 = self;
  sub_10002C880(0x6562697263736564, 0xEF2928656E656353, 11);
}

- (id)currentState
{
  sub_10002DE10();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (void)stopSpeech
{
  NSString v2 = self;
  sub_10002C880(0x65657053706F7473, 0xEC00000029286863, 12);
}

- (void)simulateEvent:(id)a3
{
  id v4 = a3;
  id v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  sub_10002CC6C(v5, v7);
  sub_10002D2E8(v5, v7);
}

@end