@interface EKCalendarResourceChangeNotification(CUIKDescription)
- (BOOL)supportsDisplay;
- (id)_dateStringWithOptions:()CUIKDescription;
- (id)_resourceChangeStringWithOptions:()CUIKDescription dict:;
- (id)allDescriptionStringsWithOptions:()CUIKDescription;
- (id)descriptionStrings:()CUIKDescription;
- (uint64_t)_changedPropertyCount;
@end

@implementation EKCalendarResourceChangeNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return [a1 type] == 4
      || [a1 type] == 5
      || [a1 type] == 6
      || [a1 type] == 7
      || [a1 type] == 11;
}

- (id)_resourceChangeStringWithOptions:()CUIKDescription dict:
{
  id v6 = a4;
  v7 = +[CUIKNotificationDescriptionGenerator sharedGenerator];
  if ([a1 type] == 4)
  {
    v8 = CUIKBundle();
    v9 = [v8 localizedStringForKey:@"Added to %@ by %@" value:&stru_1F187C430 table:0];

    v10 = [a1 calendarName];
LABEL_9:
    id v15 = [a1 _identityStringWithOptions:a3];
    v16 = 0;
    int v17 = 1;
    goto LABEL_129;
  }
  if ([a1 type] != 5 && objc_msgSend(a1, "type") != 13)
  {
    if ([a1 type] == 6 || objc_msgSend(a1, "type") == 14)
    {
      int v18 = [a1 dateChanged];
      int v19 = [a1 timeChanged] + v18;
      int v20 = [a1 titleChanged];
      int v21 = v19 + v20 + [a1 locationChanged];
      v22 = [a1 _identityStringWithOptions:a3];
      int v17 = [a1 type] == 6 && v22 != 0;
      if (v21 == 1)
      {
        if ([a1 dateChanged])
        {
          v24 = CUIKBundle();
          v25 = v24;
          if (v17)
          {
            v9 = [v24 localizedStringForKey:@"Date changed to %@ by %@" value:&stru_1F187C430 table:0];

            id v15 = v22;
          }
          else
          {
            v9 = [v24 localizedStringForKey:@"Date changed to %@" value:&stru_1F187C430 table:0];

            id v15 = 0;
          }
          uint64_t v72 = [v7 _sharedDateFormatter];
LABEL_121:
          v89 = (void *)v72;
          v90 = [a1 startDate];
          v10 = [v89 stringFromDate:v90];

          goto LABEL_128;
        }
        if ([a1 timeChanged])
        {
          v42 = (void *)MEMORY[0x1E4F576C8];
          v43 = [a1 startDate];
          int v44 = [v42 requiresSingularLocalizationForDate:v43];

          v45 = CUIKBundle();
          v46 = v45;
          if (v17)
          {
            if (v44) {
              v47 = @"Time changed to %@ by %@ (singular hour)";
            }
            else {
              v47 = @"Time changed to %@ by %@ (plural hour)";
            }
            v9 = [v45 localizedStringForKey:v47 value:@"Time changed to %@ by %@" table:0];

            id v15 = v22;
          }
          else
          {
            if (v44) {
              v77 = @"Time changed to %@ (singular hour)";
            }
            else {
              v77 = @"Time changed to %@ (plural hour)";
            }
            v9 = [v45 localizedStringForKey:v77 value:@"Time changed to %@" table:0];

            id v15 = 0;
          }
          uint64_t v72 = [v7 _sharedTimeFormatter];
          goto LABEL_121;
        }
        if ([a1 titleChanged])
        {
          v73 = CUIKBundle();
          if (v17)
          {
            v74 = @"Title changed by %@";
LABEL_125:
            v9 = [v73 localizedStringForKey:v74 value:&stru_1F187C430 table:0];

            goto LABEL_126;
          }
          v88 = @"Title changed";
LABEL_116:
          v9 = [v73 localizedStringForKey:v88 value:&stru_1F187C430 table:0];

LABEL_117:
          id v15 = 0;
          v10 = 0;
          goto LABEL_128;
        }
        if (![a1 locationChanged])
        {
          id v15 = 0;
          v10 = 0;
          v9 = 0;
          goto LABEL_128;
        }
        v78 = [a1 location];
        uint64_t v79 = [v78 length];

        if (v79) {
          int v80 = v17;
        }
        else {
          int v80 = 0;
        }
        v81 = CUIKBundle();
        v73 = v81;
        if (v80 != 1)
        {
          if (v17)
          {
            v74 = @"Location changed by %@";
            goto LABEL_125;
          }
          if (v79)
          {
            v9 = [v81 localizedStringForKey:@"Location changed to %@" value:&stru_1F187C430 table:0];

            id v91 = [a1 location];
            goto LABEL_127;
          }
          v88 = @"Location changed.";
          goto LABEL_116;
        }
        v9 = [v81 localizedStringForKey:@"Location changed to %@ by %@" value:&stru_1F187C430 table:0];

        id v15 = v22;
        v10 = [a1 location];
      }
      else
      {
        if ((v21 - 1) > 1)
        {
          v48 = CUIKBundle();
          v49 = v48;
          if (v17) {
            v50 = @"Updated in %@ by %@";
          }
          else {
            v50 = @"Updated in %@";
          }
          if (v17) {
            v51 = v22;
          }
          else {
            v51 = 0;
          }
          v9 = [v48 localizedStringForKey:v50 value:&stru_1F187C430 table:0];

          v10 = [a1 calendarName];
          id v15 = v51;
          goto LABEL_128;
        }
        if ([a1 dateChanged] && objc_msgSend(a1, "timeChanged"))
        {
          v26 = CUIKBundle();
          v27 = v26;
          if (v17) {
            v28 = @"Date and time changed by %@";
          }
          else {
            v28 = @"Date and time changed";
          }
          v9 = [v26 localizedStringForKey:v28 value:&stru_1F187C430 table:0];
        }
        else
        {
          v9 = 0;
        }
        if ([a1 dateChanged] && objc_msgSend(a1, "titleChanged"))
        {
          v52 = CUIKBundle();
          v53 = v52;
          if (v17) {
            v54 = @"Date and title changed by %@";
          }
          else {
            v54 = @"Date and title changed";
          }
          uint64_t v55 = [v52 localizedStringForKey:v54 value:&stru_1F187C430 table:0];

          v9 = (void *)v55;
        }
        if ([a1 dateChanged] && objc_msgSend(a1, "locationChanged"))
        {
          v56 = CUIKBundle();
          v57 = v56;
          if (v17) {
            v58 = @"Date and location changed by %@";
          }
          else {
            v58 = @"Date and location changed";
          }
          uint64_t v59 = [v56 localizedStringForKey:v58 value:&stru_1F187C430 table:0];

          v9 = (void *)v59;
        }
        if ([a1 timeChanged] && objc_msgSend(a1, "titleChanged"))
        {
          v60 = CUIKBundle();
          v61 = v60;
          if (v17) {
            v62 = @"Time and title changed by %@";
          }
          else {
            v62 = @"Time and title changed";
          }
          uint64_t v63 = [v60 localizedStringForKey:v62 value:&stru_1F187C430 table:0];

          v9 = (void *)v63;
        }
        if ([a1 timeChanged] && objc_msgSend(a1, "locationChanged"))
        {
          v64 = CUIKBundle();
          v65 = v64;
          if (v17) {
            v66 = @"Time and location changed by %@";
          }
          else {
            v66 = @"Time and location changed";
          }
          uint64_t v67 = [v64 localizedStringForKey:v66 value:&stru_1F187C430 table:0];

          v9 = (void *)v67;
        }
        if (![a1 titleChanged] || !objc_msgSend(a1, "locationChanged"))
        {
          if (v17) {
            goto LABEL_126;
          }
          goto LABEL_117;
        }
        v68 = CUIKBundle();
        v69 = v68;
        if (v17)
        {
          uint64_t v70 = [v68 localizedStringForKey:@"Location and title changed by %@" value:&stru_1F187C430 table:0];

          v9 = (void *)v70;
LABEL_126:
          id v91 = v22;
LABEL_127:
          v10 = v91;
          id v15 = 0;
          goto LABEL_128;
        }
        uint64_t v87 = [v68 localizedStringForKey:@"Location and title changed" value:&stru_1F187C430 table:0];

        id v15 = 0;
        v10 = 0;
        v9 = (void *)v87;
      }
LABEL_128:

      v16 = 0;
      goto LABEL_129;
    }
    if ([a1 type] != 7)
    {
      if ([a1 type] == 11)
      {
        v71 = CUIKBundle();
        v9 = [v71 localizedStringForKey:@"This calendar is now public." value:&stru_1F187C430 table:0];

        int v17 = 0;
        v16 = 0;
        id v15 = 0;
        v10 = 0;
      }
      else
      {
        int v17 = 0;
        v16 = 0;
        id v15 = 0;
        v10 = 0;
        v9 = 0;
      }
      goto LABEL_129;
    }
    v29 = [a1 updateCount];
    v30 = [a1 createCount];
    v31 = [a1 deleteCount];
    v107 = v29;
    int v32 = [v29 intValue];
    int v33 = [v30 intValue];
    int v34 = [v31 intValue];
    int v35 = v34;
    if (v33 && !v34 && !v32)
    {
      v36 = [a1 name];
      if (v36 || ([a1 emailAddress], (v36 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v101 = [a1 phoneNumber];

        if (!v101)
        {
          v37 = CUIKBundle();
          v9 = [v37 localizedStringForKey:@"%@ events were added to %@." value:&stru_1F187C430 table:0];
          int v38 = 1;
          goto LABEL_38;
        }
      }
      v37 = CUIKBundle();
      v9 = [v37 localizedStringForKey:@"%@ events were added to %@ by %@." value:&stru_1F187C430 table:0];
      int v38 = 0;
LABEL_38:

      v39 = [v7 _sharedNumberFormatter];
      v40 = v39;
      v41 = v30;
LABEL_98:
      v10 = [v39 stringFromNumber:v41];
LABEL_113:

      int v17 = v38 ^ 1;
      id v15 = [a1 calendarName];
      v16 = [a1 _identityStringWithOptions:a3];

      goto LABEL_129;
    }
    v75 = [a1 name];
    if (v35 && !v33 && !v32)
    {
      if (v75 || ([a1 emailAddress], (v75 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v102 = [a1 phoneNumber];

        if (!v102)
        {
          v76 = CUIKBundle();
          v9 = [v76 localizedStringForKey:@"%@ events were deleted from %@." value:&stru_1F187C430 table:0];
          int v38 = 1;
          goto LABEL_97;
        }
      }
      v76 = CUIKBundle();
      v9 = [v76 localizedStringForKey:@"%@ events were deleted from %@ by %@." value:&stru_1F187C430 table:0];
      int v38 = 0;
LABEL_97:

      v39 = [v7 _sharedNumberFormatter];
      v40 = v39;
      v41 = v31;
      goto LABEL_98;
    }
    if (v75 || ([a1 emailAddress], (v75 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v103 = [a1 phoneNumber];

      if (!v103)
      {
        v82 = CUIKBundle();
        v9 = [v82 localizedStringForKey:@"%@ events were updated in %@." value:&stru_1F187C430 table:0];
        int v38 = 1;
        goto LABEL_112;
      }
    }
    v82 = CUIKBundle();
    v9 = [v82 localizedStringForKey:@"%@ events were updated in %@ by %@." value:&stru_1F187C430 table:0];
    int v38 = 0;
LABEL_112:

    int v83 = [v107 intValue];
    v106 = v30;
    int v84 = [v30 intValue] + v83;
    uint64_t v85 = v84 + [v31 intValue];
    v40 = [v7 _sharedNumberFormatter];
    v86 = [NSNumber numberWithInt:v85];
    v10 = [v40 stringFromNumber:v86];

    v30 = v106;
    goto LABEL_113;
  }
  uint64_t v11 = [a1 type];
  v12 = CUIKBundle();
  v13 = v12;
  if (v11 == 5) {
    v14 = @"Deleted from %@ by %@";
  }
  else {
    v14 = @"Deleted from %@";
  }
  v9 = [v12 localizedStringForKey:v14 value:&stru_1F187C430 table:0];

  v10 = [a1 calendarName];
  if (v11 == 5) {
    goto LABEL_9;
  }
  int v17 = 0;
  v16 = 0;
  id v15 = 0;
LABEL_129:
  if (v9) {
    BOOL v92 = v10 == 0;
  }
  else {
    BOOL v92 = 1;
  }
  int v93 = !v92;
  if (v15) {
    int v94 = v93;
  }
  else {
    int v94 = 0;
  }
  if (v94 == 1 && v16 != 0)
  {
    [NSString localizedStringWithValidatedFormat:v9, @"%@%@%@", 0, v10, v15, v16 validFormatSpecifiers error];
LABEL_147:
    id v96 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_148;
  }
  if (v94)
  {
    [NSString localizedStringWithValidatedFormat:v9, @"%@%@", 0, v10, v15, v105 validFormatSpecifiers error];
    goto LABEL_147;
  }
  if (v93)
  {
    [NSString localizedStringWithValidatedFormat:v9, @"%@", 0, v10, v104, v105 validFormatSpecifiers error];
    goto LABEL_147;
  }
  if (v9)
  {
    id v96 = v9;
LABEL_148:
    v97 = v96;
    if (!v6) {
      goto LABEL_157;
    }
    goto LABEL_149;
  }
  v99 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
    -[EKCalendarResourceChangeNotification(CUIKDescription) _resourceChangeStringWithOptions:dict:]();
  }

  v97 = 0;
  if (!v6) {
    goto LABEL_157;
  }
LABEL_149:
  if ([a1 _changedPropertyCount] == 1 && objc_msgSend(a1, "dateChanged"))
  {
    v98 = @"Date";
    goto LABEL_160;
  }
LABEL_157:
  if (v17) {
    v98 = @"Person";
  }
  else {
    v98 = @"Action";
  }
LABEL_160:
  [v6 setObject:v97 forKeyedSubscript:v98];

  return v97;
}

- (id)_dateStringWithOptions:()CUIKDescription
{
  if ((a3 & 0x40) != 0
    && ([a1 type] == 4
     || [a1 type] == 6
     && ([a1 _changedPropertyCount] != 1
      || ([a1 dateChanged] & 1) == 0 && (objc_msgSend(a1, "timeChanged") & 1) == 0)))
  {
    uint64_t v5 = [a1 allDay];
    id v6 = [a1 startDateForNextOccurrence];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [a1 startDate];
    }
    v9 = v8;

    v10 = +[CUIKDateDescriptionGenerator sharedGenerator];
    v4 = [v10 dateStringForDate:v9 allDay:v5 shortFormat:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 _resourceChangeStringWithOptions:a3 dict:0];
  uint64_t v6 = [a1 _dateStringWithOptions:a3];
  v7 = (void *)v6;
  if (v6)
  {
    uint64_t v14 = v6;
    id v15 = v5;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    v9 = &v14;
    uint64_t v10 = 2;
  }
  else
  {
    v13 = v5;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    v9 = (uint64_t *)&v13;
    uint64_t v10 = 1;
  }
  uint64_t v11 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v13, v14, v15);

  return v11;
}

- (id)descriptionStrings:()CUIKDescription
{
  uint64_t v5 = objc_opt_new();
  id v6 = (id)[a1 _resourceChangeStringWithOptions:a3 dict:v5];
  v7 = [a1 _dateStringWithOptions:a3];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"Date"];
  }

  return v5;
}

- (uint64_t)_changedPropertyCount
{
  LODWORD(v2) = [a1 dateChanged];
  int v3 = [a1 timeChanged];
  uint64_t v4 = 1;
  if (v2) {
    uint64_t v4 = 2;
  }
  if (v3) {
    uint64_t v2 = v4;
  }
  else {
    uint64_t v2 = v2;
  }
  uint64_t v5 = v2 + [a1 titleChanged];
  return v5 + [a1 locationChanged];
}

- (void)_resourceChangeStringWithOptions:()CUIKDescription dict:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Unhandled type of %@. Can't generate human readable description.", v3, v4, v5, v6, 2u);
}

@end