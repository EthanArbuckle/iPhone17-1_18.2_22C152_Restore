@interface CSLPRFAppSwitcherDefaultApplications
+ (id)defaultApplicationList;
@end

@implementation CSLPRFAppSwitcherDefaultApplications

+ (id)defaultApplicationList
{
  v5[8] = *MEMORY[0x263EF8340];
  if (_CSLDeviceIsVictory_onceToken != -1) {
    dispatch_once(&_CSLDeviceIsVictory_onceToken, &__block_literal_global_838);
  }
  if (!_CSLDeviceIsVictory_isVictory) {
    goto LABEL_5;
  }
  v5[0] = @"com.nike.nikeplus-gps.watchkitapp";
  v5[1] = @"com.apple.ActivityMonitorApp";
  v5[2] = @"com.apple.HeartRate";
  v5[3] = @"com.apple.SessionTrackerApp";
  v5[4] = @"com.apple.NanoMusic";
  v5[5] = @"com.apple.MobileSMS";
  v5[6] = @"com.apple.private.NanoTimer";
  v5[7] = @"com.apple.NanoCalendar";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:8];
  if (!v2)
  {
LABEL_5:
    v4[0] = @"com.apple.ActivityMonitorApp";
    v4[1] = @"com.apple.HeartRate";
    v4[2] = @"com.apple.SessionTrackerApp";
    v4[3] = @"com.apple.NanoMusic";
    v4[4] = @"com.apple.MobileSMS";
    v4[5] = @"com.apple.private.NanoTimer";
    v4[6] = @"com.apple.NanoCalendar";
    v4[7] = @"com.apple.NanoMaps";
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  }
  return v2;
}

@end