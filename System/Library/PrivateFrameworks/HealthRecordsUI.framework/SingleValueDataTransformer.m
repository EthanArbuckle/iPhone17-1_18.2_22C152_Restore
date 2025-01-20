@interface SingleValueDataTransformer
- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5;
- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6;
- (id)graphSeriesWith:(id)a3;
@end

@implementation SingleValueDataTransformer

- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  id v11 = sub_1C226A864(v9, v10, a5, a6);

  swift_release();
  return v11;
}

- (id)graphSeriesWith:(id)a3
{
  id v3 = a3;
  swift_retain();
  v4 = (void *)sub_1C226A4B0(v3);

  swift_release();
  return v4;
}

- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5
{
  sub_1C254F470();
  sub_1C254F470();
  id v6 = a3;
  swift_retain();
  id v7 = sub_1C226AB4C(v6);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

@end