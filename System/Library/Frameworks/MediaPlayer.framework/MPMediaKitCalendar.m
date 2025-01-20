@interface MPMediaKitCalendar
@end

@implementation MPMediaKitCalendar

void ___MPMediaKitCalendar_block_invoke()
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = [v0 copy];
  v2 = (void *)_MPMediaKitCalendar_sGMTCalendar;
  _MPMediaKitCalendar_sGMTCalendar = v1;

  v3 = (void *)_MPMediaKitCalendar_sGMTCalendar;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

@end