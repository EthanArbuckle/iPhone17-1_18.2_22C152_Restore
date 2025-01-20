@interface IRMediaEvent
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)_isEventSubTypeValid:(int64_t)a3;
- (BOOL)_isEventTypeValid:(int64_t)a3;
- (BOOL)isEligibleApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOutsideApp;
- (IRMediaEvent)init;
- (IRMediaEvent)initWithCoder:(id)a3;
- (IRMediaEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4;
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
- (void)setIsEligibleApp:(BOOL)a3;
- (void)setIsOutsideApp:(BOOL)a3;
@end

@implementation IRMediaEvent

- (IRMediaEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4
{
  v6 = self;
  if (-[IRMediaEvent _isEventTypeValid:](self, "_isEventTypeValid:")
    && [(IRMediaEvent *)v6 _isEventSubTypeValid:a4])
  {
    v10.receiver = v6;
    v10.super_class = (Class)IRMediaEvent;
    v7 = [(IREvent *)&v10 initWithName:@"kIREventNameMedia"];
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
  return (unint64_t)a3 < 0xC;
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
  v12.super_class = (Class)IRMediaEvent;
  v5 = -[IREvent copyWithZone:](&v12, sel_copyWithZone_);
  v5[3] = [(IRMediaEvent *)self eventType];
  v5[4] = [(IRMediaEvent *)self eventSubType];
  uint64_t v6 = [(NSString *)self->_contextIdentifier copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  *((unsigned char *)v5 + 16) = [(IRMediaEvent *)self isOutsideApp];
  *((unsigned char *)v5 + 17) = [(IRMediaEvent *)self isEligibleApp];
  objc_super v10 = self;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IRMediaEvent;
  id v4 = a3;
  [(IREvent *)&v9 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", self->_eventType, v9.receiver, v9.super_class);
  [v4 encodeObject:v5 forKey:@"eventType"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_eventSubType];
  [v4 encodeObject:v6 forKey:@"eventSubType"];

  [v4 encodeObject:self->_contextIdentifier forKey:@"contextIdentifier"];
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
  v7 = [NSNumber numberWithBool:self->_isOutsideApp];
  [v4 encodeObject:v7 forKey:@"isOutsideApp"];

  uint64_t v8 = [NSNumber numberWithBool:self->_isEligibleApp];
  [v4 encodeObject:v8 forKey:@"isEligibleApp"];
}

- (IRMediaEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IRMediaEvent;
  v5 = [(IREvent *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventType"];
    v7 = v6;
    if (v6)
    {
      int64_t v8 = (int)[(IRMediaEvent *)v6 intValue];

      v5->_eventType = v8;
      objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventSubType"];
      v7 = v9;
      if (v9)
      {
        int64_t v10 = (int)[(IRMediaEvent *)v9 intValue];

        v5->_eventSubType = v10;
        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
        uint64_t v12 = self;

        contextIdentifier = v5->_contextIdentifier;
        v5->_contextIdentifier = (NSString *)v12;

        v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
        uint64_t v15 = self;

        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v15;

        v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isOutsideApp"];
        v7 = v17;
        if (v17)
        {
          char v18 = [(IRMediaEvent *)v17 BOOLValue];

          v5->_isOutsideApp = v18;
          v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isEligibleApp"];
          v7 = v19;
          if (v19)
          {
            char v20 = [(IRMediaEvent *)v19 BOOLValue];

            v5->_isEligibleApp = v20;
            v7 = v5;
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IRMediaEvent)init
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

  v7 = [(IREvent *)self name];
  [v6 appendFormat:@", name: %@", v7];

  int64_t v8 = IRMediaEventTypeToString(self->_eventType);
  [v6 appendFormat:@", eventType: %@", v8];

  if (self->_eventSubType) {
    objc_super v9 = @"Invalid";
  }
  else {
    objc_super v9 = @"Default";
  }
  [v6 appendFormat:@", eventSubType: %@", v9];
  [v6 appendFormat:@", contextIdentifier: %@", self->_contextIdentifier];
  [v6 appendFormat:@", bundleID: %@", self->_bundleID];
  int64_t v10 = [NSNumber numberWithBool:self->_isOutsideApp];
  [v6 appendFormat:@", isOutsideApp: %@", v10];

  v11 = [NSNumber numberWithBool:self->_isEligibleApp];
  [v6 appendFormat:@", isEligibleApp: %@", v11];

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
    int64_t v6 = [(IRMediaEvent *)self eventType];
    if (v6 != [v5 eventType]) {
      goto LABEL_12;
    }
    int64_t v7 = [(IRMediaEvent *)self eventSubType];
    if (v7 != [v5 eventSubType]) {
      goto LABEL_12;
    }
    int64_t v8 = [(IRMediaEvent *)self contextIdentifier];
    objc_super v9 = [v5 contextIdentifier];
    if ([v8 isEqual:v9])
    {
    }
    else
    {
      v11 = [(IRMediaEvent *)self contextIdentifier];
      uint64_t v12 = [v5 contextIdentifier];

      if (v11 != v12) {
        goto LABEL_12;
      }
    }
    v13 = [(IRMediaEvent *)self bundleID];
    v14 = [v5 bundleID];
    if ([v13 isEqual:v14])
    {
    }
    else
    {
      uint64_t v15 = [(IRMediaEvent *)self bundleID];
      v16 = [v5 bundleID];

      if (v15 != v16) {
        goto LABEL_12;
      }
    }
    int v17 = [(IRMediaEvent *)self isOutsideApp];
    if (v17 == [v5 isOutsideApp])
    {
      BOOL v19 = [(IRMediaEvent *)self isEligibleApp];
      int v10 = v19 ^ [v5 isEligibleApp] ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v10) = 0;
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)IRMediaEvent;
  unint64_t v3 = [(IREvent *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_contextIdentifier hash];
  return v3 ^ v4 ^ [(NSString *)self->_bundleID hash] ^ self->_eventSubType ^ self->_eventType ^ self->_isOutsideApp ^ self->_isEligibleApp ^ 0x1F;
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

- (BOOL)isOutsideApp
{
  return self->_isOutsideApp;
}

- (void)setIsOutsideApp:(BOOL)a3
{
  self->_isOutsideApp = a3;
}

- (BOOL)isEligibleApp
{
  return self->_isEligibleApp;
}

- (void)setIsEligibleApp:(BOOL)a3
{
  self->_isEligibleApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end