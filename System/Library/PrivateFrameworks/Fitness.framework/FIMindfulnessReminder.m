@interface FIMindfulnessReminder
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (FIMindfulnessReminder)initWithCoder:(id)a3;
- (FIMindfulnessReminder)initWithType:(int64_t)a3;
- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4;
- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4 customWeekdaySelection:(unint64_t)a5 enabled:(BOOL)a6;
- (NSDateComponents)customDateComponents;
- (id)_typeDescription;
- (id)description;
- (int64_t)type;
- (unint64_t)customWeekdaySelection;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIMindfulnessReminder

- (FIMindfulnessReminder)initWithType:(int64_t)a3
{
  return [(FIMindfulnessReminder *)self initWithType:a3 customDateComponents:0 customWeekdaySelection:0 enabled:1];
}

- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4
{
  return [(FIMindfulnessReminder *)self initWithType:a3 customDateComponents:a4 customWeekdaySelection:0 enabled:1];
}

- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4 customWeekdaySelection:(unint64_t)a5 enabled:(BOOL)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FIMindfulnessReminder;
  v12 = [(FIMindfulnessReminder *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_customDateComponents, a4);
    v13->_enabled = a6;
    v13->_customWeekdaySelection = a5;
    v13->_type = a3;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FIMindfulnessReminder *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    BOOL v12 = 1;
    goto LABEL_13;
  }
  int64_t type = self->_type;
  if (type == [(FIMindfulnessReminder *)v4 type])
  {
    customDateComponents = self->_customDateComponents;
    v8 = [(FIMindfulnessReminder *)v5 customDateComponents];
    if (customDateComponents == v8)
    {
      unint64_t customWeekdaySelection = self->_customWeekdaySelection;
      BOOL v12 = customWeekdaySelection == [(FIMindfulnessReminder *)v5 customWeekdaySelection];
    }
    else
    {
      v9 = self->_customDateComponents;
      v10 = [(FIMindfulnessReminder *)v5 customDateComponents];
      if ([(NSDateComponents *)v9 isEqual:v10])
      {
        unint64_t v11 = self->_customWeekdaySelection;
        BOOL v12 = v11 == [(FIMindfulnessReminder *)v5 customWeekdaySelection];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return [(NSDateComponents *)self->_customDateComponents hash] ^ type;
}

- (id)description
{
  v3 = NSString;
  BOOL enabled = self->_enabled;
  v5 = [(FIMindfulnessReminder *)self _typeDescription];
  v6 = [v3 stringWithFormat:@"FIMindfulnessReminder (%p): enabled: %d, type: %@, date components: (hour: %ld, minute: %ld)", self, enabled, v5, -[NSDateComponents hour](self->_customDateComponents, "hour"), -[NSDateComponents minute](self->_customDateComponents, "minute")];

  return v6;
}

- (id)_typeDescription
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 2) {
    return @"Unknown";
  }
  else {
    return off_26441C790[v2];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  customDateComponents = self->_customDateComponents;
  id v6 = v4;
  if (customDateComponents)
  {
    [v4 encodeObject:customDateComponents forKey:@"CustomDateComponents"];
    id v4 = v6;
  }
  [v4 encodeInteger:self->_customWeekdaySelection forKey:@"CustomWeekdaySelection"];
  [v6 encodeBool:self->_enabled forKey:@"Enabled"];
  [v6 encodeInteger:self->_type forKey:@"Type"];
}

- (FIMindfulnessReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIMindfulnessReminder;
  v5 = [(FIMindfulnessReminder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CustomDateComponents"];
    customDateComponents = v5->_customDateComponents;
    v5->_customDateComponents = (NSDateComponents *)v6;

    v5->_unint64_t customWeekdaySelection = [v4 decodeIntegerForKey:@"CustomWeekdaySelection"];
    v5->_BOOL enabled = [v4 decodeBoolForKey:@"Enabled"];
    unint64_t v8 = [v4 decodeIntegerForKey:@"Type"];
    if (v8 <= 3) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0;
    }
    v5->_int64_t type = v9;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateComponents)customDateComponents
{
  return self->_customDateComponents;
}

- (unint64_t)customWeekdaySelection
{
  return self->_customWeekdaySelection;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end