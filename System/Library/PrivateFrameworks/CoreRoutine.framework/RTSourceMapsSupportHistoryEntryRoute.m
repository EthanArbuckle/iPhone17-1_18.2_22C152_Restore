@interface RTSourceMapsSupportHistoryEntryRoute
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)navigationWasInterrupted;
- (RTSourceMapsSupportHistoryEntryRoute)initWithCoder:(id)a3;
- (RTSourceMapsSupportHistoryEntryRoute)initWithUsageDate:(id)a3 navigationWasInterrupted:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceMapsSupportHistoryEntryRoute

- (RTSourceMapsSupportHistoryEntryRoute)initWithUsageDate:(id)a3 navigationWasInterrupted:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  result = [(RTSourceMapsSupportHistoryEntry *)&v6 initWithUsageDate:a3];
  if (result) {
    result->_navigationWasInterrupted = a4;
  }
  return result;
}

- (RTSourceMapsSupportHistoryEntryRoute)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTSourceMapsSupportHistoryEntryRoute initWithCoder:]";
      __int16 v12 = 1024;
      int v13 = 31;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aDecoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  objc_super v6 = [(RTSourceMapsSupportHistoryEntry *)&v9 initWithCoder:v4];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"navigationWasInterrupted"];
    v6->_navigationWasInterrupted = [v7 BOOLValue];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v9 = "-[RTSourceMapsSupportHistoryEntryRoute encodeWithCoder:]";
      __int16 v10 = 1024;
      int v11 = 43;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aCoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  [(RTSourceMapsSupportHistoryEntry *)&v7 encodeWithCoder:v4];
  objc_super v6 = [NSNumber numberWithBool:self->_navigationWasInterrupted];
  [v4 encodeObject:v6 forKey:@"navigationWasInterrupted"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  if ([(RTSourceMapsSupportHistoryEntry *)&v10 isEqual:v4])
  {
    id v5 = v4;
    BOOL v6 = [(RTSourceMapsSupportHistoryEntryRoute *)self navigationWasInterrupted];
    char v7 = [v5 navigationWasInterrupted];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  unint64_t v3 = [(RTSourceMapsSupportHistoryEntry *)&v7 hash];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[RTSourceMapsSupportHistoryEntryRoute navigationWasInterrupted](self, "navigationWasInterrupted"));
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  id v4 = [(RTSourceMapsSupportHistoryEntry *)&v9 description];
  BOOL v5 = [(RTSourceMapsSupportHistoryEntryRoute *)self navigationWasInterrupted];
  BOOL v6 = @"NO";
  if (v5) {
    BOOL v6 = @"YES";
  }
  objc_super v7 = [v3 stringWithFormat:@"%@, navigationWasInterrupted, %@", v4, v6];

  return v7;
}

- (BOOL)navigationWasInterrupted
{
  return self->_navigationWasInterrupted;
}

@end