@interface AFGetTimerResponse
+ (BOOL)supportsSecureCoding;
- (AFGetTimerResponse)initWithCoder:(id)a3;
- (STTimer)timer;
- (void)encodeWithCoder:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation AFGetTimerResponse

- (void).cxx_destruct
{
}

- (void)setTimer:(id)a3
{
}

- (STTimer)timer
{
  return self->_timer;
}

- (AFGetTimerResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFGetTimerResponse;
  v5 = [(AFSiriResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timer"];
    timer = v5->_timer;
    v5->_timer = (STTimer *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFGetTimerResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_timer, @"timer", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end