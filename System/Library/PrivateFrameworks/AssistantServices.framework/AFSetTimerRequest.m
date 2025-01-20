@interface AFSetTimerRequest
+ (BOOL)supportsSecureCoding;
- (AFSetTimerRequest)initWithCoder:(id)a3;
- (STTimer)timer;
- (id)createResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation AFSetTimerRequest

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

- (AFSetTimerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSetTimerRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Timer"];
    timer = v5->_timer;
    v5->_timer = (STTimer *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSetTimerRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_timer, @"Timer", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end