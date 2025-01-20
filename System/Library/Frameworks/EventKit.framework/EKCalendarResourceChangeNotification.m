@interface EKCalendarResourceChangeNotification
- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4;
- (BOOL)allDay;
- (BOOL)dateChanged;
- (BOOL)locationChanged;
- (BOOL)needsAlert;
- (BOOL)timeChanged;
- (BOOL)titleChanged;
- (EKCalendarResourceChangeNotification)initWithType:(int64_t)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDate)startDateForNextOccurrence;
- (NSNumber)createCount;
- (NSNumber)deleteCount;
- (NSNumber)updateCount;
- (NSString)calendarName;
- (NSString)eventID;
- (NSString)location;
- (id)resourceChangeFromEventStore:(id)a3;
- (unsigned)changeType;
- (void)setAllDay:(BOOL)a3;
- (void)setCalendarName:(id)a3;
- (void)setChangeType:(unsigned int)a3;
- (void)setCreateCount:(id)a3;
- (void)setDateChanged:(BOOL)a3;
- (void)setDeleteCount:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventID:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationChanged:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDateForNextOccurrence:(id)a3;
- (void)setTimeChanged:(BOOL)a3;
- (void)setTitleChanged:(BOOL)a3;
- (void)setUpdateCount:(id)a3;
@end

@implementation EKCalendarResourceChangeNotification

- (EKCalendarResourceChangeNotification)initWithType:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarResourceChangeNotification;
  return [(EKCalendarNotification *)&v4 initWithType:a3];
}

- (id)resourceChangeFromEventStore:(id)a3
{
  return (id)[a3 publicObjectWithObjectID:self->super._objectID];
}

- (BOOL)needsAlert
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarResourceChangeNotification;
  BOOL v3 = [(EKCalendarNotification *)&v5 needsAlert];
  if (v3) {
    LOBYTE(v3) = ![(EKCalendarNotification *)self hiddenFromNotificationCenter];
  }
  return v3;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(EKCalendarResourceChangeNotification *)self resourceChangeFromEventStore:v6];
  if (!v7)
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendarResourceChangeNotification acknowledgeWithEventStore:error:]((uint64_t)self, v9);
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      [MEMORY[0x1E4F28C58] errorWithCADResult:1010];
      char v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    char v8 = 0;
    goto LABEL_8;
  }
  char v8 = [v6 removeResourceChange:v7 error:a4];
LABEL_8:

  return v8;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)calendarName
{
  return self->_calendarName;
}

- (void)setCalendarName:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDateForNextOccurrence
{
  return self->_startDateForNextOccurrence;
}

- (void)setStartDateForNextOccurrence:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)allDay
{
  return self->_timeChanged;
}

- (void)setAllDay:(BOOL)a3
{
  self->_timeChanged = a3;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unsigned int)a3
{
  self->_changeType = a3;
}

- (BOOL)dateChanged
{
  return self->_locationChanged;
}

- (void)setDateChanged:(BOOL)a3
{
  self->_locationChanged = a3;
}

- (BOOL)timeChanged
{
  return self->_titleChanged;
}

- (void)setTimeChanged:(BOOL)a3
{
  self->_titleChanged = a3;
}

- (BOOL)locationChanged
{
  return *(&self->_titleChanged + 1);
}

- (void)setLocationChanged:(BOOL)a3
{
  *(&self->_titleChanged + 1) = a3;
}

- (BOOL)titleChanged
{
  return *(&self->_titleChanged + 2);
}

- (void)setTitleChanged:(BOOL)a3
{
  *(&self->_titleChanged + 2) = a3;
}

- (NSNumber)createCount
{
  return self->_createCount;
}

- (void)setCreateCount:(id)a3
{
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(id)a3
{
}

- (NSNumber)deleteCount
{
  return self->_deleteCount;
}

- (void)setDeleteCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCount, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_createCount, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_calendarName, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)acknowledgeWithEventStore:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Failed to load EKResourceChange with objectID %{public}@", (uint8_t *)&v3, 0xCu);
}

@end