@interface CARConnectionEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6;
- (CARConnectionEvent)initWithCoder:(id)a3;
- (CARConnectionEvent)initWithDictionary:(id)a3;
- (CARConnectionEvent)initWithEventName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6;
- (NSDate)eventDate;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)payload;
- (NSString)eventName;
- (NSUUID)identifier;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CARConnectionEvent

- (CARConnectionEvent)initWithEventName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionEvent;
  v14 = [(CARConnectionEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventName, a3);
    objc_storeStrong((id *)&v15->_eventDate, a5);
    objc_storeStrong((id *)&v15->_payload, a6);
    v15->_eventType = a4;
  }

  return v15;
}

+ (id)eventWithName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithEventName:v12 type:a4 date:v11 payload:v10];

  return v13;
}

- (CARConnectionEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionEvent;
  v5 = [(CARConnectionEvent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"event"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"timestamp"];
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    uint64_t v10 = [v4 objectForKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v10;

    id v12 = [v4 valueForKey:@"eventType"];
    v5->_eventType = (int)[v12 intValue];

    id v13 = [v4 objectForKey:@"identifier"];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v14;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(CARConnectionEvent *)self eventName];
  [v3 setObject:v4 forKeyedSubscript:@"event"];

  v5 = [(CARConnectionEvent *)self eventDate];
  [v3 setObject:v5 forKeyedSubscript:@"timestamp"];

  uint64_t v6 = [(CARConnectionEvent *)self identifier];
  v7 = [v6 UUIDString];
  [v3 setObject:v7 forKeyedSubscript:@"identifier"];

  uint64_t v8 = [(CARConnectionEvent *)self payload];
  [v3 setObject:v8 forKeyedSubscript:@"payload"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CARConnectionEvent eventType](self, "eventType"));
  [v3 setObject:v9 forKeyedSubscript:@"eventType"];

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(CARConnectionEvent *)self eventName];
  [v8 encodeObject:v4 forKey:@"kCPEventNameKey"];

  v5 = [(CARConnectionEvent *)self eventDate];
  [v8 encodeObject:v5 forKey:@"kCPEventDateKey"];

  uint64_t v6 = [(CARConnectionEvent *)self payload];
  [v8 encodeObject:v6 forKey:@"kCPEventDictionaryKey"];

  v7 = [(CARConnectionEvent *)self identifier];
  [v8 encodeObject:v7 forKey:@"kCPEventIdentifierKey"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[CARConnectionEvent eventType](self, "eventType"), @"kCPEventTypeKey");
}

- (CARConnectionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARConnectionEvent;
  v5 = [(CARConnectionEvent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPEventNameKey"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPEventDateKey"];
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kCPEventDictionaryKey"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v15;

    v5->_eventType = [v4 decodeIntegerForKey:@"kCPEventTypeKey"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPEventIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v17;
  }
  return v5;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end