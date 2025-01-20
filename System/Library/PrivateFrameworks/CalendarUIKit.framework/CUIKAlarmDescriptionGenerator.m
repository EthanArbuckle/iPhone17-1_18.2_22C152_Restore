@interface CUIKAlarmDescriptionGenerator
+ (id)descriptionForAbsoluteDate:(id)a3 longVersion:(BOOL)a4;
+ (id)descriptionForRelativeOffset:(double)a3 isAllDay:(BOOL)a4 isRelativeToTravelStart:(BOOL)a5 isDefault:(BOOL)a6;
@end

@implementation CUIKAlarmDescriptionGenerator

+ (id)descriptionForAbsoluteDate:(id)a3 longVersion:(BOOL)a4
{
  if (a4) {
    CUIKLongStringForDateAndTime(a3);
  }
  else {
  v4 = CUIKStringForDateAndTime(a3);
  }

  return v4;
}

+ (id)descriptionForRelativeOffset:(double)a3 isAllDay:(BOOL)a4 isRelativeToTravelStart:(BOOL)a5 isDefault:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (a4)
  {
    v9 = (const void *)CalTimeZoneCopyCFTimeZone();
    uint64_t GregorianDate = CalDateTimeGetGregorianDate();
    v11 = (void *)MEMORY[0x1E4F1C9C8];
    MEMORY[0x1C1889F10](GregorianDate);
    v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    CFRelease(v9);
    BOOL v13 = a3 > 0.0;
    if (a3 >= 86400.0) {
      BOOL v13 = 0;
    }
    if (a3 == 0.0 || v13)
    {
      v27 = CUIKBundle();
      v15 = [v27 localizedStringForKey:@"On day of event (%@)" value:&stru_1F187C430 table:0];

      v28 = NSString;
      v16 = CUIKStringForGMTTime(v12, 0);
      v21 = objc_msgSend(v28, "localizedStringWithFormat:", v15, v16);
    }
    else if (a3 == -572400.0)
    {
      v14 = NSString;
      v15 = CUIKBundle();
      v16 = [v15 localizedStringForKey:@"%@ before" value:&stru_1F187C430 table:0];
      v17 = NSString;
      v18 = CUIKBundle();
      v19 = [v18 localizedStringForKey:@"interval_weeks" value:&stru_1F187C430 table:0];
      v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, 1);
      v21 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v20);
    }
    else
    {
      v29 = CUIKBundle();
      v30 = v29;
      if (a3 >= 0.0 || a3 < -21600.0)
      {
        if (a3 >= 0.0)
        {
          v15 = [v29 localizedStringForKey:@"%@ after" value:&stru_1F187C430 table:0];

          double v35 = floor(a3 / 86400.0);
        }
        else
        {
          v15 = [v29 localizedStringForKey:@"%@ before" value:&stru_1F187C430 table:0];

          double v35 = ceil(fabs(a3) / 86400.0);
        }
        uint64_t v36 = (uint64_t)v35;
        v37 = NSString;
        v38 = CUIKBundle();
        v39 = [v38 localizedStringForKey:@"interval_days_long" value:&stru_1F187C430 table:0];
        v16 = objc_msgSend(v37, "localizedStringWithFormat:", v39, v36);

        v33 = [NSString localizedStringWithValidatedFormat:v15, @"%@", 0, v16 validFormatSpecifiers error];
        v40 = NSString;
        v34 = CUIKBundle();
        v41 = [v34 localizedStringForKey:@"All-day alarm format" value:@"%@ (%@)" table:0];
        v42 = CUIKStringForGMTTime(v12, 0);
        v21 = objc_msgSend(v40, "localizedStringWithFormat:", v41, v33, v42);
      }
      else
      {
        v31 = [v29 localizedStringForKey:@"At time of event" value:&stru_1F187C430 table:0];
        v15 = CUIKDurationStringForTimeInterval(1, v31, 0, v7, 1, a3);

        v16 = CUIKStringForGMTTime(v12, 0);
        v32 = NSString;
        v33 = CUIKBundle();
        v34 = [v33 localizedStringForKey:@"All-day alarm format" value:@"%@ (%@)" table:0];
        v21 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v15, v16);
      }
    }
  }
  else if (a3 == -604800.0)
  {
    v22 = NSString;
    v12 = CUIKBundle();
    v15 = [v12 localizedStringForKey:@"%@ before" value:&stru_1F187C430 table:0];
    v23 = NSString;
    v24 = CUIKBundle();
    v25 = [v24 localizedStringForKey:@"interval_weeks" value:&stru_1F187C430 table:0];
    v26 = objc_msgSend(v23, "localizedStringWithFormat:", v25, 1);
    v21 = objc_msgSend(v22, "localizedStringWithFormat:", v15, v26);
  }
  else
  {
    v12 = CUIKBundle();
    v15 = [v12 localizedStringForKey:@"At time of event" value:&stru_1F187C430 table:0];
    v21 = CUIKDurationStringForTimeInterval(1, v15, 0, v7, 1, a3);
  }

  if (v6)
  {
    v43 = NSString;
    v44 = CUIKBundle();
    v45 = [v44 localizedStringForKey:@"Default (%@)" value:&stru_1F187C430 table:0];
    uint64_t v46 = [v43 localizedStringWithValidatedFormat:v45, @"%@", 0, v21 validFormatSpecifiers error];

    v21 = (void *)v46;
  }

  return v21;
}

@end