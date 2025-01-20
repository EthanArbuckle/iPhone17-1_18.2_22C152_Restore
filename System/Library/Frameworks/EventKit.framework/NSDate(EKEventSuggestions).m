@interface NSDate(EKEventSuggestions)
- (id)localizedShortTimeInTimeZone:()EKEventSuggestions;
- (id)nextDateMatchingTimeComponents;
@end

@implementation NSDate(EKEventSuggestions)

- (id)nextDateMatchingTimeComponents
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1C9C8] dateWithDatePartFromDate:v2 timePartFromDate:a1 inCalendar:0];
  if ([v3 isBeforeDate:v2])
  {
    v4 = [v2 dateByAddingDays:1 inCalendar:0];
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithDatePartFromDate:v4 timePartFromDate:a1 inCalendar:0];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (id)localizedShortTimeInTimeZone:()EKEventSuggestions
{
  id v4 = a3;
  id v5 = (void *)_dateWithTimeZoneFormatter;
  if (!_dateWithTimeZoneFormatter)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)_dateWithTimeZoneFormatter;
    _dateWithTimeZoneFormatter = v6;

    v8 = (void *)_dateWithTimeZoneFormatter;
    v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v8 setLocale:v9];

    [(id)_dateWithTimeZoneFormatter setTimeStyle:1];
    id v5 = (void *)_dateWithTimeZoneFormatter;
  }
  [v5 setTimeZone:v4];
  v10 = [(id)_dateWithTimeZoneFormatter stringFromDate:a1];

  return v10;
}

@end