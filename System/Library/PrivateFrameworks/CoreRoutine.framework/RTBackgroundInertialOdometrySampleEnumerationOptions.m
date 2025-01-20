@interface RTBackgroundInertialOdometrySampleEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (RTBackgroundInertialOdometrySampleEnumerationOptions)init;
- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithCoder:(id)a3;
- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithDateInterval:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)processingBlock;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation RTBackgroundInertialOdometrySampleEnumerationOptions

- (RTBackgroundInertialOdometrySampleEnumerationOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTBackgroundInertialOdometrySampleEnumerationOptions *)self initWithDateInterval:v6];
  return v7;
}

- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithDateInterval:(id)a3
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTBackgroundInertialOdometrySampleEnumerationOptions;
  v7 = [(RTBackgroundInertialOdometrySampleEnumerationOptions *)&v11 init];
  if (v7)
  {
    if (v6)
    {
      v8 = (void *)[v6 copy];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
      v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v8 = (void *)[v9 initWithStartDate:v3 endDate:v4];
    }
    objc_storeStrong((id *)&v7->_dateInterval, v8);
    if (!v6)
    {

      v8 = (void *)v3;
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RTBackgroundInertialOdometrySampleEnumerationOptions *)self dateInterval];
  id v6 = (void *)[v4 initWithDateInterval:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];

  id v6 = [(RTBackgroundInertialOdometrySampleEnumerationOptions *)self initWithDateInterval:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTBackgroundInertialOdometrySampleEnumerationOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTBackgroundInertialOdometrySampleEnumerationOptions *)self isEqualToOptions:v5];

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (!dateInterval)
  {
    uint64_t v3 = [v5 dateInterval];
    if (!v3)
    {
      char v10 = 1;
LABEL_7:

      goto LABEL_8;
    }
    v8 = self->_dateInterval;
  }
  id v9 = [v6 dateInterval];
  char v10 = [(NSDateInterval *)v8 isEqual:v9];

  if (!dateInterval) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (unint64_t)hash
{
  return [(NSDateInterval *)self->_dateInterval hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(NSDateInterval *)self->_dateInterval startDate];
  id v5 = [v4 stringFromDate];
  BOOL v6 = [(NSDateInterval *)self->_dateInterval endDate];
  v7 = [v6 stringFromDate];
  v8 = [v3 stringWithFormat:@"start date, %@, end date, %@", v5, v7];

  return v8;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)processingBlock
{
  return 0;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end