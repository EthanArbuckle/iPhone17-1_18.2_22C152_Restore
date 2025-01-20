@interface CalTimeIntervalLocalization
+ (id)_localizedStringWithTimeString:(id)a3 rawDuration:(double)a4 options:(unint64_t)a5;
+ (id)_localizedTimeStringForAllDayEventDuration:(double)a3 includeAlert:(BOOL)a4;
+ (id)_localizedTimeStringForTimedEventDuration:(double)a3 abbreviate:(BOOL)a4;
+ (id)_stringWithDurations:(id)a3 timeUnits:(id)a4;
+ (id)localizedStringForInterval:(double)a3 withOptions:(unint64_t)a4;
+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 abbreviate:(BOOL)a7;
+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 dayDuration:(id *)a7 hourDuration:(id *)a8 minuteDuration:(id *)a9 secondDuration:(id *)a10 abbreviate:(BOOL)a11;
@end

@implementation CalTimeIntervalLocalization

+ (id)localizedStringForInterval:(double)a3 withOptions:(unint64_t)a4
{
  if (fabs(a3) >= 2.22044605e-16 || (a4 & 1) == 0)
  {
    if ((a4 & 0x20) != 0)
    {
      v12 = [a1 _localizedTimeStringForAllDayEventDuration:(a4 >> 3) & 1 includeAlert:a3];
    }
    else
    {
      v8 = [a1 _localizedTimeStringForTimedEventDuration:(a4 >> 1) & 1 abbreviate:a3];
      v12 = [a1 _localizedStringWithTimeString:v8 rawDuration:a4 options:a3];
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
    v10 = NSString;
    v11 = [v9 localizedStringForKey:@"%d minutes" value:&stru_1EE0C39E0 table:0];
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, 0);
  }

  return v12;
}

+ (id)_localizedTimeStringForTimedEventDuration:(double)a3 abbreviate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a1 _calculateDurations:v7 timeUnits:v8 forDuration:0 allDay:v4 abbreviate:a3];
  v9 = [a1 _stringWithDurations:v7 timeUnits:v8];

  return v9;
}

+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 abbreviate:(BOOL)a7
{
  id v13 = 0;
  id v11 = 0;
  id v12 = 0;
  uint64_t v10 = 0;
  LOBYTE(v9) = a7;
  [a1 _calculateDurations:a3 timeUnits:a4 forDuration:a6 allDay:&v13 dayDuration:&v12 hourDuration:&v11 minuteDuration:a5 secondDuration:&v10 abbreviate:v9];
  id v7 = v13;
  id v8 = v12;
}

+ (id)_stringWithDurations:(id)a3 timeUnits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  if ([v5 count] == 1)
  {
    id v8 = [v5 objectAtIndex:0];
    uint64_t v9 = [v8 integerValue];

    uint64_t v10 = NSString;
    id v11 = [v7 localizedStringForKey:@"duration and unit one group" value:@"%ld %@" table:0];
    id v12 = [v6 objectAtIndex:0];
    id v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9, v12);
