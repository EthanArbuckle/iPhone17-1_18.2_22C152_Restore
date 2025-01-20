@interface MadBridge
+ (_TtC9appstored9MadBridge)shared;
- (BOOL)isThirdPartyRestore:(id)a3;
- (_TtC9appstored9MadBridge)init;
- (uint64_t)sendDiscoverEvent;
- (void)kickOffRestoreIfNeeded:(id)a3;
- (void)prioritize:(id)a3;
- (void)promoteApplicationWithBundleIdentifier:(id)a3;
- (void)transferAppAssetPromisesForCoordinators:(id)a3 logKey:(id)a4;
@end

@implementation MadBridge

+ (_TtC9appstored9MadBridge)shared
{
  if (qword_1005A30A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1540;
  return (_TtC9appstored9MadBridge *)v2;
}

- (BOOL)isThirdPartyRestore:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1000D7268(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)transferAppAssetPromisesForCoordinators:(id)a3 logKey:(id)a4
{
  sub_100018D68(0, &qword_1005A6358);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_1000D7A04(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)kickOffRestoreIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000D8214(v4);
}

- (void)prioritize:(id)a3
{
}

- (void)promoteApplicationWithBundleIdentifier:(id)a3
{
}

- (_TtC9appstored9MadBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MadBridge();
  return [(MadBridge *)&v3 init];
}

- (uint64_t)sendDiscoverEvent
{
  uint64_t v0 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TaskPriority();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100016714((uint64_t)v2, &qword_1005A4640);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_1005A6348;
  *(void *)(v9 + 24) = v5;
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  swift_task_create();
  return swift_release();
}

@end