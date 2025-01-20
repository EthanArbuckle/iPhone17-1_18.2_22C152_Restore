@interface WFVCalendarFormatter
+ (id)ICSFromCalendarItems:(id)a3;
+ (id)calendarItemsFromICS:(id)a3;
+ (id)foldString:(id)a3 withOctetCount:(int64_t)a4;
+ (id)hexColorFromCGColor:(CGColor *)a3;
+ (id)stringRepresentationOfParticipant:(id)a3;
@end

@implementation WFVCalendarFormatter

+ (id)hexColorFromCGColor:(CGColor *)a3
{
  v3 = [MEMORY[0x263F851A8] colorWithCGColor:a3];
  uint64_t v6 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  [v3 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v9 * 255.0), (int)(v8 * 255.0), (int)(v7 * 255.0));

  return v4;
}

+ (id)stringRepresentationOfParticipant:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  v5 = [v3 name];

  if (v5)
  {
    uint64_t v6 = [v3 name];
    [v4 appendFormat:@";CN=\"%@\"", v6];
  }
  unint64_t v7 = [v3 participantRole] - 1;
  if (v7 <= 3) {
    [v4 appendFormat:@";ROLE=%@", off_2642877F8[v7]];
  }
  unint64_t v8 = [v3 participantStatus] - 1;
  if (v8 <= 6) {
    [v4 appendFormat:@";PARTSTAT=%@", off_264287818[v8]];
  }
  unint64_t v9 = [v3 participantType];
  if (v9 <= 4) {
    [v4 appendFormat:@";CUTYPE=%@", off_264287850[v9]];
  }
  v10 = [v3 URL];

  if (v10)
  {
    v11 = [v3 URL];
    v12 = [v11 absoluteString];
    [v4 appendFormat:@":%@", v12];
  }
  return v4;
}

+ (id)foldString:(id)a3 withOctetCount:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F089D8] string];
  unint64_t v7 = [v5 dataUsingEncoding:4 allowLossyConversion:1];
  if ([v7 length])
  {
    unint64_t v8 = 0;
    do
    {
      int64_t v9 = a4 - ((uint64_t)v8 > 0);
      if (v9 + v8 > [v7 length]) {
        int64_t v9 = [v7 length] - v8;
      }
      while (1)
      {
        v10 = objc_msgSend(v7, "subdataWithRange:", v8, v9);
        uint64_t v11 = [[NSString alloc] initWithData:v10 encoding:4];
        if (v11) {
          break;
        }
        --v9;

        if (!v9)
        {
          id v13 = 0;
          goto LABEL_13;
        }
      }
      v12 = (void *)v11;

      if (v8) {
        [v6 appendFormat:@"\r\n %@", v12];
      }
      else {
        [v6 appendString:v12];
      }
      v8 += v9;
    }
    while (v8 < [v7 length]);
  }
  id v13 = v6;
LABEL_13:

  return v13;
}

