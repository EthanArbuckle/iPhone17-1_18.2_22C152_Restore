@interface BackgroundAssetRelayTask
+ (TaskQueue)taskQueue;
- (BOOL)shouldSkipTransparencySheet;
- (_TtC9appstored24BackgroundAssetRelayTask)init;
- (_TtC9appstored24BackgroundAssetRelayTask)initWithAppInstall:(id)a3 metadata:(id)a4 requestToken:(id)a5;
- (_TtC9appstored24BackgroundAssetRelayTask)initWithoutKeepAlive;
- (void)mainWithCompletionHandler:(id)a3;
- (void)setShouldSkipTransparencySheet:(BOOL)a3;
@end

@implementation BackgroundAssetRelayTask

+ (TaskQueue)taskQueue
{
  if (qword_1005A3088 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1538;
  return (TaskQueue *)v2;
}

- (BOOL)shouldSkipTransparencySheet
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC9appstored24BackgroundAssetRelayTask_shouldSkipTransparencySheet);
}

- (void)setShouldSkipTransparencySheet:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9appstored24BackgroundAssetRelayTask_shouldSkipTransparencySheet) = a3;
}

- (_TtC9appstored24BackgroundAssetRelayTask)initWithAppInstall:(id)a3 metadata:(id)a4 requestToken:(id)a5
{
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = a5;
  v10 = (_TtC9appstored24BackgroundAssetRelayTask *)sub_1000CD2CC(v8, v7, a5);

  return v10;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A60C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

- (_TtC9appstored24BackgroundAssetRelayTask)init
{
  result = (_TtC9appstored24BackgroundAssetRelayTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9appstored24BackgroundAssetRelayTask)initWithoutKeepAlive
{
  result = (_TtC9appstored24BackgroundAssetRelayTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored24BackgroundAssetRelayTask_install));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored24BackgroundAssetRelayTask_logKey));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored24BackgroundAssetRelayTask_requestToken);
}

@end