@interface EKCalendarItemChange
+ (int)entityType;
- (BOOL)allDayChanged;
- (BOOL)endDateChanged;
- (BOOL)endTimezoneChanged;
- (BOOL)locationChanged;
- (BOOL)notesChanged;
- (BOOL)startDateChanged;
- (BOOL)startTimezoneChanged;
- (BOOL)suppressNotificationForChanges;
- (BOOL)titleChanged;
- (EKCalendarItemChange)initWithChangeProperties:(id)a3;
- (EKObjectID)calendarID;
- (EKObjectID)oldCalendarID;
- (NSString)externalID;
- (NSString)oldExternalID;
- (NSString)uniqueID;
- (NSString)uuid;
@end

@implementation EKCalendarItemChange

+ (int)entityType
{
  return 101;
}

- (EKCalendarItemChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKCalendarItemChange;
  v5 = [(EKObjectChange *)&v34 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"calendar_id"];
    uint64_t v7 = [v6 intValue];
    v8 = [(EKObjectChange *)v5 changedObjectID];
    uint64_t v9 = +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 1, v7, [v8 databaseID]);
    calendarID = v5->_calendarID;
    v5->_calendarID = (EKObjectID *)v9;

    v11 = [v4 objectForKeyedSubscript:@"old_calendar_id"];
    if ([v11 intValue])
    {
      uint64_t v12 = [v11 intValue];
      v13 = [(EKObjectChange *)v5 changedObjectID];
      uint64_t v14 = +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 1, v12, [v13 databaseID]);
      oldCalendarID = v5->_oldCalendarID;
      v5->_oldCalendarID = (EKObjectID *)v14;
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"external_id"];
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"old_external_id"];
    oldExternalID = v5->_oldExternalID;
    v5->_oldExternalID = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"unique_identifier"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v22;

    v24 = [v4 objectForKeyedSubscript:@"summary"];
    v5->_titleChanged = [v24 BOOLValue];

    v25 = [v4 objectForKeyedSubscript:@"location_id"];
    v5->_locationChanged = [v25 BOOLValue];

    v26 = [v4 objectForKeyedSubscript:@"start_date"];
    v5->_startDateChanged = [v26 BOOLValue];

    v27 = [v4 objectForKeyedSubscript:@"start_tz"];
    v5->_startTimezoneChanged = [v27 BOOLValue];

    v28 = [v4 objectForKeyedSubscript:@"end_date"];
    v5->_endDateChanged = [v28 BOOLValue];

    v29 = [v4 objectForKeyedSubscript:@"end_tz"];
    v5->_endTimezoneChanged = [v29 BOOLValue];

    v30 = [v4 objectForKeyedSubscript:@"description"];
    v5->_notesChanged = [v30 BOOLValue];

    v31 = [v4 objectForKeyedSubscript:@"all_day"];
    v5->_allDayChanged = [v31 BOOLValue];

    v32 = [v4 objectForKeyedSubscript:@"suppress_notification_for_changes"];
    v5->_suppressNotificationForChanges = [v32 BOOLValue];
  }
  return v5;
}

- (EKObjectID)calendarID
{
  return self->_calendarID;
}

- (EKObjectID)oldCalendarID
{
  return self->_oldCalendarID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)oldExternalID
{
  return self->_oldExternalID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)titleChanged
{
  return self->_titleChanged;
}

- (BOOL)locationChanged
{
  return self->_locationChanged;
}

- (BOOL)startDateChanged
{
  return self->_startDateChanged;
}

- (BOOL)startTimezoneChanged
{
  return self->_startTimezoneChanged;
}

- (BOOL)endDateChanged
{
  return self->_endDateChanged;
}

- (BOOL)endTimezoneChanged
{
  return self->_endTimezoneChanged;
}

- (BOOL)notesChanged
{
  return self->_notesChanged;
}

- (BOOL)allDayChanged
{
  return self->_allDayChanged;
}

- (BOOL)suppressNotificationForChanges
{
  return self->_suppressNotificationForChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_oldExternalID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_oldCalendarID, 0);

  objc_storeStrong((id *)&self->_calendarID, 0);
}

@end