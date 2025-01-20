@interface CaliTIPHandler
+ (BOOL)diffsAreImportant:(id)a3;
+ (BOOL)doScheduleChanges:(id)a3 applyToEvent:(id)a4 inCalendar:(id)a5;
+ (BOOL)handleEvent:(id)a3 calEvent:(void *)a4 eventID:(id)a5 database:(CalDatabase *)a6 message:(id)a7 accountInfo:(id)a8;
+ (BOOL)isAddressMe:(id)a3 withAccountInfo:(id)a4;
+ (BOOL)myStatusNeedsActionForEvent:(id)a3 withAccountInfo:(id)a4;
+ (id)_calculateDiffsForCalEvent:(void *)a3 icsEvent:(id)a4 inMessage:(id)a5;
+ (id)debugStringForEvent:(id)a3;
+ (id)getOccurrenceChange:(id)a3 forEvent:(id)a4 inCalendar:(id)a5;
+ (id)myAddressWithAccountInfo:(id)a3 forEvent:(id)a4;
+ (void)copyEventInStore:(void *)a3 appropriateForHandlingMessageForEventUID:(id)a4 inDatabase:(CalDatabase *)a5;
+ (void)processMessage:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 options:(unint64_t)a8;
+ (void)processMessages:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 cancellationToken:(id)a8 options:(unint64_t)a9;
@end

@implementation CaliTIPHandler

+ (void)processMessages:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 cancellationToken:(id)a8 options:(unint64_t)a9
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  v15 = [a3 allObjects];
  v16 = [v15 sortedArrayUsingSelector:sel_compare_];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v28 != v20) {
        objc_enumerationMutation(v17);
      }
      v22 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
      if ([v14 isCancelled]) {
        break;
      }
      v23 = [v22 event];

      if (v23) {
        [a1 processMessage:v22 withDatabase:a4 calStore:a5 accountInfo:v12 handledEventCallback:v13 options:a9];
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v19) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (BOOL)diffsAreImportant:(id)a3
{
  id v3 = a3;
  if (([v3 containsObject:II_LOCATION_KEY] & 1) != 0
    || ([v3 containsObject:II_ALL_DAY_KEY] & 1) != 0
    || ([v3 containsObject:II_FROM_KEY] & 1) != 0
    || ([v3 containsObject:II_VIDEOCONFERENCE_KEY] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 containsObject:II_RECURRENCE_KEY];
  }

  return v4;
}

+ (id)debugStringForEvent:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "recurrence_id");

  if (v4)
  {
    v5 = NSString;
    v6 = [v3 uid];
    v7 = objc_msgSend(v3, "recurrence_id");
    v8 = [v7 value];
    v9 = [v5 stringWithFormat:@"%@ (%@)", v6, v8];
  }
  else
  {
    v9 = [v3 uid];
  }

  return v9;
}

+ (id)getOccurrenceChange:(id)a3 forEvent:(id)a4 inCalendar:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v9, "recurrence_id");

  if (v11)
  {
    id v34 = a1;
    id v12 = objc_msgSend(v9, "recurrence_id");
    id v13 = [v10 systemDateForDate:v12 options:1];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = [v8 recurrenceIDs];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v20 = [v10 systemDateForDate:v19 options:1];
          if ([v13 isEqual:v20])
          {
            uint64_t v21 = (void *)CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
            {
              v22 = v21;
              v23 = [v34 debugStringForEvent:v9];
              *(_DWORD *)buf = 138412290;
              v40 = v23;
              _os_log_impl(&dword_1A8E81000, v22, OS_LOG_TYPE_DEBUG, "event has occurrence change: %@", buf, 0xCu);
            }
            v24 = [v8 changeForOccurrence:v19];

            goto LABEL_23;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    a1 = v34;
    goto LABEL_16;
  }
  v25 = [v8 recurrenceIDs];
  if ([v25 count])
  {
    v26 = [v8 masterChange];

    if (!v26)
    {
LABEL_16:
      long long v27 = (void *)CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
      {
        long long v28 = v27;
        long long v29 = [a1 debugStringForEvent:v9];
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_log_impl(&dword_1A8E81000, v28, OS_LOG_TYPE_DEBUG, "event does NOT have occurrence change: %@", buf, 0xCu);
      }
      v24 = 0;
      goto LABEL_23;
    }
  }
  else
  {
  }
  long long v30 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v31 = v30;
    uint64_t v32 = [a1 debugStringForEvent:v9];
    *(_DWORD *)buf = 138412290;
    v40 = v32;
    _os_log_impl(&dword_1A8E81000, v31, OS_LOG_TYPE_DEBUG, "event has occurrence change: %@", buf, 0xCu);
  }
  v24 = [v8 masterChange];
