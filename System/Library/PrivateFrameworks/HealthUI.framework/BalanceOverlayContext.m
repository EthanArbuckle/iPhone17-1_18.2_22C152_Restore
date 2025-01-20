@interface BalanceOverlayContext
- (_TtC8HealthUI21BalanceOverlayContext)init;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)updateContextItemForDateInterval:(NSDateInterval *)a3 overlayController:(HKInteractiveChartOverlayViewController *)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation BalanceOverlayContext

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUI21BalanceOverlayContext_overlayDisplayType));
}

- (void)updateContextItemForDateInterval:(NSDateInterval *)a3 overlayController:(HKInteractiveChartOverlayViewController *)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  sub_1E0E250A4(0, &qword_1EAD6E4D0, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v13 - 8, v14);
  v16 = (char *)&v25 - v15;
  v17 = _Block_copy(a7);
  v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = v17;
  v18[7] = self;
  uint64_t v19 = sub_1E0ECD3E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EAD6E4E0;
  v20[5] = v18;
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EAD6E4F0;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = self;
  sub_1E0E233CC((uint64_t)v16, (uint64_t)&unk_1EAD6E500, (uint64_t)v21);
  swift_release();
}

- (id)contextItemForLastUpdate
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI21BalanceOverlayContext_currentContextItem);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = *(uint64_t (**)(void, void, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xB8);
    v7 = self;
    v5 = (void *)v6(MEMORY[0x1E4FBC860], 0, 1);
    v3 = 0;
  }
  id v8 = v3;

  return v5;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC8HealthUI21BalanceOverlayContext)init
{
  result = (_TtC8HealthUI21BalanceOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI21BalanceOverlayContext_currentContextItem);
}

@end