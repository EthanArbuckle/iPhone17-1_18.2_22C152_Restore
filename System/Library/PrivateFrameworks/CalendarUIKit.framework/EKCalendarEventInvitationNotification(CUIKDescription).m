@interface EKCalendarEventInvitationNotification(CUIKDescription)
- (id)_dateString:()CUIKDescription;
- (id)_identityStringWithOptions:()CUIKDescription;
- (id)_locationString:()CUIKDescription;
- (id)_organizerString:()CUIKDescription;
- (id)_recurrenceChangedString;
- (id)allDescriptionStringsWithOptions:()CUIKDescription;
- (id)descriptionStrings:()CUIKDescription;
- (uint64_t)_attendeeReplyStringWithOptions:()CUIKDescription descriptions:;
- (uint64_t)_attendeeString:()CUIKDescription;
- (uint64_t)supportsDisplay;
- (void)_populateDescriptionStringsArray:()CUIKDescription dictionary:options:;
@end

@implementation EKCalendarEventInvitationNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  if (![a1 type]) {
    return 1;
  }
  uint64_t result = [a1 type];
  if (result == 1) {
    return result;
  }
  return [a1 type] == 2 || objc_msgSend(a1, "type") == 3;
}

- (void)_populateDescriptionStringsArray:()CUIKDescription dictionary:options:
{
  id v26 = a3;
  id v8 = a4;
  if (![a1 type] || objc_msgSend(a1, "type") == 1 || objc_msgSend(a1, "type") == 2)
  {
    if ([a1 type] == 2) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Cancelled"];
    }
    uint64_t v9 = [a1 _organizerString:a5];
    v10 = (void *)v9;
    if ((a5 & 0x200) == 0 && v9)
    {
      [v8 setObject:v9 forKeyedSubscript:@"Person"];
      [v26 addObject:v10];
    }
    if ((a5 & 4) != 0)
    {
      v11 = [a1 _attendeeString:a5];
      if (v11)
      {
        [v8 setObject:v11 forKeyedSubscript:@"2ndPerson"];
        [v26 addObject:v11];
      }
    }
    v12 = [a1 _dateString:a5];
    if (v12)
    {
      [v8 setObject:v12 forKeyedSubscript:@"Date"];
      [v26 addObject:v12];
    }
    v13 = [a1 _locationString:a5];
    if (v13)
    {
      [v8 setObject:v13 forKeyedSubscript:@"Action"];
      [v26 addObject:v13];
    }
    v14 = [a1 _recurrenceChangedString];
    if (v14)
    {
      [v8 setObject:v14 forKeyedSubscript:@"Action"];
      [v26 addObject:v14];
    }

    goto LABEL_20;
  }
  if ([a1 type] == 3)
  {
    if ([a1 expanded] && objc_msgSend(a1, "isProposedNewTime"))
    {
      v10 = [a1 _identityStringWithOptions:a5];
      v21 = [a1 expandedProposedTimeAttendee];
      v22 = [v21 proposedStartDate];
      v23 = +[CUIKAvailabilityDescriptionGenerator attendeeProposedANewTime:v22 attendeeName:v10];

      if (!v23)
      {
LABEL_42:

LABEL_20:
        goto LABEL_21;
      }
      v24 = @"Action";
    }
    else
    {
      if ([a1 isLocationDecline])
      {
        v10 = [a1 _locationString:a5];
        if (v10)
        {
          [v8 setObject:v10 forKeyedSubscript:@"Action"];
          [v26 addObject:v10];
        }
        goto LABEL_20;
      }
      v10 = [a1 _attendeeReplyStringWithOptions:a5 descriptions:v8];
      if (v10)
      {
        [v26 addObject:v10];
        id v25 = (id)[a1 _attendeeReplyStringWithOptions:a5 descriptions:v8];
      }
      v23 = [a1 _dateString:a5];
      if (!v23) {
        goto LABEL_42;
      }
      v24 = @"Date";
    }
    [v8 setObject:v23 forKeyedSubscript:v24];
    [v26 addObject:v23];
    goto LABEL_42;
  }
LABEL_21:
  v15 = [a1 recurrenceRule];
  if (v15)
  {
    v16 = objc_opt_new();
    v17 = [a1 startDateForNextOccurrence];
    if (v17)
    {
      v18 = [v16 naturalLanguageDescriptionForRecurrenceRule:v15 withStartDate:v17];
    }
    else
    {
      v19 = [a1 startDate];
      v18 = [v16 naturalLanguageDescriptionForRecurrenceRule:v15 withStartDate:v19];
    }
    [v8 setObject:v18 forKeyedSubscript:@"Recurrence"];
  }
  v20 = [a1 timeSensitiveDescriptionString];
  [v8 setObject:v20 forKeyedSubscript:@"TimeSensitive"];
}

- (id)descriptionStrings:()CUIKDescription
{
  v5 = objc_opt_new();
  [a1 _populateDescriptionStringsArray:0 dictionary:v5 options:a3];
  v6 = (void *)[v5 copy];

  return v6;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  v5 = objc_opt_new();
  [a1 _populateDescriptionStringsArray:v5 dictionary:0 options:a3];
  v6 = (void *)[v5 copy];

  return v6;
}

