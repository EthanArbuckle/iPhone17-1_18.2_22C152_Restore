@interface MPStorePlatformCalendar
@end

@implementation MPStorePlatformCalendar

void ___MPStorePlatformCalendar_block_invoke()
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = [v0 copy];
  v2 = (void *)_MPStorePlatformCalendar_sGMTCalendar;
  _MPStorePlatformCalendar_sGMTCalendar = v1;

  v3 = (void *)_MPStorePlatformCalendar_sGMTCalendar;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

@end