@interface HKHealthAppIDSMessage
+ (BOOL)supportsSecureCoding;
- (HKHealthAppIDSMessage)initWithCoder:(id)a3;
- (HKHealthAppIDSMessage)initWithMessageKind:(int64_t)a3;
- (NSSecureCoding)payload;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation HKHealthAppIDSMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthAppIDSMessage)initWithMessageKind:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKHealthAppIDSMessage;
  v4 = [(HKHealthAppIDSMessage *)&v8 init];
  v5 = v4;
  if (v4)
  {
    payload = v4->_payload;
    v4->_type = a3;
    v4->_payload = 0;
  }
  return v5;
}

- (HKHealthAppIDSMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthAppIDSMessage;
  v5 = [(HKHealthAppIDSMessage *)&v9 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectForKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSSecureCoding *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_payload forKey:@"payload"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSSecureCoding)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end