LABEL_9:

    goto LABEL_10;
  }
  if ([v5 count] == 2)
  {
    v14 = [v5 objectAtIndex:0];
    uint64_t v15 = [v14 integerValue];

    v16 = [v5 objectAtIndex:1];
    uint64_t v17 = [v16 integerValue];

    v18 = NSString;
    id v11 = [v7 localizedStringForKey:@"%ld %@, %ld %@", &stru_1EE0C39E0, 0 value table];
    id v12 = [v6 objectAtIndex:0];
    v19 = [v6 objectAtIndex:1];
    id v13 = objc_msgSend(v18, "localizedStringWithFormat:", v11, v15, v12, v17, v19);

    goto LABEL_9;
  }
  if ([v5 count] == 3)
  {
    v20 = [v5 objectAtIndex:0];
    uint64_t v40 = [v20 integerValue];

    v21 = [v5 objectAtIndex:1];
    uint64_t v22 = [v21 integerValue];

    v23 = [v5 objectAtIndex:2];
    uint64_t v24 = [v23 integerValue];

    v25 = NSString;
    id v11 = [v7 localizedStringForKey:@"%ld %@, %ld %@, %ld %@", &stru_1EE0C39E0, 0 value table];
    id v12 = [v6 objectAtIndex:0];
    v26 = [v6 objectAtIndex:1];
    v27 = [v6 objectAtIndex:2];
    id v13 = objc_msgSend(v25, "localizedStringWithFormat:", v11, v40, v12, v22, v26, v24, v27);

    goto LABEL_9;
  }
  if ([v5 count] == 4)
  {
    v28 = [v5 objectAtIndex:0];
    uint64_t v41 = [v28 integerValue];

    v29 = [v5 objectAtIndex:1];
    uint64_t v39 = [v29 integerValue];

    v30 = [v5 objectAtIndex:2];
    uint64_t v38 = [v30 integerValue];

    v31 = [v5 objectAtIndex:3];
    uint64_t v32 = [v31 integerValue];

    v33 = NSString;
    id v11 = [v7 localizedStringForKey:@"%ld %@, %ld %@, %ld %@, %ld %@", &stru_1EE0C39E0, 0 value table];
    id v12 = [v6 objectAtIndex:0];
    v34 = [v6 objectAtIndex:1];
    v35 = [v6 objectAtIndex:2];
    v36 = [v6 objectAtIndex:3];
    id v13 = objc_msgSend(v33, "localizedStringWithFormat:", v11, v41, v12, v39, v34, v38, v35, v32, v36);

    goto LABEL_9;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

+ (id)_localizedStringWithTimeString:(id)a3 rawDuration:(double)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  uint64_t v9 = v8;
  if ((v5 & 8) != 0)
  {
    id v11 = NSString;
    if ((v5 & 0x10) != 0)
    {
      if (a4 < 0.0) {
        id v12 = @"Alert %@ before travel";
      }
      else {
        id v12 = @"Alert %@ after travel";
      }
    }
    else if (a4 < 0.0)
    {
      id v12 = @"Alert %@ before start";
    }
    else
    {
      id v12 = @"Alert %@ after start";
    }
  }
  else
  {
    if ((v5 & 4) == 0)
    {
      id v10 = v7;
      goto LABEL_15;
    }
    id v11 = NSString;
    if (a4 >= 0.0) {
      id v12 = @"%@ after";
    }
    else {
      id v12 = @"%@ before";
    }
  }
  id v13 = [v8 localizedStringForKey:v12 value:&stru_1EE0C39E0 table:0];
  objc_msgSend(v11, "localizedStringWithFormat:", v13, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:

  return v10;
}

+ (id)_localizedTimeStringForAllDayEventDuration:(double)a3 includeAlert:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v45 = 0;
  id v46 = 0;
  id v43 = 0;
  id v44 = 0;
  LOBYTE(v36) = 0;
  [a1 _calculateDurations:v8 timeUnits:v9 forDuration:1 allDay:&v46 dayDuration:&v45 hourDuration:&v44 minuteDuration:a3 secondDuration:&v43 abbreviate:v36];
  id v42 = v46;
  id v10 = v45;
  id v11 = v44;
  id v12 = v43;
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  v14 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
  uint64_t v39 = (void *)v13;
  uint64_t v15 = [v14 components:28 fromDate:v13];

  uint64_t v41 = v10;
  objc_msgSend(v15, "setHour:", objc_msgSend(v10, "integerValue"));
  uint64_t v40 = v11;
  uint64_t v16 = [v11 integerValue];

  [v15 setMinute:v16];
  uint64_t v17 = [MEMORY[0x1E4F1C9A8] sharedAutoupdatingCurrentCalendar];
  v18 = [v17 dateFromComponents:v15];

  v19 = [v18 timeStringAlwaysIncludeMinutes:0];
  v20 = [v8 objectAtIndex:0];
  uint64_t v21 = [v20 integerValue];

  uint64_t v22 = [v9 objectAtIndex:0];
  if (!v4)
  {
    if (v21 == 7)
    {
      if (a3 < 0.0)
      {
        uint64_t v24 = NSString;
        v27 = @"%d week before";
        v23 = v7;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        v23 = v7;
        uint64_t v24 = NSString;
        if (a3 < 0.0)
        {
          v25 = @"%d day before (%@)";
          goto LABEL_10;
        }
        uint64_t v32 = @"On day of event (%@)";
LABEL_26:
        v26 = [v23 localizedStringForKey:v32 value:&stru_1EE0C39E0 table:0];
        uint64_t v35 = (uint64_t)v19;
        goto LABEL_27;
      }
      if (a3 < 0.0)
      {
        v29 = NSString;
        v30 = @"%ld %@ before (%@)";
LABEL_23:
        v26 = [v7 localizedStringForKey:v30 value:&stru_1EE0C39E0 table:0];
        v31 = v29;
        v23 = v7;
        objc_msgSend(v31, "localizedStringWithFormat:", v26, v21, v22, v19);
        goto LABEL_28;
      }
    }
    v29 = NSString;
    v30 = @"%ld %@ after (%@)";
    goto LABEL_23;
  }
  if (v21 == 7)
  {
    if (a3 >= 0.0)
    {
LABEL_21:
      v29 = NSString;
      v30 = @"Alert %ld %@ after at %@";
      goto LABEL_23;
    }
    v23 = v7;
    uint64_t v24 = NSString;
    v27 = @"Alert %d week before";
LABEL_17:
    v26 = [v7 localizedStringForKey:v27 value:&stru_1EE0C39E0 table:0];
    goto LABEL_18;
  }
  v23 = v7;
  if (v21)
  {
    if (a3 < 0.0)
    {
      v28 = NSString;
      v26 = [v23 localizedStringForKey:@"Alert %ld %@ before at %@" value:&stru_1EE0C39E0 table:0];
      objc_msgSend(v28, "localizedStringWithFormat:", v26, v21, v22, v19);
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  uint64_t v24 = NSString;
  if (a3 >= 0.0)
  {
    uint64_t v32 = @"Alert on day of event at %@";
    goto LABEL_26;
  }
  v25 = @"Alert %d day before at %@";
LABEL_10:
  v26 = [v23 localizedStringForKey:v25 value:&stru_1EE0C39E0 table:0];
  v37 = v19;
LABEL_18:
  uint64_t v35 = 1;
LABEL_27:
  objc_msgSend(v24, "localizedStringWithFormat:", v26, v35, v37, v38);
  v33 = LABEL_28:;

  return v33;
}

+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 dayDuration:(id *)a7 hourDuration:(id *)a8 minuteDuration:(id *)a9 secondDuration:(id *)a10 abbreviate:(BOOL)a11
{
  BOOL v14 = a6;
  v68 = a10;
  id v69 = a3;
  id v17 = a4;
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  double v19 = -a5;
  if (a5 >= 0.0) {
    double v20 = a5;
  }
  else {
    double v20 = -a5;
  }
  if (v20 < 86400.0) {
    goto LABEL_24;
  }
  id v21 = [NSNumber numberWithInt:(int)(a5 / 86400.0)];
  *a7 = v21;
  double v22 = (double)(86400 * [v21 integerValue]);
  id v23 = *a7;
  if (a5 < 0.0 && v14)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "integerValue") - 1);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    *a7 = v23;
  }
  a5 = a5 - v22;
  uint64_t v24 = objc_msgSend(v23, "integerValue", a10);
  if (v24 >= 0) {
    unint64_t v25 = v24;
  }
  else {
    unint64_t v25 = -v24;
  }
  if (v25 < 2)
  {
    if (a11)
    {
      v26 = @"shortened day";
      v27 = @"day";
      goto LABEL_16;
    }
    v26 = @"day";
LABEL_19:
    v28 = v18;
    v27 = v26;
    goto LABEL_20;
  }
  if (!a11)
  {
    v26 = @"days";
    goto LABEL_19;
  }
  v26 = @"shortened days";
  v27 = @"days";
