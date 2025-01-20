@interface EKDuetSignalEventSerializer
+ (id)componentsForDate:(id)a3 inTimeZone:(id)a4;
+ (id)serializedEventWithEvent:(id)a3;
@end

@implementation EKDuetSignalEventSerializer

+ (id)serializedEventWithEvent:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [v3 title];

  if (v5)
  {
    v6 = [v3 title];
    [v4 setObject:v6 forKey:@"title"];
  }
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAllDay"));
  [v4 setObject:v7 forKey:@"isAllDay"];

  v8 = [v3 startDate];

  if (v8)
  {
    v9 = [v3 startDate];
    v10 = [v3 startTimeZone];
    v11 = [a1 componentsForDate:v9 inTimeZone:v10];
    [v4 setObject:v11 forKey:@"startDate"];
  }
  v12 = [v3 endDateUnadjustedForLegacyClients];

  if (v12)
  {
    v13 = [v3 endDateUnadjustedForLegacyClients];
    v14 = [v3 endTimeZone];
    v15 = [a1 componentsForDate:v13 inTimeZone:v14];
    [v4 setObject:v15 forKey:@"endDate"];
  }
  v16 = [v3 location];

  if (v16)
  {
    v17 = [v3 location];
    [v4 setObject:v17 forKey:@"location"];
  }
  v18 = [v3 attendees];

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F1CA48];
    v20 = [v3 attendees];
    v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

    v22 = [v3 attendees];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __56__EKDuetSignalEventSerializer_serializedEventWithEvent___block_invoke;
    v77[3] = &unk_1E5B99148;
    id v78 = v21;
    id v23 = v21;
    [v22 enumerateObjectsUsingBlock:v77];

    [v4 setObject:v23 forKey:@"attendees"];
  }
  v24 = [v3 recurrenceRules];

  v68 = v4;
  id v59 = v3;
  if (v24)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = [v3 recurrenceRules];
    uint64_t v66 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v66)
    {
      uint64_t v25 = 0;
      uint64_t v64 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v74 != v64) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          v28 = objc_msgSend(NSString, "stringWithFormat:", @"rrule_%d_frequency", v25 + i);
          v29 = objc_msgSend(NSString, "stringWithFormat:", @"rrule_%d_interval", v25 + i);
          v30 = objc_msgSend(NSString, "stringWithFormat:", @"rrule_%d_end", v25 + i);
          v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "frequency"));
          [v68 setObject:v31 forKey:v28];

          v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "interval"));
          [v68 setObject:v32 forKey:v29];

          v33 = NSNumber;
          v34 = [v27 recurrenceEnd];
          v35 = [v33 numberWithInt:v34 == 0];
          [v68 setObject:v35 forKey:v30];
        }
        uint64_t v25 = (v25 + i);
        uint64_t v66 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v66);
    }

    v4 = v68;
    id v3 = v59;
  }
  v36 = [v3 alarms];

  if (v36)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v60 = [v3 alarms];
    uint64_t v65 = [v60 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v65)
    {
      uint64_t v67 = 0;
      id obja = *(id *)v70;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(id *)v70 != obja) {
            objc_enumerationMutation(v60);
          }
          v38 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          v39 = objc_msgSend(NSString, "stringWithFormat:", @"alarm_%d_absoluteDate", v67 + j);
          v40 = objc_msgSend(NSString, "stringWithFormat:", @"alarm_%d_relativeOffset", v67 + j);
          v41 = objc_msgSend(NSString, "stringWithFormat:", @"alarm_%d_locationTitle", v67 + j);
          v42 = objc_msgSend(NSString, "stringWithFormat:", @"alarm_%d_proximity", v67 + j);
          v43 = [v38 absoluteDate];

          if (v43) {
            [v38 absoluteDate];
          }
          else {
          v44 = [MEMORY[0x1E4F1C9C8] distantPast];
          }
          v45 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
          v46 = [a1 componentsForDate:v44 inTimeZone:v45];

          v4 = v68;
          [v68 setObject:v46 forKey:v39];
          v47 = NSNumber;
          [v38 relativeOffset];
          v48 = objc_msgSend(v47, "numberWithDouble:");
          [v68 setObject:v48 forKey:v40];

          v49 = [v38 structuredLocation];
          if (v49)
          {
            v50 = [v38 structuredLocation];
            uint64_t v51 = [v50 title];
            v52 = (void *)v51;
            if (v51) {
              v53 = (__CFString *)v51;
            }
            else {
              v53 = &stru_1EF932508;
            }
            [v68 setObject:v53 forKey:v41];

            v4 = v68;
          }
          else
          {
            [v68 setObject:&stru_1EF932508 forKey:v41];
          }

          v54 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "proximity"));
          [v4 setObject:v54 forKey:v42];
        }
        uint64_t v65 = [v60 countByEnumeratingWithState:&v69 objects:v79 count:16];
        uint64_t v67 = (v67 + j);
      }
      while (v65);
    }

    id v3 = v59;
  }
  v55 = [v3 calendar];

  if (v55)
  {
    v56 = [v3 calendar];
    v57 = [v56 calendarIdentifier];
    [v4 setObject:v57 forKey:@"calendar"];
  }

  return v4;
}

void __56__EKDuetSignalEventSerializer_serializedEventWithEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 URL];
  id v5 = [v3 absoluteString];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

+ (id)componentsForDate:(id)a3 inTimeZone:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v9 setTimeZone:v6];

  v10 = [v9 components:3145854 fromDate:v7];

  return v10;
}

@end