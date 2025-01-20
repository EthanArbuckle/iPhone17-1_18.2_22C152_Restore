@interface ATXUsageInsightsAppSessionEvent
+ (BOOL)supportsSecureCoding;
+ (id)usageInsightsAppLaunchReasonFromBMAppInFocus:(id)a3;
- (ATXUsageInsightsAppSessionEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 launchReason:(id)a5 startTime:(id)a6 endTime:(id)a7 duration:(double)a8;
- (ATXUsageInsightsAppSessionEvent)initWithCoder:(id)a3;
- (NSDate)endTime;
- (NSDate)eventTime;
- (NSDate)startTime;
- (NSString)bundleID;
- (NSString)launchReason;
- (double)duration;
- (unint64_t)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUsageInsightsAppSessionEvent

- (ATXUsageInsightsAppSessionEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 launchReason:(id)a5 startTime:(id)a6 endTime:(id)a7 duration:(double)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ATXUsageInsightsAppSessionEvent;
  v18 = [(ATXUsageInsightsAppSessionEvent *)&v24 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    bundleID = v18->_bundleID;
    v18->_bundleID = (NSString *)v19;

    v18->_category = a4;
    uint64_t v21 = [v15 copy];
    launchReason = v18->_launchReason;
    v18->_launchReason = (NSString *)v21;

    objc_storeStrong((id *)&v18->_startTime, a6);
    objc_storeStrong((id *)&v18->_endTime, a7);
    v18->_duration = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(ATXUsageInsightsAppSessionEvent *)self bundleID];
  [v8 encodeObject:v4 forKey:@"bundleID"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXUsageInsightsAppSessionEvent category](self, "category"), @"category");
  v5 = [(ATXUsageInsightsAppSessionEvent *)self launchReason];
  [v8 encodeObject:v5 forKey:@"launchReason"];

  v6 = [(ATXUsageInsightsAppSessionEvent *)self startTime];
  [v8 encodeObject:v6 forKey:@"startTime"];

  v7 = [(ATXUsageInsightsAppSessionEvent *)self endTime];
  [v8 encodeObject:v7 forKey:@"endTime"];

  [(ATXUsageInsightsAppSessionEvent *)self duration];
  objc_msgSend(v8, "encodeDouble:forKey:", @"duration");
}

- (ATXUsageInsightsAppSessionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"category"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchReason"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
  [v4 decodeDoubleForKey:@"duration"];
  double v11 = v10;

  v12 = [(ATXUsageInsightsAppSessionEvent *)self initWithBundleID:v5 category:v6 launchReason:v7 startTime:v8 endTime:v9 duration:v11];
  return v12;
}

- (NSDate)eventTime
{
  return self->_startTime;
}

+ (id)usageInsightsAppLaunchReasonFromBMAppInFocus:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasPrefix:@"com.apple.SpringBoard.transitionReason"])
    {
      v5 = [v4 componentsSeparatedByString:@"."];
      uint64_t v6 = [v5 lastObject];
    }
    else
    {
      uint64_t v6 = v4;
    }
  }
  else
  {
    uint64_t v6 = @"Unknown";
  }

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end