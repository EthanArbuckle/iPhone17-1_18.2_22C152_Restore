@interface EKUIAutocompleteTracker
+ (BOOL)_isChangeToTrackedPropertySignificant:(unint64_t)a3;
+ (BOOL)_trackedEventProperty:(unint64_t)a3 isPresentInAutocompleteResult:(id)a4;
+ (BOOL)_trackedEventProperty:(unint64_t)a3 wasOverriddenInEvent:(id)a4 fromAutocompleteResult:(id)a5;
+ (id)propertyName:(unint64_t)a3;
- (BOOL)_trackedEventProperty:(unint64_t)a3 wasSetInNewEvent:(id)a4;
- (BOOL)initialIsAllDay;
- (EKCalendar)initialCalendar;
- (NSDate)initialEndDate;
- (NSDate)initialStartDate;
- (NSTimeZone)initialTimeZone;
- (unint64_t)finalNumberOfAutocompleteResults;
- (void)_augmentPayload:(id)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7;
- (void)finalizeAutocompleteTrackingOnSave:(BOOL)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7;
- (void)setFinalNumberOfAutocompleteResults:(unint64_t)a3;
- (void)setInitialCalendar:(id)a3;
- (void)setInitialEndDate:(id)a3;
- (void)setInitialIsAllDay:(BOOL)a3;
- (void)setInitialStartDate:(id)a3;
- (void)setInitialTimeZone:(id)a3;
- (void)trackAutocompleteQuery;
- (void)trackAutocompleteResultsShown;
- (void)trackNLResultShown;
- (void)trackZKWQuery;
- (void)trackZKWResultShown;
@end

@implementation EKUIAutocompleteTracker

- (void)trackZKWQuery
{
  self->_hasTrackedZKWQuery = 1;
}

- (void)trackZKWResultShown
{
  self->_hasTrackedZKWResultShown = 1;
}

- (void)trackNLResultShown
{
  self->_hasTrackedNLResultShown = 1;
}

- (void)trackAutocompleteQuery
{
  self->_hasTrackedAutocompleteQuery = 1;
}

- (void)trackAutocompleteResultsShown
{
  self->_hasTrackedAutocompleteResultsShown = 1;
}

- (void)finalizeAutocompleteTrackingOnSave:(BOOL)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a3;
  v30[8] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (!self->_hasFinalizedTracking)
  {
    BOOL v24 = v7;
    self->_hasFinalizedTracking = 1;
    unint64_t v23 = a6;
    if (v13) {
      unint64_t v15 = a6 + 1;
    }
    else {
      unint64_t v15 = 0;
    }
    v29[0] = @"ZKWQueryStarted";
    v28 = [NSNumber numberWithBool:self->_hasTrackedZKWQuery];
    v30[0] = v28;
    v29[1] = @"ZKWResultShown";
    v27 = [NSNumber numberWithBool:self->_hasTrackedZKWResultShown];
    v30[1] = v27;
    v29[2] = @"NLResultShown";
    v26 = [NSNumber numberWithBool:self->_hasTrackedNLResultShown];
    v30[2] = v26;
    v29[3] = @"AutocompleteQueryStarted";
    v16 = [NSNumber numberWithBool:self->_hasTrackedAutocompleteQuery];
    v30[3] = v16;
    v29[4] = @"AutocompleteResultsShown";
    v17 = [NSNumber numberWithBool:self->_hasTrackedAutocompleteResultsShown];
    v30[4] = v17;
    v29[5] = @"NumberOfAutocompleteResults";
    v18 = [NSNumber numberWithUnsignedInteger:self->_finalNumberOfAutocompleteResults];
    v30[5] = v18;
    v29[6] = @"EventSaved";
    BOOL v25 = v10;
    v19 = [NSNumber numberWithBool:v10];
    v30[6] = v19;
    v29[7] = @"WhichResultSelected";
    v20 = [NSNumber numberWithUnsignedInteger:v15];
    v30[7] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
    v22 = (void *)[v21 mutableCopy];

    if (v14 && self->_finalNumberOfAutocompleteResults && v25) {
      [(EKUIAutocompleteTracker *)self _augmentPayload:v22 withEvent:v12 selectedResult:v14 selectedIndex:v23 isZKW:v24];
    }
    CalAnalyticsSendEvent();
  }
}

