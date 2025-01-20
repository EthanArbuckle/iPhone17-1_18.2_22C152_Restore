@interface FBADraftDirectoriesCleanUp
+ (void)cleanDraftDirectoryWithStalenessDate:(id)a3 filerFormType:(int64_t)a4 url:(id)a5;
+ (void)run;
- (_TtC18Feedback_Assistant26FBADraftDirectoriesCleanUp)init;
@end

@implementation FBADraftDirectoriesCleanUp

+ (void)run
{
}

+ (void)cleanDraftDirectoryWithStalenessDate:(id)a3 filerFormType:(int64_t)a4 url:(id)a5
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v14 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10007C2C0((uint64_t)v13, a4, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (_TtC18Feedback_Assistant26FBADraftDirectoriesCleanUp)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADraftDirectoriesCleanUp();
  return [(FBADraftDirectoriesCleanUp *)&v3 init];
}

@end