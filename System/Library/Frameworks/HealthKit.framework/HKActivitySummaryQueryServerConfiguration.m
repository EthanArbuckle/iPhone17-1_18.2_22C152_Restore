@interface HKActivitySummaryQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)orderByDateAscending;
- (BOOL)shouldIncludeActivitySummaryPrivateProperties;
- (BOOL)shouldIncludeActivitySummaryStatistics;
- (HKActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setOrderByDateAscending:(BOOL)a3;
- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3;
- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3;
@end

@implementation HKActivitySummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setShouldIncludeActivitySummaryPrivateProperties:self->_shouldIncludeActivitySummaryPrivateProperties];
  [v4 setShouldIncludeActivitySummaryStatistics:self->_shouldIncludeActivitySummaryStatistics];
  [v4 setOrderByDateAscending:self->_orderByDateAscending];
  [v4 setLimit:self->_limit];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_shouldIncludeActivitySummaryPrivateProperties = [v4 decodeBoolForKey:@"IncludePrivateProperties"];
    v5->_shouldIncludeActivitySummaryStatistics = [v4 decodeBoolForKey:@"IncludeStatistics"];
    v5->_orderByDateAscending = [v4 decodeBoolForKey:@"OrderByDateAscending"];
    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldIncludeActivitySummaryPrivateProperties, @"IncludePrivateProperties", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_shouldIncludeActivitySummaryStatistics forKey:@"IncludeStatistics"];
  [v4 encodeBool:self->_orderByDateAscending forKey:@"OrderByDateAscending"];
  [v4 encodeInteger:self->_limit forKey:@"Limit"];
}

- (BOOL)shouldIncludeActivitySummaryPrivateProperties
{
  return self->_shouldIncludeActivitySummaryPrivateProperties;
}

- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (BOOL)shouldIncludeActivitySummaryStatistics
{
  return self->_shouldIncludeActivitySummaryStatistics;
}

- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryStatistics = a3;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  self->_orderByDateAscending = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end