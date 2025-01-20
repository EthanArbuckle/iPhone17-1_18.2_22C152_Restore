@interface UpdatesDatabaseMergeResult
- (BOOL)result;
- (BOOL)shouldNotifyOfChanges;
- (NSArray)bundleIDs;
- (_TtC9appstored26UpdatesDatabaseMergeResult)init;
- (_TtC9appstored26UpdatesDatabaseMergeResult)initWithAvailableUpdateCount:(int64_t)a3 shouldNotifyOfChanges:(BOOL)a4 bundleIDs:(id)a5 result:(BOOL)a6;
- (int64_t)availableUpdateCount;
@end

@implementation UpdatesDatabaseMergeResult

- (int64_t)availableUpdateCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_availableUpdateCount);
}

- (BOOL)result
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_result);
}

- (BOOL)shouldNotifyOfChanges
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_shouldNotifyOfChanges);
}

- (NSArray)bundleIDs
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (_TtC9appstored26UpdatesDatabaseMergeResult)initWithAvailableUpdateCount:(int64_t)a3 shouldNotifyOfChanges:(BOOL)a4 bundleIDs:(id)a5 result:(BOOL)a6
{
  v10 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_availableUpdateCount) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_shouldNotifyOfChanges) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_bundleIDs) = v10;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored26UpdatesDatabaseMergeResult_result) = a6;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for UpdatesDatabaseMergeResult();
  return [(UpdatesDatabaseMergeResult *)&v12 init];
}

- (_TtC9appstored26UpdatesDatabaseMergeResult)init
{
  result = (_TtC9appstored26UpdatesDatabaseMergeResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end