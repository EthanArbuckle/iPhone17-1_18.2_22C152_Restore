@interface ATXSettingsActionsClientRequest
+ (BOOL)supportsSecureCoding;
- (ATXSettingsActionsClientRequest)initWithCoder:(id)a3;
- (NSDate)startDate;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ATXSettingsActionsClientRequest

- (void).cxx_destruct
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t limit = self->_limit;
  id v5 = a3;
  [v5 encodeInteger:limit forKey:@"limit"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (ATXSettingsActionsClientRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsClientRequest;
  id v5 = [(ATXSettingsActionsClientRequest *)&v9 init];
  if (v5)
  {
    v5->_int64_t limit = [v4 decodeIntegerForKey:@"limit"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;
  }
  return v5;
}

- (void)setStartDate:(id)a3
{
}

@end