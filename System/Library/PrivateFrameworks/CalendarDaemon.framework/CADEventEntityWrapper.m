@interface CADEventEntityWrapper
+ (BOOL)supportsSecureCoding;
- (CADEventEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4 occurrenceDate:(double)a5;
- (CADEventEntityWrapper)initWithCoder:(id)a3;
- (NSDate)nextReminderOccurrenceDate;
- (id)occurrenceDate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADEventEntityWrapper

- (void).cxx_destruct
{
}

- (NSDate)nextReminderOccurrenceDate
{
  return self->_nextReminderOccurrenceDate;
}

- (id)occurrenceDate
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_occurrenceDate];
}

- (CADEventEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4 occurrenceDate:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CADEventEntityWrapper;
  v6 = -[CADEntityWrapper initWithCalEntity:loadedValues:](&v12, sel_initWithCalEntity_loadedValues_);
  v7 = v6;
  if (v6)
  {
    v6->_occurrenceDate = a5;
    CalEventNextReminderOccurrenceDateIfEventKitIsLikelyToWantIt();
    if (v8 != *MEMORY[0x1E4F57888])
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      nextReminderOccurrenceDate = v7->_nextReminderOccurrenceDate;
      v7->_nextReminderOccurrenceDate = (NSDate *)v9;
    }
  }
  return v7;
}

- (CADEventEntityWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADEventEntityWrapper;
  v5 = [(CADEntityWrapper *)&v10 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"occurrenceDate"];
    v5->_occurrenceDate = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"next"];
    nextReminderOccurrenceDate = v5->_nextReminderOccurrenceDate;
    v5->_nextReminderOccurrenceDate = (NSDate *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CADEventEntityWrapper;
  [(CADEntityWrapper *)&v6 encodeWithCoder:v4];
  [v4 encodeDouble:@"occurrenceDate" forKey:self->_occurrenceDate];
  nextReminderOccurrenceDate = self->_nextReminderOccurrenceDate;
  if (nextReminderOccurrenceDate) {
    [v4 encodeObject:nextReminderOccurrenceDate forKey:@"next"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end