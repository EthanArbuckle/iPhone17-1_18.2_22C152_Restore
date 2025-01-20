@interface PreinstalledAppUpdateAuthorizationTask
+ (TaskQueue)taskQueue;
+ (void)cleanupAfterUninstalledAppsWithBundleIDs:(id)a3;
- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)init;
- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)initWithBundleID:(id)a3 logKey:(id)a4 processHandle:(id)a5 completion:(id)a6;
- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)initWithoutKeepAlive;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation PreinstalledAppUpdateAuthorizationTask

+ (TaskQueue)taskQueue
{
  if (qword_1005A3000 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B14B0;
  return (TaskQueue *)v2;
}

- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)initWithBundleID:(id)a3 logKey:(id)a4 processHandle:(id)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  id v13 = a4;
  id v14 = a5;
  v15 = (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask *)sub_1000562D8(v9, v11, v13, v14, (uint64_t)sub_100034BAC, v12);

  swift_release();
  return v15;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A4510;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  id v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

+ (void)cleanupAfterUninstalledAppsWithBundleIDs:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000563F8(v3);
  swift_bridgeObjectRelease();
}

- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)init
{
  result = (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask)initWithoutKeepAlive
{
  result = (_TtC9appstored38PreinstalledAppUpdateAuthorizationTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored38PreinstalledAppUpdateAuthorizationTask_logKey));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored38PreinstalledAppUpdateAuthorizationTask_processHandle);
}

@end