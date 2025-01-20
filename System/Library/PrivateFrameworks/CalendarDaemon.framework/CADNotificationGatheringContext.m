@interface CADNotificationGatheringContext
- (BOOL)deleteOldNotifications;
- (BOOL)eventHasNewProposedTime:(void *)a3;
- (BOOL)expanded;
- (BOOL)isEventTimeSensitiveForFocus:(void *)a3;
- (BOOL)shouldSkipNotificationForCalendar:(void *)a3;
- (BOOL)shouldSkipNotificationForStore:(void *)a3;
- (CADNotificationGatheringContext)initWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9;
- (ClientConnection)connection;
- (NSArray)notifications;
- (NSDate)earliestExpiringNotification;
- (double)endDateOfLastOccurrenceInCacheForEvent:(void *)a3 database:(CalDatabase *)a4 cacheRange:(id *)a5;
- (double)expirationTimestampForEvent:(void *)a3 database:(CalDatabase *)a4;
- (double)expirationTimestampForEvent:(void *)a3 withInitialOccurrenceDate:(double)a4 database:(CalDatabase *)a5;
- (double)expirationTimestampForRecurrence:(void *)a3 event:(void *)a4 database:(CalDatabase *)a5;
- (double)now;
- (id)nearestProposedTimeForEvent:(void *)a3;
- (void)addNotification:(id)a3;
@end

@implementation CADNotificationGatheringContext

- (NSArray)notifications
{
  return &self->_notifications->super;
}

- (CADNotificationGatheringContext)initWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9
{
  BOOL v10 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CADNotificationGatheringContext;
  v19 = [(CADNotificationGatheringContext *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_connection, a3);
    objc_storeStrong((id *)&v20->_sourceExternalIdentifier, a5);
    v20->_excludingDelegateSources = a6;
    v20->_filteredByShowsNotificationsFlag = a8;
    v20->_expanded = a9;
    if (v10)
    {
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v21 = (void *)getEKCalendarVisibilityManagerClass_softClass;
      uint64_t v36 = getEKCalendarVisibilityManagerClass_softClass;
      if (!getEKCalendarVisibilityManagerClass_softClass)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __getEKCalendarVisibilityManagerClass_block_invoke;
        v32[3] = &unk_1E624EC50;
        v32[4] = &v33;
        __getEKCalendarVisibilityManagerClass_block_invoke((uint64_t)v32);
        v21 = (void *)v34[3];
      }
      id v22 = v21;
      _Block_object_dispose(&v33, 8);
      v23 = (void *)MEMORY[0x1E4F1CAD0];
      v24 = [v22 unselectedCalendarIdentifiersForFocusMode];
      uint64_t v25 = [v23 setWithArray:v24];
      uncheckedCalendarIdentifiers = v20->_uncheckedCalendarIdentifiers;
      v20->_uncheckedCalendarIdentifiers = (NSSet *)v25;
    }
    uint64_t v27 = objc_opt_new();
    notifications = v20->_notifications;
    v20->_notifications = (NSMutableArray *)v27;

    if (!v17)
    {
      id v17 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
      v20->_deleteOldNotifications = 1;
    }
    [v17 timeIntervalSinceReferenceDate];
    v20->_now = v29;
    v20->_earliestExpirationDate = *(double *)MEMORY[0x1E4F57878];
  }

  return v20;
}

- (NSDate)earliestExpiringNotification
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_earliestExpirationDate];
}

- (ClientConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_uncheckedCalendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceExternalIdentifier, 0);
}

- (BOOL)shouldSkipNotificationForStore:(void *)a3
{
  if (+[CADNotificationUtilities storeIsReadOnlyDelegate:](CADNotificationUtilities, "storeIsReadOnlyDelegate:"))
  {
    v5 = CADNotificationLogHandle;
    if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      v6 = "Filtering notification because it is in a read-only delegate";
      v7 = (uint8_t *)&v17;
LABEL_19:
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    BOOL v8 = +[CADNotificationUtilities _storeIsDelegate:a3];
    if (self->_excludingDelegateSources && v8)
    {
      v5 = CADNotificationLogHandle;
      if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      __int16 v16 = 0;
      v6 = "Filtering notification because it's in a delegate source and we're excluding delegate sources";
      v7 = (uint8_t *)&v16;
      goto LABEL_19;
    }
    if (!self->_filteredByShowsNotificationsFlag || ((CalStoreShowsNotifications() | !v8) & 1) != 0)
    {
      if (self->_sourceExternalIdentifier)
      {
        BOOL v10 = (void *)CalStoreCopyExternalID();
        if (![(NSString *)self->_sourceExternalIdentifier isEqualToString:v10])
        {
          v13 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_DEFAULT, "Filtering notification because it's not in the source we're interested in", v14, 2u);
          }

          return 1;
        }
      }
      return 0;
    }
    v5 = CADNotificationLogHandle;
    if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Filtering notification because we're filtering by showNotificationsFlag and it's not set";
      v7 = buf;
      goto LABEL_19;
    }
  }
  return 1;
}

