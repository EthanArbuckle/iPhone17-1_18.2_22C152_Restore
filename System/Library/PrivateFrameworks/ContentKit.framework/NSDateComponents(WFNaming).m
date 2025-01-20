@interface NSDateComponents(WFNaming)
- (BOOL)wf_dateFormatterTimeStyleForDisplayableCalendarUnits:()WFNaming;
- (id)wfName;
- (uint64_t)wf_dateFormatterDateStyleForDisplayableCalendarUnits:()WFNaming;
- (uint64_t)wf_displayableCalendarUnits;
@end

@implementation NSDateComponents(WFNaming)

- (BOOL)wf_dateFormatterTimeStyleForDisplayableCalendarUnits:()WFNaming
{
  return (a3 & 0xE0) != 0;
}

- (uint64_t)wf_dateFormatterDateStyleForDisplayableCalendarUnits:()WFNaming
{
  return 2 * ((a3 & 0x201C) != 0);
}

- (uint64_t)wf_displayableCalendarUnits
{
  BOOL v2 = [a1 valueForComponent:4] != 0x7FFFFFFFFFFFFFFFLL;
  if ([a1 valueForComponent:8] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = 4 * v2;
  }
  else {
    uint64_t v3 = (4 * v2) | 8;
  }
  if ([a1 valueForComponent:0x2000] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 |= 0x2000uLL;
  }
  if ([a1 valueForComponent:16] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 |= 0x10uLL;
  }
  if ([a1 valueForComponent:32] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 |= 0x20uLL;
  }
  if ([a1 valueForComponent:64] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 |= 0x40uLL;
  }
  if ([a1 valueForComponent:128] == 0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  else {
    return v3 | 0x80;
  }
}

- (id)wfName
{
  uint64_t v2 = objc_msgSend(a1, "wf_displayableCalendarUnits");
  uint64_t v3 = objc_msgSend(a1, "wf_dateFormatterDateStyleForDisplayableCalendarUnits:", v2);
  uint64_t v4 = objc_msgSend(a1, "wf_dateFormatterTimeStyleForDisplayableCalendarUnits:", v2);
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:a1];

  uint64_t v7 = [a1 timeZone];
  if (!v7) {
    goto LABEL_3;
  }
  v8 = (void *)v7;
  v9 = [a1 timeZone];
  v10 = [v9 abbreviation];
  v11 = [MEMORY[0x263EFFA18] localTimeZone];
  v12 = [v11 abbreviation];
  char v13 = [v10 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F08790]);
    [v15 setTimeStyle:v4];
    [v15 setDateStyle:v3];
    v16 = [v15 dateFormat];
    char v17 = [v16 localizedCaseInsensitiveContainsString:@"z"];

    if ((v17 & 1) == 0)
    {
      v18 = [v15 dateFormat];
      v19 = [v18 stringByAppendingString:@" z"];
      [v15 setDateFormat:v19];
    }
    v20 = [a1 timeZone];
    [v15 setTimeZone:v20];

    v14 = [v15 stringFromDate:v6];
  }
  else
  {
LABEL_3:
    v14 = [MEMORY[0x263F08790] localizedStringFromDate:v6 dateStyle:v3 timeStyle:v4];
  }

  return v14;
}

@end