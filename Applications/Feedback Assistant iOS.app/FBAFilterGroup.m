@interface FBAFilterGroup
- (NSArray)filters;
- (NSString)title;
- (_TtC18Feedback_Assistant14FBAFilterGroup)init;
- (_TtC18Feedback_Assistant14FBAFilterGroup)initWithName:(id)a3 filters:(id)a4;
- (unint64_t)compoundType;
- (void)setCompoundType:(unint64_t)a3;
- (void)setFilters:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FBAFilterGroup

- (NSArray)filters
{
  type metadata accessor for FBAFilter();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setFilters:(id)a3
{
  type metadata accessor for FBAFilter();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filters) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (NSString)title
{
  if (*(void *)&self->filterManager[OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (unint64_t)compoundType
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_compoundType);
}

- (void)setCompoundType:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_compoundType) = (Class)a3;
}

- (_TtC18Feedback_Assistant14FBAFilterGroup)initWithName:(id)a3 filters:(id)a4
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  type metadata accessor for FBAFilter();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC18Feedback_Assistant14FBAFilterGroup *)sub_10006810C(v4, v6, v7);
}

- (_TtC18Feedback_Assistant14FBAFilterGroup)init
{
  result = (_TtC18Feedback_Assistant14FBAFilterGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end