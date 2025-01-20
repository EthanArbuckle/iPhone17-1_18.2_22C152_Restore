@interface GTReplayResponseStream
+ (BOOL)supportsSecureCoding;
- (GTReplayResponseStream)initWithCoder:(id)a3;
- (GTReplayResponseStream)initWithState:(unsigned int)a3;
- (unsigned)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(unsigned int)a3;
@end

@implementation GTReplayResponseStream

- (GTReplayResponseStream)initWithState:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GTReplayResponseStream;
  v4 = [(GTReplayResponse *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayResponseStream)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayResponseStream;
  v5 = [(GTReplayResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_state = [v4 decodeInt32ForKey:@"state"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayResponseStream;
  id v4 = a3;
  [(GTReplayResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_state, @"state", v5.receiver, v5.super_class);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

@end