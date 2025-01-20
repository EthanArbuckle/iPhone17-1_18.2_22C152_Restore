@interface HKMedicalDate(Display)
+ (id)displayStringForDate:()Display form:originalTimeZoneString:;
- (id)displayStringWithPreferredForm:()Display includeTimeZone:;
- (uint64_t)displayString;
- (uint64_t)displayStringWithTimeZone;
@end

@implementation HKMedicalDate(Display)

- (uint64_t)displayString
{
  uint64_t v2 = [a1 form];
  return [a1 displayStringWithPreferredForm:v2 includeTimeZone:0];
}

- (uint64_t)displayStringWithTimeZone
{
  uint64_t v2 = [a1 form];
  return [a1 displayStringWithPreferredForm:v2 includeTimeZone:1];
}

- (id)displayStringWithPreferredForm:()Display includeTimeZone:
{
  if (objc_msgSend(a1, "isCompatibleWithMedicalDateForm:"))
  {
    v7 = [MEMORY[0x1E4F2B188] referenceCalendarWithLocalTimezone];
    v8 = [a1 adjustedDateForCalendar:v7];

    v9 = (void *)MEMORY[0x1E4F2B188];
    if (a4)
    {
      v10 = [a1 originalTimeZoneString];
      v11 = [v9 displayStringForDate:v8 form:a3 originalTimeZoneString:v10];
    }
    else
    {
      v11 = [MEMORY[0x1E4F2B188] displayStringForDate:v8 form:a3 originalTimeZoneString:0];
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)displayStringForDate:()Display form:originalTimeZoneString:
{
  id v7 = a3;
  id v8 = a5;
  switch((unint64_t)a4)
  {
    case 0uLL:
      v9 = HKLocalizedStringForDateAndTemplate(v7, 33);
      v10 = v9;
      if (v8)
      {
        id v11 = [NSString stringWithFormat:@"%@ %@", v9, v8];
      }
      else
      {
        id v11 = v9;
      }
      a4 = v11;

      break;
    case 1uLL:
      v12 = v7;
      uint64_t v13 = 10;
      goto LABEL_7;
    case 2uLL:
      v12 = v7;
      uint64_t v13 = 6;
      goto LABEL_7;
    case 3uLL:
      v12 = v7;
      uint64_t v13 = 1;
LABEL_7:
      a4 = HKLocalizedStringForDateAndTemplate(v12, v13);
      break;
    default:
      break;
  }

  return a4;
}

@end