@interface AFSearchAlarmsRequest
+ (BOOL)supportsSecureCoding;
- (AFSearchAlarmsRequest)initWithCoder:(id)a3;
- (STAlarm)criteria;
- (id)createResponse;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setOptions:(int64_t)a3;
@end

@implementation AFSearchAlarmsRequest

- (void).cxx_destruct
{
}

- (void)setCriteria:(id)a3
{
}

- (STAlarm)criteria
{
  return self->_criteria;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (AFSearchAlarmsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSearchAlarmsRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_options = [v4 decodeIntegerForKey:@"Options"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Criteria"];
    criteria = v5->_criteria;
    v5->_criteria = (STAlarm *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSearchAlarmsRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, @"Options", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_criteria forKey:@"Criteria"];
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSearchAlarmsResponse alloc] _initWithRequest:self];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end