@interface DAECalendarAvailabilitySpan
+ (BOOL)supportsSecureCoding;
- (DAECalendarAvailabilitySpan)init;
- (DAECalendarAvailabilitySpan)initWithCoder:(id)a3;
- (DAECalendarAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAECalendarAvailabilitySpan

- (DAECalendarAvailabilitySpan)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Please use the appropriate designated initializer for this class." userInfo:0];
  objc_exception_throw(v2);
}

- (DAECalendarAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DAECalendarAvailabilitySpan.m", 19, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"DAECalendarAvailabilitySpan.m", 20, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];

LABEL_3:
  if ([v10 compare:v12] == 1)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"DAECalendarAvailabilitySpan.m" lineNumber:21 description:@"'startDate' must not be after 'endDate'"];
  }
  v19.receiver = self;
  v19.super_class = (Class)DAECalendarAvailabilitySpan;
  v13 = [(DAECalendarAvailabilitySpan *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startDate, a3);
    objc_storeStrong((id *)&v14->_endDate, a4);
    v14->_type = a5;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t type = self->_type;
  if (type > 6) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *((void *)&off_1E6216270 + type);
  }
  v6 = (void *)[v3 initWithFormat:@"startDate: [%@] endDate: [%@], type: [%@]", self->_startDate, self->_endDate, v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAECalendarAvailabilitySpan)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"startDate"];
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"endDate"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];

  v9 = -[DAECalendarAvailabilitySpan initWithStartDate:endDate:type:](self, "initWithStartDate:endDate:type:", v6, v7, [v8 integerValue]);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end