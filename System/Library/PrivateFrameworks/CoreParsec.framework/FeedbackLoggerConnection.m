@interface FeedbackLoggerConnection
- (_TtC11FlusherUtil24FeedbackLoggerConnection)init;
- (void)dealloc;
- (void)requestSandboxExtensionForBundleID:(NSString *)a3 completion:(id)a4;
- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4;
@end

@implementation FeedbackLoggerConnection

- (void)dealloc
{
  v2 = self;
  sub_100102770();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_100102840((uint64_t)a3, (uint64_t)sub_100103F08, v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)requestSandboxExtensionForBundleID:(NSString *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_1001034B8((uint64_t)&unk_1001C07C8, (uint64_t)v7);
}

- (_TtC11FlusherUtil24FeedbackLoggerConnection)init
{
}

@end