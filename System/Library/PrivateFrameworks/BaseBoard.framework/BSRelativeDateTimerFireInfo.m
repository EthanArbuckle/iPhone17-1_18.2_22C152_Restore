@interface BSRelativeDateTimerFireInfo
- (BSRelativeDateTimerFireInfo)initWithValue:(unint64_t)a3 resolution:(unint64_t)a4 comparedToNow:(int64_t)a5 fireDate:(id)a6;
- (NSDate)fireDate;
- (int64_t)comparedToNow;
- (unint64_t)resolution;
- (unint64_t)value;
@end

@implementation BSRelativeDateTimerFireInfo

- (BSRelativeDateTimerFireInfo)initWithValue:(unint64_t)a3 resolution:(unint64_t)a4 comparedToNow:(int64_t)a5 fireDate:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BSRelativeDateTimerFireInfo;
  v11 = [(BSRelativeDateTimerFireInfo *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_value = a3;
    v11->_resolution = a4;
    v11->_comparedToNow = a5;
    uint64_t v13 = [v10 copy];
    fireDate = v12->_fireDate;
    v12->_fireDate = (NSDate *)v13;
  }
  return v12;
}

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)resolution
{
  return self->_resolution;
}

- (int64_t)comparedToNow
{
  return self->_comparedToNow;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
}

@end