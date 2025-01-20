@interface FBAFilterManager
+ (id)keyPathsForValuesAffectingUserDescription;
- (BOOL)active;
- (BOOL)toggleActive;
- (NSArray)activeFilters;
- (NSArray)filterGroups;
- (NSArray)filters;
- (NSPredicate)predicate;
- (NSString)userDescription;
- (_TtC18Feedback_Assistant16FBAFilterManager)init;
- (_TtC18Feedback_Assistant16FBAFilterManager)initWithFilterGroups:(id)a3;
- (_TtP18Feedback_Assistant24FBAFilterManagerDelegate_)filterDelegate;
- (id)filterForIndexPath:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)setActive:(BOOL)a3;
- (void)setFilterDelegate:(id)a3;
- (void)setFilterGroups:(id)a3;
- (void)toggleFilterAtIndex:(int64_t)a3;
- (void)toggleFilterAtIndexPath:(id)a3;
@end

@implementation FBAFilterManager

- (NSArray)filterGroups
{
  type metadata accessor for FBAFilterGroup();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setFilterGroups:(id)a3
{
  type metadata accessor for FBAFilterGroup();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (_TtP18Feedback_Assistant24FBAFilterManagerDelegate_)filterDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18Feedback_Assistant24FBAFilterManagerDelegate_ *)Strong;
}

- (void)setFilterDelegate:(id)a3
{
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_active);
}

- (void)setActive:(BOOL)a3
{
  v4 = self;
  sub_10007F6E0(a3);
}

- (NSArray)filters
{
  return (NSArray *)sub_10007F904(self, (uint64_t)a2, (void (*)(void))sub_10007F7AC);
}

- (NSArray)activeFilters
{
  return (NSArray *)sub_10007F904(self, (uint64_t)a2, (void (*)(void))sub_10007F970);
}

- (NSPredicate)predicate
{
  NSArray v2 = self;
  id v3 = sub_10007FBD4();

  return (NSPredicate *)v3;
}

+ (id)keyPathsForValuesAffectingUserDescription
{
  sub_10004DE60(&qword_100122890);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000D86F0;
  strcpy((char *)(inited + 32), "activeFilters");
  *(_WORD *)(inited + 46) = -4864;
  sub_10008BCA8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (NSString)userDescription
{
  NSArray v2 = self;
  sub_10008028C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC18Feedback_Assistant16FBAFilterManager)initWithFilterGroups:(id)a3
{
  type metadata accessor for FBAFilterGroup();
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC18Feedback_Assistant16FBAFilterManager *)sub_10008080C(v3);
}

- (id)filterForIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000809A0();
  v10 = v9;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10;
}

- (void)toggleFilterAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100080BAC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)toggleFilterAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100080E7C(a3);
}

- (BOOL)toggleActive
{
  NSArray v2 = self;
  char v3 = sub_1000810F4();

  return v3 & 1;
}

- (void)activate
{
  NSArray v2 = self;
  sub_10008121C();
}

- (void)deactivate
{
  NSArray v2 = self;
  sub_100081304();
}

- (_TtC18Feedback_Assistant16FBAFilterManager)init
{
  result = (_TtC18Feedback_Assistant16FBAFilterManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  char v3 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterDelegate;

  sub_100056D7C((uint64_t)v3);
}

@end