@interface HDIDSMessageOptions
+ (double)HDIDSMessageOptionsMaxMessageTimeout;
+ (id)defaultOptionsWithPriority:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HDIDSMessageOptions)initWithPriority:(unint64_t)a3 timeoutInterval:(double)a4;
- (double)timeoutInterval;
- (unint64_t)hash;
- (unint64_t)priority;
@end

@implementation HDIDSMessageOptions

- (HDIDSMessageOptions)initWithPriority:(unint64_t)a3 timeoutInterval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDIDSMessageOptions;
  result = [(HDIDSMessageOptions *)&v7 init];
  if (result)
  {
    result->_priority = a3;
    result->_timeoutInterval = a4;
  }
  return result;
}

+ (id)defaultOptionsWithPriority:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPriority:a3 timeoutInterval:0.0];

  return v3;
}

+ (double)HDIDSMessageOptionsMaxMessageTimeout
{
  return *MEMORY[0x1E4F6B050];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDIDSMessageOptions *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_priority == v4->_priority
      && self->_timeoutInterval == v4->_timeoutInterval;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t priority = self->_priority;
  v3 = [NSNumber numberWithDouble:self->_timeoutInterval];
  unint64_t v4 = [v3 hash] ^ priority;

  return v4;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

@end