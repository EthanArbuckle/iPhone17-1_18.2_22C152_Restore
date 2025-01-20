@interface CalDAVOfficeHour
+ (BOOL)supportsSecureCoding;
+ (id)_gregorianGMTCalendar;
+ (id)dataFromOfficeHours:(id)a3;
+ (id)icsFromOfficeHours:(id)a3;
+ (id)logHandle;
+ (id)officeHoursFromData:(id)a3;
+ (id)officeHoursFromICS:(id)a3;
- (BOOL)enabled;
- (CalDAVOfficeHour)initWithCoder:(id)a3;
- (NSDateComponents)endDate;
- (NSDateComponents)startDate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CalDAVOfficeHour

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)logHandle_logHandle;
  return v2;
}

uint64_t __29__CalDAVOfficeHour_logHandle__block_invoke()
{
  logHandle_logHandle = (uint64_t)os_log_create("com.apple.calendar.DataAccessExpress", "CalDAVOfficeHour");
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalDAVOfficeHour)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalDAVOfficeHour;
  v5 = [(CalDAVOfficeHour *)&v13 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDay"];
    uint64_t v7 = [v6 copy];
    startDate = v5->_startDate;
    v5->_startDate = (NSDateComponents *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    uint64_t v10 = [v9 copy];
    endDate = v5->_endDate;
    v5->_endDate = (NSDateComponents *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CalDAVOfficeHour enabled](self, "enabled"), @"enabled");
  v5 = [(CalDAVOfficeHour *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDay"];

  id v6 = [(CalDAVOfficeHour *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if ([(CalDAVOfficeHour *)self enabled]) {
    id v6 = @"enabled";
  }
  else {
    id v6 = @"disabled";
  }
  uint64_t v7 = [(CalDAVOfficeHour *)self startDate];
  v8 = [(CalDAVOfficeHour *)self endDate];
  v9 = [v3 stringWithFormat:@"%@ <%p> {%@, %@, %@}", v5, self, v6, v7, v8];

  return v9;
}

+ (id)officeHoursFromData:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4FB7F48];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithData:v4 options:0 error:0];

    id v6 = +[CalDAVOfficeHour officeHoursFromICS:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)officeHoursFromICS:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  uint64_t v3 = 7;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  do
  {
    v5 = objc_alloc_init(CalDAVOfficeHour);
    [v4 addObject:v5];

    --v3;
  }
  while (v3);
  v69 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v67 calendar];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v7 = [v67 calendar];
  v8 = [v7 components];

  id obj = v8;
  v9 = v4;
  uint64_t v72 = [v8 countByEnumeratingWithState:&v103 objects:v109 count:16];
  if (v72)
  {
    unint64_t v10 = 0x1E4FB7000uLL;
    uint64_t v71 = *(void *)v104;
    v75 = v6;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v104 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = v11;
        v12 = *(void **)(*((void *)&v103 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_71;
        }
        id v13 = v12;
        v14 = [v13 dtstart];
        v15 = [v6 systemDateForDate:v14 options:0];

        v78 = v13;
        v16 = [v13 dtend];
        uint64_t v17 = [v6 systemDateForDate:v16 options:0];

        v73 = (void *)v17;
        if (!v17)
        {
          v18 = [v78 duration];
          v19 = v18;
          if (v18)
          {
            [v18 timeInterval];
            v73 = objc_msgSend(v15, "dateByAddingTimeInterval:");
          }
          else
          {
            v73 = 0;
          }
        }
        v20 = v15;
        if ((!v15 || [v69 compare:v15] == 1) && (!v73 || objc_msgSend(v69, "compare:", v73) == -1))
        {
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          v21 = [v78 components];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v99 objects:v108 count:16];
          if (!v22) {
            goto LABEL_70;
          }
          uint64_t v23 = v22;
          v68 = v20;
          uint64_t v24 = *(void *)v100;
          uint64_t v76 = *(void *)v100;
          v77 = v21;
          while (1)
          {
            uint64_t v25 = 0;
            uint64_t v82 = v23;
            do
            {
              if (*(void *)v100 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v99 + 1) + 8 * v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = v26;
                uint64_t v28 = [v27 dtstart];
                v86 = v27;
                uint64_t v29 = [v27 dtend];
                v88 = [v6 systemDateForDate:v28 options:0];
                v85 = (void *)v28;
                v87 = [v6 systemCalendarForDate:v28 options:0];
                uint64_t v30 = [v6 systemDateForDate:v29 options:0];
                v84 = (void *)v29;
                uint64_t v31 = [v6 systemCalendarForDate:v29 options:0];
                id v32 = (id)v31;
                v89 = (void *)v30;
                if (v30)
                {
                  v33 = v87;
                }
                else
                {
                  uint64_t v34 = v24;
                  v35 = v6;
                  unint64_t v36 = v10;
                  v37 = v21;
                  v38 = (void *)v31;
                  v39 = [v78 duration];
                  v40 = v39;
                  if (v39)
                  {
                    [v39 timeInterval];
                    v89 = objc_msgSend(v88, "dateByAddingTimeInterval:");
                  }
                  else
                  {
                    v89 = 0;
                  }
                  v33 = v87;
                  id v32 = v87;

                  v21 = v37;
                  unint64_t v10 = v36;
                  id v6 = v35;
                  uint64_t v24 = v34;
                  uint64_t v23 = v82;
                }
                v41 = [v33 components:764 fromDate:v88];
                v91 = v32;
                v42 = [v32 components:764 fromDate:v89];
                v93 = v41;
                uint64_t v43 = [v41 weekday];
                v92 = v42;
                if (v43 == [v42 weekday])
                {
                  v44 = [v86 rrule];
                  if ([v44 count] == 1)
                  {
                    v45 = [v44 lastObject];
                    v46 = [v45 byday];
                    v47 = v46;
                    v48 = v87;
                    v80 = v44;
                    uint64_t v81 = v25;
                    v79 = v45;
                    if (v46)
                    {
                      long long v97 = 0u;
                      long long v98 = 0u;
                      long long v95 = 0u;
                      long long v96 = 0u;
                      uint64_t v49 = [v46 countByEnumeratingWithState:&v95 objects:v107 count:16];
                      if (!v49) {
                        goto LABEL_64;
                      }
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v96;
                      id v90 = v47;
                      while (1)
                      {
                        for (uint64_t i = 0; i != v50; ++i)
                        {
                          if (*(void *)v96 != v51) {
                            objc_enumerationMutation(v90);
                          }
                          v53 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * i), "weekday") - 1);
                          [v53 setEnabled:1];
                          v54 = [v53 startDate];
                          if (!v54)
                          {
                            v56 = 0;
LABEL_45:
                            [v53 setStartDate:v93];
                            goto LABEL_46;
                          }
                          v55 = [v48 dateFromComponents:v54];
                          v56 = v55;
                          if (!v55) {
                            goto LABEL_45;
                          }
                          v57 = [v55 laterDate:v88];

                          if (v57 == v56) {
                            goto LABEL_45;
                          }
LABEL_46:
                          v58 = [v53 endDate];
                          if (!v58)
                          {
                            v60 = 0;
LABEL_52:
                            [v53 setEndDate:v92];
                            goto LABEL_53;
                          }
                          v59 = [v91 dateFromComponents:v58];
                          v60 = v59;
                          if (!v59) {
                            goto LABEL_52;
                          }
                          [v59 earlierDate:v89];
                          v62 = v61 = v9;

                          BOOL v63 = v62 == v60;
                          v9 = v61;
                          v48 = v87;
                          if (v63) {
                            goto LABEL_52;
                          }
LABEL_53:
                        }
                        v47 = v90;
                        uint64_t v50 = [v90 countByEnumeratingWithState:&v95 objects:v107 count:16];
                        if (!v50) {
                          goto LABEL_64;
                        }
                      }
                    }
                    v65 = [a1 logHandle];
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BA3E8000, v65, OS_LOG_TYPE_DEFAULT, "Discarding overly-complex recurrence for AVAILABLE, iCal doesn't understand it.", buf, 2u);
                    }

LABEL_64:
                    id v6 = v75;
                    uint64_t v24 = v76;
                    unint64_t v10 = 0x1E4FB7000;
                    v21 = v77;
                    uint64_t v25 = v81;
                    uint64_t v23 = v82;
                    v64 = v79;
                    v44 = v80;
                  }
                  else
                  {
                    v64 = [a1 logHandle];
                    v48 = v87;
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BA3E8000, v64, OS_LOG_TYPE_DEFAULT, "Discarding non-recurring AVAILABLE, iCal doesn't understand it.", buf, 2u);
                    }
                  }
                }
                else
                {
                  v44 = [a1 logHandle];
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BA3E8000, v44, OS_LOG_TYPE_DEFAULT, "Discarding non-same-day AVAILABLE, iCal doesn't understand it.", buf, 2u);
                  }
                  v48 = v87;
                }
              }
              ++v25;
            }
            while (v25 != v23);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v99 objects:v108 count:16];
            if (!v23)
            {
              v20 = v68;
              goto LABEL_70;
            }
          }
        }
        v21 = [a1 logHandle];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BA3E8000, v21, OS_LOG_TYPE_DEFAULT, "Discarding non-current VAVAILABILITY, iCal doesn't understand it.", buf, 2u);
        }
