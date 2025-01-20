@interface NSCalendar(HKAdditions)
- (id)hk_disambiguatedDSTDatesForComponents:()HKAdditions;
- (id)hk_startOfTomorrowForDate:()HKAdditions;
- (id)hk_yesterdayAtNoonForDate:()HKAdditions;
@end

@implementation NSCalendar(HKAdditions)

- (id)hk_startOfTomorrowForDate:()HKAdditions
{
  v4 = [a1 dateByAddingUnit:16 value:1 toDate:a3 options:0];
  v5 = [a1 startOfDayForDate:v4];

  return v5;
}

- (id)hk_yesterdayAtNoonForDate:()HKAdditions
{
  v4 = [a1 dateByAddingUnit:16 value:-1 toDate:a3 options:0];
  v5 = [a1 startOfDayForDate:v4];

  v6 = [a1 dateBySettingUnit:32 value:12 ofDate:v5 options:0];

  return v6;
}

- (id)hk_disambiguatedDSTDatesForComponents:()HKAdditions
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
  objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
  [v6 setHour:12];
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v7 timeZone];
  [v6 setTimeZone:v8];

  v9 = [a1 dateFromComponents:v6];
  v10 = objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"), objc_msgSend(v5, "second"), v9, 4096);
  uint64_t v11 = [v5 hour];
  uint64_t v12 = [v5 minute];
  uint64_t v13 = [v5 second];

  uint64_t v14 = [a1 dateBySettingHour:v11 minute:v12 second:v13 ofDate:v9 options:0x2000];
  v15 = (void *)v14;
  if (!v10)
  {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  if (v14)
  {
    if (![v10 isEqualToDate:v14])
    {
      v21[0] = v10;
      v21[1] = v15;
      v16 = (void *)MEMORY[0x1E4F1C978];
      v17 = (void **)v21;
      uint64_t v19 = 2;
      goto LABEL_9;
    }
    v22 = v10;
    v16 = (void *)MEMORY[0x1E4F1C978];
    v17 = &v22;
  }
  else
  {
    v23[0] = v10;
    v16 = (void *)MEMORY[0x1E4F1C978];
    v17 = (void **)v23;
  }
  uint64_t v19 = 1;
LABEL_9:
  v18 = [v16 arrayWithObjects:v17 count:v19];
LABEL_10:

  return v18;
}

@end