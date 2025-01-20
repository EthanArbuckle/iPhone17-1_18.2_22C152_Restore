@interface HAENotificationEvent
+ (BOOL)supportsSecureCoding;
- (HAENotificationEvent)initWithCoder:(id)a3;
- (HAENotificationEvent)initWithEventType:(unsigned int)a3 exposureLevel:(double)a4 dateInterval:(id)a5 metadata:(id)a6;
- (NSDateInterval)dateInterval;
- (NSDictionary)metadata;
- (NSUUID)uuid;
- (double)level;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getEventTypeString;
- (unsigned)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAENotificationEvent

- (HAENotificationEvent)initWithEventType:(unsigned int)a3 exposureLevel:(double)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HAENotificationEvent;
  v13 = [(HAENotificationEvent *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->level = a4;
    objc_storeStrong((id *)&v13->dateInterval, a5);
    v14->eventType = a3;
    uint64_t v15 = [v12 copy];
    metadata = v14->metadata;
    v14->metadata = (NSDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263F08C38] UUID];
    uuid = v14->uuid;
    v14->uuid = (NSUUID *)v17;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [(HAENotificationEvent *)self level];
  objc_msgSend(v6, "encodeDouble:forKey:", @"AudioExposureLevel");
  v4 = [(HAENotificationEvent *)self dateInterval];
  [v6 encodeObject:v4 forKey:@"DateInterval"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[HAENotificationEvent eventType](self, "eventType"), @"EventType");
  v5 = [(HAENotificationEvent *)self metadata];
  [v6 encodeObject:v5 forKey:@"Metadata"];

  [v6 encodeObject:self->uuid forKey:@"UUID"];
}

- (HAENotificationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAENotificationEvent;
  v5 = [(HAENotificationEvent *)&v19 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"AudioExposureLevel"];
    v5->level = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
    dateInterval = v5->dateInterval;
    v5->dateInterval = (NSDateInterval *)v7;

    v5->eventType = [v4 decodeInt32ForKey:@"EventType"];
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Metadata"];
    uint64_t v14 = [v13 copy];
    metadata = v5->metadata;
    v5->metadata = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(HAENotificationEvent *)self eventType];
  [(HAENotificationEvent *)self level];
  double v8 = v7;
  v9 = [(HAENotificationEvent *)self dateInterval];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  uint64_t v11 = [(HAENotificationEvent *)self metadata];
  id v12 = (void *)[v11 copyWithZone:a3];
  v13 = (void *)[v5 initWithEventType:v6 exposureLevel:v10 dateInterval:v12 metadata:v8];

  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HAENotificationEvent *)self uuid];
  v5 = [(HAENotificationEvent *)self getEventTypeString];
  [(HAENotificationEvent *)self level];
  uint64_t v7 = v6;
  double v8 = [(HAENotificationEvent *)self dateInterval];
  v9 = [(HAENotificationEvent *)self metadata];
  uint64_t v10 = [v3 stringWithFormat:@"HAENotificationEvent: uuid= %@, type= %@, exposure level= %.2f, date= %@, metadata= %@", v4, v5, v7, v8, v9];

  return v10;
}

- (id)getEventTypeString
{
  unsigned int v2 = [(HAENotificationEvent *)self eventType];
  v3 = @"UnknownType";
  if (v2 == 2003133803) {
    v3 = @"HAENotificationEventTypeWeeklyLimit";
  }
  if (v2 == 1818850917) {
    return @"HAENotificationEventTypeLoudLimt";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)level
{
  return self->level;
}

- (NSDateInterval)dateInterval
{
  return self->dateInterval;
}

- (unsigned)eventType
{
  return self->eventType;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->dateInterval, 0);
}

@end