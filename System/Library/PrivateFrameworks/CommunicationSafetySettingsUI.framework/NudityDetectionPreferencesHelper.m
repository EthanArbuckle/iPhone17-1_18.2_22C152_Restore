@interface NudityDetectionPreferencesHelper
+ (BOOL)nudityDetectionAvailableForBundleID:(id)a3;
+ (BOOL)nudityDetectionFeatureEnabled;
+ (BOOL)nudityDetectionRowEnabled;
+ (id)classForNudityAppDetectionSettings;
+ (id)mainNudityDetectionFooterText;
+ (id)nudityDetectionOnOffLabel;
+ (id)nudityDetectionOnOffLabelForBundleID:(id)a3;
+ (id)nudityDetectionRowIconID;
+ (id)nudityDetectionRowLabel;
+ (void)initializeNudityDetection;
- (NudityDetectionPreferencesHelper)init;
@end

@implementation NudityDetectionPreferencesHelper

+ (void)initializeNudityDetection
{
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
}

+ (id)classForNudityAppDetectionSettings
{
  v2 = (void *)sub_24A5E9610();
  return v2;
}

+ (BOOL)nudityDetectionRowEnabled
{
  return sub_24A5D7520();
}

+ (id)nudityDetectionRowIconID
{
  v2 = (void *)sub_24A5E9610();
  return v2;
}

+ (id)nudityDetectionRowLabel
{
  if (qword_26B178960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v2 = (id)qword_26B178328;
  v3 = (void *)sub_24A5E9610();
  id v4 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, 0);

  sub_24A5E9640();
  v5 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)nudityDetectionOnOffLabel
{
  return sub_24A5D70F0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_24A5D7628);
}

+ (id)mainNudityDetectionFooterText
{
  return sub_24A5D70F0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_24A5D783C);
}

+ (BOOL)nudityDetectionAvailableForBundleID:(id)a3
{
  uint64_t v3 = sub_24A5E9640();
  uint64_t v5 = v4;
  if (qword_26B1784D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_retain();
  char v6 = sub_24A5E4C80(v3, v5);
  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

+ (id)nudityDetectionOnOffLabelForBundleID:(id)a3
{
  uint64_t v3 = sub_24A5E9640();
  sub_24A5D7BE4(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_24A5E9610();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)nudityDetectionFeatureEnabled
{
  uint64_t v5 = &_s5FlagsON;
  unint64_t v6 = sub_24A5D747C();
  char v2 = sub_24A5E91C0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

- (NudityDetectionPreferencesHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)NudityDetectionPreferencesHelper;
  return [(NudityDetectionPreferencesHelper *)&v3 init];
}

@end