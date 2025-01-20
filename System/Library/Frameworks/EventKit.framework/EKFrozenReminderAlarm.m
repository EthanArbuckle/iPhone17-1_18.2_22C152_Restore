@interface EKFrozenReminderAlarm
+ (Class)meltedClass;
+ (id)semanticIdentifierFromDateComponents:(id)a3;
+ (id)semanticIdentifierFromREMAlarm:(id)a3;
+ (id)triggersFromAbsoluteDate:(id)a3 relativeOffset:(double)a4 timeValuesRelevant:(BOOL)a5 structuredLocation:(id)a6 proximity:(int64_t)a7;
+ (id)uniqueIdentifierForREMObject:(id)a3;
+ (int64_t)ekAlarmProximityToEKAlarmProximity:(int64_t)a3;
+ (int64_t)remAlarmProximityToEKAlarmProximity:(int64_t)a3;
- (BOOL)_applyChanges:(id)a3 error:(id *)a4;
- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)isDefaultAlarm;
- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4;
- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4 withChanges:(id)a5;
- (EKFrozenReminderAlarm)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5;
- (EKFrozenReminderAlarm)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5;
- (EKFrozenReminderStructuredLocation)structuredLocation;
- (NSArray)alarms;
- (NSArray)triggers;
- (NSString)externalID;
- (double)relativeOffset;
- (id)_effectiveAlarm;
- (id)_locationAlarm;
- (id)_remStructuredLocation;
- (id)_setTimeOrLocationAlarm:(id)a3;
- (id)_timeAlarm;
- (id)absoluteDate;
- (id)acknowledgedDate;
- (id)calendarItemOwner;
- (id)calendarOwner;
- (id)emailAddress;
- (id)modifiedStructuredLocation;
- (id)originalAlarm;
- (id)remObjectID;
- (id)snoozedAlarmsSet;
- (id)updatedAlarmWithLocation:(id)a3;
- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4;
- (id)urlWrapper;
- (int64_t)proximity;
- (int64_t)type;
- (void)_setTimeAndLocationAlarms:(id)a3;
@end

@implementation EKFrozenReminderAlarm

- (EKFrozenReminderAlarm)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKFrozenReminderAlarm;
  v9 = [(EKFrozenReminderObject *)&v13 initWithREMObject:v8 inStore:a4 withChanges:a5];
  v10 = v9;
  if (v9) {
    id v11 = [(EKFrozenReminderAlarm *)v9 _setTimeOrLocationAlarm:v8];
  }

  return v10;
}

- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4
{
  return [(EKFrozenReminderAlarm *)self initWithAlarms:a3 inStore:a4 withChanges:0];
}

- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 firstObject];
  v14.receiver = self;
  v14.super_class = (Class)EKFrozenReminderAlarm;
  v12 = [(EKFrozenReminderObject *)&v14 initWithREMObject:v11 inStore:v10 withChanges:v9];

  if (v12) {
    [(EKFrozenReminderAlarm *)v12 _setTimeAndLocationAlarms:v8];
  }

  return v12;
}

- (EKFrozenReminderAlarm)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v12 setSkipsPersistentObjectCopy:1];
  objc_super v13 = [v9 valueForKey:@"relativeOffset"];
  [(EKChangeSet *)v12 changeSingleValue:v13 forKey:@"relativeOffset" basedOn:0];

  objc_super v14 = [v9 valueForKey:@"absoluteDate"];
  [(EKChangeSet *)v12 changeSingleValue:v14 forKey:@"absoluteDate" basedOn:0];

  v15 = [v9 valueForKey:@"structuredLocation"];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 uniqueIdentifier];
    id v18 = [v10 objectForKeyedSubscript:v17];

    if (!v18) {
      id v18 = v16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      [v25 handleFailureInMethod:a2, self, @"EKFrozenReminderAlarm.m", 85, @"structured location is an unexpected type: %@", v27 object file lineNumber description];
    }
    [(EKChangeSet *)v12 changeSingleValue:v18 forKey:@"structuredLocation" basedOn:0];
  }
  v19 = [v9 valueForKey:@"proximity"];
  [(EKChangeSet *)v12 changeSingleValue:v19 forKey:@"proximity" basedOn:0];

  v20 = [v9 valueForKey:@"UUID"];
  if (!v20)
  {
    v21 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v21 UUIDString];
  }
  [(EKChangeSet *)v12 changeSingleValue:v20 forKey:@"UUID" basedOn:0];
  v22 = [v11 reminderStore];

  v28.receiver = self;
  v28.super_class = (Class)EKFrozenReminderAlarm;
  v23 = [(EKFrozenReminderObject *)&v28 initWithREMObject:0 inStore:v22 withChanges:v12];

  return v23;
}

- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EKFrozenReminderAlarm;
  v5 = [(EKFrozenReminderObject *)&v9 updatedFrozenObjectWithChanges:a3 updatedChildren:a4];
  if (v5 == self)
  {
    v7 = self;
  }
  else
  {
    v6 = [(EKFrozenReminderAlarm *)self alarms];
    if ([v6 count]) {
      [(EKFrozenReminderAlarm *)v5 _setTimeAndLocationAlarms:v6];
    }
    v7 = v5;
  }

  return v7;
}

- (void)_setTimeAndLocationAlarms:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(EKFrozenReminderAlarm *)self _setTimeOrLocationAlarm:v9];
        id v11 = (void *)v10;
        if (v10) {
          BOOL v12 = v10 == v9;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          objc_super v13 = +[EKReminderStore log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(EKFrozenReminderAlarm *)&v15 _setTimeAndLocationAlarms:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  if (!self->_timeAlarm && !self->_locationAlarm)
  {
    objc_super v14 = +[EKReminderStore log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[EKFrozenReminderAlarm _setTimeAndLocationAlarms:](v4);
    }
  }
}

- (id)_setTimeOrLocationAlarm:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 trigger];
    getREMAlarmTimeIntervalTriggerClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (getREMAlarmDateTriggerClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = 152;
    }
    else
    {
      getREMAlarmLocationTriggerClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v12 = +[EKReminderStore log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[EKFrozenReminderAlarm _setTimeOrLocationAlarm:]();
        }

        id v10 = 0;
        goto LABEL_6;
      }
      uint64_t v8 = 160;
    }
    uint64_t v9 = (id *)((char *)&self->super.super.super.isa + v8);
    id v10 = *(id *)((char *)&self->super.super.super.isa + v8);
    objc_storeStrong(v9, a3);
LABEL_6:

    goto LABEL_8;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (id)_timeAlarm
{
  return self->_timeAlarm;
}

- (id)_locationAlarm
{
  return self->_locationAlarm;
}

- (NSArray)alarms
{
  v10[2] = *MEMORY[0x1E4F143B8];
  locationAlarm = self->_locationAlarm;
  if (self->_timeAlarm)
  {
    if (locationAlarm)
    {
      v10[0] = self->_timeAlarm;
      v10[1] = locationAlarm;
      v3 = (void *)MEMORY[0x1E4F1C978];
      p_timeAlarm = (REMAlarm **)v10;
      uint64_t v5 = 2;
LABEL_8:
      uint64_t v6 = [v3 arrayWithObjects:p_timeAlarm count:v5];
      goto LABEL_9;
    }
    timeAlarm = self->_timeAlarm;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_timeAlarm = &timeAlarm;
LABEL_7:
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  if (locationAlarm)
  {
    uint64_t v8 = self->_locationAlarm;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_timeAlarm = &v8;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_9:

  return (NSArray *)v6;
}

- (id)remObjectID
{
  if (self->_timeAlarm) {
    timeAlarm = self->_timeAlarm;
  }
  else {
    timeAlarm = self->_locationAlarm;
  }
  v3 = [(REMAlarm *)timeAlarm objectID];

  return v3;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (double)relativeOffset
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__EKFrozenReminderAlarm_relativeOffset__block_invoke;
  v6[3] = &unk_1E5B96AB8;
  v6[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"relativeOffset" backingValue:v6];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

id __39__EKFrozenReminderAlarm_relativeOffset__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _timeAlarm];
  v2 = [v1 trigger];

  getREMAlarmTimeIntervalTriggerClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = NSNumber;
    [v2 timeInterval];
    double v4 = objc_msgSend(v3, "numberWithDouble:");
  }
  else
  {
    double v4 = &unk_1EF953388;
  }

  return v4;
}

- (id)absoluteDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EKFrozenReminderAlarm_absoluteDate__block_invoke;
  v4[3] = &unk_1E5B96A90;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"absoluteDate" backingValue:v4];

  return v2;
}

id __37__EKFrozenReminderAlarm_absoluteDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _timeAlarm];
  v2 = [v1 trigger];

  getREMAlarmDateTriggerClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [v2 dateComponents];
    double v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v3 setCalendar:v4];

    uint64_t v5 = [v3 date];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (EKFrozenReminderStructuredLocation)structuredLocation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__EKFrozenReminderAlarm_structuredLocation__block_invoke;
  v4[3] = &unk_1E5B9A6E0;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"structuredLocation" backingValue:v4];

  return (EKFrozenReminderStructuredLocation *)v2;
}

