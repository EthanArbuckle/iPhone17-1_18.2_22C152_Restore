@interface CPSTravelEstimatesStringFormatter
- (CPSTravelEstimatesStringFormatter)init;
- (NSCalendar)calendar;
- (NSDateComponentsFormatter)remainingTimeFormatter;
- (NSDateFormatter)arrivalTimeFormatter;
- (double)_minuteRoundedTimeRemainingForTravelEstimates:(id)a3;
- (id)generateTravelEstimatesStringsForTravelEstimates:(id)a3;
- (void)setCalendar:(id)a3;
@end

@implementation CPSTravelEstimatesStringFormatter

- (CPSTravelEstimatesStringFormatter)init
{
  SEL v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CPSTravelEstimatesStringFormatter;
  v12 = [(CPSTravelEstimatesStringFormatter *)&v10 init];
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    id v6 = v9;
    id v7 = (id)[MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    objc_msgSend(v6, "setLocale:");

    objc_msgSend(v9, "setDateStyle:");
    [v9 setTimeStyle:1];
    objc_msgSend(v9, "setAMSymbol:");
    [v9 setPMSymbol:&stru_26DEE39C0];
    objc_storeStrong((id *)&v12->_arrivalTimeFormatter, v9);
    id v8 = objc_alloc_init(MEMORY[0x263F08780]);
    [v8 setUnitsStyle:0];
    objc_storeStrong((id *)&v12->_remainingTimeFormatter, v8);
    v2 = (NSCalendar *)(id)[MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v12->_calendar;
    v12->_calendar = v2;

    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  v5 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v5;
}

- (double)_minuteRoundedTimeRemainingForTravelEstimates:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] timeRemaining];
  double v6 = v3;
  [location[0] timeRemaining];
  double v7 = v6 - fmod(v4, 60.0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)generateTravelEstimatesStringsForTravelEstimates:(id)a3
{
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = objc_alloc_init(CPSTravelEstimatesStrings);
  id v24 = CPSLocalizedStringForKey(@"ARRIVAL");
  -[CPSTravelEstimatesStrings setLocalizedArrivalString:](v43, "setLocalizedArrivalString:");

  id v42 = (id)[location[0] distanceRemaining];
  if (v42 && ([v42 doubleValue], v3 >= 0.0))
  {
    id v21 = v42;
    uint64_t v32 = MEMORY[0x263EF8330];
    int v33 = -1073741824;
    int v34 = 0;
    v35 = __86__CPSTravelEstimatesStringFormatter_generateTravelEstimatesStringsForTravelEstimates___block_invoke;
    v36 = &unk_2648A5458;
    v37 = v43;
    CPSFormattedDistanceSepartedShortUnit(v21, &v32);
    objc_storeStrong((id *)&v37, 0);
  }
  else
  {
    [(CPSTravelEstimatesStrings *)v43 setDistanceRemainingString:0x26DEE3DE0];
    id v23 = (id)[MEMORY[0x263EFF960] currentLocale];
    char v40 = 0;
    char v38 = 0;
    if ([v23 usesMetricSystem])
    {
      id v41 = CPSLocalizedStringForKey(@"KMS");
      char v40 = 1;
      id v22 = v41;
    }
    else
    {
      id v39 = CPSLocalizedStringForKey(@"MI");
      char v38 = 1;
      id v22 = v39;
    }
    [(CPSTravelEstimatesStrings *)v43 setLocalizedDistanceRemainingUnit:v22];
    if (v38) {

    }
    if (v40) {
  }
    }
  [location[0] timeRemaining];
  if (v4 >= 0.0)
  {
    [(CPSTravelEstimatesStringFormatter *)v45 _minuteRoundedTimeRemainingForTravelEstimates:location[0]];
    double v31 = v5;
    id v30 = (id)[MEMORY[0x263EFF910] date];
    id v29 = (id)[v30 dateByAddingTimeInterval:v31];
    v18 = [(CPSTravelEstimatesStringFormatter *)v45 arrivalTimeFormatter];
    id v28 = [(NSDateFormatter *)v18 stringFromDate:v29];

    [(CPSTravelEstimatesStrings *)v43 setArrivalTimeString:v28];
    v19 = [(CPSTravelEstimatesStringFormatter *)v45 calendar];
    id v27 = [(NSCalendar *)v19 components:96 fromDate:v30 toDate:v29 options:0];

    if (v27)
    {
      v17 = [(CPSTravelEstimatesStringFormatter *)v45 remainingTimeFormatter];
      [(NSDateComponentsFormatter *)v17 setAllowedUnits:96];

      if ([v27 hour] >= 10)
      {
        [v27 setMinute:0];
        v16 = [(CPSTravelEstimatesStringFormatter *)v45 remainingTimeFormatter];
        [(NSDateComponentsFormatter *)v16 setAllowedUnits:32];
      }
      v15 = [(CPSTravelEstimatesStringFormatter *)v45 remainingTimeFormatter];
      v26 = [(NSDateComponentsFormatter *)v15 stringFromDateComponents:v27];

      id v25 = 0;
      if ([v27 hour] <= 1)
      {
        if ([v27 hour] == 1)
        {
          id v8 = CPSLocalizedStringForKey(@"HR");
          id v9 = v25;
          id v25 = v8;
        }
        else
        {
          if ([v27 minute] <= 1) {
            id v10 = CPSLocalizedStringForKey(@"MIN");
          }
          else {
            id v10 = CPSLocalizedStringForKey(@"MINS");
          }
          id v11 = v25;
          id v25 = v10;
        }
      }
      else
      {
        id v6 = CPSLocalizedStringForKey(@"HRS");
        id v7 = v25;
        id v25 = v6;
      }
      [(CPSTravelEstimatesStrings *)v43 setTimeRemainingString:v26];
      [(CPSTravelEstimatesStrings *)v43 setLocalizedTimeRemainingUnit:v25];
      objc_storeStrong(&v25, 0);
      objc_storeStrong((id *)&v26, 0);
    }
    else
    {
      [(CPSTravelEstimatesStrings *)v43 setArrivalTimeString:0x26DEE3DE0];
      [(CPSTravelEstimatesStrings *)v43 setTimeRemainingString:0x26DEE3DE0];
      id v14 = CPSLocalizedStringForKey(@"MINS");
      -[CPSTravelEstimatesStrings setLocalizedTimeRemainingUnit:](v43, "setLocalizedTimeRemainingUnit:");
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    [(CPSTravelEstimatesStrings *)v43 setArrivalTimeString:0x26DEE3DE0];
    [(CPSTravelEstimatesStrings *)v43 setTimeRemainingString:0x26DEE3DE0];
    id v20 = CPSLocalizedStringForKey(@"MINS");
    -[CPSTravelEstimatesStrings setLocalizedTimeRemainingUnit:](v43, "setLocalizedTimeRemainingUnit:");
  }
  v13 = v43;
  objc_storeStrong(&v42, 0);
  objc_storeStrong((id *)&v43, 0);
  objc_storeStrong(location, 0);

  return v13;
}

void __86__CPSTravelEstimatesStringFormatter_generateTravelEstimatesStringsForTravelEstimates___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  [a1[4] setDistanceRemainingString:location[0]];
  [a1[4] setLocalizedDistanceRemainingUnit:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (NSDateFormatter)arrivalTimeFormatter
{
  return self->_arrivalTimeFormatter;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSDateComponentsFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (void).cxx_destruct
{
}

@end