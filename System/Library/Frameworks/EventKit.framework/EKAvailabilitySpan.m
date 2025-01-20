@interface EKAvailabilitySpan
- (EKAvailabilitySpan)init;
- (EKAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (int64_t)type;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation EKAvailabilitySpan

- (EKAvailabilitySpan)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Please use the appropriate designated initializer for this class." userInfo:0];
  objc_exception_throw(v2);
}

- (EKAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5
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
    [v16 handleFailureInMethod:a2, self, @"EKAvailabilitySpan.m", 21, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"EKAvailabilitySpan.m", 22, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];

LABEL_3:
  if ([v10 compare:v12] == 1)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"EKAvailabilitySpan.m" lineNumber:23 description:@"'startDate' must not be after 'endDate'"];
  }
  v19.receiver = self;
  v19.super_class = (Class)EKAvailabilitySpan;
  v13 = [(EKAvailabilitySpan *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startDate, a3);
    objc_storeStrong((id *)&v14->_endDate, a4);
    v14->_type = a5;
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)EKAvailabilitySpan;
  v4 = [(EKAvailabilitySpan *)&v15 description];
  v5 = [(EKAvailabilitySpan *)self startDate];
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [v5 descriptionWithLocale:v6];
  v8 = [(EKAvailabilitySpan *)self endDate];
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = [v8 descriptionWithLocale:v9];
  unint64_t v11 = [(EKAvailabilitySpan *)self type];
  if (v11 > 7) {
    v12 = 0;
  }
  else {
    v12 = off_1E5B975F0[v11];
  }
  v13 = [v3 stringWithFormat:@"[%@] startDate: [%@] endDate: [%@] type: [%@]", v4, v7, v10, v12];

  return (NSString *)v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end