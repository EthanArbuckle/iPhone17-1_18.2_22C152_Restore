@interface HDAlarmEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresDeviceOnWrist;
- (BOOL)requiresDeviceUnlocked;
- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6;
- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7;
- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6;
- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7;
- (NSDate)currentDueDate;
- (NSDate)dueDate;
- (NSDateComponents)dueDateComponents;
- (NSString)clientIdentifier;
- (NSString)eventIdentifier;
- (NSTimeZone)_unitTest_localTimeZoneOverride;
- (id)_initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 dueDateComponents:(id)a6 eventOptions:(unint64_t)a7 clientOptions:(unint64_t)a8;
- (id)description;
- (unint64_t)clientOptions;
- (unint64_t)eventOptions;
- (unint64_t)hash;
- (void)set_unitTest_localTimeZoneOverride:(id)a3;
@end

@implementation HDAlarmEvent

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6
{
  return (HDAlarmEvent *)[(HDAlarmEvent *)self _initWithClientIdentifier:a3 eventIdentifier:a4 dueDate:a5 dueDateComponents:0 eventOptions:a6 clientOptions:0];
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7
{
  return (HDAlarmEvent *)[(HDAlarmEvent *)self _initWithClientIdentifier:a3 eventIdentifier:a4 dueDate:a5 dueDateComponents:0 eventOptions:a6 clientOptions:a7];
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6
{
  return (HDAlarmEvent *)[(HDAlarmEvent *)self _initWithClientIdentifier:a3 eventIdentifier:a4 dueDate:0 dueDateComponents:a5 eventOptions:a6 clientOptions:0];
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7
{
  return (HDAlarmEvent *)[(HDAlarmEvent *)self _initWithClientIdentifier:a3 eventIdentifier:a4 dueDate:0 dueDateComponents:a5 eventOptions:a6 clientOptions:a7];
}

- (id)_initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 dueDateComponents:(id)a6 eventOptions:(unint64_t)a7 clientOptions:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  unint64_t v17 = (unint64_t)a5;
  unint64_t v18 = (unint64_t)a6;
  v19 = (void *)v18;
  if (!(v17 | v18))
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HDAlarmEvent.m", 105, @"Invalid parameter not satisfying: %@", @"dueDate != nil || dueDateComponents != nil" object file lineNumber description];
LABEL_12:

    goto LABEL_6;
  }
  if (v17 && v18)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HDAlarmEvent.m", 106, @"Invalid parameter not satisfying: %@", @"dueDate == nil || dueDateComponents == nil" object file lineNumber description];
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  if (([v19 isValidDate] & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HDAlarmEvent.m", 107, @"Invalid parameter not satisfying: %@", @"HDAlarmEventValidateDateComponents(dueDateComponents)" object file lineNumber description];
    goto LABEL_12;
  }
LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)HDAlarmEvent;
  v20 = [(HDAlarmEvent *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    eventIdentifier = v20->_eventIdentifier;
    v20->_eventIdentifier = (NSString *)v23;

    uint64_t v25 = [(id)v17 copy];
    dueDate = v20->_dueDate;
    v20->_dueDate = (NSDate *)v25;

    uint64_t v27 = [v19 copy];
    dueDateComponents = v20->_dueDateComponents;
    v20->_dueDateComponents = (NSDateComponents *)v27;

    v20->_eventOptions = a7;
    v20->_clientOptions = a8;
  }

  return v20;
}

- (NSDate)currentDueDate
{
  v3 = [(HDAlarmEvent *)self dueDate];

  if (v3)
  {
    v4 = [(HDAlarmEvent *)self dueDate];
  }
  else
  {
    v5 = [(HDAlarmEvent *)self dueDateComponents];
    v6 = objc_msgSend(v5, "hk_populatedCalendarGregorianCalendarDefault");

    if (self)
    {
      [MEMORY[0x1E4F1CAF0] resetSystemTimeZone];
      v7 = [(HDAlarmEvent *)self _unitTest_localTimeZoneOverride];
      v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    [v6 setTimeZone:v10];

    v11 = [(HDAlarmEvent *)self dueDateComponents];
    v4 = [v6 dateFromComponents:v11];
  }

  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    clientIdentifier = self->_clientIdentifier;
    v7 = (NSString *)v5[1];
    if ((clientIdentifier == v7 || v7 && -[NSString isEqualToString:](clientIdentifier, "isEqualToString:"))
      && ((eventIdentifier = self->_eventIdentifier, id v9 = (NSString *)v5[2], eventIdentifier == v9)
       || v9 && -[NSString isEqualToString:](eventIdentifier, "isEqualToString:")))
    {
      v10 = [(HDAlarmEvent *)self currentDueDate];
      v11 = [v5 currentDueDate];
      if (v10 == v11)
      {
        BOOL v15 = self->_eventOptions == v5[5] && self->_clientOptions == v5[6];
      }
      else
      {
        v12 = [v5 currentDueDate];
        if (v12)
        {
          v13 = [(HDAlarmEvent *)self currentDueDate];
          v14 = [v5 currentDueDate];
          BOOL v15 = [v13 isEqualToDate:v14]
             && self->_eventOptions == v5[5]
             && self->_clientOptions == v5[6];
        }
        else
        {
          BOOL v15 = 0;
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_eventIdentifier hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_dueDate hash];
  return v4 ^ v5 ^ [(NSDateComponents *)self->_dueDateComponents hash] ^ self->_eventOptions ^ self->_clientOptions;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HDAlarmEvent *)self clientIdentifier];
  v6 = [(HDAlarmEvent *)self eventIdentifier];
  v7 = [(HDAlarmEvent *)self dueDate];
  v8 = [(HDAlarmEvent *)self dueDateComponents];
  unint64_t v9 = [(HDAlarmEvent *)self eventOptions];
  if (v9)
  {
    char v10 = v9;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = v11;
    if ((v10 & 2) != 0) {
      [v11 addObject:@"require-device-on-wrist"];
    }
    if (v10) {
      [v12 addObject:@"require-device-unlocked"];
    }
    v13 = [v12 componentsJoinedByString:@", "];
  }
  else
  {
    v13 = @"none";
  }
  v14 = [v3 stringWithFormat:@"<%@:%p client:%@ event:%@ dueDate:%@, dueDateComponents:%@, eventOptions: %@, clientOptions: %lu>", v4, self, v5, v6, v7, v8, v13, -[HDAlarmEvent clientOptions](self, "clientOptions")];

  return v14;
}

- (BOOL)requiresDeviceOnWrist
{
  return ([(HDAlarmEvent *)self eventOptions] >> 1) & 1;
}

- (BOOL)requiresDeviceUnlocked
{
  return [(HDAlarmEvent *)self eventOptions] & 1;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (unint64_t)eventOptions
{
  return self->_eventOptions;
}

- (unint64_t)clientOptions
{
  return self->_clientOptions;
}

- (NSTimeZone)_unitTest_localTimeZoneOverride
{
  return self->__unitTest_localTimeZoneOverride;
}

- (void)set_unitTest_localTimeZoneOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_localTimeZoneOverride, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end