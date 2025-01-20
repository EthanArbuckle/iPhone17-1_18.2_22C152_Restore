@interface SGEvent(Presentation)
+ (id)formatEvents:()Presentation;
+ (uint64_t)sameDayEvents:()Presentation;
- (id)formattedStartDate;
- (id)formattedStartTime;
- (id)timeZoneOrGMT;
@end

@implementation SGEvent(Presentation)

- (id)formattedStartDate
{
  v2 = +[SGUIDateFormatting mediumDateFormatter];
  v3 = [v2 timeZone];
  v4 = [a1 timeZoneOrGMT];
  [v2 setTimeZone:v4];

  v5 = [a1 start];
  v6 = [v2 stringFromDate:v5];

  [v2 setTimeZone:v3];
  return v6;
}

- (id)formattedStartTime
{
  v2 = +[SGUIDateFormatting singleDayTimeFormatter];
  v3 = [v2 timeZone];
  v4 = [a1 timeZoneOrGMT];
  [v2 setTimeZone:v4];

  v5 = [a1 start];
  v6 = [v2 stringFromDate:v5];

  [v2 setTimeZone:v3];
  return v6;
}

- (id)timeZoneOrGMT
{
  v1 = [a1 startTimeZone];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  }
  v4 = v3;

  return v4;
}

+ (id)formatEvents:()Presentation
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (!v5)
  {
    v7 = 0;
    goto LABEL_19;
  }
  if (v5 == 2)
  {
    if ([a1 sameDayEvents:v4])
    {
      v8 = [v4 objectAtIndexedSubscript:0];
      v9 = [v8 start];
      v10 = [v4 objectAtIndexedSubscript:1];
      v11 = [v10 start];
      int v12 = [v9 isEqual:v11];

      if (v12)
      {
        uint64_t v6 = +[SGUIDateFormatting fullDayFormatter];
        goto LABEL_9;
      }
      v24 = NSString;
      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v14 = [v13 localizedStringForKey:@"SuggestionsBannerTwoEventsSameDayFormat" value:&stru_1F0ED27A8 table:0];
      v15 = [v4 objectAtIndexedSubscript:0];
      v21 = [v15 formattedStartDate];
      v22 = [v4 objectAtIndexedSubscript:0];
      v23 = [v22 formattedStartTime];
      v25 = [v4 objectAtIndexedSubscript:1];
      v26 = [v25 formattedStartTime];
      v7 = objc_msgSend(v24, "localizedStringWithFormat:", v14, v21, v23, v26);
    }
    else
    {
      v20 = NSString;
      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v14 = [v13 localizedStringForKey:@"SuggestionsBannerTwoEventsDifferentDayFormat" value:&stru_1F0ED27A8 table:0];
      v15 = [v4 objectAtIndexedSubscript:0];
      v21 = [v15 formattedStartDate];
      v22 = [v4 objectAtIndexedSubscript:1];
      v23 = [v22 formattedStartDate];
      v7 = objc_msgSend(v20, "localizedStringWithFormat:", v14, v21, v23);
    }

LABEL_17:
    goto LABEL_18;
  }
  if (v5 != 1)
  {
    int v16 = [a1 sameDayEvents:v4];
    v17 = NSString;
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    v13 = v18;
    if (v16) {
      v19 = @"SuggestionsBannerMultiEventsSameDayFormat";
    }
    else {
      v19 = @"SuggestionsBannerMultiEventsDifferentDayFormat";
    }
    v14 = [v18 localizedStringForKey:v19 value:&stru_1F0ED27A8 table:0];
    v15 = [v4 objectAtIndexedSubscript:0];
    v21 = [v15 formattedStartDate];
    v7 = objc_msgSend(v17, "localizedStringWithFormat:", v14, v21);
    goto LABEL_17;
  }
  uint64_t v6 = +[SGUIDateFormatting mediumDateFormatter];
LABEL_9:
  v13 = (void *)v6;
  v14 = [v4 objectAtIndexedSubscript:0];
  v15 = [v14 start];
  v7 = [v13 stringFromDate:v15];
LABEL_18:

LABEL_19:
  return v7;
}

+ (uint64_t)sameDayEvents:()Presentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v5 = [v3 firstObject];
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v7 = [v5 timeZoneOrGMT];
    [v6 setTimeZone:v7];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v21 = v3;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          if (v13 != v5)
          {
            v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) timeZoneOrGMT];
            v15 = [v6 timeZone];
            int v16 = [v15 isEqual:v14];

            if (!v16)
            {

LABEL_16:
              uint64_t v4 = 0;
              goto LABEL_17;
            }
            v17 = [v5 start];
            v18 = [v13 start];
            int v19 = [v6 isDate:v17 inSameDayAsDate:v18];

            if (!v19) {
              goto LABEL_16;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      uint64_t v4 = 1;
LABEL_17:
      id v3 = v21;
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

@end