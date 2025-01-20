@interface RTFetchFingerprintsOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (NSDateInterval)dateInterval;
- (RTFetchFingerprintsOptions)init;
- (RTFetchFingerprintsOptions)initWithCoder:(id)a3;
- (RTFetchFingerprintsOptions)initWithDateInterval:(id)a3 settledState:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)settledState;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setSettledState:(unint64_t)a3;
@end

@implementation RTFetchFingerprintsOptions

- (RTFetchFingerprintsOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTFetchFingerprintsOptions *)self initWithDateInterval:v6 settledState:2];
  return v7;
}

- (RTFetchFingerprintsOptions)initWithDateInterval:(id)a3 settledState:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTFetchFingerprintsOptions;
  v7 = [(RTFetchFingerprintsOptions *)&v15 init];
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [v6 copy];
      dateInterval = v7->_dateInterval;
      v7->_dateInterval = (NSDateInterval *)v8;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
      dateInterval = [MEMORY[0x1E4F1C9C8] distantPast];
      v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v12 = [v10 initWithStartDate:dateInterval endDate:v11];
      v13 = v7->_dateInterval;
      v7->_dateInterval = (NSDateInterval *)v12;
    }
    v7->_settledState = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  dateInterval = self->_dateInterval;
  unint64_t settledState = self->_settledState;
  return (id)[v4 initWithDateInterval:dateInterval settledState:settledState];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeInteger:self->_settledState forKey:@"settledState"];
}

- (RTFetchFingerprintsOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"settledState"];

  v7 = [(RTFetchFingerprintsOptions *)self initWithDateInterval:v5 settledState:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTFetchFingerprintsOptions *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTFetchFingerprintsOptions *)self isEqualToOptions:v5];

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  uint64_t v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    v9 = [v6 dateInterval];
    char v10 = [(NSDateInterval *)v8 isEqual:v9];

    if (dateInterval) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v3 = [v5 dateInterval];
  if (v3)
  {
    uint64_t v8 = self->_dateInterval;
    goto LABEL_4;
  }
  char v10 = 1;
LABEL_7:

LABEL_8:
  unint64_t settledState = self->_settledState;
  if (settledState == [v6 settledState]) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_dateInterval hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_settledState];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(NSDateInterval *)self->_dateInterval startDate];
  unint64_t v5 = [(NSDateInterval *)self->_dateInterval endDate];
  BOOL v6 = [v3 stringWithFormat:@"start date, %@, end date, %@, settledState, %lu", v4, v5, self->_settledState];

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setSettledState:(unint64_t)a3
{
  self->_unint64_t settledState = a3;
}

- (void).cxx_destruct
{
}

@end