- (id)_identityStringWithOptions:()CUIKDescription
{
  if ([a1 isProposedNewTime])
  {
    v5 = [a1 expandedProposedTimeAttendee];
    v6 = [a1 _identityStringForIdentity:v5 withOptions:a3];
  }
  else
  {
    v6 = [a1 _identityStringForIdentity:a1 withOptions:a3];
  }

  return v6;
}

- (id)_organizerString:()CUIKDescription
{
  if ([a1 type] == 2)
  {
    v5 = CUIKBundle();
    v6 = v5;
    v7 = @"Canceled by %@";
  }
  else
  {
    v5 = CUIKBundle();
    v6 = v5;
    if ((a3 & 0x80) != 0) {
      id v8 = @"From: %@";
    }
    else {
      id v8 = @"Invitation from %@";
    }
    if ((a3 & 4) != 0) {
      v7 = v8;
    }
    else {
      v7 = @"%@";
    }
  }
  uint64_t v9 = [v5 localizedStringForKey:v7 value:&stru_1F187C430 table:0];

  v10 = [a1 _identityStringWithOptions:a3];
  v11 = [NSString localizedStringWithValidatedFormat:v9, @"%@", 0, v10 validFormatSpecifiers error];

  return v11;
}

- (uint64_t)_attendeeString:()CUIKDescription
{
  return 0;
}

- (uint64_t)_attendeeReplyStringWithOptions:()CUIKDescription descriptions:
{
  id v5 = a4;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  uint64_t v98 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__12;
  v77 = __Block_byref_object_dispose__12;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__12;
  v71 = __Block_byref_object_dispose__12;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__12;
  v65 = __Block_byref_object_dispose__12;
  id v66 = (id)objc_opt_new();
  v6 = [a1 attendees];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __103__EKCalendarEventInvitationNotification_CUIKDescription___attendeeReplyStringWithOptions_descriptions___block_invoke;
  v51[3] = &unk_1E636B030;
  v53 = &v79;
  v54 = &v67;
  v55 = &v91;
  id v7 = v5;
  id v52 = v7;
  v56 = &v95;
  v57 = &v87;
  v58 = &v61;
  v59 = &v73;
  v60 = &v83;
  [v6 enumerateObjectsUsingBlock:v51];

  uint64_t v8 = v92[3];
  BOOL v9 = v8 > 1 || v96[3] > 1 || v88[3] > 1;
  char v10 = *((unsigned char *)v84 + 24) | v9;
  *((unsigned char *)v84 + 24) = v10;
  if (*((unsigned char *)v80 + 24))
  {
    v11 = [a1 owner];
    v12 = CalShortDisplayStringForNotificationIdentity(v11, 1, 0);

    uint64_t v13 = [a1 owner];
    v14 = (void *)v74[5];
    v74[5] = v13;

    v15 = NSString;
    v16 = CUIKBundle();
    v17 = [v16 localizedStringForKey:@"%@ declined to move the event to your proposed time" value:&stru_1F187C430 table:0];
    v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v12);
    [v7 setObject:v18 forKeyedSubscript:@"Action"];

LABEL_7:
LABEL_27:

    goto LABEL_28;
  }
  if (v10)
  {
    v19 = (void *)v74[5];
    v74[5] = 0;

    v12 = objc_opt_new();
    uint64_t v20 = v92[3];
    if (v20 == 1)
    {
      v21 = NSString;
      v22 = CUIKBundle();
      v23 = [v22 localizedStringForKey:@"%@ declined" value:&stru_1F187C430 table:0];
      v24 = CalShortDisplayStringForNotificationIdentity((void *)v68[5], 1, 0);
      id v25 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v24);
      [v12 appendString:v25];

      id v26 = v74;
      id v27 = (id)v68[5];
      v28 = (void *)v26[5];
      v26[5] = (uint64_t)v27;
    }
    else
    {
      if (v20 <= 1)
      {
LABEL_16:
        if (v96[3] >= 1)
        {
          if ([v12 length]) {
            [v12 appendString:@"\n"];
          }
          v37 = NSString;
          v38 = CUIKBundle();
          v39 = [v38 localizedStringForKey:@"invitees_commented" value:&stru_1F187C430 table:0];
          v40 = objc_msgSend(v37, "localizedStringWithFormat:", v39, v96[3]);
          [v12 appendString:v40];

          if (v96[3] > 1) {
            [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"MultipleComments"];
          }
        }
        if (v88[3] >= 1)
        {
          if ([v12 length]) {
            [v12 appendString:@"\n"];
          }
          v41 = NSString;
          v42 = CUIKBundle();
          v43 = [v42 localizedStringForKey:@"invitees_proposed_time" value:&stru_1F187C430 table:0];
          v44 = objc_msgSend(v41, "localizedStringWithFormat:", v43, v88[3]);
          [v12 appendString:v44];

          if (v88[3] >= 2) {
            [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"TimeProposals"];
          }
        }
        [v7 setObject:v12 forKeyedSubscript:@"Action"];
        goto LABEL_27;
      }
      v34 = NSString;
      v28 = CUIKBundle();
      v35 = [v28 localizedStringForKey:@"invitees_declined_short" value:&stru_1F187C430 table:0];
      v36 = objc_msgSend(v34, "localizedStringWithFormat:", v35, v92[3]);
      [v12 appendString:v36];
    }
    goto LABEL_16;
  }
  if (v88[3] < 1)
  {
    if (v8 < 1)
    {
      v50 = NSString;
      if (v96[3] < 1)
      {
        v12 = CUIKBundle();
        v16 = [v12 localizedStringForKey:@"Message" value:&stru_1F187C430 table:0];
        v17 = [v50 localizedStringWithFormat:v16];
        [v7 setObject:v17 forKeyedSubscript:@"Action"];
        goto LABEL_7;
      }
      v30 = CUIKBundle();
      v31 = [v30 localizedStringForKey:@"%@ commented" value:&stru_1F187C430 table:0];
      v32 = CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
      v33 = objc_msgSend(v50, "localizedStringWithFormat:", v31, v32);
      [v7 setObject:v33 forKeyedSubscript:@"Action"];
    }
    else
    {
      v49 = NSString;
      v30 = CUIKBundle();
      v31 = [v30 localizedStringForKey:@"%@ declined" value:&stru_1F187C430 table:0];
      v32 = CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
      v33 = objc_msgSend(v49, "localizedStringWithFormat:", v31, v32);
      [v7 setObject:v33 forKeyedSubscript:@"Action"];
    }
  }
  else
  {
    v29 = NSString;
    v30 = CUIKBundle();
    v31 = [v30 localizedStringForKey:@"%@ proposed a new time" value:&stru_1F187C430 table:0];
    v32 = CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
    v33 = objc_msgSend(v29, "localizedStringWithFormat:", v31, v32);
    [v7 setObject:v33 forKeyedSubscript:@"Action"];
  }

  [v7 setObject:v74[5] forKeyedSubscript:@"ImportantAttendee"];
