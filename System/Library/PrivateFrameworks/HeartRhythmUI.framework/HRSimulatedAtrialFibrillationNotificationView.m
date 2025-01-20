@interface HRSimulatedAtrialFibrillationNotificationView
- (HRSimulatedAtrialFibrillationNotificationView)init;
@end

@implementation HRSimulatedAtrialFibrillationNotificationView

- (HRSimulatedAtrialFibrillationNotificationView)init
{
  v13.receiver = self;
  v13.super_class = (Class)HRSimulatedAtrialFibrillationNotificationView;
  v2 = [(HRSimulatedAtrialFibrillationNotificationView *)&v13 init];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  v4 = objc_msgSend(MEMORY[0x263F1C6B0], "hrui_heartRateIconImage");
  v5 = HRHeartRhythmUIFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"ATRIAL_FIBRILLATION_QUICK_LOOK_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v7 = HRHeartRhythmUIFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"ATRIAL_FIBRILLATION_QUICK_LOOK_SUBTITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v9 = [v8 localizedUppercaseString];

  v10 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  v11 = (HRSimulatedAtrialFibrillationNotificationView *)[objc_alloc(MEMORY[0x263F46998]) initWithIconImage:v4 titleText:v6 detailText:v9 tintColor:v10];

  return v11;
}

@end