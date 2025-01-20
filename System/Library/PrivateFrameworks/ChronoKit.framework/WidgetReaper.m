@interface WidgetReaper
- (NSProgress)progress;
- (_TtC9ChronoKit12WidgetReaper)init;
- (void)setProgress:(id)a3;
@end

@implementation WidgetReaper

- (NSProgress)progress
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_progress);
  swift_beginAccess();
  return (NSProgress *)*v2;
}

- (void)setProgress:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_progress);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC9ChronoKit12WidgetReaper)init
{
  result = (_TtC9ChronoKit12WidgetReaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1DA854438((uint64_t)self + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_cutoffDate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_fileManager);
}

@end