LABEL_23:

  return v24;
}

+ (BOOL)doScheduleChanges:(id)a3 applyToEvent:(id)a4 inCalendar:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isCreate])
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = objc_msgSend(v8, "recurrence_id");

    if (v11)
    {
      id v12 = objc_msgSend(v8, "recurrence_id");
      id v13 = [v9 systemDateForDate:v12 options:1];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = [v7 recurrenceIDs];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v23 = v8;
        uint64_t v17 = *(void *)v25;
        BOOL v10 = 1;
LABEL_6:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [v9 systemDateForDate:*(void *)(*((void *)&v24 + 1) + 8 * v18) options:1];
          char v20 = [v13 isEqual:v19];

          if (v20) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v16) {
              goto LABEL_6;
            }
            BOOL v10 = 0;
            break;
          }
        }
        id v8 = v23;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      id v13 = [v7 recurrenceIDs];
      if ([v13 count])
      {
        uint64_t v21 = [v7 masterChange];
        BOOL v10 = v21 != 0;
      }
      else
      {
        BOOL v10 = 1;
      }
    }
  }
  return v10;
}

+ (BOOL)isAddressMe:(id)a3 withAccountInfo:(id)a4
{
  id v5 = a4;
  v6 = [a3 absoluteString];
  char v7 = [v5 addressIsAccountOwner:v6];

  return v7;
}

+ (id)myAddressWithAccountInfo:(id)a3 forEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = objc_msgSend(a4, "attendee", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 value];
        char v14 = [a1 isAddressMe:v13 withAccountInfo:v6];

        if (v14)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

+ (BOOL)myStatusNeedsActionForEvent:(id)a3 withAccountInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = objc_msgSend(a3, "attendee", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 partstat] < 2 || objc_msgSend(v12, "rsvp"))
        {
          id v13 = [v12 value];
          char v14 = [a1 isAddressMe:v13 withAccountInfo:v6];

          if (v14)
          {
            BOOL v15 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

+ (void)copyEventInStore:(void *)a3 appropriateForHandlingMessageForEventUID:(id)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)CalDatabaseCopyAllEventsWithUniqueIdentifierInStore((os_unfair_lock_s *)a5, (const __CFString *)a4, (uint64_t)a3);
  CFTypeRef v6 = (CFTypeRef)[v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(const void **)(*((void *)&v12 + 1) + 8 * i);
        if (CalEventIsOnCalendarThatAllowsScheduling((uint64_t)v9))
        {
          CFTypeRef v6 = CFRetain(v9);
          goto LABEL_14;
        }
        uint64_t v10 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v17 = v9;
          _os_log_impl(&dword_1A8E81000, v10, OS_LOG_TYPE_INFO, "Rejecting candidate event for iTIP message because it is on a calendar that does not allow scheduling %@", buf, 0xCu);
        }
      }
      CFTypeRef v6 = (CFTypeRef)[v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (void *)v6;
}

