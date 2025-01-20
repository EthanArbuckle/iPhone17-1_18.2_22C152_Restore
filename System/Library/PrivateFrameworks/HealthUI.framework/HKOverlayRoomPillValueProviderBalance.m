@interface HKOverlayRoomPillValueProviderBalance
- (HKOverlayRoomPillValueProviderBalance)init;
- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7;
@end

@implementation HKOverlayRoomPillValueProviderBalance

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  sub_1E0DFAB14();
  unint64_t v11 = sub_1E0ECD330();
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = self;
  sub_1E0EAFE14(v11);
  v17 = v16;

  swift_bridgeObjectRelease();
  return v17;
}

- (HKOverlayRoomPillValueProviderBalance)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OverlayRoomPillValueProviderBalance();
  return [(HKOverlayRoomPillValueProviderBalance *)&v3 init];
}

@end