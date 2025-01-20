@interface IDSNegativeInfo
- (IDSNegativeInfo)initWithTime:(double)a3 count:(int64_t)a4;
- (double)time;
- (id)description;
- (int64_t)count;
@end

@implementation IDSNegativeInfo

- (IDSNegativeInfo)initWithTime:(double)a3 count:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSNegativeInfo;
  result = [(IDSNegativeInfo *)&v7 init];
  if (result)
  {
    result->_time = a3;
    result->_count = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t count = self->_count;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v6, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v3, v10, @"<%@: %p> count: %ld timeInCache: %f", v9 - self->_time, v4, self, count, v9 - self->_time);
}

- (double)time
{
  return self->_time;
}

- (int64_t)count
{
  return self->_count;
}

@end