+ (void)processMessage:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 options:(unint64_t)a8
{
  char v67 = a8;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v66 = a6;
  v65 = (void (**)(void))a7;
  v70 = v11;
  v73 = [v11 calendar];
  long long v12 = [v11 allOccurrences];
  long long v13 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = v13;
    long long v15 = [v11 filename];
    *(_DWORD *)buf = 138412546;
    v81 = v15;
    __int16 v82 = 2048;
    uint64_t v83 = [v12 count];
    _os_log_impl(&dword_1A8E81000, v14, OS_LOG_TYPE_DEBUG, "process: ++++ %@ (contains %lu occurrences)", buf, 0x16u);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v12;
  uint64_t v16 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v16)
  {
    char v69 = 0;
    uint64_t v72 = *(void *)v76;
    double v18 = *MEMORY[0x1E4F57888];
    *(void *)&long long v17 = 138412546;
    long long v64 = v17;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v76 != v72) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
        uint64_t v21 = objc_msgSend(v20, "uid", v64);
        id v22 = v20;
        id v23 = v73;
        long long v24 = objc_msgSend(v22, "recurrence_id");

        *(double *)&uint64_t v25 = v18;
        if (v24)
        {
          long long v26 = objc_msgSend(v22, "recurrence_id");
          uint64_t DateTimeFromICSDate = CalCreateDateTimeFromICSDate(v26, v23);

          CalDateTimeRelease();
          uint64_t v25 = DateTimeFromICSDate;
        }

        BOOL v28 = *(double *)&v25 == 0.0 || *(double *)&v25 == v18;
        if (!v28)
        {
          uint64_t v29 = [v22 uid];
          uint64_t v30 = CalGetRecurrenceUIDFromRealUID(v29, *(double *)&v25);

          uint64_t v21 = (void *)v30;
        }
        unsigned int v31 = [v23 method];
        unsigned int v32 = v31;
        Copy = 0;
        char v34 = 1;
        if (v31 <= 5 && ((1 << v31) & 0x2C) != 0)
        {
          Copy = (void *)[a1 copyEventInStore:a5 appropriateForHandlingMessageForEventUID:v21 inDatabase:a4];
          if (Copy) {
            goto LABEL_18;
          }
          if (v32 == 3 && ((v28 | [v70 iMIPImported] ^ 1) & 1) == 0)
          {
            v49 = [v22 uid];
            v50 = (const void *)[a1 copyEventInStore:a5 appropriateForHandlingMessageForEventUID:v49 inDatabase:a4];

            v51 = CDBLogHandle;
            if (v50)
            {
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v81 = v21;
                _os_log_impl(&dword_1A8E81000, v51, OS_LOG_TYPE_INFO, "Making a new detachment with UID %@ for iTIP REPLY.", buf, 0xCu);
              }
              Copy = (void *)CalCalendarItemCreateCopy(v50, 0);
              CalEventRemoveAllRecurrences();
              CalEventAddDetachedEvent((uint64_t)v50, Copy);
              CalEventSetOriginalStartDate((uint64_t)Copy, *(CFAbsoluteTime *)&v25);
              started = (void *)CalEventCopyStartTimeZone((uint64_t)Copy);
              CFStringRef v53 = (const __CFString *)CalCFTimeZoneCopyCalTimeZone();
              CalEventSetStartDate((uint64_t)Copy, v25, v53);
              unsigned int Duration = CalEventGetDuration((uint64_t)v50);
              CalEventSetEndDate((uint64_t)Copy, *(double *)&v25 + (double)Duration);
              if (v53) {
                CFRelease(v53);
              }

              if (Copy)
              {
LABEL_18:
                if ((v69 & 1) != 0
                  && CalEventIsDetached((uint64_t)Copy)
                  && (CalEventIsSignificantlyDetachedIgnoringParticipation((uint64_t)Copy) & 1) == 0
                  && ((char v35 = [v70 iMIPImported], v32 == 3) ? (v36 = v35) : (v36 = 0), (v36 & 1) == 0))
                {
                  v57 = CDBLogHandle;
                  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = v21;
                    _os_log_impl(&dword_1A8E81000, v57, OS_LOG_TYPE_INFO, "Ignoring inbox item %@ because it's detached but not significantly", buf, 0xCu);
                  }
                }
                else
                {
                  if ((v67 & 1) == 0) {
                    goto LABEL_28;
                  }
                  id v37 = v22;
                  unint64_t v38 = [v37 sequence];
                  int SequenceNumber = CalEventGetSequenceNumber(Copy);
                  if (v38 > SequenceNumber)
                  {

                    goto LABEL_28;
                  }
                  if (v32 == 3 || v38 < SequenceNumber)
                  {
                    BOOL v55 = v38 < SequenceNumber;

                    if (v55) {
                      goto LABEL_56;
                    }
                  }
                  else
                  {
                    uint64_t ModifiedDate = CalCalendarItemCopyLastModifiedDate((uint64_t)Copy);
                    v44 = (const void *)ModifiedDate;
                    double v45 = v18;
                    if (ModifiedDate)
                    {
                      double v45 = MEMORY[0x1AD0E87A0](ModifiedDate);
                      CFRelease(v44);
                    }
                    v46 = objc_msgSend(v37, "last_modified");
                    double v47 = CalDateFromICSDateAsUTC(v46);

                    if (v47 == v18)
                    {
                      v48 = [v37 dtstamp];
                      double v47 = CalDateFromICSDateAsUTC(v48);
                    }
                    if (v45 > v47)
                    {
LABEL_56:
                      v56 = CDBLogHandle;
                      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v81 = v21;
                        _os_log_impl(&dword_1A8E81000, v56, OS_LOG_TYPE_INFO, "Ignoring message %@ because it's older than what's already in the database.", buf, 0xCu);
                      }
                      int v40 = [v70 iMIPImported];
                      goto LABEL_29;
                    }
                  }
LABEL_28:
                  int v40 = [a1 handleEvent:v22 calEvent:Copy eventID:v21 database:a4 message:v70 accountInfo:v66];
LABEL_29:
                  if (v40)
                  {
                    v41 = CDBLogHandle;
                    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v81 = v21;
                      _os_log_impl(&dword_1A8E81000, v41, OS_LOG_TYPE_DEBUG, "Event with identifier %@ handled message.", buf, 0xCu);
                    }
                    if (v65) {
                      v65[2]();
                    }
                    char v69 = 1;
LABEL_65:
                    CFRelease(Copy);
                    goto LABEL_66;
                  }
                }
                char v34 = 0;
                goto LABEL_62;
              }
            }
            else
            {
              v59 = (id)CDBLogHandle;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                v60 = [v22 uid];
                *(_DWORD *)buf = v64;
                v81 = v21;
                __int16 v82 = 2112;
                uint64_t v83 = (uint64_t)v60;
                _os_log_impl(&dword_1A8E81000, v59, OS_LOG_TYPE_INFO, "Could not find a valid event in the calendar database with uid %@. Also couldn't find the original event with uid %@.", buf, 0x16u);
              }
              Copy = 0;
            }
            char v34 = 1;
          }
          else
          {
            uint64_t v42 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v81 = v21;
              _os_log_impl(&dword_1A8E81000, v42, OS_LOG_TYPE_INFO, "Could not find a valid event in the calendar database with uid %@", buf, 0xCu);
            }
            Copy = 0;
          }
        }