+ (id)calendarItemsFromICS:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)ICSFromCalendarItems:(id)a3
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v126 = a3;
  id v3 = [MEMORY[0x263F089D8] string];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke;
  aBlock[3] = &unk_264287780;
  id v148 = a1;
  id v115 = v3;
  id v147 = v115;
  v4 = _Block_copy(aBlock);
  v144[0] = MEMORY[0x263EF8330];
  v144[1] = 3221225472;
  v144[2] = __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke_2;
  v144[3] = &unk_2642877A8;
  id v127 = v4;
  id v145 = v127;
  id v5 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(v144);
  v5[2](v5, @"BEGIN", @"VCALENDAR");
  v5[2](v5, @"VERSION", @"2.0");
  if ([v126 count])
  {
    uint64_t v6 = [v126 firstObject];
    unint64_t v7 = [v6 calendar];

    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    unint64_t v8 = (__CFString *)v126;
    uint64_t v9 = [(__CFString *)v8 countByEnumeratingWithState:&v140 objects:v157 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v141;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v141 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v140 + 1) + 8 * i) calendar];
          id v13 = [v12 calendarIdentifier];
          v14 = [(__CFString *)v7 calendarIdentifier];
          int v15 = [v13 isEqualToString:v14];

          if (!v15)
          {
            v17 = v7;
            unint64_t v7 = v8;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [(__CFString *)v8 countByEnumeratingWithState:&v140 objects:v157 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (v7)
    {
      v16 = [(__CFString *)v7 title];
      v5[2](v5, @"X-WR-CALNAME", v16);

      objc_msgSend(a1, "hexColorFromCGColor:", -[__CFString CGColor](v7, "CGColor"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, @"X-APPLE-CALENDAR-COLOR", v17);
LABEL_13:
    }
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = v126;
  uint64_t v119 = [obj countByEnumeratingWithState:&v136 objects:v156 count:16];
  if (v119)
  {
    uint64_t v118 = *(void *)v137;
    uint64_t v116 = *MEMORY[0x263EFF3F8];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v137 != v118)
        {
          uint64_t v19 = v18;
          objc_enumerationMutation(obj);
          uint64_t v18 = v19;
        }
        uint64_t v120 = v18;
        v122 = *(void **)(*((void *)&v136 + 1) + 8 * v18);
        getEKReminderClass();
        char isKindOfClass = objc_opt_isKindOfClass();
        v21 = @"VEVENT";
        if (isKindOfClass) {
          v21 = @"VTODO";
        }
        v121 = v21;
        ((void (*)(void (**)(void *, __CFString *, __CFString *), __CFString *))v5[2])(v5, @"BEGIN");
        v22 = [v122 title];

        if (v22)
        {
          v23 = [v122 title];
          v5[2](v5, @"SUMMARY", v23);
        }
        if ([v122 hasNotes])
        {
          v24 = [v122 notes];
          v5[2](v5, @"DESCRIPTION", v24);
        }
        v25 = [v122 location];

        if (v25)
        {
          v26 = [v122 location];
          v5[2](v5, @"LOCATION", v26);
        }
        v27 = [v122 URL];

        if (v27)
        {
          v28 = NSString;
          v29 = [v122 URL];
          v30 = [v29 absoluteString];
          v31 = [v28 stringWithFormat:@"URLVALUE=URI:%@", v30, v115];;
          (*((void (**)(id, void *))v127 + 2))(v127, v31);
        }
        v32 = [v122 calendarItemExternalIdentifier];

        if (v32)
        {
          v33 = [v122 calendarItemExternalIdentifier];
          v5[2](v5, @"UID", v33);
        }
        id v124 = objc_alloc_init(MEMORY[0x263F08790]);
        v34 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
        [v124 setLocale:v34];

        [v124 setDateFormat:@"yyyyMMdd'T'HHmmss'Z'"];
        v35 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
        [v124 setTimeZone:v35];

        v36 = [v122 creationDate];

        if (v36)
        {
          v37 = [v122 creationDate];
          v38 = [v124 stringFromDate:v37];
          v5[2](v5, @"CREATED", v38);
        }
        v39 = [v122 lastModifiedDate];

        if (v39)
        {
          v40 = [v122 lastModifiedDate];
          v41 = [v124 stringFromDate:v40];
          v5[2](v5, @"LAST-MODIFIED", v41);
        }
        v42 = [MEMORY[0x263EFF910] date];
        v43 = [v124 stringFromDate:v42];
        v5[2](v5, @"DTSTAMP", v43);

        if ([v122 hasAttendees])
        {
          long long v134 = 0u;
          long long v135 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          v44 = [v122 attendees];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v132 objects:v155 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v133;
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v133 != v46) {
                  objc_enumerationMutation(v44);
                }
                v48 = NSString;
                v49 = [a1 stringRepresentationOfParticipant:*(void *)(*((void *)&v132 + 1) + 8 * j)];
                v50 = [v48 stringWithFormat:@"ATTENDEE%@", v49];
                (*((void (**)(id, void *))v127 + 2))(v127, v50);
              }
              uint64_t v45 = [v44 countByEnumeratingWithState:&v132 objects:v155 count:16];
            }
            while (v45);
          }
        }
        if ([v122 hasAlarms])
        {
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v123 = [v122 alarms];
          uint64_t v51 = [v123 countByEnumeratingWithState:&v128 objects:v154 count:16];
          if (v51)
          {
            uint64_t v52 = *(void *)v129;
            do
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v129 != v52) {
                  objc_enumerationMutation(v123);
                }
                v54 = *(void **)(*((void *)&v128 + 1) + 8 * k);
                v5[2](v5, @"BEGIN", @"VALARM");
                v5[2](v5, @"ACTION", @"DISPLAY");
                v5[2](v5, @"DESCRIPTION", @"Reminder");
                v55 = [v54 absoluteDate];

                if (v55)
                {
                  v56 = NSString;
                  v57 = [v54 absoluteDate];
                  v58 = [v124 stringFromDate:v57];
                  v59 = [v56 stringWithFormat:@"TRIGGERVALUE=DATE-TIME:%@", v58];;
                  (*((void (**)(id, void *))v127 + 2))(v127, v59);
                }
                else
                {
                  [v54 relativeOffset];
                  double v61 = v60;
                  v62 = [MEMORY[0x263F089D8] stringWithString:@"-P"];
                  v57 = v62;
                  uint64_t v63 = (uint64_t)-v61;
                  if ((unint64_t)(v63 + 86399) >= 0x2A2FF) {
                    [(__CFString *)v62 appendFormat:@"%ldD", v63 / 86400];
                  }
                  uint64_t v64 = v63 % 86400;
                  int v65 = v63 % 86400 / 3600;
                  int v66 = (int)v64 % 3600;
                  unsigned int v67 = ((int)v64 % 3600 + ((-30583 * ((int)v64 % 3600)) >> 16)) & 0x8000;
                  int v68 = ((__int16)((34953 * (v63 % 86400 % 3600)) >> 16) >> 5) + (v67 >> 15);
                  uint64_t v69 = (__int16)((int)v64 % 3600
                                - 60 * (((__int16)((34953 * ((int)v64 % 3600)) >> 16) >> 5) + (v67 >> 15)));
                  unint64_t v70 = v64 - 3600;
                  unsigned int v71 = v66 - 60;
                  if (v70 < 0xFFFFFFFFFFFFE3E1 || v71 < 0xFFFFFF89 || v69)
                  {
                    BOOL v72 = v70 < 0xFFFFFFFFFFFFE3E1;
                    [(__CFString *)v57 appendString:@"T"];
                    if (v72) {
                      [(__CFString *)v57 appendFormat:@"%ldH", v65];
                    }
                    if (v71 <= 0xFFFFFF88) {
                      [(__CFString *)v57 appendFormat:@"%ldM", v68];
                    }
                    if (v69) {
                      [(__CFString *)v57 appendFormat:@"%ldS", v69];
                    }
                  }
                  v5[2](v5, @"TRIGGER", v57);
                }

                v5[2](v5, @"END", @"VALARM");
              }
              uint64_t v51 = [v123 countByEnumeratingWithState:&v128 objects:v154 count:16];
            }
            while (v51);
          }
        }
        uint64_t v150 = 0;
        v151 = &v150;
        uint64_t v152 = 0x2050000000;
        v73 = (void *)getEKEventClass_softClass_9371;
        uint64_t v153 = getEKEventClass_softClass_9371;
        if (!getEKEventClass_softClass_9371)
        {
          v149[0] = MEMORY[0x263EF8330];
          v149[1] = 3221225472;
          v149[2] = __getEKEventClass_block_invoke_9372;
          v149[3] = &unk_26428AC60;
          v149[4] = &v150;
          __getEKEventClass_block_invoke_9372((uint64_t)v149);
          v73 = (void *)v151[3];
        }
        id v74 = v73;
        _Block_object_dispose(&v150, 8);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          getEKReminderClass();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_94;
          }
          id v86 = v122;
          v87 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:v116];
          v88 = [v86 startDateComponents];

          if (v88)
          {
            v89 = [v86 startDateComponents];
            v90 = [v87 dateFromComponents:v89];

            v91 = [v124 stringFromDate:v90];
            v5[2](v5, @"DTSTART", v91);
          }
          v92 = [v86 dueDateComponents];

          if (v92)
          {
            v93 = [v86 dueDateComponents];
            v94 = [v87 dateFromComponents:v93];

            v95 = [v124 stringFromDate:v94];
            v5[2](v5, @"DUE", v95);
          }
          v96 = [v86 completionDate];

          if (v96)
          {
            v97 = [v86 completionDate];
            v98 = [v124 stringFromDate:v97];
            v5[2](v5, @"COMPLETED", v98);
          }
          objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v86, "priority"));
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, @"PRIORITY", v99);

          goto LABEL_93;
        }
        id v75 = v122;
        if ([v75 isAllDay])
        {
          v76 = (__CFString *)objc_alloc_init(MEMORY[0x263F08790]);
          [(__CFString *)v76 setDateFormat:@"yyyyMMdd"];
          v77 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF918]);
          [(__CFString *)v77 setDay:1];
          v78 = [v75 startDate];
          v79 = [(__CFString *)v76 stringFromDate:v78];

          v80 = [MEMORY[0x263EFF8F0] currentCalendar];
          v81 = [v75 startDate];
          v82 = [v80 dateByAddingComponents:v77 toDate:v81 options:0];
          v83 = [(__CFString *)v76 stringFromDate:v82];

          v84 = [NSString stringWithFormat:@"DTSTARTVALUE=DATE:%@", v79];;
          (*((void (**)(id, void *))v127 + 2))(v127, v84);

          v85 = [NSString stringWithFormat:@"DTENDVALUE=DATE:%@", v83];;
          (*((void (**)(id, void *))v127 + 2))(v127, v85);
        }
        else
        {
          v100 = [v75 startDate];
          if (!v100) {
            goto LABEL_84;
          }
          v101 = [v75 endDate];
          BOOL v102 = v101 == 0;

          if (v102) {
            goto LABEL_84;
          }
          v103 = [v75 startDate];
          v76 = [v124 stringFromDate:v103];

          v104 = [v75 endDate];
          v77 = [v124 stringFromDate:v104];

          v5[2](v5, @"DTSTART", v76);
          v5[2](v5, @"DTEND", v77);
        }