LABEL_16:
  v28 = v18;
LABEL_20:
  v29 = [v28 localizedStringForKey:v26 value:v27 table:0];
  v30 = NSNumber;
  uint64_t v31 = [*a7 integerValue];
  if (v31 >= 0) {
    uint64_t v32 = v31;
  }
  else {
    uint64_t v32 = -v31;
  }
  v33 = [v30 numberWithInteger:v32];
  [v69 addObject:v33];

  [v17 addObject:v29];
  double v19 = -a5;
LABEL_24:
  if (a5 >= 0.0) {
    double v34 = a5;
  }
  else {
    double v34 = v19;
  }
  if (v34 >= 3600.0)
  {
    id v35 = [NSNumber numberWithInteger:(uint64_t)(a5 / 3600.0)];
    *a8 = v35;
    a5 = a5 - (double)(3600 * [v35 integerValue]);
    uint64_t v36 = [*a8 integerValue];
    v37 = @"hours";
    if (v36 >= 0) {
      unint64_t v38 = v36;
    }
    else {
      unint64_t v38 = -v36;
    }
    if (a11) {
      v37 = @"hrs";
    }
    uint64_t v39 = @"hr";
    if (!a11) {
      uint64_t v39 = @"hour";
    }
    if (v38 <= 1) {
      uint64_t v40 = v39;
    }
    else {
      uint64_t v40 = v37;
    }
    uint64_t v41 = objc_msgSend(v18, "localizedStringForKey:value:table:", v40, &stru_1EE0C39E0, 0, v68);
    id v42 = NSNumber;
    uint64_t v43 = [*a8 integerValue];
    if (v43 >= 0) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = -v43;
    }
    id v45 = [v42 numberWithInteger:v44];
    [v69 addObject:v45];

    [v17 addObject:v41];
    double v19 = -a5;
  }
  if (a5 >= 0.0) {
    double v46 = a5;
  }
  else {
    double v46 = v19;
  }
  if (v46 >= 60.0)
  {
    id v47 = [NSNumber numberWithInt:(int)(a5 / 60.0)];
    *a9 = v47;
    a5 = a5 - (double)(60 * [v47 integerValue]);
    if (a11)
    {
      v48 = @"min";
    }
    else
    {
      uint64_t v49 = [*a9 integerValue];
      if (v49 >= 0) {
        unint64_t v50 = v49;
      }
      else {
        unint64_t v50 = -v49;
      }
      if (v50 <= 1) {
        v48 = @"minute";
      }
      else {
        v48 = @"minutes";
      }
    }
    v51 = objc_msgSend(v18, "localizedStringForKey:value:table:", v48, &stru_1EE0C39E0, 0, v68);
    v52 = NSNumber;
    uint64_t v53 = [*a9 integerValue];
    if (v53 >= 0) {
      uint64_t v54 = v53;
    }
    else {
      uint64_t v54 = -v53;
    }
    v55 = [v52 numberWithInteger:v54];
    [v69 addObject:v55];

    [v17 addObject:v51];
    double v19 = -a5;
  }
  if (a5 >= 0.0) {
    double v19 = a5;
  }
  if (v19 > 0.0)
  {
    id v56 = [NSNumber numberWithInt:(int)a5];
    v57 = v68;
    id *v68 = v56;
    uint64_t v58 = [v56 integerValue];
    if (v58 >= 0) {
      unint64_t v59 = v58;
    }
    else {
      unint64_t v59 = -v58;
    }
    if (v59 <= 1) {
      v60 = @"second";
    }
    else {
      v60 = @"seconds";
    }
    v61 = objc_msgSend(v18, "localizedStringForKey:value:table:", v60, &stru_1EE0C39E0, 0, v68);
    v62 = NSNumber;
    uint64_t v63 = [*v57 integerValue];
    if (v63 >= 0) {
      uint64_t v64 = v63;
    }
    else {
      uint64_t v64 = -v63;
    }
    v65 = [v62 numberWithInteger:v64];
    [v69 addObject:v65];

    [v17 addObject:v61];
  }
  if (v14 && !*a7)
  {
    id v66 = [NSNumber numberWithInteger:0];
    *a7 = v66;
    [v69 insertObject:v66 atIndex:0];
    v67 = [v18 localizedStringForKey:@"day" value:@"day" table:0];
    [v17 insertObject:v67 atIndex:0];
  }
}

@end