LABEL_70:

LABEL_71:
        uint64_t v11 = v74 + 1;
      }
      while (v74 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v103 objects:v109 count:16];
    }
    while (v72);
  }

  return v9;
}

+ (id)dataFromOfficeHours:(id)a3
{
  uint64_t v3 = +[CalDAVOfficeHour icsFromOfficeHours:a3];
  id v4 = [v3 ICSDataWithOptions:0];

  return v4;
}

+ (id)_gregorianGMTCalendar
{
  if (_gregorianGMTCalendar_onceToken != -1) {
    dispatch_once(&_gregorianGMTCalendar_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)_gregorianGMTCalendar_gregorianGMTCalendar;
  return v2;
}

void __41__CalDAVOfficeHour__gregorianGMTCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)_gregorianGMTCalendar_gregorianGMTCalendar;
  _gregorianGMTCalendar_gregorianGMTCalendar = v1;

  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [(id)_gregorianGMTCalendar_gregorianGMTCalendar setTimeZone:v3];
}

+ (id)icsFromOfficeHours:(id)a3
{
  id v75 = a3;
  if ([v75 count] != 7)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2 object:a1 file:@"CalDAVOfficeHour.m" lineNumber:196 description:@"Office hours array must contain seven items"];
  }
  uint64_t v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  id v6 = [a1 _gregorianGMTCalendar];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  id v67 = v6;
  v8 = [v6 components:764 fromDate:v7];

  BOOL v63 = (void *)v5;
  v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"), v5);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v66 = v8;
  uint64_t v9 = [v8 weekday];
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  v12 = 0;
  id v13 = 0;
  for (uint64_t i = 0; i != 7; ++i)
  {
    v15 = [v75 objectAtIndex:v9 - 1];
    if (![v15 enabled]) {
      goto LABEL_21;
    }
    uint64_t v78 = i;
    v16 = [v15 startDate];
    uint64_t v74 = v15;
    uint64_t v76 = [v15 endDate];
    v77 = v16;
    if (!v11 || !v12) {
      goto LABEL_17;
    }
    uint64_t v17 = [v16 hour];
    v18 = [v12 value];
    if (v17 != [v18 hour]) {
      goto LABEL_16;
    }
    uint64_t v19 = [v16 minute];
    v20 = [v12 value];
    if (v19 != [v20 minute] || !v13) {
      goto LABEL_15;
    }
    v21 = v12;
    uint64_t v22 = [v76 hour];
    uint64_t v23 = [v13 value];
    if (v22 != [v23 hour])
    {

      v12 = v21;
LABEL_15:

LABEL_16:
LABEL_17:
      uint64_t v73 = v9;
      uint64_t v31 = v13;
      if (v10)
      {
        id v32 = [MEMORY[0x1E4FB7F18] makeUID];
        [v10 setUid:v32];

        [v10 setDtstamp:v65];
        [v10 setDtstart:v12];
        [v10 setDtend:v13];
        v33 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
        [v10 setRrule:v33];

        [v64 addObject:v10];
      }
      id v71 = objc_alloc_init(MEMORY[0x1E4FB7EF0]);

      id v34 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      v70 = v11;
      objc_msgSend(v34, "setYear:", objc_msgSend(v66, "year"));
      objc_msgSend(v34, "setMonth:", objc_msgSend(v66, "month") - 1);
      objc_msgSend(v34, "setDay:", objc_msgSend(v66, "day") + v78);
      v35 = [v67 dateFromComponents:v34];
      uint64_t v28 = [v67 components:28 fromDate:v35];

      id v36 = objc_alloc(MEMORY[0x1E4FB7F28]);
      uint64_t v37 = [v28 year];
      v38 = v12;
      uint64_t v39 = [v28 month];
      uint64_t v40 = [v28 day];
      uint64_t v41 = [v16 hour];
      uint64_t v42 = [v16 minute];
      [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      uint64_t v43 = v68 = v31;
      uint64_t v69 = [v36 initWithYear:v37 month:v39 day:v40 hour:v41 minute:v42 second:0 timeZone:v43];

      id v44 = objc_alloc(MEMORY[0x1E4FB7F28]);
      uint64_t v45 = [v28 year];
      uint64_t v46 = [v28 month];
      uint64_t v47 = [v28 day];
      uint64_t v48 = [v76 hour];
      uint64_t v49 = [v76 minute];
      uint64_t v50 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      id v13 = (void *)[v44 initWithYear:v45 month:v46 day:v47 hour:v48 minute:v49 second:0 timeZone:v50];

      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB7F78]) initWithFrequency:5];
      uint64_t v9 = v73;
      uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4FB7EF8]) initWithWeekday:v73];
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObject:v29];
      [v11 setByday:v30];
      v21 = (void *)v69;
      id v27 = v76;
      uint64_t i = v78;
      unint64_t v10 = v71;
      goto LABEL_20;
    }
    uint64_t v72 = [v76 minute];
    uint64_t v24 = [v13 value];
    uint64_t v25 = [v24 minute];

    BOOL v26 = v72 == v25;
    v12 = v21;
    v16 = v77;
    id v27 = v76;
    if (!v26) {
      goto LABEL_17;
    }
    uint64_t v28 = [v11 byday];
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4FB7EF8]) initWithWeekday:v9];
    uint64_t v30 = [v28 arrayByAddingObject:v29];
    [v11 setByday:v30];
    uint64_t i = v78;
LABEL_20:

    v12 = v21;
    v15 = v74;
LABEL_21:
    uint64_t v9 = v9 % 7 + 1;
  }
  uint64_t v51 = v12;
  v52 = v13;
  if (v10)
  {
    v53 = [MEMORY[0x1E4FB7F18] makeUID];
    [v10 setUid:v53];

    [v10 setDtstamp:v65];
    [v10 setDtstart:v51];
    [v10 setDtend:v52];
    v54 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
    [v10 setRrule:v54];

    [v64 addObject:v10];
  }
  id v55 = objc_alloc_init(MEMORY[0x1E4FB7EE8]);
  v56 = [MEMORY[0x1E4FB7F18] makeUID];
  [v55 setUid:v56];

  [v55 setDtstamp:v65];
  [v55 setComponents:v64];
  id v57 = objc_alloc_init(MEMORY[0x1E4FB7F00]);
  v58 = [MEMORY[0x1E4F1C978] arrayWithObject:v55];
  [v57 setComponents:v58 options:2];

  v59 = ICSDefaultPRODID();
  [v57 setProdid:v59];

  v60 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithCalendar:v57];
  return v60;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDateComponents)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end