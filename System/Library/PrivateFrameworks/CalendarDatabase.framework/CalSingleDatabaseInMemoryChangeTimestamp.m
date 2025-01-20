@interface CalSingleDatabaseInMemoryChangeTimestamp
+ (BOOL)supportsSecureCoding;
- (CalSingleDatabaseInMemoryChangeTimestamp)init;
- (CalSingleDatabaseInMemoryChangeTimestamp)initWithCoder:(id)a3;
- (CalSingleDatabaseInMemoryChangeTimestamp)initWithDawnOfTime;
- (CalSingleDatabaseInMemoryChangeTimestamp)initWithTimestampForMyself:(unint64_t)a3 others:(unint64_t)a4;
- (unint64_t)myself;
- (unint64_t)others;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CalSingleDatabaseInMemoryChangeTimestamp

- (CalSingleDatabaseInMemoryChangeTimestamp)init
{
  v5.receiver = self;
  v5.super_class = (Class)CalSingleDatabaseInMemoryChangeTimestamp;
  v2 = [(CalSingleDatabaseInMemoryChangeTimestamp *)&v5 init];
  if (v2)
  {
    uint64_t v3 = CalMonotonicTime();
    v2->_others = v3;
    v2->_myself = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithDawnOfTime
{
  return [(CalSingleDatabaseInMemoryChangeTimestamp *)self initWithTimestampForMyself:0 others:0];
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithTimestampForMyself:(unint64_t)a3 others:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CalSingleDatabaseInMemoryChangeTimestamp;
  result = [(CalSingleDatabaseInMemoryChangeTimestamp *)&v7 init];
  if (result)
  {
    result->_others = a4;
    result->_myself = a3;
  }
  return result;
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"myself"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"others"];

  return [(CalSingleDatabaseInMemoryChangeTimestamp *)self initWithTimestampForMyself:v5 others:v6];
}

- (void)encodeWithCoder:(id)a3
{
  myself = self->_myself;
  id v5 = a3;
  [v5 encodeInt64:myself forKey:@"myself"];
  [v5 encodeInt64:self->_others forKey:@"others"];
}

- (unint64_t)others
{
  return self->_others;
}

- (unint64_t)myself
{
  return self->_myself;
}

@end