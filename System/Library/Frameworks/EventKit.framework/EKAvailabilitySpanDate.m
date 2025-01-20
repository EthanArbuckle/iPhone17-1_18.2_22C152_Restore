@interface EKAvailabilitySpanDate
+ (unsigned)valueForSpanType:(int64_t)a3;
- (EKAvailabilitySpanDate)initWithDate:(id)a3 dateType:(int64_t)a4 spanType:(int64_t)a5;
- (NSDate)spanDate;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)dateType;
- (int64_t)spanType;
- (void)setDateType:(int64_t)a3;
- (void)setSpanDate:(id)a3;
- (void)setSpanType:(int64_t)a3;
@end

@implementation EKAvailabilitySpanDate

- (EKAvailabilitySpanDate)initWithDate:(id)a3 dateType:(int64_t)a4 spanType:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKAvailabilitySpanDate;
  v10 = [(EKAvailabilitySpanDate *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spanDate, a3);
    v11->_dateType = a4;
    v11->_spanType = a5;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(EKAvailabilitySpanDate *)self spanDate];
  v6 = [v4 spanDate];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    unsigned int v8 = objc_msgSend((id)objc_opt_class(), "valueForSpanType:", -[EKAvailabilitySpanDate spanType](self, "spanType"));
    if (v8 > objc_msgSend((id)objc_opt_class(), "valueForSpanType:", objc_msgSend(v4, "spanType"))) {
      int64_t v9 = -1;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    v10 = [(EKAvailabilitySpanDate *)self spanDate];
    v11 = [v4 spanDate];
    int64_t v9 = [v10 compare:v11];
  }
  return v9;
}

+ (unsigned)valueForSpanType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return dword_1A4F8FED8[a3];
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(EKAvailabilitySpanDate *)self spanDate];
  v5 = EKAvailabilitySpanTypeAsString([(EKAvailabilitySpanDate *)self spanType]);
  int64_t v6 = [(EKAvailabilitySpanDate *)self dateType];
  int v7 = @"end";
  if (!v6) {
    int v7 = @"start";
  }
  unsigned int v8 = [v3 stringWithFormat:@"%@ \t%@\t%@", v4, v5, v7];

  return v8;
}

- (NSDate)spanDate
{
  return self->_spanDate;
}

- (void)setSpanDate:(id)a3
{
}

- (int64_t)dateType
{
  return self->_dateType;
}

- (void)setDateType:(int64_t)a3
{
  self->_dateType = a3;
}

- (int64_t)spanType
{
  return self->_spanType;
}

- (void)setSpanType:(int64_t)a3
{
  self->_spanType = a3;
}

- (void).cxx_destruct
{
}

@end