LABEL_28:
  if ([(id)v62[5] length])
  {
    v45 = NSString;
    v46 = [v7 objectForKeyedSubscript:@"Action"];
    v47 = [v45 stringWithFormat:@"%@\n%@", v46, v62[5]];
    [v7 setObject:v47 forKeyedSubscript:@"Action"];
  }
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  return 0;
}

- (id)_dateString:()CUIKDescription
{
  if ([a1 timeChanged])
  {
    id v5 = CUIKBundle();
    v6 = v5;
    id v7 = @"Time changed to %@";
    goto LABEL_5;
  }
  if ([a1 dateChanged])
  {
    id v5 = CUIKBundle();
    v6 = v5;
    id v7 = @"Date changed to %@";
LABEL_5:
    uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1F187C430 table:0];

    if (v8)
    {
      uint64_t v9 = 0;
LABEL_9:
      uint64_t v10 = [a1 isAllDay];
      v11 = [a1 startDateForNextOccurrence];
      if (v11)
      {
        v12 = +[CUIKDateDescriptionGenerator sharedGenerator];
        uint64_t v13 = [v12 dateStringForDate:v11 allDay:v10 standalone:v9 shortFormat:0];

        v14 = [NSString localizedStringWithValidatedFormat:v8, @"%@", 0, v13 validFormatSpecifiers error];
      }
      else
      {
        v14 = 0;
      }

      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if ((a3 & 0x100) == 0)
  {
    uint64_t v8 = @"%@";
    uint64_t v9 = 1;
    goto LABEL_9;
  }
LABEL_11:
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_locationString:()CUIKDescription
{
  if (![a1 isLocationDecline])
  {
    if ([a1 type] != 3)
    {
      int v7 = [a1 locationChanged];
      int v8 = [a1 videoConferenceChanged];
      int v9 = v8;
      if (v7)
      {
        uint64_t v10 = CUIKBundle();
        v3 = v10;
        if (v9) {
          v11 = @"Location changed and Video Call updated";
        }
        else {
          v11 = @"Location changed";
        }
        goto LABEL_11;
      }
      if (v8)
      {
        uint64_t v10 = CUIKBundle();
        v3 = v10;
        v11 = @"Video Call updated";
LABEL_11:
        v6 = [v10 localizedStringForKey:v11 value:&stru_1F187C430 table:0];
        goto LABEL_12;
      }
    }
    v6 = 0;
    goto LABEL_13;
  }
  v2 = NSString;
  v3 = CUIKBundle();
  v4 = [v3 localizedStringForKey:@"%@ is unavailable" value:&stru_1F187C430 table:0];
  id v5 = [a1 name];
  v6 = objc_msgSend(v2, "localizedStringWithFormat:", v4, v5);

LABEL_12:
LABEL_13:

  return v6;
}

- (id)_recurrenceChangedString
{
  if ([a1 recurrenceChanged])
  {
    v1 = CUIKBundle();
    v2 = [v1 localizedStringForKey:@"Repeat frequency or end date changed" value:&stru_1F187C430 table:0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end