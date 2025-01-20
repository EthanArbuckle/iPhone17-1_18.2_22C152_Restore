@interface ATXCompactTimeSummary
+ (BOOL)supportsSecureCoding;
- (ATXCompactTimeSummary)initWithCoder:(id)a3;
- (ATXCompactTimeSummary)initWithTimeMarbles:(id)a3;
- (NSArray)timeMarbles;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCompactTimeSummary

- (ATXCompactTimeSummary)initWithTimeMarbles:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXCompactTimeSummary;
  v5 = [(ATXCompactTimeSummary *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timeMarbles = v5->_timeMarbles;
    v5->_timeMarbles = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXCompactTimeSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"timeMarbles"];

  uint64_t v6 = [(ATXCompactTimeSummary *)self initWithTimeMarbles:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)timeMarbles
{
  return self->_timeMarbles;
}

- (void).cxx_destruct
{
}

@end