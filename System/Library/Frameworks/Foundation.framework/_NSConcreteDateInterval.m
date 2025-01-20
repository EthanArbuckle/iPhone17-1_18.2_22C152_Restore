@interface _NSConcreteDateInterval
- (_NSConcreteDateInterval)init;
- (_NSConcreteDateInterval)initWithStartDate:(id)a3 duration:(double)a4;
- (_NSConcreteDateInterval)initWithStartDate:(id)a3 endDate:(id)a4;
- (double)duration;
- (id)endDate;
- (id)startDate;
- (void)dealloc;
@end

@implementation _NSConcreteDateInterval

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteDateInterval;
  [(_NSConcreteDateInterval *)&v3 dealloc];
}

- (id)startDate
{
  return objc_getProperty(self, a2, 8, 1);
}

- (double)duration
{
  return self->_duration;
}

- (id)endDate
{
  if (self->_duration == 0.0)
  {
    v2 = self->_startDate;
    return v2;
  }
  else
  {
    startDate = self->_startDate;
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    return (id)objc_msgSend(v5, "dateWithTimeInterval:sinceDate:", startDate);
  }
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 duration:(double)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:@"Start date is nil!", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_8;
  }
  if (a4 < 0.0)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:@"Duration is less than 0!", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_8:
    v10 = v9;

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  v11.receiver = self;
  v11.super_class = (Class)_NSConcreteDateInterval;
  v6 = [(NSDateInterval *)&v11 init];
  if (v6)
  {
    v6->_startDate = (NSDate *)[a3 copy];
    v6->_duration = a4;
  }
  return v6;
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v11 = +[NSString stringWithFormat:@"Start date is nil!", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_9:
    uint64_t v12 = v11;

    v13 = (void *)MEMORY[0x1E4F1CA00];
    v14 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_11;
  }
  if (!a4)
  {
    objc_super v11 = +[NSString stringWithFormat:@"End date is nil!", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_9;
  }
  if ([a3 compare:a4] == 1)
  {
    uint64_t v12 = +[NSString stringWithFormat:@"Start date cannot be later in time than end date!", _NSMethodExceptionProem((objc_class *)self, a2)];

    v13 = (void *)MEMORY[0x1E4F1CA00];
    v14 = (void *)MEMORY[0x1E4F1C3A8];
LABEL_11:
    objc_exception_throw((id)[v13 exceptionWithName:*v14 reason:v12 userInfo:0]);
  }
  v15.receiver = self;
  v15.super_class = (Class)_NSConcreteDateInterval;
  v8 = [(NSDateInterval *)&v15 init];
  if (v8)
  {
    v8->_startDate = (NSDate *)[a3 copy];
    [a4 timeIntervalSinceDate:a3];
    v8->_duration = v9;
  }
  return v8;
}

- (_NSConcreteDateInterval)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];

  return [(_NSConcreteDateInterval *)self initWithStartDate:v3 duration:0.0];
}

@end