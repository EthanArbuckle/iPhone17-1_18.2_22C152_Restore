@interface FBADirectoriesMigrator
+ (void)deleteOldDirectoriesWithLibraryDirectory:(id)a3;
+ (void)run;
- (_TtC18Feedback_Assistant22FBADirectoriesMigrator)init;
@end

@implementation FBADirectoriesMigrator

+ (void)run
{
}

+ (void)deleteOldDirectoriesWithLibraryDirectory:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  sub_10009DEC4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC18Feedback_Assistant22FBADirectoriesMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADirectoriesMigrator();
  return [(FBADirectoriesMigrator *)&v3 init];
}

@end