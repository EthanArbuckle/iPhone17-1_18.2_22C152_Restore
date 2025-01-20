@interface HMMHomeLogEvent
- (HMMHomeLogEvent)initWithHomeUUID:(id)a3;
- (HMMHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSString)homeUUIDString;
- (NSUUID)homeUUID;
@end

@implementation HMMHomeLogEvent

- (void).cxx_destruct
{
}

- (HMMHomeLogEvent)initWithHomeUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMHomeLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeUUID, a3);
  }

  return v7;
}

- (HMMHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMHomeLogEvent;
  v8 = [(HMMLogEvent *)&v11 initWithStartTime:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_homeUUID, a4);
  }

  return v9;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSString)homeUUIDString
{
  v2 = [(HMMHomeLogEvent *)self homeUUID];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

@end