- (void)_augmentPayload:(id)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7
{
  BOOL v7 = a7;
  id v30 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v7)
  {
    if (self->_hasTrackedAutocompleteResultsShown) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = [v12 source] == 2;
  }
  unint64_t v15 = [NSNumber numberWithUnsignedInteger:v14];
  [v30 setObject:v15 forKeyedSubscript:@"SelectionType"];

  int v29 = 0;
  for (uint64_t i = 0; i != 11; ++i)
  {
    BOOL v17 = [(EKUIAutocompleteTracker *)self _trackedEventProperty:i wasSetInNewEvent:v11];
    uint64_t v18 = [(id)objc_opt_class() _trackedEventProperty:i isPresentInAutocompleteResult:v13];
    uint64_t v19 = [(id)objc_opt_class() _trackedEventProperty:i wasOverriddenInEvent:v11 fromAutocompleteResult:v13];
    uint64_t v20 = v19;
    if (v17 && v18 ^ 1 | v19) {
      v29 |= [(id)objc_opt_class() _isChangeToTrackedPropertySignificant:i];
    }
    v21 = +[EKUIAutocompleteTracker propertyName:i];
    v22 = [NSNumber numberWithBool:v17];
    unint64_t v23 = [v21 stringByAppendingString:@"SetInEvent"];
    [v30 setObject:v22 forKeyedSubscript:v23];

    BOOL v24 = [NSNumber numberWithBool:v18];
    BOOL v25 = [v21 stringByAppendingString:@"PresentInResult"];
    [v30 setObject:v24 forKeyedSubscript:v25];

    v26 = [NSNumber numberWithBool:v20];
    v27 = [v21 stringByAppendingString:@"Overridden"];
    [v30 setObject:v26 forKeyedSubscript:v27];
  }
  v28 = [NSNumber numberWithInt:(v29 & 1) == 0];
  [v30 setObject:v28 forKeyedSubscript:@"CompleteWin"];
}

+ (id)propertyName:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return @"Title";
  }
  else {
    return off_1E6089FF0[a3 - 1];
  }
}

+ (BOOL)_isChangeToTrackedPropertySignificant:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

+ (BOOL)_trackedEventProperty:(unint64_t)a3 isPresentInAutocompleteResult:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  BOOL v8 = 1;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 7uLL:
      break;
    case 1uLL:
      v9 = [v6 clientLocation];
      if (!v9)
      {
        BOOL v10 = [v7 structuredLocation];
        BOOL v8 = v10 != 0;
      }
      goto LABEL_9;
    case 3uLL:
    case 4uLL:
    case 8uLL:
      goto LABEL_5;
    case 5uLL:
      id v13 = [v6 attendees];
      goto LABEL_8;
    case 6uLL:
      id v13 = [v6 alarms];
LABEL_8:
      v9 = v13;
      BOOL v8 = [v13 count] != 0;
LABEL_9:

      break;
    case 9uLL:
      uint64_t v14 = [v6 URL];
      goto LABEL_12;
    case 0xAuLL:
      uint64_t v14 = [v6 notes];
LABEL_12:
      BOOL v8 = v14 != 0;

      break;
    default:
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"+[EKUIAutocompleteTracker _trackedEventProperty:isPresentInAutocompleteResult:]"];
      [v11 handleFailureInMethod:a2, 1, @"EKUIAutocompleteTracker.m", 206, @"Unknown property id %lu in %@", a3, v12 object file lineNumber description];

LABEL_5:
      BOOL v8 = 0;
      break;
  }

  return v8;
}

