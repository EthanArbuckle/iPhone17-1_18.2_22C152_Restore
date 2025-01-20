@interface MinimumTimeIntervalRadarRequestFilter
- (BOOL)shouldRequestRadarForDisplayReason:(id)a3;
- (_TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter)init;
- (void)radarRequestedForDisplayReason:(id)a3;
@end

@implementation MinimumTimeIntervalRadarRequestFilter

- (BOOL)shouldRequestRadarForDisplayReason:(id)a3
{
  v3 = self;
  BOOL v4 = sub_1D499E700();

  return v4;
}

- (void)radarRequestedForDisplayReason:(id)a3
{
  uint64_t v4 = sub_1D49B3690();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory);
  v8 = self;
  v7();
  uint64_t v9 = (uint64_t)v8 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v9 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v6, v10, v11);
  swift_endAccess();
}

- (_TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter)init
{
  result = (_TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage);
  swift_release();
}

@end