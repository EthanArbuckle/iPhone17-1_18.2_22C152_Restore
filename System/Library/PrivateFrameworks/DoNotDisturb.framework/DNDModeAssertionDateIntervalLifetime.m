@interface DNDModeAssertionDateIntervalLifetime
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveForDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertionDateIntervalLifetime)initWithCoder:(id)a3;
- (DNDModeAssertionDateIntervalLifetime)initWithDateInterval:(id)a3;
- (NSDateInterval)dateInterval;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionDateIntervalLifetime

- (DNDModeAssertionDateIntervalLifetime)initWithDateInterval:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDModeAssertionDateIntervalLifetime;
  v5 = [(DNDModeAssertionLifetime *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;
  }
  return v5;
}

- (BOOL)isActiveForDate:(id)a3
{
  id v4 = a3;
  if ([(NSDateInterval *)self->_dateInterval containsDate:v4])
  {
    v5 = [(NSDateInterval *)self->_dateInterval endDate];
    BOOL v6 = [v5 compare:v4] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDModeAssertionDateIntervalLifetime *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
      v7 = [(DNDModeAssertionDateIntervalLifetime *)v5 dateInterval];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
        if (v8)
        {
          objc_super v9 = [(DNDModeAssertionDateIntervalLifetime *)v5 dateInterval];
          if (v9)
          {
            v10 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
            v11 = [(DNDModeAssertionDateIntervalLifetime *)v5 dateInterval];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p; dateInterval: %@>", v4, self, v5];

  return v6;
}

- (unint64_t)lifetimeType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionDateIntervalLifetime)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];

  BOOL v6 = [(DNDModeAssertionDateIntervalLifetime *)self initWithDateInterval:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDModeAssertionDateIntervalLifetime *)self dateInterval];
  [v4 encodeObject:v5 forKey:@"dateInterval"];
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
}

@end