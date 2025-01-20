@interface NSDate
@end

@implementation NSDate

void __37__NSDate_GEOCelestial___geo_calendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)_MergedGlobals_180;
  _MergedGlobals_180 = v1;

  v3 = (void *)_MergedGlobals_180;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v3 setTimeZone:v4];
}

@end