- (BOOL)shouldSkipNotificationForCalendar:(void *)a3
{
  if (self->_uncheckedCalendarIdentifiers)
  {
    v4 = (void *)CalCalendarCopyUUID();
    BOOL v5 = [(NSSet *)self->_uncheckedCalendarIdentifiers containsObject:v4];
    if (v5)
    {
      v6 = CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "Filtering notification because its calendar is unchecked in the calendar app", v8, 2u);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (double)now
{
  return self->_now;
}

- (double)expirationTimestampForEvent:(void *)a3 withInitialOccurrenceDate:(double)a4 database:(CalDatabase *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v9 = (void *)CalCalendarItemCopyRecurrences();
  if ([v9 count])
  {
    double v10 = *MEMORY[0x1E4F57880];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          -[CADNotificationGatheringContext expirationTimestampForRecurrence:event:database:](self, "expirationTimestampForRecurrence:event:database:", *(void *)(*((void *)&v18 + 1) + 8 * v15), a3, a5, (void)v18);
          if (v10 < v16) {
            double v10 = v16;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
  else
  {
    double v10 = (double)CalEventGetDuration() + a4;
  }

  return v10;
}

- (double)expirationTimestampForRecurrence:(void *)a3 event:(void *)a4 database:(CalDatabase *)a5
{
  CalRecurrenceGetEffectiveEndDate();
  double v9 = v8;
  if (vabdd_f64(v8, *MEMORY[0x1E4F57888]) < 2.22044605e-16) {
    return *MEMORY[0x1E4F57878];
  }
  id v28 = 0;
  [(CADNotificationGatheringContext *)self endDateOfLastOccurrenceInCacheForEvent:a4 database:a5 cacheRange:&v28];
  double v10 = v11;
  id v12 = v28;
  uint64_t v13 = v12;
  if (v10 <= self->_now)
  {
    uint64_t v14 = [v12 endDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;

    if (v9 < v16) {
      goto LABEL_7;
    }
    __int16 v17 = [v13 endDate];
    [v17 timeIntervalSinceReferenceDate];
    double v19 = v18;
    long long v20 = [v13 timeZone];
    MEMORY[0x1C1864DD0](v19);

    double v21 = *MEMORY[0x1E4F57878];
    id v22 = [v13 timeZone];
    MEMORY[0x1C1864DD0](v21);

    uint64_t v23 = [v13 timeZone];
    int v24 = CalEventOccurrencesExistForEventInDateRange();

    if (v24)
    {
      uint64_t v25 = [v13 endDate];
      [v25 timeIntervalSinceReferenceDate];
      double v10 = v26;
    }
    else
    {
LABEL_7:
      double v10 = *MEMORY[0x1E4F57880];
    }
  }

  return v10;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)addNotification:(id)a3
{
  id v6 = a3;
  [(NSMutableArray *)self->_notifications addObject:v6];
  [v6 expirationDate];
  if (v4 < self->_earliestExpirationDate)
  {
    [v6 expirationDate];
    self->_earliestExpirationDate = v5;
  }
}

- (BOOL)eventHasNewProposedTime:(void *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)CalCalendarItemCopyAttendees();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (CalParticipantGetProposedStartDateChanged())
        {
          CalAttendeeGetProposedStartDate();
          if (v9 != 0.0)
          {
            if (CalEventAttendeeIsSelf() && CalAttendeeGetProposedStartDateStatus() == 3) {
              goto LABEL_14;
            }
            char v6 = 1;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
LABEL_14:
    char v6 = 0;
  }

  return v6 & 1;
}

- (id)nearestProposedTimeForEvent:(void *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)CalCalendarItemCopyAttendees();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        if (CalParticipantGetProposedStartDateChanged())
        {
          CalAttendeeGetProposedStartDate();
          if (v10 != 0.0)
          {
            double v11 = v10;
            if (CalAttendeeGetProposedStartDateStatus() != 3)
            {
              long long v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", v11, v15);
              if ([v12 isAfterDate:v3]
                && (!v7 || [v12 isBeforeDate:v7]))
              {
                id v13 = v12;

                uint64_t v7 = v13;
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isEventTimeSensitiveForFocus:(void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (CalEventGetJunkStatus() != 3)
  {
    int v6 = CalEventGetInvitationChangedProperties() & 0xF0;
    BOOL v7 = [(CADNotificationGatheringContext *)self eventHasNewProposedTime:a3];
    BOOL v8 = v7;
    if (v6 && !v7)
    {
      double v9 = (void *)CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
      {
        double v10 = v9;
        int v26 = 67109120;
        int RowID = CalCalendarItemGetRowID();
        _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is not time-sensitive because it is an attendee reply that is not a proposed time", (uint8_t *)&v26, 8u);
      }
      return 0;
    }
    CalCalendarItemGetStatus();
    double v11 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
    long long v12 = (void *)CalCopyDefaultTimeZone();
    id v13 = CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions();
    long long v14 = v13;
    if (v13)
    {
      [v13 timeIntervalSinceDate:v11];
      double v15 = *MEMORY[0x1E4F578B8];
      if (v16 <= *MEMORY[0x1E4F578B8])
      {
        int v24 = (void *)CADNotificationLogHandle;
        BOOL v5 = 1;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = v24;
          int v26 = 67109120;
          int RowID = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is time-sensitive because it starts within the time-sensitive window", (uint8_t *)&v26, 8u);
        }
        goto LABEL_19;
      }
      if (!v8) {
        goto LABEL_18;
      }
      long long v17 = [(CADNotificationGatheringContext *)self nearestProposedTimeForEvent:a3];
      long long v18 = v17;
      if (v17)
      {
        [v17 timeIntervalSinceDate:v11];
        if (v19 <= v15)
        {
          uint64_t v20 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
          {
            double v21 = v20;
            int v26 = 67109120;
            int RowID = CalCalendarItemGetRowID();
            _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is time-sensitive because it is an attendee proposed time within the time-sensitive window", (uint8_t *)&v26, 8u);
          }
          BOOL v5 = 1;
          goto LABEL_19;
        }
      }
    }
    else
    {
      id v22 = (void *)CADNotificationLogHandle;
      if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
      {
LABEL_18:
        BOOL v5 = 0;
LABEL_19:

        return v5;
      }
      long long v18 = v22;
      int v26 = 67109120;
      int RowID = CalCalendarItemGetRowID();
      _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is not time-sensitive because there is no occurrence ending after now", (uint8_t *)&v26, 8u);
    }

    goto LABEL_18;
  }
  return 0;
}

- (double)expirationTimestampForEvent:(void *)a3 database:(CalDatabase *)a4
{
  BOOL v7 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
  CalEventOccurrenceGetDate();
  double v9 = v8;
  CFRelease(v7);
  [(CADNotificationGatheringContext *)self expirationTimestampForEvent:a3 withInitialOccurrenceDate:a4 database:v9];
  return result;
}

- (double)endDateOfLastOccurrenceInCacheForEvent:(void *)a3 database:(CalDatabase *)a4 cacheRange:(id *)a5
{
  BOOL v5 = (const void *)CalFilterCreateWithDatabaseShowingAll();
  int RowID = CalCalendarItemGetRowID();
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFArrayAppendValue(Mutable, (const void *)RowID);
  double Duration = (double)CalEventGetDuration();
  double v9 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  CFArrayRef v10 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
  CFRelease(v9);
  double v11 = *MEMORY[0x1E4F57880];
  if (v10)
  {
    if (CFArrayGetCount(v10))
    {
      CFArrayGetValueAtIndex(v10, 0);
      CalEventOccurrenceGetDate();
      double v11 = v12 + Duration;
    }
    CFRelease(v10);
  }
  CFRelease(Mutable);
  CFRelease(v5);
  return v11;
}

- (BOOL)deleteOldNotifications
{
  return self->_deleteOldNotifications;
}

@end