- (BOOL)_trackedEventProperty:(unint64_t)a3 wasSetInNewEvent:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  LOBYTE(v8) = 1;
  switch(a3)
  {
    case 0uLL:
      break;
    case 1uLL:
      v9 = [v6 location];
      if (!v9)
      {
        BOOL v10 = [v7 preferredLocation];
        LOBYTE(v8) = v10 != 0;
      }
      goto LABEL_16;
    case 2uLL:
      if (self->_initialIsAllDay != [v6 isAllDay]) {
        break;
      }
      uint64_t v14 = [v7 startDate];
      if ([v14 isEqualToDate:self->_initialStartDate])
      {
        unint64_t v15 = [v7 endDateUnadjustedForLegacyClients];
        if ([v15 isEqualToDate:self->_initialEndDate])
        {
          v16 = [v7 timeZone];
          int v8 = [v16 isEqualToTimeZone:self->_initialTimeZone] ^ 1;
        }
      }
      goto LABEL_18;
    case 3uLL:
      [v6 travelTime];
      BOOL v18 = v17 == 0.0;
      goto LABEL_23;
    case 4uLL:
      LOBYTE(v8) = [v6 hasRecurrenceRules];
      break;
    case 5uLL:
      uint64_t v19 = [v6 attendees];
      goto LABEL_15;
    case 6uLL:
      uint64_t v19 = [v6 alarms];
LABEL_15:
      v9 = v19;
      LOBYTE(v8) = [v19 count] != 0;
LABEL_16:

      break;
    case 7uLL:
      uint64_t v14 = [v6 calendar];
      int v8 = [v14 isEqual:self->_initialCalendar] ^ 1;
LABEL_18:

      break;
    case 8uLL:
      if ([v6 allowsAvailabilityModifications] && objc_msgSend(v7, "availability")) {
        break;
      }
      if (![v7 allowsPrivacyLevelModifications]) {
        goto LABEL_26;
      }
      BOOL v18 = [v7 privacyLevel] == 0;
LABEL_23:
      LOBYTE(v8) = !v18;
      break;
    case 9uLL:
      id v11 = [v6 URL];
      goto LABEL_28;
    case 0xAuLL:
      id v11 = [v6 notes];
LABEL_28:
      LOBYTE(v8) = v11 != 0;

      break;
    default:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[EKUIAutocompleteTracker _trackedEventProperty:wasSetInNewEvent:]"];
      [v12 handleFailureInMethod:1, self, @"EKUIAutocompleteTracker.m", 243, @"Unknown property id %lu in %@", a3, v13 object file lineNumber description];

LABEL_26:
      LOBYTE(v8) = 0;
      break;
  }

  return v8;
}

