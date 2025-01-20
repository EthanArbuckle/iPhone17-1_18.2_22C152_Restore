@interface BalanceInteractiveChartViewController
- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12;
- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15;
- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13;
- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
@end

@implementation BalanceInteractiveChartViewController

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6DAF0);
  sub_1E0ECD330();
  v8 = self;
  v9 = (void *)sub_1E0ECD320();
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for BalanceInteractiveChartViewController();
  [(HKInteractiveChartOverlayViewController *)&v12 configureDisplayTypes:v9 timeScope:a4 stackOffset:a5];

  v10 = [(HKInteractiveChartViewController *)v8 primaryGraphViewController];
  v11 = [(HKGraphViewController *)v10 graphView];

  [(HKGraphView *)v11 setScrollingOptions:1];
  swift_bridgeObjectRelease();
}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  uint64_t v10 = sub_1E0ECBB60();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ECBB20();
  v15 = self;
  id v16 = sub_1E0E08F98(a3, a4, (uint64_t)v14, a5);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return v16;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  if (a4 == 6) {
    int64_t v6 = 5;
  }
  else {
    int64_t v6 = a4;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BalanceInteractiveChartViewController();
  id v7 = a3;
  v8 = self;
  id v9 = [(HKInteractiveChartViewController *)&v13 stringForValueRange:v7 timeScope:v6];
  if (v9)
  {
    uint64_t v10 = v9;
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

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v10 = a3;
  id v16 = a4;
  uint64_t v11 = self;
  uint64_t v12 = [(HKInteractiveChartViewController *)v11 annotationDataSource];
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    v14 = (void *)v13;
    if (a5 == 6) {
      a5 = 5;
    }
    v15 = [(HKInteractiveChartViewController *)v11 healthStore];
    objc_msgSend(v14, sel_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController_, v10, v16, a5, a6, v15, v11);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  v39[0] = a9;
  v39[1] = self;
  sub_1E0E0AA40(0, &qword_1EAD6DE80, MEMORY[0x1E4F27CA0]);
  MEMORY[0x1F4188790](v18 - 8, v19);
  v21 = (char *)v39 - v20;
  sub_1E0E0AA40(0, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v22 - 8, v23);
  v25 = (char *)v39 - v24;
  if (a10)
  {
    sub_1E0ECB940();
    uint64_t v26 = sub_1E0ECB980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = sub_1E0ECB980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v25, 1, 1, v27);
  }
  if (a11)
  {
    sub_1E0ECBB20();
    uint64_t v28 = sub_1E0ECBB60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v21, 0, 1, v28);
  }
  else
  {
    uint64_t v29 = sub_1E0ECBB60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v21, 1, 1, v29);
  }
  id v30 = a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  id v34 = a7;
  id v35 = a8;
  id v36 = v39[0];
  v37 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1E0E0A008((uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36, (uint64_t)v25, (uint64_t)v21, a12);

  return v37;
}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  v42 = self;
  id v40 = a8;
  id v41 = a10;
  id v38 = a7;
  id v39 = a9;
  sub_1E0E0AA40(0, &qword_1EAD6DE80, MEMORY[0x1E4F27CA0]);
  MEMORY[0x1F4188790](v16 - 8, v17);
  uint64_t v19 = (char *)&v37 - v18;
  sub_1E0E0AA40(0, (unint64_t *)&qword_1EAD6DB60, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v20 - 8, v21);
  uint64_t v23 = (char *)&v37 - v22;
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6D9E0);
  sub_1E0DF2C04(0, &qword_1EAD6DE90);
  sub_1E0DFD8FC();
  uint64_t v37 = sub_1E0ECCFD0();
  if (a11)
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
  if (a12)
  {
    sub_1E0ECBB20();
    uint64_t v26 = sub_1E0ECBB60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v19, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = sub_1E0ECBB60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v19, 1, 1, v27);
  }
  id v28 = a4;
  id v29 = a5;
  id v30 = a6;
  id v31 = v38;
  id v32 = v40;
  id v33 = v39;
  id v34 = v41;
  id v35 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1E0E0A30C(v37, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v23, (uint64_t)v19, a13);

  return v35;
}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  v54 = self;
  id v56 = a9;
  sub_1E0E0AA40(0, &qword_1EAD6DE80, MEMORY[0x1E4F27CA0]);
  MEMORY[0x1F4188790](v20 - 8, v21);
  uint64_t v23 = (char *)&v51 - v22;
  sub_1E0E09FA0();
  uint64_t v53 = sub_1E0ECD330();
  if (a5)
  {
    sub_1E0DF2C04(0, &qword_1EAD6DE98);
    uint64_t v52 = sub_1E0ECD330();
  }
  else
  {
    uint64_t v52 = 0;
  }
  id v55 = a7;
  if (a12)
  {
    id v24 = a6;
    id v25 = a7;
    id v26 = a8;
    id v27 = v56;
    id v28 = a10;
    id v29 = a11;
    id v30 = a15;
    id v31 = a13;
    id v32 = a4;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v57, 0, sizeof(v57));
    id v33 = a6;
    id v34 = a7;
    id v35 = a8;
    id v36 = v56;
    id v37 = a10;
    id v38 = a11;
    id v39 = a15;
    id v40 = a13;
    id v41 = a4;
  }
  if (a13)
  {
    sub_1E0ECBB20();

    uint64_t v42 = sub_1E0ECBB60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v23, 0, 1, v42);
  }
  else
  {
    uint64_t v43 = sub_1E0ECBB60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v23, 1, 1, v43);
  }
  if (a15)
  {
    sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6D9E0);
    sub_1E0DF2C04(0, &qword_1EAD6DE90);
    sub_1E0DFD8FC();
    uint64_t v44 = sub_1E0ECCFD0();
  }
  else
  {
    uint64_t v44 = 0;
  }
  uint64_t v50 = v44;
  uint64_t v49 = (uint64_t)v23;
  id v45 = v55;
  id v46 = v56;
  v47 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1E0E0A678(v53, (uint64_t)a4, v52, (uint64_t)a6, (uint64_t)v55, (uint64_t)a8, (uint64_t)v56, (uint64_t)a10, (uint64_t)a11, (uint64_t)v57, v49, a14, v50);

  return v47;
}

@end