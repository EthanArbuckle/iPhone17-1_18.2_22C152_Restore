@interface WOCyclingPowerZonesConfigurationEditor
+ (BOOL)isManualZonesEqualToAutomaticUsing:(id)a3;
+ (id)allSupportedSizes;
+ (id)changeConfigurationTypeTo:(int64_t)a3 using:(id)a4;
+ (id)changeFunctionalThresholdPowerTo:(double)a3 using:(id)a4;
+ (id)changeLowerBoundTo:(double)a3 zoneIndex:(int64_t)a4 using:(id)a5;
+ (id)changeUpperBoundTo:(double)a3 zoneIndex:(int64_t)a4 using:(id)a5;
+ (id)changeZonesSizeTo:(int64_t)a3 using:(id)a4;
+ (id)resetManualZonesUsing:(id)a3;
- (WOCyclingPowerZonesConfigurationEditor)init;
@end

@implementation WOCyclingPowerZonesConfigurationEditor

+ (id)changeLowerBoundTo:(double)a3 zoneIndex:(int64_t)a4 using:(id)a5
{
  return sub_1A330(a3, (uint64_t)a1, (uint64_t)a2, a4, (char *)a5, (uint64_t (*)(uint64_t, uint64_t, double))&static CyclingPowerZonesConfigurationEditor.changeLowerBound(to:zoneIndex:using:));
}

+ (id)changeUpperBoundTo:(double)a3 zoneIndex:(int64_t)a4 using:(id)a5
{
  return sub_1A330(a3, (uint64_t)a1, (uint64_t)a2, a4, (char *)a5, (uint64_t (*)(uint64_t, uint64_t, double))&static CyclingPowerZonesConfigurationEditor.changeUpperBound(to:zoneIndex:using:));
}

+ (id)changeFunctionalThresholdPowerTo:(double)a3 using:(id)a4
{
  uint64_t v5 = sub_1FD90();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_20140();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20200();
  sub_20090();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for FunctionalThresholdPowerSource.other(_:), v6);
  id v10 = a4;
  sub_1FD70();
  sub_20070();
  uint64_t v11 = sub_201B0();
  swift_release();
  v12 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v11;
  v16.receiver = v13;
  v16.super_class = v12;
  id v14 = objc_msgSendSuper2(&v16, "init");

  return v14;
}

+ (id)changeConfigurationTypeTo:(int64_t)a3 using:(id)a4
{
  id v5 = a4;
  id v6 = _s25SessionTrackerAppSettings42CyclingPowerZonesConfigurationEditorBridgeC06changeH4Type2to5usingAA0efghJ0CAA0efghlJ0O_AHtFZ_0(a3);

  return v6;
}

+ (id)changeZonesSizeTo:(int64_t)a3 using:(id)a4
{
  uint64_t v5 = sub_1FF90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20200();
  id v9 = a4;
  sub_1FF60();
  uint64_t v10 = sub_201C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v10;
  v15.receiver = v12;
  v15.super_class = v11;
  id v13 = objc_msgSendSuper2(&v15, "init");

  return v13;
}

+ (id)resetManualZonesUsing:(id)a3
{
  sub_20200();
  id v4 = a3;
  uint64_t v5 = sub_201A0();
  uint64_t v6 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, "init");

  return v8;
}

+ (id)allSupportedSizes
{
  _s25SessionTrackerAppSettings42CyclingPowerZonesConfigurationEditorBridgeC17allSupportedSizesSaySiGyFZ_0();
  v2.super.isa = sub_202D0().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (BOOL)isManualZonesEqualToAutomaticUsing:(id)a3
{
  sub_20200();
  id v4 = a3;
  char v5 = sub_201E0();

  return v5 & 1;
}

- (WOCyclingPowerZonesConfigurationEditor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationEditorBridge();
  return [(WOCyclingPowerZonesConfigurationEditor *)&v3 init];
}

@end