LABEL_62:
        v58 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v21;
          _os_log_impl(&dword_1A8E81000, v58, OS_LOG_TYPE_DEBUG, "Event with identifier %@ didn't handle the message; looking at the next event.",
            buf,
            0xCu);
        }
        if ((v34 & 1) == 0) {
          goto LABEL_65;
        }
LABEL_66:

        ++v19;
      }
      while (v16 != v19);
      uint64_t v61 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      uint64_t v16 = v61;
    }
    while (v61);
  }

  v62 = (id)CDBLogHandle;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    v63 = [v70 filename];
    *(_DWORD *)buf = 138412290;
    v81 = v63;
    _os_log_impl(&dword_1A8E81000, v62, OS_LOG_TYPE_DEBUG, "process: ~~~~ leaving message: %@", buf, 0xCu);
  }
}

+ (BOOL)handleEvent:(id)a3 calEvent:(void *)a4 eventID:(id)a5 database:(CalDatabase *)a6 message:(id)a7 accountInfo:(id)a8
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  double v18 = [v16 calendar];
  int v19 = [v18 method];
  switch(v19)
  {
    case 5:
      int v22 = [a1 myStatusNeedsActionForEvent:v14 withAccountInfo:v17];
      LODWORD(a1) = [v16 iMIPImported];
      if (a1) {
        CalEventSetStatus(a4, 3);
      }
      id v23 = (void *)CDBLogHandle;
      BOOL v24 = os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          uint64_t v25 = v23;
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1A8E81000, v25, OS_LOG_TYPE_INFO, "Found a cancellation for an event (%d) that was proposed or invitee not yet accepted. Hiding alert for this change.", buf, 8u);
        }
        long long v26 = a4;
        int v27 = 0;
      }
      else
      {
        if (v24)
        {
          id v37 = v23;
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1A8E81000, v37, OS_LOG_TYPE_INFO, "Marking cancelled event %d as needing a notification", buf, 8u);
        }
        LOBYTE(a1) = 1;
        long long v26 = a4;
        int v27 = 1;
      }
      CalEventSetNeedsNotification((uint64_t)v26, v27);
      break;
    case 3:
      id v69 = v15;
      BOOL v28 = [v14 attendee];
      uint64_t v29 = [v28 lastObject];

      uint64_t v30 = [v29 value];
      uint64_t v31 = [v30 absoluteString];

      v68 = (void *)v31;
      CFTypeRef v32 = CalDatabaseCopyAttendeeForEventWithAddress((os_unfair_lock_s *)a6, (uint64_t)a4, v31);
      if (v32)
      {
        v33 = v32;
        int v34 = [v29 partstat];
        id v66 = v17;
        if ([v16 iMIPImported])
        {
          int Status = CalAttendeeGetStatus((uint64_t)v33);
          if (Status == CalAttendeeStatusFromICSParticipationStatus(v34))
          {
            char v36 = 0;
          }
          else
          {
            char v36 = [MEMORY[0x1E4F1CA80] setWithObject:II_ATTENDEES_KEY];
            CalAttendeeUpdateFromICSUserAddress(v29, v33, v18, 0);
          }
          LOBYTE(a1) = 1;
        }
        else
        {
          char v36 = [a1 _calculateDiffsForCalEvent:a4 icsEvent:v14 inMessage:v16];
          LOBYTE(a1) = 0;
        }
        v65 = v18;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v51 = v36;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          char v60 = (char)a1;
          uint64_t v61 = a4;
          id v63 = v16;
          int v54 = 0;
          uint64_t v55 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v71 != v55) {
                objc_enumerationMutation(v51);
              }
              v57 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              if ([v57 isEqualToString:II_ATTENDEES_KEY]) {
                BOOL v58 = v34 == 3;
              }
              else {
                BOOL v58 = 0;
              }
              if (v58)
              {
                CalParticipantSetStatusChanged((uint64_t)v33, 1);
                v54 |= 0x20u;
              }
              else if ([v57 isEqualToString:II_COMMENTS_KEY])
              {
                if (CalParticipantGetCommentChanged((uint64_t)v33)) {
                  v54 |= 0x10u;
                }
              }
              else
              {
                [v57 isEqualToString:II_PROPOSEDTIME_KEY];
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
          }
          while (v53);

          id v16 = v63;
          LOBYTE(a1) = v60;
          if (v54)
          {
            CalEventAddInvitationChangedProperties((uint64_t)v61, v54);
            LOBYTE(a1) = 1;
            CalEventSetNeedsNotification((uint64_t)v61, 1);
          }
        }
        else
        {
        }
        CFRelease(v33);

        double v18 = v65;
        id v17 = v66;
      }
      else
      {
        LOBYTE(a1) = 0;
      }

      id v15 = v69;
      break;
    case 2:
      if (!CalEventHasOccurrenceInTheFuture((uint64_t)a4))
      {
        long long v20 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v15;
          uint64_t v21 = "Ignoring inbox update for %@ because it is in the past";
          goto LABEL_25;
        }
