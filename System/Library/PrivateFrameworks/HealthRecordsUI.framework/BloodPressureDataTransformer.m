@interface BloodPressureDataTransformer
- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5;
- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6;
- (id)graphSeriesWith:(id)a3;
@end

@implementation BloodPressureDataTransformer

- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  swift_retain();
  id v10 = sub_1C2496B6C(v8, v9, a5);

  swift_release();
  return v10;
}

- (id)graphSeriesWith:(id)a3
{
  id v3 = a3;
  swift_retain();
  id v4 = objc_msgSend(v3, sel_keyColor);
  if (!v4) {
    id v4 = objc_msgSend(self, sel_blackColor);
  }
  type metadata accessor for BloodPressureChartSeries();
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultSeriesWithDiastolicColor_, v4);

  swift_release();
  return v5;
}

- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5
{
  id v5 = a3;
  swift_retain();
  sub_1C2495394();
  v7 = v6;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B28]), sel_init);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B30]), sel_initWithGraphSeries_baseDisplayType_valueFormatter_dataTypeCode_, v5, v7, v8, 80);
  swift_release();

  return v9;
}

@end