LABEL_84:
        v105 = [v75 organizer];

        if (v105)
        {
          v106 = NSString;
          v107 = [v75 organizer];
          v108 = [a1 stringRepresentationOfParticipant:v107];
          v109 = [v106 stringWithFormat:@"ORGANIZER%@", v108];
          (*((void (**)(id, void *))v127 + 2))(v127, v109);
        }
        unint64_t v110 = [v75 status] - 1;
        if (v110 <= 2) {
          v5[2](v5, @"STATUS", off_2642877E0[v110]);
        }
        uint64_t v111 = [v75 availability];
        if (!v111)
        {
          v112 = @"OPAQUE";
          goto LABEL_92;
        }
        if (v111 == 1)
        {
          v112 = @"TRANSPARENT";
LABEL_92:
          v5[2](v5, @"TRANSP", v112);
        }
LABEL_93:

LABEL_94:
        v5[2](v5, @"SEQUENCE", @"0");
        v5[2](v5, @"END", v121);

        uint64_t v18 = v120 + 1;
      }
      while (v120 + 1 != v119);
      uint64_t v119 = [obj countByEnumeratingWithState:&v136 objects:v156 count:16];
    }
    while (v119);
  }

  v5[2](v5, @"END", @"VCALENDAR");
  id v113 = v115;

  return v113;
}

void __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  v4 = [a2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  id v7 = [v3 foldString:v4 withOctetCount:75];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [@"\r\n" stringByAppendingString:v7];
  [v5 appendString:v6];
}

void __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"%@:%@", a2, a3];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

@end