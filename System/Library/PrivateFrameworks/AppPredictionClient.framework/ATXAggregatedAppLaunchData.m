@interface ATXAggregatedAppLaunchData
+ (BOOL)supportsSecureCoding;
- (ATXAggregatedAppLaunchData)initWithCoder:(id)a3;
- (ATXAggregatedAppLaunchData)initWithRawLaunchCount:(unint64_t)a3 uniqueDaysLaunched:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGreaterThanOrEqualToData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)rawLaunchCount;
- (unint64_t)uniqueDaysLaunched;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAggregatedAppLaunchData

- (ATXAggregatedAppLaunchData)initWithRawLaunchCount:(unint64_t)a3 uniqueDaysLaunched:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXAggregatedAppLaunchData;
  result = [(ATXAggregatedAppLaunchData *)&v7 init];
  if (result)
  {
    result->_rawLaunchCount = a3;
    result->_uniqueDaysLaunched = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t rawLaunchCount = self->_rawLaunchCount;
  id v5 = a3;
  [v5 encodeInteger:rawLaunchCount forKey:@"rawLaunchCount"];
  [v5 encodeInteger:self->_uniqueDaysLaunched forKey:@"uniqueDaysLaunched"];
}

- (ATXAggregatedAppLaunchData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"rawLaunchCount"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"uniqueDaysLaunched"];

  objc_super v7 = (ATXAggregatedAppLaunchData *)[objc_alloc((Class)objc_opt_class()) initWithRawLaunchCount:v5 uniqueDaysLaunched:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t rawLaunchCount = self->_rawLaunchCount;
  unint64_t uniqueDaysLaunched = self->_uniqueDaysLaunched;

  return (id)[v4 initWithRawLaunchCount:rawLaunchCount uniqueDaysLaunched:uniqueDaysLaunched];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXAggregatedAppLaunchData *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(ATXAggregatedAppLaunchData *)v5 rawLaunchCount] == self->_rawLaunchCount
        && [(ATXAggregatedAppLaunchData *)v5 uniqueDaysLaunched] == self->_uniqueDaysLaunched;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<ATXAggregatedAppLaunchData count=%ld; uniqueDays=%ld>",
                 [(ATXAggregatedAppLaunchData *)self rawLaunchCount],
                 [(ATXAggregatedAppLaunchData *)self uniqueDaysLaunched]);

  return v2;
}

- (BOOL)isGreaterThanOrEqualToData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXAggregatedAppLaunchData *)self rawLaunchCount];
  if (v5 >= [v4 rawLaunchCount])
  {
    unint64_t v7 = [(ATXAggregatedAppLaunchData *)self uniqueDaysLaunched];
    BOOL v6 = v7 >= [v4 uniqueDaysLaunched];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)rawLaunchCount
{
  return self->_rawLaunchCount;
}

- (unint64_t)uniqueDaysLaunched
{
  return self->_uniqueDaysLaunched;
}

@end