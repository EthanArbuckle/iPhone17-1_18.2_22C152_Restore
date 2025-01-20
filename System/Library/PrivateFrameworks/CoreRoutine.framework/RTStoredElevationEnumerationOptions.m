@interface RTStoredElevationEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (RTStoredElevationEnumerationOptions)init;
- (RTStoredElevationEnumerationOptions)initWithCoder:(id)a3;
- (RTStoredElevationEnumerationOptions)initWithDateInterval:(id)a3 batchSize:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)processingBlock;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTStoredElevationEnumerationOptions

- (RTStoredElevationEnumerationOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTStoredElevationEnumerationOptions *)self initWithDateInterval:v6 batchSize:0];
  return v7;
}

- (RTStoredElevationEnumerationOptions)initWithDateInterval:(id)a3 batchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStoredElevationEnumerationOptions;
  v8 = [(RTStoredElevationEnumerationOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  dateInterval = self->_dateInterval;
  unint64_t batchSize = self->_batchSize;
  return (id)[v4 initWithDateInterval:dateInterval batchSize:batchSize];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"dateInterval, %@, batchSize, %lu", self->_dateInterval, self->_batchSize];
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
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
}

- (RTStoredElevationEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"batchSize"];

  id v7 = [(RTStoredElevationEnumerationOptions *)self initWithDateInterval:v5 batchSize:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTStoredElevationEnumerationOptions *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredElevationEnumerationOptions *)self isEqualToOptions:v5];

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
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
    v8 = self->_dateInterval;
    goto LABEL_4;
  }
  char v10 = 1;
LABEL_7:

LABEL_8:
  unint64_t batchSize = self->_batchSize;
  if (batchSize == [v6 batchSize]) {
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
  id v4 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
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

- (void).cxx_destruct
{
}

@end