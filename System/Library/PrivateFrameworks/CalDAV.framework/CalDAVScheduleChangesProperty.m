@interface CalDAVScheduleChangesProperty
+ (id)debugStringForType:(int)a3;
+ (id)propertyWithItem:(id)a3;
- (BOOL)isCancel;
- (BOOL)isCreate;
- (BOOL)isReply;
- (BOOL)isUpdate;
- (CalDAVOccurrenceChange)masterChange;
- (CalDAVScheduleChangesProperty)init;
- (NSArray)recurrenceIDs;
- (NSMutableDictionary)occurrenceChanges;
- (NSString)attendeeAddress;
- (NSString)dateStamp;
- (id)changeForOccurrence:(id)a3;
- (int)actionType;
- (void)addOccurrenceChange:(id)a3;
- (void)setActionType:(int)a3;
- (void)setAttendeeAddress:(id)a3;
- (void)setDateStamp:(id)a3;
- (void)setMasterChange:(id)a3;
- (void)setOccurrenceChanges:(id)a3;
@end

@implementation CalDAVScheduleChangesProperty

- (CalDAVScheduleChangesProperty)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalDAVScheduleChangesProperty;
  v2 = [(CalDAVScheduleChangesProperty *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CalDAVScheduleChangesProperty *)v2 setActionType:0];
    [(CalDAVScheduleChangesProperty *)v3 setDateStamp:0];
    [(CalDAVScheduleChangesProperty *)v3 setAttendeeAddress:0];
    [(CalDAVScheduleChangesProperty *)v3 setMasterChange:0];
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(CalDAVScheduleChangesProperty *)v3 setOccurrenceChanges:v4];
  }
  return v3;
}

+ (id)debugStringForType:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"UNKNOWN";
  }
  else {
    return off_2641EC3F8[a3 - 1];
  }
}

- (BOOL)isCancel
{
  return [(CalDAVScheduleChangesProperty *)self actionType] == 3;
}

- (BOOL)isReply
{
  return [(CalDAVScheduleChangesProperty *)self actionType] == 4;
}

- (BOOL)isUpdate
{
  return [(CalDAVScheduleChangesProperty *)self actionType] == 2;
}

- (BOOL)isCreate
{
  return [(CalDAVScheduleChangesProperty *)self actionType] == 1;
}

+ (id)propertyWithItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_23;
  }
  v4 = objc_opt_new();
  v5 = [v3 dtstamp];
  objc_super v6 = [v5 payloadAsString];

  if ([v6 length]) {
    [v4 setDateStamp:v6];
  }
  v7 = [v3 action];
  v8 = [v7 create];

  if (!v8)
  {
    v9 = [v7 cancel];

    if (v9)
    {
      [v4 setActionType:3];
      v10 = [v7 cancel];
    }
    else
    {
      v11 = [v7 reply];

      if (v11)
      {
        [v4 setActionType:4];
        v12 = [v7 reply];
        v13 = [v12 attendee];
        v14 = [v13 payloadAsString];
        v15 = [v14 trimWhiteSpace];
        [v4 setAttendeeAddress:v15];

        v10 = [v7 reply];
      }
      else
      {
        v16 = [v7 update];

        if (!v16) {
          goto LABEL_22;
        }
        [v4 setActionType:2];
        v10 = [v7 update];
      }
    }
    v17 = v10;
    v18 = [v10 recurrences];

    if (v18)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = +[CalDAVOccurrenceChange changeWithItem:](CalDAVOccurrenceChange, "changeWithItem:", *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
            [v4 addOccurrenceChange:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v21);
      }
    }
    goto LABEL_22;
  }
  [v4 setActionType:1];
LABEL_22:

LABEL_23:
  return v4;
}

- (void)addOccurrenceChange:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isMaster])
    {
      objc_super v6 = [(CalDAVScheduleChangesProperty *)self masterChange];

      if (v6)
      {
        v7 = scheduleChangesLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[CalDAVScheduleChangesProperty addOccurrenceChange:](v7);
        }
      }
      [(CalDAVScheduleChangesProperty *)self setMasterChange:v5];
    }
    else
    {
      v8 = [v5 recurrenceID];
      v9 = [v8 ICSStringWithOptions:0];

      v10 = [(CalDAVScheduleChangesProperty *)self occurrenceChanges];
      [v10 setObject:v5 forKeyedSubscript:v9];
    }
  }
}

- (NSArray)recurrenceIDs
{
  v2 = [(CalDAVScheduleChangesProperty *)self occurrenceChanges];
  id v3 = [v2 allValues];
  id v4 = [v3 arrayByApplyingSelector:sel_recurrenceID];

  return (NSArray *)v4;
}

- (id)changeForOccurrence:(id)a3
{
  if (a3)
  {
    id v4 = [a3 ICSStringWithOptions:0];
    v5 = [(CalDAVScheduleChangesProperty *)self occurrenceChanges];
    objc_super v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    objc_super v6 = [(CalDAVScheduleChangesProperty *)self masterChange];
  }
  return v6;
}

- (NSString)dateStamp
{
  return self->_dateStamp;
}

- (void)setDateStamp:(id)a3
{
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int)a3
{
  self->_actionType = a3;
}

- (NSString)attendeeAddress
{
  return self->_attendeeAddress;
}

- (void)setAttendeeAddress:(id)a3
{
}

- (CalDAVOccurrenceChange)masterChange
{
  return self->_masterChange;
}

- (void)setMasterChange:(id)a3
{
}

- (NSMutableDictionary)occurrenceChanges
{
  return self->_occurrenceChanges;
}

- (void)setOccurrenceChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceChanges, 0);
  objc_storeStrong((id *)&self->_masterChange, 0);
  objc_storeStrong((id *)&self->_attendeeAddress, 0);
  objc_storeStrong((id *)&self->_dateStamp, 0);
}

- (void)addOccurrenceChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213CEC000, log, OS_LOG_TYPE_ERROR, "Error: schedule changes message from server contains multiple master events - picking one at random...", v1, 2u);
}

@end