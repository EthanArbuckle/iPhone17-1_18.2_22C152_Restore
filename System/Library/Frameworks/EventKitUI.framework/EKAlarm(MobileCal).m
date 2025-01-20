@interface EKAlarm(MobileCal)
+ (id)defaultDesignator;
- (id)_localizedDescription:()MobileCal isAllDay:;
- (uint64_t)localizedAllDayDescription;
- (uint64_t)localizedDescription;
- (uint64_t)longLocalizedAllDayDescription;
- (uint64_t)longLocalizedDescription;
@end

@implementation EKAlarm(MobileCal)

+ (id)defaultDesignator
{
  v0 = EventKitUIBundle();
  v1 = [v0 localizedStringForKey:@"Default (%@)" value:&stru_1F0CC2140 table:0];

  return v1;
}

- (id)_localizedDescription:()MobileCal isAllDay:
{
  if ([a1 isAbsolute])
  {
    v7 = [a1 absoluteDate];
    if (a3) {
      CUIKLongStringForDateAndTime();
    }
    else {
    v10 = CUIKStringForDateAndTime();
    }
  }
  else
  {
    v7 = [a1 owner];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 travelTime];
      v8 = [v7 defaultAlarms];
      v9 = [v8 anyObject];
    }
    else
    {
      v9 = 0;
    }
    [a1 relativeOffset];
    double v12 = v11;
    if ([a1 isDefaultAlarm] && v9)
    {
      [v9 relativeOffset];
      double v12 = v13;
    }
    v10 = CalStringForRelativeOffset(a4, v12);
    if ([a1 isDefaultAlarm])
    {
      v14 = NSString;
      v15 = [MEMORY[0x1E4F25488] defaultDesignator];
      uint64_t v16 = [v14 localizedStringWithValidatedFormat:v15, @"%@", 0, v10 validFormatSpecifiers error];

      v10 = (void *)v16;
    }
  }

  return v10;
}

- (uint64_t)longLocalizedDescription
{
  return [a1 _localizedDescription:1 isAllDay:0];
}

- (uint64_t)longLocalizedAllDayDescription
{
  return [a1 _localizedDescription:1 isAllDay:1];
}

- (uint64_t)localizedDescription
{
  return [a1 _localizedDescription:0 isAllDay:0];
}

- (uint64_t)localizedAllDayDescription
{
  return [a1 _localizedDescription:0 isAllDay:1];
}

@end