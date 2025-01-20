@interface ATXProposedRescheduledDate
+ (BOOL)supportsSecureCoding;
- (ATXProposedRescheduledDate)initWithCoder:(id)a3;
- (ATXProposedRescheduledDate)initWithDateTime:(id)a3;
- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3;
- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3 fuzzyTimeRangeStart:(id)a4 fuzzyTimeRangeEnd:(id)a5;
- (ATXProposedRescheduledDate)initWithHourComponents:(id)a3;
- (ATXTime)fuzzyTimeRangeEnd;
- (ATXTime)fuzzyTimeRangeStart;
- (NSDate)dateTime;
- (NSDateComponents)components;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProposedRescheduledDate

- (ATXProposedRescheduledDate)initWithDateTime:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  v6 = [(ATXProposedRescheduledDate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateTime, a3);
    v7->_type = 0;
    v8 = v7;
  }

  return v7;
}

- (ATXProposedRescheduledDate)initWithHourComponents:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  id v5 = [(ATXProposedRescheduledDate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (NSDateComponents *)v6;

    v5->_type = 1;
    v8 = v5;
  }

  return v5;
}

- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  id v5 = [(ATXProposedRescheduledDate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (NSDateComponents *)v6;

    v5->_type = 2;
    v8 = v5;
  }

  return v5;
}

- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3 fuzzyTimeRangeStart:(id)a4 fuzzyTimeRangeEnd:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXProposedRescheduledDate;
  v11 = [(ATXProposedRescheduledDate *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    components = v11->_components;
    v11->_components = (NSDateComponents *)v12;

    v11->_type = 3;
    objc_storeStrong((id *)&v11->_fuzzyTimeRangeStart, a4);
    objc_storeStrong((id *)&v11->_fuzzyTimeRangeEnd, a5);
    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_dateTime forKey:@"dateTime"];
  [v5 encodeObject:self->_components forKey:@"components"];
  [v5 encodeObject:self->_fuzzyTimeRangeStart forKey:@"fuzzyTimeStart"];
  [v5 encodeObject:self->_fuzzyTimeRangeEnd forKey:@"fuzzyTimeEnd"];
}

- (ATXProposedRescheduledDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXProposedRescheduledDate;
  id v5 = [(ATXProposedRescheduledDate *)&v16 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateTime"];
    dateTime = v5->_dateTime;
    v5->_dateTime = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"components"];
    components = v5->_components;
    v5->_components = (NSDateComponents *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fuzzyTimeStart"];
    fuzzyTimeRangeStart = v5->_fuzzyTimeRangeStart;
    v5->_fuzzyTimeRangeStart = (ATXTime *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fuzzyTimeEnd"];
    fuzzyTimeRangeEnd = v5->_fuzzyTimeRangeEnd;
    v5->_fuzzyTimeRangeEnd = (ATXTime *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSDate)dateTime
{
  return self->_dateTime;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (ATXTime)fuzzyTimeRangeStart
{
  return self->_fuzzyTimeRangeStart;
}

- (ATXTime)fuzzyTimeRangeEnd
{
  return self->_fuzzyTimeRangeEnd;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyTimeRangeEnd, 0);
  objc_storeStrong((id *)&self->_fuzzyTimeRangeStart, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_dateTime, 0);
}

@end