LABEL_26:
        LOBYTE(a1) = 0;
        break;
      }
      if (CalCalendarItemGetStatus((uint64_t)a4) == 3
        && [a1 myStatusNeedsActionForEvent:v14 withAccountInfo:v17])
      {
        long long v20 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v15;
          uint64_t v21 = "Ignoring cancellation for event we never responded to (%@)";
LABEL_25:
          _os_log_impl(&dword_1A8E81000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
      if ([v16 iMIPImported])
      {
        uint64_t v38 = objc_opt_new();
      }
      else
      {
        uint64_t v38 = [a1 _calculateDiffsForCalEvent:a4 icsEvent:v14 inMessage:v16];
      }
      v39 = (void *)v38;
      if (([a1 diffsAreImportant:v38] & 1) != 0
        || [a1 myStatusNeedsActionForEvent:v14 withAccountInfo:v17]
        && !CalEventHasBeenAlerted((uint64_t)a4))
      {
        if (!CalEventIsDetached((uint64_t)a4)
          || (CalEventIsSignificantlyDetachedIgnoringParticipation((uint64_t)a4) & 1) != 0)
        {
          id v67 = v17;
          int v40 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v81 = v15;
            _os_log_impl(&dword_1A8E81000, v40, OS_LOG_TYPE_INFO, "Setting needs notification for event %@ because an iTIP request was found in the inbox", buf, 0xCu);
          }
          id v62 = v16;
          id v64 = v14;
          CalEventSetNeedsNotification((uint64_t)a4, 1);
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v41 = v39;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v74 objects:v79 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            int v44 = 0;
            uint64_t v45 = *(void *)v75;
            do
            {
              uint64_t v46 = 0;
              do
              {
                if (*(void *)v75 != v45) {
                  objc_enumerationMutation(v41);
                }
                double v47 = *(void **)(*((void *)&v74 + 1) + 8 * v46);
                if (([v47 isEqualToString:II_FROM_KEY] & 1) != 0
                  || [v47 isEqualToString:II_TO_KEY])
                {
                  v44 |= 2u;
                }
                else if ([v47 isEqualToString:II_ALL_DAY_KEY])
                {
                  v44 |= 1u;
                }
                else if ([v47 isEqualToString:II_EVENT_TITLE_KEY])
                {
                  v44 |= 4u;
                }
                else if ([v47 isEqualToString:II_LOCATION_KEY])
                {
                  v44 |= 8u;
                }
                else if ([v47 isEqualToString:II_VIDEOCONFERENCE_KEY])
                {
                  v44 |= 0x100u;
                }
                else if ([v47 isEqualToString:II_RECURRENCE_KEY])
                {
                  v44 |= 0x200u;
                }
                ++v46;
              }
              while (v43 != v46);
              uint64_t v48 = [v41 countByEnumeratingWithState:&v74 objects:v79 count:16];
              uint64_t v43 = v48;
            }
            while (v48);
          }

          CalEventSetInvitationChangedProperties((uint64_t)a4);
          LOBYTE(a1) = 1;
          id v16 = v62;
          id v14 = v64;
          id v17 = v67;
          goto LABEL_93;
        }
        v49 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v15;
          v50 = "Ignoring inbox item %@ because it's for an event that is not significantly detached";
          goto LABEL_91;
        }
      }
      else
      {
        v49 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v15;
          v50 = "Ignoring inbox item %@ because it doesn't look important";
LABEL_91:
          _os_log_impl(&dword_1A8E81000, v49, OS_LOG_TYPE_INFO, v50, buf, 0xCu);
        }
      }
      LOBYTE(a1) = 0;
