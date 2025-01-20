@interface ADSessionAssertion
- (ADSessionAssertion)initWithTimestamp:(unint64_t)a3 reason:(id)a4;
- (NSString)description;
- (NSString)reason;
- (unint64_t)timestamp;
@end

@implementation ADSessionAssertion

- (void).cxx_destruct
{
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v10.receiver = self;
  v10.super_class = (Class)ADSessionAssertion;
  v4 = [(ADSessionAssertion *)&v10 description];
  unint64_t timestamp = self->_timestamp;
  reason = self->_reason;
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  v8 = [v3 initWithFormat:@"%@ {unint64_t timestamp = %llu, reason = %@, duration = %f seconds}", v4, timestamp, reason, v7];

  return (NSString *)v8;
}

- (ADSessionAssertion)initWithTimestamp:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADSessionAssertion;
  uint64_t v7 = [(ADSessionAssertion *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_unint64_t timestamp = a3;
    v9 = (NSString *)[v6 copy];
    reason = v8->_reason;
    v8->_reason = v9;
  }
  return v8;
}

@end