id __43__EKFrozenReminderAlarm_structuredLocation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _locationAlarm];
  double v3 = [v2 trigger];

  if (v3)
  {
    double v4 = [v3 structuredLocation];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    uint64_t v6 = [WeakRetained frozenObjectForReminderObject:v4];

    uint64_t v7 = [*(id *)(a1 + 32) path];
    uint64_t v8 = [*(id *)(a1 + 32) remObjectID];
    uint64_t v9 = [v7 arrayByAddingObject:v8];
    [v6 setPath:v9];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)modifiedStructuredLocation
{
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"structuredLocation"])
  {
    double v3 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"structuredLocation" basedOn:0];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (NSString)externalID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__EKFrozenReminderAlarm_externalID__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"UUID" backingValue:v4];

  return (NSString *)v2;
}

id __35__EKFrozenReminderAlarm_externalID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 152);
  if (v3)
  {
    double v4 = [v3 alarmUID];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    double v4 = 0;
  }
  uint64_t v5 = *(void **)(v2 + 160);
  if (v5)
  {
    uint64_t v6 = [v5 alarmUID];

    double v4 = (void *)v6;
  }
  if (!v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 152);
    if (v8 || (uint64_t v8 = *(void **)(v7 + 160)) != 0)
    {
      uint64_t v9 = [v8 remObjectID];
      id v10 = [v9 uuid];
      double v4 = [v10 UUIDString];
    }
    else
    {
      double v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)remAlarmProximityToEKAlarmProximity:(int64_t)a3
{
  return a3;
}

+ (int64_t)ekAlarmProximityToEKAlarmProximity:(int64_t)a3
{
  return a3;
}

