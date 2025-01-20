@interface DNDModeAssertionScheduleLifetime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertionScheduleLifetime)initWithCoder:(id)a3;
- (DNDModeAssertionScheduleLifetime)initWithScheduleIdentifier:(id)a3 behavior:(unint64_t)a4;
- (NSString)scheduleIdentifier;
- (id)description;
- (unint64_t)behavior;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionScheduleLifetime

- (DNDModeAssertionScheduleLifetime)initWithScheduleIdentifier:(id)a3 behavior:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeAssertionScheduleLifetime;
  v7 = [(DNDModeAssertionLifetime *)&v11 _init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    scheduleIdentifier = v7->_scheduleIdentifier;
    v7->_scheduleIdentifier = (NSString *)v8;

    v7->_behavior = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDModeAssertionScheduleLifetime *)self lifetimeType] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = (DNDModeAssertionScheduleLifetime *)a3;
  if (self == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      v10 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
      objc_super v11 = [(DNDModeAssertionScheduleLifetime *)v9 scheduleIdentifier];
      if (v10 != v11)
      {
        uint64_t v12 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
        if (!v12)
        {
          BOOL v14 = 0;
          goto LABEL_15;
        }
        v3 = (void *)v12;
        uint64_t v13 = [(DNDModeAssertionScheduleLifetime *)v9 scheduleIdentifier];
        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_14;
        }
        uint64_t v4 = (void *)v13;
        unint64_t v5 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
        id v6 = [(DNDModeAssertionScheduleLifetime *)v9 scheduleIdentifier];
        if (![v5 isEqual:v6])
        {
          BOOL v14 = 0;
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
      }
      unint64_t v15 = [(DNDModeAssertionScheduleLifetime *)self behavior];
      BOOL v14 = v15 == [(DNDModeAssertionScheduleLifetime *)v9 behavior];
      if (v10 != v11) {
        goto LABEL_11;
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
  id v6 = DNDStringFromModeAssertionScheduleLifetimeBehavior([(DNDModeAssertionScheduleLifetime *)self behavior]);
  v7 = [v3 stringWithFormat:@"<%@: %p; scheduleIdentifier: '%@'; behavior: %@>", v4, self, v5, v6];

  return v7;
}

- (unint64_t)lifetimeType
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionScheduleLifetime)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"behavior"];

  v7 = [(DNDModeAssertionScheduleLifetime *)self initWithScheduleIdentifier:v5 behavior:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(DNDModeAssertionScheduleLifetime *)self scheduleIdentifier];
  [v5 encodeObject:v4 forKey:@"scheduleIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDModeAssertionScheduleLifetime behavior](self, "behavior"), @"behavior");
}

- (NSString)scheduleIdentifier
{
  return self->_scheduleIdentifier;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
}

@end