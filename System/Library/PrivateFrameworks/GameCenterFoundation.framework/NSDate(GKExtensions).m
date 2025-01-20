@interface NSDate(GKExtensions)
+ (id)_gkFormattedTimeIntervalStringWithStartDate:()GKExtensions endDate:calendarUnits:style:;
- (id)_gkFormattedWhenStringWithOptions:()GKExtensions;
- (uint64_t)_gkFormattedDateForStyle:()GKExtensions relative:;
@end

@implementation NSDate(GKExtensions)

+ (id)_gkFormattedTimeIntervalStringWithStartDate:()GKExtensions endDate:calendarUnits:style:
{
  v9 = (objc_class *)MEMORY[0x1E4F28C00];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  [v12 setUnitsStyle:a6];
  v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v14 = [v13 components:a5 fromDate:v11 toDate:v10 options:0];

  [v12 setAllowedUnits:a5];
  v15 = [v12 stringFromDateComponents:v14];

  return v15;
}

- (uint64_t)_gkFormattedDateForStyle:()GKExtensions relative:
{
  if (_gkFormattedDateForStyle_relative__once != -1) {
    dispatch_once(&_gkFormattedDateForStyle_relative__once, &__block_literal_global_87);
  }
  if ([(id)_gkFormattedDateForStyle_relative__sDateFormatter doesRelativeDateFormatting] != a4) {
    [(id)_gkFormattedDateForStyle_relative__sDateFormatter setDoesRelativeDateFormatting:a4];
  }
  [(id)_gkFormattedDateForStyle_relative__sDateFormatter _gkUpdateLocale];
  [(id)_gkFormattedDateForStyle_relative__sDateFormatter setDateStyle:a3];
  v7 = (void *)_gkFormattedDateForStyle_relative__sDateFormatter;

  return [v7 stringFromDate:a1];
}

- (id)_gkFormattedWhenStringWithOptions:()GKExtensions
{
  return GKDateAsWhenString(a1, a3);
}

@end