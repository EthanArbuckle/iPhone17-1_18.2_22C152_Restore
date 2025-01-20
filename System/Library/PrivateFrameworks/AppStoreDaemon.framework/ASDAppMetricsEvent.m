@interface ASDAppMetricsEvent
+ (BOOL)supportsSecureCoding;
- (ASDAppMetricsEvent)initWithCoder:(id)a3;
- (BOOL)isPosted;
- (NSDictionary)payload;
- (NSNumber)eventTime;
- (int64_t)eventSubtype;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventSubtype:(int64_t)a3;
- (void)setEventTime:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setPayload:(id)a3;
- (void)setPosted:(BOOL)a3;
@end

@implementation ASDAppMetricsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppMetricsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDAppMetricsEvent;
  v5 = [(ASDAppMetricsEvent *)&v17 init];
  if (v5)
  {
    v5->_eventType = [v4 decodeIntegerForKey:@"_eventType"];
    v5->_eventSubtype = [v4 decodeIntegerForKey:@"_eventSubtype"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventTime"];
    eventTime = v5->_eventTime;
    v5->_eventTime = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_payload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v14;

    v5->_posted = [v4 decodeBoolForKey:@"_posted"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType = self->_eventType;
  id v5 = a3;
  [v5 encodeInteger:eventType forKey:@"_eventType"];
  [v5 encodeInteger:self->_eventSubtype forKey:@"_eventSubtype"];
  [v5 encodeObject:self->_eventTime forKey:@"_eventTime"];
  [v5 encodeObject:self->_payload forKey:@"_payload"];
  [v5 encodeBool:self->_posted forKey:@"_posted"];
}

- (int64_t)eventSubtype
{
  return self->_eventSubtype;
}

- (void)setEventSubtype:(int64_t)a3
{
  self->_eventSubtype = a3;
}

- (NSNumber)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_int64_t eventType = a3;
}

- (BOOL)isPosted
{
  return self->_posted;
}

- (void)setPosted:(BOOL)a3
{
  self->_posted = a3;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
}

@end