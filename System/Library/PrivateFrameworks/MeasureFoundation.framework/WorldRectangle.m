@interface WorldRectangle
- (_TtC17MeasureFoundation14WorldRectangle)init;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation WorldRectangle

- (int64_t)state
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  v4 = self;
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
  v4 = self;
  WorldRectangle.state.setter(a3);
}

- (_TtC17MeasureFoundation14WorldRectangle)init
{
  result = (_TtC17MeasureFoundation14WorldRectangle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22F1899D0((uint64_t)self + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data, (uint64_t)v3, qword_268694570);
  sub_22F21A848((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction));
}

@end