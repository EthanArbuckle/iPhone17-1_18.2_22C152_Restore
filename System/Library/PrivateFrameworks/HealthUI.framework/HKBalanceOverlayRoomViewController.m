@interface HKBalanceOverlayRoomViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4;
- (HKBalanceOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4;
- (void)dismiss:(id)a3;
@end

@implementation HKBalanceOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  uint64_t v15 = (uint64_t)a10;
  id v33 = a9;
  unint64_t v34 = a11;
  sub_1E0E85930(0, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  uint64_t v18 = MEMORY[0x1F4188790](v16 - 8, v17);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v21);
  v23 = (char *)&v33 - v22;
  if (a6)
  {
    sub_1E0ECB940();
    uint64_t v24 = sub_1E0ECB980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_1E0ECB980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v23, 1, 1, v25);
  }
  if (a10)
  {
    sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6DAF0);
    uint64_t v15 = sub_1E0ECD330();
  }
  type metadata accessor for BalanceOverlayRoomViewController();
  uint64_t v26 = MEMORY[0x1E4F27928];
  sub_1E0E858B0((uint64_t)v23, (uint64_t)v20, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928]);
  swift_bridgeObjectRetain();
  id v27 = a5;
  id v28 = a4;
  id v29 = a8;
  id v30 = v33;
  id v31 = BalanceOverlayRoomViewController.__allocating_init(displayDate:applicationItems:factorDisplayTypes:mode:)((uint64_t)v20, v27, v15, 1);
  objc_msgSend(v31, sel_setRestorationUserActivity_, v29);
  objc_msgSend(v31, sel_setAdditionalChartOptions_, v34);

  swift_bridgeObjectRelease();
  sub_1E0E85994((uint64_t)v23, (uint64_t)&qword_1EAD6DB60, v26, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0E85930);
  return v31;
}

- (HKBalanceOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  sub_1E0E85930(0, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8, v11);
  v13 = (char *)&v19 - v12;
  if (a3)
  {
    sub_1E0ECB940();
    uint64_t v14 = sub_1E0ECB980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_1E0ECB980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a5)
  {
    sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6DAF0);
    a5 = (id)sub_1E0ECD330();
  }
  id v16 = a4;
  uint64_t v17 = (HKBalanceOverlayRoomViewController *)sub_1E0E8429C((uint64_t)v13, v16, (uint64_t)a5, a6);

  return v17;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType);
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(v4, sel_localization);
  id v8 = objc_msgSend(v7, sel_displayName);

  sub_1E0ECD1D0();
  v9 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType));
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  sub_1E0E8461C(a3, v8);

  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6F530);
  uint64_t v11 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  sub_1E0E85930(0, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v19 - v11;
  if (a4)
  {
    sub_1E0ECB940();
    uint64_t v13 = sub_1E0ECB980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_1E0ECB980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
  }
  id v15 = a5;
  id v16 = self;
  id v17 = sub_1E0E80FF0(a3, (uint64_t)v12, v15);

  sub_1E0E85994((uint64_t)v12, (uint64_t)&qword_1EAD6DB60, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0E85930);
  return v17;
}

- (id)createChartOverlayViewController
{
  v2 = self;
  id v3 = sub_1E0E81548();

  return v3;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = [(HKOverlayRoomViewController *)v7 chartController];
  if (v8
    && (uint64_t v9 = v8,
        id v10 = [(HKInteractiveChartViewController *)v8 stringForValueRange:v6 timeScope:a4], v9, v10))
  {
    sub_1E0ECD1D0();

    uint64_t v11 = (void *)sub_1E0ECD190();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v11 = 0;
  }
  return v11;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return 1;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1E0E84880();

  return v9;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1E0E85078(a4);
}

- (void)dismiss:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1E0E82D6C();

  sub_1E0E85994((uint64_t)v6, (uint64_t)qword_1EB584EC0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0B32FF4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType));
  sub_1E0E85994((uint64_t)self + OBJC_IVAR___HKBalanceOverlayRoomViewController_mostFrequentClassification, (uint64_t)&qword_1EAD6E3F8, MEMORY[0x1E4F65950], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1E0E85930);
}

@end