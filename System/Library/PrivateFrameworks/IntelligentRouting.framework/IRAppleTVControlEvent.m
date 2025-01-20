@interface IRAppleTVControlEvent
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)_isEventSubTypeValid:(int64_t)a3;
- (BOOL)_isEventTypeValid:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IRAppleTVControlEvent)init;
- (IRAppleTVControlEvent)initWithCoder:(id)a3;
- (IRAppleTVControlEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4;
- (NSString)bundleID;
- (NSString)contextIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventSubType;
- (int64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContextIdentifier:(id)a3;
@end

@implementation IRAppleTVControlEvent

- (IRAppleTVControlEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4
{
  v6 = self;
  if (-[IRAppleTVControlEvent _isEventTypeValid:](self, "_isEventTypeValid:")
    && [(IRAppleTVControlEvent *)v6 _isEventSubTypeValid:a4])
  {
    v10.receiver = v6;
    v10.super_class = (Class)IRAppleTVControlEvent;
    v7 = [(IREvent *)&v10 initWithName:@"kIREventNameAppleTVControl"];
    if (v7)
    {
      v7->_eventType = a3;
      v7->_eventSubType = a4;
    }
    v6 = v7;
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isEventTypeValid:(int64_t)a3
{
  return (unint64_t)a3 < 6;
}

- (BOOL)_isEventSubTypeValid:(int64_t)a3
{
  return a3 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IRAppleTVControlEvent;
  v5 = -[IREvent copyWithZone:](&v12, sel_copyWithZone_);
  v5[2] = [(IRAppleTVControlEvent *)self eventType];
  v5[3] = [(IRAppleTVControlEvent *)self eventSubType];
  uint64_t v6 = [(NSString *)self->_contextIdentifier copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  objc_super v10 = self;
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IRAppleTVControlEvent;
  id v4 = a3;
  [(IREvent *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", self->_eventType, v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"eventType"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_eventSubType];
  [v4 encodeObject:v6 forKey:@"eventSubType"];

  [v4 encodeObject:self->_contextIdentifier forKey:@"contextIdentifier"];
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
}

- (IRAppleTVControlEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IRAppleTVControlEvent;
  v5 = [(IREvent *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventType"];
    objc_super v7 = v6;
    if (v6)
    {
      int64_t v8 = (int)[(IRAppleTVControlEvent *)v6 intValue];

      v5->_eventType = v8;
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventSubType"];
      objc_super v7 = v9;
      if (v9)
      {
        int64_t v10 = (int)[(IRAppleTVControlEvent *)v9 intValue];

        v5->_eventSubType = v10;
        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
        uint64_t v12 = self;

        contextIdentifier = v5->_contextIdentifier;
        v5->_contextIdentifier = (NSString *)v12;

        v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
        uint64_t v15 = self;

        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v15;

        objc_super v7 = v5;
      }
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (IRAppleTVControlEvent)init
{
}

+ (id)new
{
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  objc_super v7 = [(IREvent *)self name];
  [v6 appendFormat:@", name: %@", v7];

  unint64_t eventType = self->_eventType;
  v9 = @"Invalid";
  if (eventType <= 5) {
    v9 = off_26539E5F0[eventType];
  }
  [v6 appendFormat:@", eventType: %@", v9];
  if (self->_eventSubType) {
    int64_t v10 = @"Invalid";
  }
  else {
    int64_t v10 = @"Default";
  }
  [v6 appendFormat:@", eventSubType: %@", v10];
  [v6 appendFormat:@", contextIdentifier: %@", self->_contextIdentifier];
  [v6 appendFormat:@", bundleID: %@", self->_bundleID];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IRAppleTVControlEvent *)self eventType];
    if (v6 == [v5 eventType])
    {
      int64_t v7 = [(IRAppleTVControlEvent *)self eventSubType];
      if (v7 == [v5 eventSubType])
      {
        int64_t v8 = [(IRAppleTVControlEvent *)self contextIdentifier];
        v9 = [v5 contextIdentifier];
        if ([v8 isEqual:v9])
        {

          goto LABEL_11;
        }
        v11 = [(IRAppleTVControlEvent *)self contextIdentifier];
        uint64_t v12 = [v5 contextIdentifier];

        if (v11 == v12)
        {
LABEL_11:
          v14 = [(IRAppleTVControlEvent *)self bundleID];
          uint64_t v15 = [v5 bundleID];
          if ([v14 isEqual:v15])
          {

            char v10 = 1;
          }
          else
          {
            v16 = [(IRAppleTVControlEvent *)self bundleID];
            v17 = [v5 bundleID];
            BOOL v18 = v16 != v17;

            char v10 = !v18;
          }
          goto LABEL_9;
        }
      }
    }
    char v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  char v10 = 0;
LABEL_10:

  return v10 & 1;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)IRAppleTVControlEvent;
  unint64_t v3 = [(IREvent *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_contextIdentifier hash];
  return v3 ^ v4 ^ [(NSString *)self->_bundleID hash] ^ self->_eventSubType ^ self->_eventType ^ 0x1F;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)eventSubType
{
  return self->_eventSubType;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end