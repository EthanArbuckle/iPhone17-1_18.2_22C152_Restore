@interface WorldPoint
- (NSArray)lines;
- (_TtC17MeasureFoundation10WorldPoint)init;
- (int64_t)state;
- (int64_t)type;
- (void)setLines:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation WorldPoint

- (NSArray)lines
{
  swift_beginAccess();
  type metadata accessor for WorldLine();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22F223CA8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLines:(id)a3
{
  type metadata accessor for WorldLine();
  uint64_t v4 = sub_22F223CB8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  uint64_t v4 = *v3;
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  int64_t v7 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);

  swift_release();
  return v7;
}

- (void)setType:(int64_t)a3
{
  uint64_t v4 = self;
  WorldPoint.type.setter(a3);
}

- (int64_t)state
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  uint64_t v4 = self;
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  int64_t v5 = *(void *)(v2 + 16);
  os_unfair_lock_unlock(v3);

  swift_release();
  return v5;
}

- (void)setState:(int64_t)a3
{
  uint64_t v4 = self;
  WorldPoint.state.setter(a3);
}

- (_TtC17MeasureFoundation10WorldPoint)init
{
  result = (_TtC17MeasureFoundation10WorldPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end