- (id)_remStructuredLocation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [(EKFrozenReminderAlarm *)self modifiedStructuredLocation];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 updatedStructuredLocation];
  }
  else if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"structuredLocation"]|| (uint64_t v6 = self->_locationAlarm) == 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = [(REMAlarm *)v6 trigger];
    getREMAlarmLocationTriggerClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v7 structuredLocation];
    }
    else
    {
      uint64_t v8 = +[EKReminderStore log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        locationAlarm = self->_locationAlarm;
        int v11 = 138412802;
        BOOL v12 = self;
        __int16 v13 = 2112;
        objc_super v14 = locationAlarm;
        __int16 v15 = 2112;
        v16 = v7;
        _os_log_error_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_ERROR, "Frozen reminder alarm being committed has a location alarm without a location alarm trigger. EKFrozenReminderAlarm=%@; _locationAlarm=%@, _locationAlarm.trigger=%@",
          (uint8_t *)&v11,
          0x20u);
      }

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (NSArray)triggers
{
  double v3 = [(EKFrozenReminderAlarm *)self _remStructuredLocation];
  BOOL v4 = self->_timeAlarm
    || [(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"absoluteDate"]
    || [(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"relativeOffset"];
  uint64_t v5 = [(EKFrozenReminderAlarm *)self absoluteDate];
  [(EKFrozenReminderAlarm *)self relativeOffset];
  uint64_t v7 = +[EKFrozenReminderAlarm triggersFromAbsoluteDate:v5 relativeOffset:v4 timeValuesRelevant:v3 structuredLocation:[(EKFrozenReminderAlarm *)self proximity] proximity:v6];

  return (NSArray *)v7;
}

+ (id)triggersFromAbsoluteDate:(id)a3 relativeOffset:(double)a4 timeValuesRelevant:(BOOL)a5 structuredLocation:(id)a6 proximity:(int64_t)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a6;
  __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if (v9)
  {
    if (v11)
    {
      objc_super v14 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      __int16 v15 = [v14 components:254 fromDate:v11];
      v16 = (void *)[objc_alloc((Class)getREMAlarmDateTriggerClass()) initWithDateComponents:v15];
      [v13 addObject:v16];
    }
    else
    {
      objc_super v14 = (void *)[objc_alloc((Class)getREMAlarmTimeIntervalTriggerClass()) initWithTimeInterval:a4];
      [v13 addObject:v14];
    }
  }
  if (v12)
  {
    uint64_t v17 = objc_msgSend(objc_alloc((Class)getREMAlarmLocationTriggerClass()), "initWithStructuredLocation:proximity:", v12, +[EKFrozenReminderAlarm ekAlarmProximityToEKAlarmProximity:](EKFrozenReminderAlarm, "ekAlarmProximityToEKAlarmProximity:", a7));
    [v13 addObject:v17];
  }

  return v13;
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [(EKFrozenReminderAlarm *)self externalID];
  if (self->_timeAlarm) {
    objc_msgSend(v5, "removeAlarm:");
  }
  if (self->_locationAlarm)
  {
    objc_msgSend(v5, "removeAlarm:");
    uint64_t v7 = [(EKFrozenReminderAlarm *)self modifiedStructuredLocation];
    if (v7)
    {
      uint64_t v8 = [(EKFrozenReminderObject *)self path];
      BOOL v9 = [(REMAlarm *)self->_locationAlarm objectID];
      id v10 = [v8 arrayByAddingObject:v9];
      [v7 setPath:v10];
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [(EKFrozenReminderAlarm *)self triggers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [v5 addAlarmWithTrigger:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        [v16 setAlarmUID:v6];
        uint64_t v17 = [(EKFrozenReminderAlarm *)self acknowledgedDate];
        [v16 setAcknowledgedDate:v17];

        long long v18 = [(EKFrozenReminderAlarm *)self originalAlarm];
        long long v19 = [v18 externalID];
        [v16 setOriginalAlarmUID:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return 1;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKFrozenReminderObject *)self path];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
    id v10 = [WeakRetained remStore];

    id v18 = 0;
    id v11 = [v10 fetchReminderWithObjectID:v8 error:&v18];
    id v12 = v18;
    if (v11)
    {
      uint64_t v13 = [v6 updateReminder:v11];
      BOOL v14 = [(EKFrozenReminderAlarm *)self _applyChanges:v13 error:a4];
    }
    else
    {
      v16 = +[EKReminderStore log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[EKFrozenReminderAlarm _applyChangesToSaveRequest:error:]();
      }

      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    __int16 v15 = +[EKReminderStore log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EKFrozenReminderAlarm _applyChangesToSaveRequest:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  return (id)[a3 alarmUID];
}

- (id)updatedAlarmWithLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v5 setSkipsPersistentObjectCopy:1];
  [(EKChangeSet *)v5 changeSingleValue:v4 forKey:@"structuredLocation" basedOn:0];

  id v6 = [(EKFrozenReminderObject *)self updatedFrozenObjectWithChanges:v5];

  return v6;
}

+ (id)semanticIdentifierFromREMAlarm:(id)a3
{
  id v4 = a3;
  id v5 = [v4 acknowledgedDate];
  id v6 = [v4 trigger];
  getREMAlarmDateTriggerClass();
  unint64_t v7 = 0x1E4F29000uLL;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 dateComponents];
    BOOL v9 = [a1 semanticIdentifierFromDateComponents:v8];

    goto LABEL_13;
  }
  getREMAlarmTimeIntervalTriggerClass();
  if (objc_opt_isKindOfClass())
  {
    id v10 = NSNumber;
    [v6 timeInterval];
    id v11 = objc_msgSend(v10, "numberWithDouble:");
    BOOL v9 = [v11 stringValue];
LABEL_7:

    goto LABEL_13;
  }
  getREMAlarmLocationTriggerClass();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    uint64_t v28 = [v12 proximity];
    id v11 = [v12 structuredLocation];

    v29 = [v11 title];
    v27 = [v11 address];
    uint64_t v26 = [v11 mapKitHandle];
    v25 = [v11 contactLabel];
    uint64_t v13 = NSNumber;
    [v11 latitude];
    long long v24 = objc_msgSend(v13, "numberWithDouble:");
    BOOL v14 = NSNumber;
    [v11 longitude];
    __int16 v15 = objc_msgSend(v14, "numberWithDouble:");
    v16 = NSNumber;
    [v11 radius];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    id v18 = +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:v29 address:v27 mapKitHandle:v26 contactLabel:v25 latitude:v24 longitude:v15 radius:v17];
    long long v19 = NSString;
    long long v20 = [NSNumber numberWithInteger:v28];
    BOOL v9 = [v19 stringWithFormat:@"Proximity=%@Location=%@", v20, v18];;

    unint64_t v7 = 0x1E4F29000;
    goto LABEL_7;
  }
  if (v6)
  {
    long long v21 = +[EKReminderStore log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:v21];
    }
  }
  BOOL v9 = 0;
LABEL_13:
  long long v22 = [*(id *)(v7 + 24) stringWithFormat:@"Ack=%@Trigger=%@:%@", v5, objc_opt_class(), v9];;

  return v22;
}