LABEL_93:

      break;
    default:
      goto LABEL_26;
  }

  return (char)a1;
}

+ (id)_calculateDiffsForCalEvent:(void *)a3 icsEvent:(id)a4 inMessage:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 scheduleChanges];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = [v9 calendar];
  long long v13 = [a1 getOccurrenceChange:v10 forEvent:v8 inCalendar:v12];

  if (([v13 attendeesChanged] & 1) != 0 || objc_msgSend(v13, "participationChanged"))
  {
    [v11 addObject:II_ATTENDEES_KEY];
    id v14 = [v10 attendeeAddress];

    if (v14)
    {
      id v15 = NSString;
      uint64_t v16 = II_ATTENDEE_PREFIX;
      id v17 = [v10 attendeeAddress];
      double v18 = [v15 stringWithFormat:@"%@%@", v16, v17];
      [v11 addObject:v18];
    }
  }
  if ([v13 attachmentsChanged]) {
    [v11 addObject:II_ATTACHMENT_KEY];
  }
  if ([v13 locationChanged]) {
    [v11 addObject:II_LOCATION_KEY];
  }
  if ([v13 summaryChanged]) {
    [v11 addObject:II_EVENT_TITLE_KEY];
  }
  if ([v13 descriptionChanged])
  {
    [v11 addObject:II_NOTE_KEY];
    if ((CalEventGetInvitationChangedProperties((uint64_t)a3) & 0x100) != 0) {
      [v11 addObject:II_VIDEOCONFERENCE_KEY];
    }
  }
  if ([v13 urlChanged]) {
    [v11 addObject:II_URL_KEY];
  }
  if ([v13 privateCommentChanged]) {
    [v11 addObject:II_COMMENTS_KEY];
  }
  if ([v13 proposedStartDateChanged]) {
    [v11 addObject:II_PROPOSEDTIME_KEY];
  }
  if ([v13 startTimeChanged]) {
    [v11 addObject:II_FROM_KEY];
  }
  if ([v13 endTimeChanged]) {
    [v11 addObject:II_TO_KEY];
  }
  if ([v13 dateTimeChanged]) {
    [v11 addObject:II_ALL_DAY_KEY];
  }
  if ([v13 timeZoneChanged]) {
    [v11 addObject:II_TIME_ZONE_KEY];
  }
  if ([v13 recurrenceChanged])
  {
    uint64_t v31 = v10;
    id v32 = v9;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v33 = v8;
    int v19 = [v8 relatedTo];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      uint64_t v23 = *MEMORY[0x1E4FB8250];
LABEL_31:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void **)(*((void *)&v34 + 1) + 8 * v24);
        long long v26 = [v25 parameterValueForName:v23];
        int v27 = v26;
        if (v26)
        {
          if ([v26 longValue] == 1)
          {
            BOOL v28 = [v25 value];

            if (v28) {
              break;
            }
          }
        }

        if (v21 == ++v24)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v21) {
            goto LABEL_31;
          }
          goto LABEL_39;
        }
      }
      uint64_t v29 = [v25 value];

      if (v29) {
        goto LABEL_42;
      }
    }
    else
    {
LABEL_39:
    }
    [v11 addObject:II_RECURRENCE_KEY];
    uint64_t v29 = 0;
LABEL_42:

    id v9 = v32;
    id v8 = v33;
    uint64_t v10 = v31;
  }

  return v11;
}

@end