@interface MeasureObject
- (BOOL)isEqual:(id)a3;
- (_TtC17MeasureFoundation13MeasureObject)init;
- (int64_t)state;
- (void)dealloc;
- (void)setState:(int64_t)a3;
@end

@implementation MeasureObject

- (int64_t)state
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
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
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  int64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(void *)(v4 + 16) = a3;
  os_unfair_lock_unlock(v5);

  swift_release();
}

- (_TtC17MeasureFoundation13MeasureObject)init
{
  return (_TtC17MeasureFoundation13MeasureObject *)MeasureObject.init()();
}

- (void)dealloc
{
  uint64_t v2 = self;
  MeasureObject.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___suggest));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___isConfirmable));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___canHandleTouch));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___confirm));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___prepareToclear));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___reconfirm));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___clear));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___percentVisible));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___distanceFromReticle));
  sub_22F1B4AC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___distanceFromCameraPlane));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___importanceWeight);
  sub_22F1B4AC8(v3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_22F224268();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    int64_t v5 = self;
  }
  char v6 = MeasureObject.isEqual(_:)((uint64_t)v8);

  sub_22F1A2FE4((uint64_t)v8);
  return v6 & 1;
}

@end