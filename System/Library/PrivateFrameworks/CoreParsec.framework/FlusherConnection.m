@interface FlusherConnection
- (_TtC11FlusherUtil17FlusherConnection)init;
- (void)dealloc;
- (void)flush:(id)a3;
- (void)flushCustomFeedbackType:(id)a3 completion:(id)a4;
- (void)flushSessionEagerly:(id)a3 completion:(id)a4;
- (void)teeCohortsFeedbackWithCompletion:(id)a3;
- (void)teeUploadsWithCompletion:(id)a3;
- (void)updateWhitelists:(unint64_t)a3 completion:(id)a4;
@end

@implementation FlusherConnection

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)updateWhitelists:(unint64_t)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_100002394();

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  sub_100002C74();
}

- (void)flush:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10013C824((uint64_t)sub_10013E9E0, v5);

  swift_release();
}

- (void)flushCustomFeedbackType:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_10013D2F8(v6, v8, (uint64_t)sub_10013E9E0, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)flushSessionEagerly:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_10013D888((uint64_t)v9, (uint64_t)sub_10013E9E0, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)teeUploadsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10013E0FC((uint64_t)sub_10013E9E0, v5, (uint64_t)&unk_1001A8268, (uint64_t)sub_10013E5A8, (uint64_t)&unk_1001A8280);

  swift_release();
}

- (void)teeCohortsFeedbackWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10013E0FC((uint64_t)sub_10013E9E0, v5, (uint64_t)&unk_1001A81F0, (uint64_t)sub_10013E558, (uint64_t)&unk_1001A8208);

  swift_release();
}

- (_TtC11FlusherUtil17FlusherConnection)init
{
}

@end