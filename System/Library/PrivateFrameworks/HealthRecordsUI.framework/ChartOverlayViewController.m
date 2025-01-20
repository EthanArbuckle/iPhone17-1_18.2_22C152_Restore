@interface ChartOverlayViewController
- (BOOL)supportsHealthFactors;
- (BOOL)supportsShowAllFilters;
- (_TtC15HealthRecordsUI26ChartOverlayViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
@end

@implementation ChartOverlayViewController

- (BOOL)supportsHealthFactors
{
  return 0;
}

- (BOOL)supportsShowAllFilters
{
  v2 = self;
  BOOL v3 = sub_1C2419250();

  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C241AB4C();

  v6 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  unint64_t v5 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_displayTypes);
  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v7 = a3;
    v8 = self;
    id result = (id)swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_1C25505F0();
    __break(1u);
    goto LABEL_11;
  }
  id v12 = a3;
  v13 = self;
  swift_bridgeObjectRetain();
  id result = (id)sub_1C2550620();
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v10 = (id)MEMORY[0x1C87588E0](0, v5);
    goto LABEL_6;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return result;
  }
  id v10 = *(id *)(v5 + 32);
LABEL_6:
  v11 = v10;

  swift_bridgeObjectRelease();
  return v11;
}

- (id)createChartOverlayViewController
{
  v2 = self;
  BOOL v3 = (void *)sub_1C2419514();

  return v3;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  sub_1C241AC5C(a3);

  sub_1C21AB51C(0, &qword_1EA2E3388);
  v11 = (void *)sub_1C254F700();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  sub_1C241B3A4(0, (unint64_t *)&qword_1EBB6F550, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v18 - v10;
  if (a4)
  {
    sub_1C254CA80();
    uint64_t v12 = sub_1C254CAD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1C254CAD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a5;
  v15 = self;
  id v16 = sub_1C2419C70(a3, (uint64_t)v11, v14);

  sub_1C241B488((uint64_t)v11, (unint64_t *)&qword_1EBB6F550, MEMORY[0x1E4F27928]);
  return v16;
}

- (_TtC15HealthRecordsUI26ChartOverlayViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  sub_1C241B3A4(0, (unint64_t *)&qword_1EBB6F550, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v16 - v9;
  if (a3)
  {
    sub_1C254CA80();
    uint64_t v11 = sub_1C254CAD0();
    uint64_t v13 = 0;
    uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  }
  else
  {
    uint64_t v11 = sub_1C254CAD0();
    uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = 1;
  }
  (*v12)(v10, v13, 1, v11);
  id v14 = a4;
  id result = (_TtC15HealthRecordsUI26ChartOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_chartDefining);
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_chartabilityResult);
}

@end