+ (BOOL)_trackedEventProperty:(unint64_t)a3 wasOverriddenInEvent:(id)a4 fromAutocompleteResult:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([a1 _trackedEventProperty:a3 isPresentInAutocompleteResult:v10])
  {
    switch(a3)
    {
      case 0uLL:
        id v11 = [v9 title];
        id v12 = [v10 title];
        char v13 = [v11 isEqualToString:v12];
        goto LABEL_26;
      case 1uLL:
        id v11 = [v10 preferredLocation];
        if (v11)
        {
          id v12 = [v9 preferredLocation];
          uint64_t v14 = [v10 preferredLocation];
          int v15 = [v12 isEqualToLocation:v14] ^ 1;

LABEL_27:
        }
        else
        {
          LOBYTE(v15) = 0;
        }

        break;
      case 2uLL:
        v16 = [v9 startDate];
        double v17 = [v10 startDate];
        char v18 = [v16 isEqualToDate:v17];

        uint64_t v19 = [v9 endDateUnadjustedForLegacyClients];
        uint64_t v20 = [v10 endDate];
        char v21 = [(id)v19 isEqualToDate:v20];

        LODWORD(v19) = [v9 isAllDay];
        int v22 = v19 ^ [v10 allDay];
        unint64_t v23 = [v10 timeZone];
        if (v23)
        {
          BOOL v24 = [v9 timeZone];
          BOOL v25 = [v10 timeZone];
          int v26 = [v24 isEqualToTimeZone:v25] ^ 1;
        }
        else
        {
          LOBYTE(v26) = 0;
        }

        LOBYTE(v15) = v18 & v21 ^ 1 | v22 | v26;
        break;
      case 5uLL:
        int v29 = [v9 attendees];
        uint64_t v30 = [v29 count];
        v31 = [v10 attendees];
        uint64_t v32 = [v31 count];

        if (v30 != v32) {
          goto LABEL_30;
        }
        v33 = [v9 attendees];
        uint64_t v34 = [v33 count];

        if (!v34) {
          goto LABEL_9;
        }
        uint64_t v35 = 0;
        do
        {
          v36 = [v9 attendees];
          v37 = [v36 objectAtIndexedSubscript:v35];
          v38 = [v10 attendees];
          v39 = [v38 objectAtIndexedSubscript:v35];
          char v40 = [v37 isEqualToParticipant:v39];

          if ((v40 & 1) == 0) {
            break;
          }
          ++v35;
          v41 = [v9 attendees];
          uint64_t v42 = [v41 count];
        }
        while (v35 != v42);
        goto LABEL_21;
      case 6uLL:
        v43 = [v9 alarms];
        uint64_t v44 = [v43 count];
        v45 = [v10 alarms];
        uint64_t v46 = [v45 count];

        if (v44 == v46)
        {
          v47 = [v9 alarms];
          uint64_t v48 = [v47 count];

          if (!v48) {
            goto LABEL_9;
          }
          uint64_t v49 = 0;
          do
          {
            v50 = [v9 alarms];
            v51 = [v50 objectAtIndexedSubscript:v49];
            v52 = [v10 alarms];
            v53 = [v52 objectAtIndexedSubscript:v49];
            char v40 = [v51 isTopographicallyEqualToAlarm:v53];

            if ((v40 & 1) == 0) {
              break;
            }
            ++v49;
            v54 = [v9 alarms];
            uint64_t v55 = [v54 count];
          }
          while (v49 != v55);
LABEL_21:
          LOBYTE(v15) = v40 ^ 1;
        }
        else
        {
LABEL_30:
          LOBYTE(v15) = 1;
        }
        break;
      case 7uLL:
        id v11 = [v9 calendar];
        uint64_t v56 = [v10 calendar];
        goto LABEL_25;
      case 9uLL:
        id v11 = [v9 URL];
        uint64_t v56 = [v10 URL];
        goto LABEL_25;
      case 0xAuLL:
        id v11 = [v9 notes];
        uint64_t v56 = [v10 notes];
LABEL_25:
        id v12 = (void *)v56;
        char v13 = [v11 isEqual:v56];
LABEL_26:
        LOBYTE(v15) = v13 ^ 1;
        goto LABEL_27;
      default:
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        v28 = [NSString stringWithUTF8String:"+[EKUIAutocompleteTracker _trackedEventProperty:wasOverriddenInEvent:fromAutocompleteResult:]"];
        [v27 handleFailureInMethod:a2, a1, @"EKUIAutocompleteTracker.m", 318, @"Unknown property id %lu in %@", a3, v28 object file lineNumber description];

        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)finalNumberOfAutocompleteResults
{
  return self->_finalNumberOfAutocompleteResults;
}

- (void)setFinalNumberOfAutocompleteResults:(unint64_t)a3
{
  self->_finalNumberOfAutocompleteResults = a3;
}

- (NSDate)initialStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitialStartDate:(id)a3
{
}

- (NSDate)initialEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialEndDate:(id)a3
{
}

- (NSTimeZone)initialTimeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialTimeZone:(id)a3
{
}

- (BOOL)initialIsAllDay
{
  return self->_initialIsAllDay;
}

- (void)setInitialIsAllDay:(BOOL)a3
{
  self->_initialIsAllDay = a3;
}

- (EKCalendar)initialCalendar
{
  return (EKCalendar *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInitialCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCalendar, 0);
  objc_storeStrong((id *)&self->_initialTimeZone, 0);
  objc_storeStrong((id *)&self->_initialEndDate, 0);

  objc_storeStrong((id *)&self->_initialStartDate, 0);
}

@end