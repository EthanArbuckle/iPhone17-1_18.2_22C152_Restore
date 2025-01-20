@interface CMEvent
+ (BOOL)supportsSecureCoding;
- (CMEvent)initWithCoder:(id)a3;
- (NSString)peerDisplayName;
- (NSUUID)uuid;
- (double)timestamp;
- (unint64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setPeerDisplayName:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation CMEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMEvent;
  v5 = [(CMEvent *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_eventType = [v4 decodeIntegerForKey:@"ev"];
    uint64_t v7 = [v4 decodeObjectForKey:@"pd"];
    peerDisplayName = v5->_peerDisplayName;
    v5->_peerDisplayName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeInteger:self->_eventType forKey:@"ev"];
  [v5 encodeObject:self->_peerDisplayName forKey:@"pd"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setPeerDisplayName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
}

@end