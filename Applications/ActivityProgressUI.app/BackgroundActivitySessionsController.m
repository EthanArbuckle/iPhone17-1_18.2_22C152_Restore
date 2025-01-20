@interface BackgroundActivitySessionsController
- (_TtC18ActivityProgressUI36BackgroundActivitySessionsController)init;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 activityName:(id)a5 activityDescription:(id)a6 progress:(id)a7;
- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8;
- (void)updateActivityName:(id)a3 activityDescription:(id)a4 forIdentifier:(id)a5;
- (void)updateActivityName:(id)a3 activityDescription:(id)a4 withHaptic:(id)a5 forIdentifier:(id)a6;
- (void)updateProgress:(id)a3 forIdentifier:(id)a4;
@end

@implementation BackgroundActivitySessionsController

- (_TtC18ActivityProgressUI36BackgroundActivitySessionsController)init
{
  return (_TtC18ActivityProgressUI36BackgroundActivitySessionsController *)sub_10001B0E8();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener);
  if (v2)
  {
    ObjectType = (objc_class *)swift_getObjectType();
    v5 = self;
    [v2 invalidate];
    v6.receiver = v5;
    v6.super_class = ObjectType;
    [(BackgroundActivitySessionsController *)&v6 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection));
  swift_unknownObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__backgroundActivitySessionsByTaskID;
  uint64_t v4 = sub_10000847C(&qword_100057EF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__jindoSessionsByBundleID;
  uint64_t v6 = sub_10000847C(&qword_100057EF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_appIconProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator));
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue);
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 activityName:(id)a5 activityDescription:(id)a6 progress:(id)a7
{
  v22 = self;
  uint64_t v23 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  id v20 = a7;
  v21 = v22;
  sub_10001DB34((uint64_t)v10, v11, v13, 0, 0, v14, v16, v17, v19, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v23);
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8
{
  v26 = self;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v28 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a5)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;
  id v23 = a8;
  v24 = v26;
  sub_10001DB34((uint64_t)v12, v25, v14, v15, (uint64_t)a5, v17, v19, v20, v22, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
}

- (void)updateProgress:(id)a3 forIdentifier:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_10001EEBC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateActivityName:(id)a3 activityDescription:(id)a4 forIdentifier:(id)a5
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000C2E8(0, &qword_100057B48);
  uint64_t v16 = self;
  Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  sub_10001F8B0(v10, v12, v13, v15, isa, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateActivityName:(id)a3 activityDescription:(id)a4 withHaptic:(id)a5 forIdentifier:(id)a6
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v18 = a5;
  uint64_t v19 = self;
  sub_10001F8B0(v12, v14, v15, v17, v18, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_1000275C8(v8);

  swift_unknownObjectRelease();
}

@end