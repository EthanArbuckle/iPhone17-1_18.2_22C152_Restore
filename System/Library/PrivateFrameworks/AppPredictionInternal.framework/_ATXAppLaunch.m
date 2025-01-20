@interface _ATXAppLaunch
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLaunch:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)bundleId;
- (NSString)description;
- (NSString)reason;
- (NSTimeZone)timeZone;
- (_ATXAppLaunch)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 reason:(id)a7;
- (id)eventTime;
- (unint64_t)hash;
@end

@implementation _ATXAppLaunch

- (_ATXAppLaunch)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 reason:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_ATXAppLaunch;
  v17 = [(_ATXAppLaunch *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    startDate = v17->_startDate;
    v17->_startDate = (NSDate *)v20;

    uint64_t v22 = [v14 copy];
    endDate = v17->_endDate;
    v17->_endDate = (NSDate *)v22;

    if (v15)
    {
      uint64_t v24 = [v15 copy];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    timeZone = v17->_timeZone;
    v17->_timeZone = (NSTimeZone *)v24;

    uint64_t v26 = [v16 copy];
    reason = v17->_reason;
    v17->_reason = (NSString *)v26;
  }
  return v17;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"(%@, %@, %@)", self->_bundleId, self->_startDate, self->_endDate];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_ATXAppLaunch *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ATXAppLaunch *)self isEqualToLaunch:v5];

  return v6;
}

- (BOOL)isEqualToLaunch:(id)a3
{
  v4 = (id *)a3;
  bundleId = self->_bundleId;
  BOOL v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
  }
  v10 = self;
  v11 = v4;
  [(NSDate *)v10->_startDate timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v11[2] timeIntervalSinceReferenceDate];
  if (v13 != v14)
  {

    char v20 = 0;
LABEL_12:

    goto LABEL_13;
  }
  [(NSDate *)v10->_endDate timeIntervalSinceReferenceDate];
  double v16 = v15;
  [v11[3] timeIntervalSinceReferenceDate];
  double v18 = v17;

  if (v16 == v18)
  {
    v19 = v10->_timeZone;
    v10 = (_ATXAppLaunch *)v19;
    if (v19 == v11[4]) {
      char v20 = 1;
    }
    else {
      char v20 = -[NSTimeZone isEqual:](v19, "isEqual:");
    }
    goto LABEL_12;
  }
LABEL_9:
  char v20 = 0;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  return [(NSDate *)self->_startDate hash] - v3 + 32 * v3;
}

- (id)eventTime
{
  return self->_startDate;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end