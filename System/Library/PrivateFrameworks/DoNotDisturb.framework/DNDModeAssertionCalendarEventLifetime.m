@interface DNDModeAssertionCalendarEventLifetime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnlyDuringEvent;
- (DNDModeAssertionCalendarEventLifetime)initWithCoder:(id)a3;
- (DNDModeAssertionCalendarEventLifetime)initWithEventUniqueID:(id)a3 occurrenceDate:(id)a4 onlyDuringEvent:(BOOL)a5;
- (NSDate)occurrenceDate;
- (NSString)eventUniqueID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionCalendarEventLifetime

- (DNDModeAssertionCalendarEventLifetime)initWithEventUniqueID:(id)a3 occurrenceDate:(id)a4 onlyDuringEvent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeAssertionCalendarEventLifetime;
  v10 = [(DNDModeAssertionLifetime *)&v16 _init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    eventUniqueID = v10->_eventUniqueID;
    v10->_eventUniqueID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    occurrenceDate = v10->_occurrenceDate;
    v10->_occurrenceDate = (NSDate *)v13;

    v10->_onlyDuringEvent = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(DNDModeAssertionCalendarEventLifetime *)self isOnlyDuringEvent];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (DNDModeAssertionCalendarEventLifetime *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
      v10 = [(DNDModeAssertionCalendarEventLifetime *)v8 eventUniqueID];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        uint64_t v12 = [(DNDModeAssertionCalendarEventLifetime *)v8 eventUniqueID];
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v4 = (void *)v12;
        uint64_t v13 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
        v5 = [(DNDModeAssertionCalendarEventLifetime *)v8 eventUniqueID];
        if (![v13 isEqual:v5])
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      v15 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
      objc_super v16 = [(DNDModeAssertionCalendarEventLifetime *)v8 occurrenceDate];
      if (v15 == v16) {
        goto LABEL_16;
      }
      uint64_t v17 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      uint64_t v18 = [(DNDModeAssertionCalendarEventLifetime *)v8 occurrenceDate];
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      uint64_t v19 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
      uint64_t v20 = [(DNDModeAssertionCalendarEventLifetime *)v8 occurrenceDate];
      v25 = (void *)v19;
      v21 = (void *)v19;
      uint64_t v4 = (void *)v20;
      if ([v21 isEqual:v20])
      {
LABEL_16:
        BOOL v22 = [(DNDModeAssertionCalendarEventLifetime *)self isOnlyDuringEvent];
        BOOL v14 = v22 ^ [(DNDModeAssertionCalendarEventLifetime *)v8 isOnlyDuringEvent] ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          uint64_t v13 = v27;
          uint64_t v4 = v28;
          v5 = v26;
          if (v9 != v10) {
            goto LABEL_26;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
  uint64_t v6 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
  BOOL v7 = [(DNDModeAssertionCalendarEventLifetime *)self isOnlyDuringEvent];
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; eventUniqueID: '%@'; occurrenceDate: %@; onlyDuringEvent: %@>",
    v4,
    self,
    v5,
    v6,
  id v9 = v8);

  return v9;
}

- (unint64_t)lifetimeType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionCalendarEventLifetime)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventUniqueID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"occurrenceDate"];
  uint64_t v7 = [v4 decodeBoolForKey:@"onlyDuringEvent"];

  id v8 = [(DNDModeAssertionCalendarEventLifetime *)self initWithEventUniqueID:v5 occurrenceDate:v6 onlyDuringEvent:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DNDModeAssertionCalendarEventLifetime *)self eventUniqueID];
  [v6 encodeObject:v4 forKey:@"eventUniqueID"];

  v5 = [(DNDModeAssertionCalendarEventLifetime *)self occurrenceDate];
  [v6 encodeObject:v5 forKey:@"occurrenceDate"];

  objc_msgSend(v6, "encodeBool:forKey:", -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](self, "isOnlyDuringEvent"), @"onlyDuringEvent");
}

- (NSString)eventUniqueID
{
  return self->_eventUniqueID;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (BOOL)isOnlyDuringEvent
{
  return self->_onlyDuringEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
}

@end