+ (id)semanticIdentifierFromDateComponents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 era];
  uint64_t v5 = [v3 year];
  uint64_t v6 = [v3 month];
  uint64_t v7 = [v3 day];
  uint64_t v8 = [v3 hour];
  uint64_t v9 = [v3 minute];
  uint64_t v10 = [v3 second];
  id v11 = [v3 timeZone];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  uint64_t v13 = v12;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v12, "appendFormat:", @"Era=%li;", v4);
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Year=%li;", v5);
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Month=%li;", v6);
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Day=%li;", v7);
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Hour=%li;", v8);
  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Minute=%li;", v9);
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v13, "appendFormat:", @"Second=%li;", v10);
  }
  BOOL v14 = [v11 name];
  __int16 v15 = v14;
  if (!v11)
  {

    __int16 v15 = @"FLOAT";
  }
  [v13 appendFormat:@"TZ=%@]", v15];

  return v13;
}

- (int64_t)proximity
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__EKFrozenReminderAlarm_proximity__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  uint64_t v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"proximity" backingValue:v5];
  int64_t v3 = [v2 integerValue];

  return v3;
}

id __34__EKFrozenReminderAlarm_proximity__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _locationAlarm];
  uint64_t v2 = [v1 trigger];

  uint64_t v3 = [v2 proximity];
  uint64_t v4 = [NSNumber numberWithInteger:v3];

  return v4;
}

- (id)_effectiveAlarm
{
  timeAlarm = self->_timeAlarm;
  if (!timeAlarm) {
    timeAlarm = self->_locationAlarm;
  }
  uint64_t v3 = timeAlarm;

  return v3;
}

- (id)acknowledgedDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__EKFrozenReminderAlarm_acknowledgedDate__block_invoke;
  v4[3] = &unk_1E5B96A90;
  v4[4] = self;
  uint64_t v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"acknowledgedDate" backingValue:v4];

  return v2;
}

id __41__EKFrozenReminderAlarm_acknowledgedDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _effectiveAlarm];
  uint64_t v2 = [v1 acknowledgedDate];

  return v2;
}

- (int64_t)type
{
  return 0;
}

- (id)emailAddress
{
  return 0;
}

- (id)urlWrapper
{
  return 0;
}

- (id)snoozedAlarmsSet
{
  return 0;
}

- (id)calendarOwner
{
  return 0;
}

- (id)calendarItemOwner
{
  return 0;
}

- (id)originalAlarm
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__EKFrozenReminderAlarm_originalAlarm__block_invoke;
  v4[3] = &unk_1E5B9A708;
  v4[4] = self;
  uint64_t v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"originalAlarm" backingValue:v4];

  return v2;
}

EKFrozenReminderAlarm *__38__EKFrozenReminderAlarm_originalAlarm__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _effectiveAlarm];
  uint64_t v3 = [v2 originalAlarmUID];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    uint64_t v5 = [WeakRetained remStore];

    uint64_t v6 = [*(id *)(a1 + 32) path];
    uint64_t v7 = [v6 firstObject];
    id v29 = 0;
    uint64_t v8 = [v5 fetchReminderWithObjectID:v7 error:&v29];
    id v9 = v29;

    if (v8)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v10 = [v8 alarms];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v23 = v9;
        long long v24 = v5;
        uint64_t v13 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            __int16 v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v16 = [v15 alarmUID];
            char v17 = [v16 isEqualToString:v3];

            if (v17)
            {
              long long v19 = [EKFrozenReminderAlarm alloc];
              id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
              long long v21 = [(EKFrozenReminderObject *)v19 initWithREMObject:v15 inStore:v20];

              id v18 = v21;
              uint64_t v10 = v18;
              goto LABEL_14;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v12) {
            continue;
          }
          break;
        }
        id v18 = 0;
LABEL_14:
        id v9 = v23;
        uint64_t v5 = v24;
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)isDefaultAlarm
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAlarm, 0);

  objc_storeStrong((id *)&self->_timeAlarm, 0);
}

- (void)_setTimeAndLocationAlarms:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_9(&dword_1A4E47000, v1, v2, "Alarm has no usable triggers (%lu passed in)", v3, v4, v5, v6, v7);
}

- (void)_setTimeAndLocationAlarms:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Alarm has multiple triggers with the same type; an arbitrary one will be used.",
    buf,
    2u);
}

- (void)_setTimeOrLocationAlarm:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_9(&dword_1A4E47000, v2, v3, "Alarm has an unknown trigger type: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_applyChangesToSaveRequest:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "Alarm to be saved doesn't have a parent reminder: %@", v1, 0xCu);
}

- (void)_applyChangesToSaveRequest:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "Couldn't fetch reminder to be saved: %@", v1, 0xCu);
}

+ (void)semanticIdentifierFromREMAlarm:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A4E47000, a3, OS_LOG_TYPE_ERROR, "Unknown alarm trigger type %@ on alarm %@ during cloning. Alarms might not be correctly matched.", v5, 0x16u);
}

@end