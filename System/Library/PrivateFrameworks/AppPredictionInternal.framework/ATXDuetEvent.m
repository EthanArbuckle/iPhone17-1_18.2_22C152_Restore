@interface ATXDuetEvent
+ (BOOL)supportsSecureCoding;
+ (int64_t)_secondsInDayFromDate:(id)a3 calendar:(id)a4;
- (ATXDuetEvent)initWithCoder:(id)a3;
- (ATXDuetEvent)initWithCurrentContextStoreValues;
- (ATXDuetEvent)initWithDKEvent:(id)a3;
- (ATXDuetEvent)initWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)isEndDateOnWeekday;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStartDateOnWeekday;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)locationIdentifier;
- (id)identifier;
- (id)locationIdentifierUUIDString;
- (int64_t)compare:(id)a3;
- (int64_t)endDateSecondsAfterMidnight;
- (int64_t)startDateSecondsAfterMidnight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLocationIdentifier:(id)a3;
@end

@implementation ATXDuetEvent

+ (int64_t)_secondsInDayFromDate:(id)a3 calendar:(id)a4
{
  id v5 = a3;
  v6 = [a4 startOfDayForDate:v5];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  return (uint64_t)v8;
}

- (int64_t)startDateSecondsAfterMidnight
{
  v2 = [(ATXDuetEvent *)self startDate];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v4 = +[ATXDuetEvent _secondsInDayFromDate:v2 calendar:v3];

  return v4;
}

- (int64_t)endDateSecondsAfterMidnight
{
  v2 = [(ATXDuetEvent *)self endDate];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v4 = +[ATXDuetEvent _secondsInDayFromDate:v2 calendar:v3];

  return v4;
}

- (BOOL)isStartDateOnWeekday
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v4 = [(ATXDuetEvent *)self startDate];
  char v5 = [v3 isDateInWeekend:v4];

  return v5 ^ 1;
}

- (BOOL)isEndDateOnWeekday
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v4 = [(ATXDuetEvent *)self endDate];
  char v5 = [v3 isDateInWeekend:v4];

  return v5 ^ 1;
}

- (id)locationIdentifierUUIDString
{
  v3 = [(ATXDuetEvent *)self locationIdentifier];
  if (v3)
  {
    int64_t v4 = [(ATXDuetEvent *)self locationIdentifier];
    char v5 = [v4 UUIDString];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (ATXDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXDuetEvent.m", 29, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 startDate];
  double v7 = [v5 endDate];
  double v8 = [(ATXDuetEvent *)self initWithStartDate:v6 endDate:v7];

  return v8;
}

- (ATXDuetEvent)initWithCurrentContextStoreValues
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ATXDuetEvent.m" lineNumber:38 description:@"Should be implemented by subclasses"];

  return 0;
}

- (ATXDuetEvent)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXDuetEvent;
    double v8 = [(ATXDuetEvent *)&v15 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      startDate = v8->_startDate;
      v8->_startDate = (NSDate *)v9;

      uint64_t v11 = [v7 copy];
      endDate = v8->_endDate;
      v8->_endDate = (NSDate *)v11;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)identifier
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ATXDuetEvent.m" lineNumber:59 description:@"Must be implemented by the subclass."];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (ATXDuetEvent *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      startDate = self->_startDate;
      id v7 = (NSDate *)v5[1];
      if (startDate == v7)
      {
      }
      else
      {
        double v8 = v7;
        uint64_t v9 = startDate;
        char v10 = [(NSDate *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_11;
        }
      }
      endDate = self->_endDate;
      v13 = (NSDate *)v5[2];
      if (endDate == v13)
      {
      }
      else
      {
        v14 = v13;
        objc_super v15 = endDate;
        char v16 = [(NSDate *)v15 isEqual:v14];

        if ((v16 & 1) == 0)
        {
LABEL_11:
          char v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v17 = [(ATXDuetEvent *)self identifier];
      v18 = [v5 identifier];
      char v11 = [v17 isEqualToString:v18];

      goto LABEL_14;
    }
    char v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  uint64_t v4 = [(NSDate *)self->_endDate hash] - v3 + 32 * v3;
  id v5 = [(ATXDuetEvent *)self identifier];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXDuetEvent *)self startDate];
  unint64_t v6 = [v4 startDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)setEndDate:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"codingKeyForDuetEventStartDate"];
  [v5 encodeObject:self->_endDate forKey:@"codingKeyForDuetEventEndDate"];
}

- (ATXDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  int64_t v7 = __atxlog_handle_anchor();
  double v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForDuetEventStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    char v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_anchor();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForDuetEventEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], objc_super v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      self = [(ATXDuetEvent *)self initWithStartDate:v8 endDate:v14];
      char v10 = self;
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUUID)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void)setLocationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end