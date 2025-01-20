@interface RTSourceMapsSupportHistoryEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)usageDate;
- (RTSourceMapsSupportHistoryEntry)initWithCoder:(id)a3;
- (RTSourceMapsSupportHistoryEntry)initWithUsageDate:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceMapsSupportHistoryEntry

- (RTSourceMapsSupportHistoryEntry)initWithUsageDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  v5 = [(RTSourceMapsSupportHistoryEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    usageDate = v5->_usageDate;
    v5->_usageDate = (NSDate *)v6;
  }
  return v5;
}

- (RTSourceMapsSupportHistoryEntry)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTSourceMapsSupportHistoryEntry initWithCoder:]";
      __int16 v13 = 1024;
      int v14 = 28;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aDecoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  uint64_t v6 = [(RTSource *)&v10 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageDate"];
    usageDate = v6->_usageDate;
    v6->_usageDate = (NSDate *)v7;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[RTSourceMapsSupportHistoryEntry encodeWithCoder:]";
      __int16 v9 = 1024;
      int v10 = 40;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aCoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  [(RTSource *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_usageDate forKey:@"usageDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  if ([(RTSource *)&v12 isEqual:v5])
  {
    id v6 = v5;
    uint64_t v7 = [(RTSourceMapsSupportHistoryEntry *)self usageDate];
    if (v7 || ([v6 usageDate], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(RTSourceMapsSupportHistoryEntry *)self usageDate];
      __int16 v9 = [v6 usageDate];
      char v10 = [v8 isEqualToDate:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  unint64_t v3 = [(RTSource *)&v7 hash];
  id v4 = [(RTSourceMapsSupportHistoryEntry *)self usageDate];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  id v4 = [(RTSource *)&v8 description];
  unint64_t v5 = [(RTSourceMapsSupportHistoryEntry *)self usageDate];
  id v6 = [v3 stringWithFormat:@"%@, usageDate, %@", v4, v5];

  return v6;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (void).cxx_destruct
{
}

@end