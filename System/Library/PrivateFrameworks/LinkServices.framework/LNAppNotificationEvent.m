@interface LNAppNotificationEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithType:(int64_t)a3 bundleIdentifier:(id)a4 entityType:(id)a5 instanceIdentifiers:(id)a6;
- (BOOL)isEqual:(id)a3;
- (LNAppNotificationEvent)initWithCoder:(id)a3;
- (LNAppNotificationEvent)initWithEventType:(int64_t)a3 bundleIdentifier:(id)a4 entityType:(id)a5 instanceIdentifiers:(id)a6;
- (NSArray)instanceIdentifiers;
- (NSString)bundleIdentifier;
- (NSString)entityType;
- (id)description;
- (int64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppNotificationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSArray)instanceIdentifiers
{
  return self->_instanceIdentifiers;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)entityType
{
  return self->_entityType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAppNotificationEvent *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNAppNotificationEvent *)self eventType];
        if (v7 != [(LNAppNotificationEvent *)v6 eventType])
        {
          LOBYTE(v13) = 0;
LABEL_31:

          goto LABEL_32;
        }
        v8 = [(LNAppNotificationEvent *)self bundleIdentifier];
        v9 = [(LNAppNotificationEvent *)v6 bundleIdentifier];
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11) {
            goto LABEL_28;
          }
          BOOL v16 = [(LNAppNotificationEvent *)v10 isEqual:v11];

          if (!v16)
          {
            LOBYTE(v13) = 0;
LABEL_29:

            goto LABEL_30;
          }
        }
        v17 = [(LNAppNotificationEvent *)self entityType];
        v18 = [(LNAppNotificationEvent *)v6 entityType];
        v15 = v17;
        v19 = v18;
        v14 = v19;
        if (v15 == v19)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v20 = v19;
          v21 = v15;
          if (!v15 || !v19)
          {
LABEL_27:

LABEL_28:
            goto LABEL_29;
          }
          BOOL v13 = [(LNAppNotificationEvent *)v15 isEqual:v19];

          if (!v13) {
            goto LABEL_28;
          }
        }
        v22 = [(LNAppNotificationEvent *)self instanceIdentifiers];
        v23 = [(LNAppNotificationEvent *)v6 instanceIdentifiers];
        v21 = v22;
        v24 = v23;
        v20 = v24;
        if (v21 == v24)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          LOBYTE(v13) = 0;
          if (v21 && v24) {
            LOBYTE(v13) = [(LNAppNotificationEvent *)v21 isEqual:v24];
          }
        }

        goto LABEL_27;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  LOBYTE(v13) = 1;
LABEL_32:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(LNAppNotificationEvent *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAppNotificationEvent *)self entityType];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = [(LNAppNotificationEvent *)self instanceIdentifiers];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(LNAppNotificationEvent *)self eventType];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNAppNotificationEvent *)self bundleIdentifier];
  int64_t v7 = [(LNAppNotificationEvent *)self entityType];
  int64_t v8 = [(LNAppNotificationEvent *)self eventType];
  unint64_t v9 = @"Created";
  if (v8 == 1) {
    unint64_t v9 = @"Deleted";
  }
  if (v8 == 2) {
    unint64_t v9 = @"Updated";
  }
  v10 = v9;
  v11 = [(LNAppNotificationEvent *)self instanceIdentifiers];
  v12 = [v3 stringWithFormat:@"<%@:%p, bundleIdentifier: %@, entityType: %@, eventType: %@, instanceIdentifiers: %@>", v5, self, v6, v7, v10, v11];

  return v12;
}

- (LNAppNotificationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"eventType"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityType"];
  int64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"instanceIdentifiers"];

  v12 = [(LNAppNotificationEvent *)self initWithEventType:v5 bundleIdentifier:v6 entityType:v7 instanceIdentifiers:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(LNAppNotificationEvent *)self bundleIdentifier];
  [v7 encodeObject:v4 forKey:@"bundleIdentifier"];

  uint64_t v5 = [(LNAppNotificationEvent *)self entityType];
  [v7 encodeObject:v5 forKey:@"entityType"];

  uint64_t v6 = [(LNAppNotificationEvent *)self instanceIdentifiers];
  [v7 encodeObject:v6 forKey:@"instanceIdentifiers"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[LNAppNotificationEvent eventType](self, "eventType"), @"eventType");
}

- (LNAppNotificationEvent)initWithEventType:(int64_t)a3 bundleIdentifier:(id)a4 entityType:(id)a5 instanceIdentifiers:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNAppNotificationEvent.m", 31, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"LNAppNotificationEvent.m", 32, @"Invalid parameter not satisfying: %@", @"entityType" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNAppNotificationEvent;
  v15 = [(LNAppNotificationEvent *)&v23 init];
  BOOL v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    objc_storeStrong((id *)&v15->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v16->_entityType, a5);
    uint64_t v17 = [v14 copy];
    instanceIdentifiers = v16->_instanceIdentifiers;
    v16->_instanceIdentifiers = (NSArray *)v17;

    v19 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithType:(int64_t)a3 bundleIdentifier:(id)a4 entityType:(id)a5 instanceIdentifiers:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [[LNAppNotificationEvent alloc] initWithEventType:a3 bundleIdentifier:v11 entityType:v10 instanceIdentifiers:v9];

  return v12;
}

@end