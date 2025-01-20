@interface EKEvent(CalendarUIKit)
- (BOOL)CUIK_deleteActionShouldDeclineEvent;
- (BOOL)CUIK_reminderShouldBeEditable;
- (__CFString)CUIK_attendeesIconSymbolWithAttendeesIconState:()CalendarUIKit myParticipantStatus:;
- (__CFString)CUIK_symbolName:()CalendarUIKit;
- (id)CUIK_currentReminder;
- (id)CUIK_disabledSymbolColor;
- (id)CUIK_symbolColor;
- (uint64_t)CUIK_attendeesIconState;
- (uint64_t)_isFirstFutureOccurrenceReminder;
@end

@implementation EKEvent(CalendarUIKit)

- (BOOL)CUIK_reminderShouldBeEditable
{
  return [a1 reminderOccurrenceType] == 0;
}

- (__CFString)CUIK_symbolName:()CalendarUIKit
{
  if ([a1 isIntegrationEvent])
  {
    int v5 = [a1 completed];
    v6 = @"circle";
    v7 = @"circle.inset.filled";
    BOOL v8 = v5 == 0;
  }
  else
  {
    if ([a1 isBirthday]) {
      return @"gift.circle.fill";
    }
    v10 = [a1 calendar];
    int v11 = [v10 isHolidayCalendar];

    v6 = @"calendar.circle.fill";
    if (!a3) {
      v6 = 0;
    }
    v7 = @"star.circle.fill";
    BOOL v8 = v11 == 0;
  }
  if (v8) {
    return v6;
  }
  else {
    return v7;
  }
}

- (__CFString)CUIK_attendeesIconSymbolWithAttendeesIconState:()CalendarUIKit myParticipantStatus:
{
  uint64_t v6 = [a1 currentUserGeneralizedParticipantRole];
  if (a4 == 3) {
    return @"person.fill.xmark";
  }
  if (v6 == 2 && (unint64_t)(a3 - 1) <= 9) {
    return off_1E6369FA8[a3 - 1];
  }
  return 0;
}

- (uint64_t)CUIK_attendeesIconState
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![a1 hasAttendees]) {
    return 0;
  }
  if (![a1 isSelfOrganized])
  {
    if ([a1 status] == 3) {
      return 10;
    }
    v21 = [a1 selfAttendee];
    uint64_t v22 = [v21 participantStatus];

    if (v22)
    {
      v23 = [a1 selfAttendee];
      uint64_t v24 = [v23 participantStatus];

      if (v24 == 3) {
        return 10;
      }
      else {
        return 8 * (v24 == 4);
      }
    }
    return 0;
  }
  [a1 attendeesNotIncludingOrganizer];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v7 isLocationRoom] && objc_msgSend(v7, "participantStatus") == 3)
        {

          uint64_t v20 = 5;
          goto LABEL_40;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = [a1 roomAttendees];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v2 count];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        if (v9 == v10
          || !objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "isLocationRoom", (void)v26)
          || [v18 participantStatus] != 2)
        {
          uint64_t v19 = objc_msgSend(v18, "participantStatus", (void)v26);
          if (v14)
          {
            if (v15 != v19)
            {
              uint64_t v20 = 6;
              goto LABEL_39;
            }
            char v14 = 1;
          }
          else
          {
            char v14 = 1;
            unint64_t v15 = v19;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    if (v14)
    {
      if (v15 >= 8) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = qword_1BE079360[v15];
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
LABEL_39:
  }
LABEL_40:

  return v20;
}

- (BOOL)CUIK_deleteActionShouldDeclineEvent
{
  id v2 = [a1 calendar];
  uint64_t v3 = [v2 source];
  if ([v3 sourceType] == 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [a1 calendar];
    uint64_t v6 = [v5 source];
    BOOL v4 = [v6 sourceType] != 2;
  }
  v7 = [a1 selfAttendee];
  uint64_t v8 = [v7 participantStatus];

  uint64_t v9 = [a1 status];
  uint64_t v10 = [a1 currentUserGeneralizedParticipantRole];
  id v11 = [a1 organizer];
  uint64_t v12 = [v11 scheduleAgent];

  BOOL result = 0;
  if (!v4 && v10 == 1)
  {
    BOOL v15 = v9 != 3 && v12 == 2;
    return v8 != 3 && v15;
  }
  return result;
}

- (id)CUIK_symbolColor
{
  if ([a1 isIntegrationEvent])
  {
    id v2 = [a1 color];
    uint64_t v3 = v2;
    if (v2) {
      objc_msgSend(v2, "CUIK_color");
    }
    else {
    BOOL v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
  }
  else
  {
    if ([a1 isBirthday]) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
    }
  }

  return v4;
}

- (id)CUIK_disabledSymbolColor
{
  v1 = objc_msgSend(a1, "CUIK_symbolColor");
  id v2 = objc_msgSend(v1, "cuik_colorWithAlphaScaled:", 0.4);

  return v2;
}

- (uint64_t)_isFirstFutureOccurrenceReminder
{
  if (![a1 isReminderIntegrationEvent]) {
    return 0;
  }
  if (![a1 hasRecurrenceRules]) {
    return 1;
  }
  id v2 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;
  uint64_t v5 = [a1 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  if (v4 >= v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [a1 previousOccurrence];
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v8 startDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  [v2 timeIntervalSinceReferenceDate];
  double v14 = v13;

  if (v12 >= v14) {
LABEL_6:
  }
    uint64_t v15 = 0;
  else {
LABEL_9:
  }
    uint64_t v15 = 1;

  return v15;
}

- (id)CUIK_currentReminder
{
  id v2 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  double v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  double v4 = [v2 dateForEndOfDayInTimeZone:v3];
  id v5 = [a1 masterEvent];
  id v6 = objc_alloc_init(MEMORY[0x1E4F255E8]);
  id v7 = [v5 timeZone];
  if (!v7) {
    id v7 = v3;
  }
  uint64_t v8 = [v5 startDate];
  uint64_t v9 = (void *)[v6 copyOccurrenceDatesWithEKEvent:v5 startDate:v8 endDate:v4 timeZone:v7 limit:0];

  uint64_t v10 = v5;
  if ([v9 count])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F25538]);
    double v12 = [v5 persistentObject];
    double v13 = [v9 lastObject];
    uint64_t v10 = (void *)[v11 initWithPersistentObject:v12 occurrenceDate:v13];
  }

  return v10;
}

@end