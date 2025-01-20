@interface ICSDate(SGCalendarAttachmentDissector)
- (id)gmtOffsetTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:;
- (id)systemTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:withCorrectnessFlag:;
- (id)validatedCompleteDateTime;
- (void)copyDateWithNewComponents:()SGCalendarAttachmentDissector;
@end

@implementation ICSDate(SGCalendarAttachmentDissector)

- (id)systemTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:withCorrectnessFlag:
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 validate:0]
    || ([v8 systemTimeZoneForDate:a1], (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (([a1 hasFloatingTimeZone] & 1) == 0) {
      *a5 = 0;
    }
    v11 = (void *)MEMORY[0x1E4F1CAF0];
    v12 = [a1 tzid];
    v10 = [v11 systemTimeZoneFromString:v12];

    if (!v10)
    {
      if (v9)
      {
        v14 = (void *)MEMORY[0x1E4F1CAF0];
        v15 = [v9 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C0]];
        v10 = [v14 systemTimeZoneFromString:v15];

        if (v10) {
          goto LABEL_6;
        }
        v16 = (void *)MEMORY[0x1E4F1CAF0];
        v17 = [v9 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C8]];
        v10 = [v16 systemTimeZoneFromString:v17];
      }
      else
      {
        v10 = 0;
      }
      if (v8 && !v10)
      {
        v18 = (void *)MEMORY[0x1E4F1CAF0];
        v19 = objc_msgSend(v8, "x_wr_timezone");
        v10 = [v18 systemTimeZoneFromString:v19];
      }
      if (!v10)
      {
        v10 = [a1 gmtOffsetTimeZoneWithCalendar:v8 withEvent:v9];
      }
    }
  }
LABEL_6:

  return v10;
}

- (id)gmtOffsetTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v10 = [a1 components];
  v11 = [v9 dateFromComponents:v10];

  v12 = (void *)MEMORY[0x1E4F1CAF0];
  v13 = [a1 tzid];
  v14 = [v12 gmtOffsetTimeZoneFromString:v13 forDate:v11];

  if (v7 && !v14)
  {
    v15 = (void *)MEMORY[0x1E4F1CAF0];
    v16 = [v7 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C0]];
    v14 = [v15 gmtOffsetTimeZoneFromString:v16 forDate:v11];
  }
  if (v7 && !v14)
  {
    v17 = (void *)MEMORY[0x1E4F1CAF0];
    v18 = [v7 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C8]];
    v14 = [v17 gmtOffsetTimeZoneFromString:v18 forDate:v11];
  }
  if (v6 && !v14)
  {
    v19 = (void *)MEMORY[0x1E4F1CAF0];
    v20 = objc_msgSend(v6, "x_wr_timezone");
    v14 = [v19 gmtOffsetTimeZoneFromString:v20 forDate:v11];
  }
  return v14;
}

- (id)validatedCompleteDateTime
{
  v2 = [a1 components];
  if ([v2 year] == 0x7FFFFFFFFFFFFFFFLL
    || [v2 month] == 0x7FFFFFFFFFFFFFFFLL
    || [v2 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    if ([v2 hour] == 0x7FFFFFFFFFFFFFFFLL
      || [v2 minute] == 0x7FFFFFFFFFFFFFFFLL
      || [v2 second] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v2 hour] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = [v2 hour];
      }
      [v2 setHour:v5];
      if ([v2 minute] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = [v2 minute];
      }
      [v2 setMinute:v6];
      if ([v2 second] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = [v2 second];
      }
      [v2 setSecond:v7];
      id v8 = (id)[a1 copyDateWithNewComponents:v2];
    }
    else
    {
      id v8 = a1;
    }
    v3 = v8;
  }

  return v3;
}

- (void)copyDateWithNewComponents:()SGCalendarAttachmentDissector
{
  id v4 = a3;
  uint64_t v5 = [a1 tzid];
  [a1 setTzid:0];
  if ([a1 hasFloatingTimeZone]) {
    [v4 timeZone];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v4, "year"), objc_msgSend(v4, "month"), objc_msgSend(v4, "day"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6);
  [a1 setTzid:v5];
  [v7 setTzid:v5];

  return v7;
}

@end