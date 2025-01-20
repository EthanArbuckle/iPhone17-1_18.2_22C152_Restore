@interface SRDeviceUsageReport
+ (BOOL)supportsSecureCoding;
+ (SRDeviceUsageReport)deviceUsageReportWithInterval:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)applicationUsageByCategory;
- (NSDictionary)notificationUsageByCategory;
- (NSDictionary)webUsageByCategory;
- (NSInteger)totalScreenWakes;
- (NSInteger)totalUnlocks;
- (NSMutableArray)_mutableActivityLevels;
- (NSMutableArray)_mutableMotionActivities;
- (NSMutableDictionary)_reportApplicationIdentifierByBundleIdentifier;
- (NSMutableDictionary)mutableApplicationUsageByCategory;
- (NSMutableDictionary)mutableNotificationUsageByCategory;
- (NSMutableDictionary)mutableWebUsageByCategory;
- (NSString)description;
- (NSString)version;
- (NSTimeInterval)duration;
- (NSTimeInterval)totalUnlockDuration;
- (SRDeviceUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRDeviceUsageReport)initWithCoder:(id)a3;
- (double)_firstAppLaunchTimeRelativeToInterval;
- (double)_totalChargingDuration;
- (double)startTime;
- (double)totalScreenWakeDuration;
- (id)_activityLevels;
- (id)_motionActivities;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMutableApplicationUsageByCategory:(id)a3;
- (void)setMutableNotificationUsageByCategory:(id)a3;
- (void)setMutableWebUsageByCategory:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalScreenWakeDuration:(double)a3;
- (void)setTotalScreenWakes:(int64_t)a3;
- (void)setTotalUnlockDuration:(double)a3;
- (void)setTotalUnlocks:(int64_t)a3;
- (void)setVersion:(id)a3;
- (void)set_firstAppLaunchTimeRelativeToInterval:(double)a3;
- (void)set_mutableActivityLevels:(id)a3;
- (void)set_mutableMotionActivities:(id)a3;
- (void)set_reportApplicationIdentifierByBundleIdentifier:(id)a3;
- (void)set_totalChargingDuration:(double)a3;
@end

@implementation SRDeviceUsageReport

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogUsageReport = (uint64_t)os_log_create("com.apple.SensorKit", "SRDeviceUsageReport");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRDeviceUsageReport)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 96, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v29.receiver = self;
  v29.super_class = (Class)SRDeviceUsageReport;
  v6 = [(SRDeviceUsageReport *)&v29 init];
  if (v6)
  {
    v6->_totalScreenWakes = [a3 decodeIntegerForKey:@"totalScreenWakes"];
    [a3 decodeDoubleForKey:@"totalScreenWakeDuration"];
    v6->_totalScreenWakeDuration = v7;
    v6->_totalUnlocks = [a3 decodeIntegerForKey:@"totalUnlocks"];
    [a3 decodeDoubleForKey:@"totalUnlockDuration"];
    v6->_totalUnlockDuration = v8;
    [a3 decodeDoubleForKey:@"totalChargingDuration"];
    v6->__totalChargingDuration = v9;
    [a3 decodeDoubleForKey:@"startTime"];
    v6->_startTime = v10;
    [a3 decodeDoubleForKey:@"duration"];
    v6->_duration = v11;
    v6->_version = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v6->_mutableApplicationUsageByCategory = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0), @"applicationUsage"), "mutableCopy");
    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v6->_mutableNotificationUsageByCategory = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0), @"notificationsUsage"), "mutableCopy");
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v6->_mutableWebUsageByCategory = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0), @"webUsage"), "mutableCopy");
    v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    v6->__mutableMotionActivities = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0), @"motionActivities"), "mutableCopy");
    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    v6->__mutableActivityLevels = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0), @"activityLevels"), "mutableCopy");
    v6->__reportApplicationIdentifierByBundleIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 118, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeDouble:@"duration" forKey:self->_duration];
  objc_msgSend(a3, "encodeObject:forKey:", -[SRDeviceUsageReport mutableNotificationUsageByCategory](self, "mutableNotificationUsageByCategory"), @"notificationsUsage");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRDeviceUsageReport mutableApplicationUsageByCategory](self, "mutableApplicationUsageByCategory"), @"applicationUsage");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRDeviceUsageReport mutableWebUsageByCategory](self, "mutableWebUsageByCategory"), @"webUsage");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRDeviceUsageReport totalScreenWakes](self, "totalScreenWakes"), @"totalScreenWakes");
  [(SRDeviceUsageReport *)self totalScreenWakeDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"totalScreenWakeDuration");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRDeviceUsageReport totalUnlocks](self, "totalUnlocks"), @"totalUnlocks");
  [(SRDeviceUsageReport *)self totalUnlockDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"totalUnlockDuration");
  [(SRDeviceUsageReport *)self _totalChargingDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"totalChargingDuration");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRDeviceUsageReport _mutableMotionActivities](self, "_mutableMotionActivities"), @"motionActivities");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRDeviceUsageReport _mutableActivityLevels](self, "_mutableActivityLevels"), @"activityLevels");
  v6 = [(SRDeviceUsageReport *)self version];

  [a3 encodeObject:v6 forKey:@"version"];
}

+ (SRDeviceUsageReport)deviceUsageReportWithInterval:(id)a3
{
  v4 = objc_alloc_init(SRDeviceUsageReport);
  objc_msgSend((id)objc_msgSend(a3, "startDate"), "srAbsoluteTime");
  -[SRDeviceUsageReport setStartTime:](v4, "setStartTime:");
  [a3 duration];
  -[SRDeviceUsageReport setDuration:](v4, "setDuration:");
  -[SRDeviceUsageReport setMutableWebUsageByCategory:](v4, "setMutableWebUsageByCategory:", [MEMORY[0x263EFF9A0] dictionary]);
  -[SRDeviceUsageReport setMutableApplicationUsageByCategory:](v4, "setMutableApplicationUsageByCategory:", [MEMORY[0x263EFF9A0] dictionary]);
  -[SRDeviceUsageReport setMutableNotificationUsageByCategory:](v4, "setMutableNotificationUsageByCategory:", [MEMORY[0x263EFF9A0] dictionary]);
  -[SRDeviceUsageReport set_mutableMotionActivities:](v4, "set_mutableMotionActivities:", [MEMORY[0x263EFF980] array]);
  -[SRDeviceUsageReport set_mutableActivityLevels:](v4, "set_mutableActivityLevels:", [MEMORY[0x263EFF980] array]);
  -[SRDeviceUsageReport set_reportApplicationIdentifierByBundleIdentifier:](v4, "set_reportApplicationIdentifierByBundleIdentifier:", [MEMORY[0x263EFF9A0] dictionary]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "srAbsoluteTime");
  -[SRDeviceUsageReport set_firstAppLaunchTimeRelativeToInterval:](v4, "set_firstAppLaunchTimeRelativeToInterval:");

  return v4;
}

- (void)dealloc
{
  self->_mutableNotificationUsageByCategory = 0;
  self->_mutableApplicationUsageByCategory = 0;

  self->_mutableWebUsageByCategory = 0;
  self->__mutableMotionActivities = 0;

  self->__mutableActivityLevels = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDeviceUsageReport;
  [(SRDeviceUsageReport *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    double startTime = self->_startTime;
    [a3 startTime];
    if (startTime != v6) {
      goto LABEL_17;
    }
    double duration = self->_duration;
    [a3 duration];
    if (duration == v8
      && (int64_t totalScreenWakes = self->_totalScreenWakes, totalScreenWakes == [a3 totalScreenWakes])
      && (double totalScreenWakeDuration = self->_totalScreenWakeDuration,
          [a3 totalScreenWakeDuration],
          totalScreenWakeDuration == v11)
      && (int64_t totalUnlocks = self->_totalUnlocks, totalUnlocks == [a3 totalUnlocks]))
    {
      int v13 = -[NSString isEqualToString:](-[SRDeviceUsageReport version](self, "version"), "isEqualToString:", [a3 version]);
      if (v13)
      {
        int v13 = -[NSMutableDictionary isEqualToDictionary:](self->_mutableWebUsageByCategory, "isEqualToDictionary:", [a3 mutableWebUsageByCategory]);
        if (v13)
        {
          int v13 = -[NSMutableDictionary isEqualToDictionary:](self->_mutableApplicationUsageByCategory, "isEqualToDictionary:", [a3 mutableApplicationUsageByCategory]);
          if (v13)
          {
            int v13 = -[NSMutableDictionary isEqualToDictionary:](self->_mutableNotificationUsageByCategory, "isEqualToDictionary:", [a3 mutableNotificationUsageByCategory]);
            if (v13)
            {
              int v13 = -[NSMutableArray isEqualToArray:](self->__mutableMotionActivities, "isEqualToArray:", [a3 _mutableMotionActivities]);
              if (v13)
              {
                int v13 = -[NSMutableArray isEqualToArray:](self->__mutableActivityLevels, "isEqualToArray:", [a3 _mutableActivityLevels]);
                if (v13)
                {
                  reportApplicationIdentifierByBundleIdentifier = self->__reportApplicationIdentifierByBundleIdentifier;
                  uint64_t v15 = [a3 _reportApplicationIdentifierByBundleIdentifier];
                  LOBYTE(v13) = [(NSMutableDictionary *)reportApplicationIdentifierByBundleIdentifier isEqualToDictionary:v15];
                }
              }
            }
          }
        }
      }
    }
    else
    {
LABEL_17:
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SRDeviceUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRDeviceUsageReport;
    double v7 = [(SRDeviceUsageReport *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
      if (v8)
      {
        double v9 = (void *)v8;

        return (SRDeviceUsageReport *)v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(SRDeviceUsageReport *)self startTime];
  uint64_t v7 = v6;
  [(SRDeviceUsageReport *)self duration];
  uint64_t v9 = v8;
  NSInteger v10 = [(SRDeviceUsageReport *)self totalScreenWakes];
  [(SRDeviceUsageReport *)self totalScreenWakeDuration];
  uint64_t v12 = v11;
  NSInteger v13 = [(SRDeviceUsageReport *)self totalUnlocks];
  [(SRDeviceUsageReport *)self totalUnlockDuration];
  uint64_t v15 = v14;
  [(SRDeviceUsageReport *)self _totalChargingDuration];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"%@ {Start time: %f, duration: %f, total screen wakes: %lu, total screen wake duration: %f, total Unlocks: %lu, Total Unlock Duration: %f, total charging duration: %f, version: %@, Application Use By Category: %@\nNotification Use By Category: %@\nWeb Use By Category: %@\nMotionActivities: %@\nActivityLevels: %@\n}", v5, v7, v9, v10, v12, v13, v15, v16, -[SRDeviceUsageReport version](self, "version"), -[SRDeviceUsageReport mutableApplicationUsageByCategory](self, "mutableApplicationUsageByCategory"), -[SRDeviceUsageReport mutableNotificationUsageByCategory](self, "mutableNotificationUsageByCategory"), -[SRDeviceUsageReport mutableWebUsageByCategory](self, "mutableWebUsageByCategory"),
                       [(SRDeviceUsageReport *)self _motionActivities],
                       [(SRDeviceUsageReport *)self _activityLevels]);
}

- (NSDictionary)applicationUsageByCategory
{
  if (self->_mutableApplicationUsageByCategory) {
    return (NSDictionary *)objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
  }
  else {
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
}

- (NSDictionary)notificationUsageByCategory
{
  if (self->_mutableNotificationUsageByCategory) {
    return (NSDictionary *)objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
  }
  else {
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
}

- (NSDictionary)webUsageByCategory
{
  if (self->_mutableWebUsageByCategory) {
    return (NSDictionary *)objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
  }
  else {
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
}

- (id)_motionActivities
{
  if (self->__mutableMotionActivities) {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:");
  }
  else {
    return (id)MEMORY[0x263EFFA68];
  }
}

- (id)_activityLevels
{
  if (self->__mutableActivityLevels) {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:");
  }
  else {
    return (id)MEMORY[0x263EFFA68];
  }
}

- (NSString)version
{
  if (self->_version) {
    return self->_version;
  }
  else {
    return (NSString *)&stru_26D165EC8;
  }
}

- (id)sr_dictionaryRepresentation
{
  v10[12] = *MEMORY[0x263EF8340];
  uint64_t v3 = __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke(self->_mutableApplicationUsageByCategory);
  uint64_t v4 = __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke(self->_mutableNotificationUsageByCategory);
  uint64_t v5 = __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke(self->_mutableWebUsageByCategory);
  uint64_t v6 = __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke_2([(SRDeviceUsageReport *)self _motionActivities]);
  uint64_t v7 = __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke_2([(SRDeviceUsageReport *)self _activityLevels]);
  v9[0] = @"totalScreenWakes";
  v10[0] = [NSNumber numberWithInteger:self->_totalScreenWakes];
  v9[1] = @"totalScreenWakeDuration";
  v10[1] = [NSNumber numberWithDouble:self->_totalScreenWakeDuration];
  v9[2] = @"totalUnlocks";
  v10[2] = [NSNumber numberWithInteger:self->_totalUnlocks];
  v9[3] = @"totalUnlockDuration";
  v10[3] = [NSNumber numberWithDouble:self->_totalUnlockDuration];
  v9[4] = @"totalChargingDuration";
  v10[4] = [NSNumber numberWithDouble:self->__totalChargingDuration];
  v9[5] = @"duration";
  v10[5] = [NSNumber numberWithDouble:self->_duration];
  v10[6] = v3;
  v9[6] = @"applicationUsage";
  v9[7] = @"notificationsUsage";
  v10[7] = v4;
  v10[8] = v5;
  v9[8] = @"webUsage";
  v9[9] = @"motionActivities";
  v10[9] = v6;
  v10[10] = v7;
  v9[10] = @"activityLevels";
  v9[11] = @"version";
  v10[11] = [(SRDeviceUsageReport *)self version];
  return (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:12];
}

uint64_t __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(a1);
        }
        uint64_t v6 = *(void *)(*((void *)&v19 + 1) + 8 * v5);
        uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v8 = (void *)[a1 objectForKeyedSubscript:v6];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "sr_dictionaryRepresentation"));
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }
        [v14 setObject:v7 forKeyedSubscript:v6];
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [a1 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }
  return [NSDictionary dictionaryWithDictionary:v14];
}

uint64_t __50__SRDeviceUsageReport_sr_dictionaryRepresentation__block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "sr_dictionaryRepresentation"));
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return [MEMORY[0x263EFF8C0] arrayWithArray:v2];
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSInteger)totalScreenWakes
{
  return self->_totalScreenWakes;
}

- (void)setTotalScreenWakes:(int64_t)a3
{
  self->_int64_t totalScreenWakes = a3;
}

- (NSInteger)totalUnlocks
{
  return self->_totalUnlocks;
}

- (void)setTotalUnlocks:(int64_t)a3
{
  self->_int64_t totalUnlocks = a3;
}

- (NSTimeInterval)totalUnlockDuration
{
  return self->_totalUnlockDuration;
}

- (void)setTotalUnlockDuration:(double)a3
{
  self->_totalUnlockDuration = a3;
}

- (void)setVersion:(id)a3
{
}

- (NSMutableDictionary)mutableApplicationUsageByCategory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMutableApplicationUsageByCategory:(id)a3
{
}

- (NSMutableDictionary)mutableNotificationUsageByCategory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMutableNotificationUsageByCategory:(id)a3
{
}

- (NSMutableDictionary)mutableWebUsageByCategory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMutableWebUsageByCategory:(id)a3
{
}

- (NSMutableArray)_mutableMotionActivities
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)set_mutableMotionActivities:(id)a3
{
}

- (NSMutableArray)_mutableActivityLevels
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)set_mutableActivityLevels:(id)a3
{
}

- (NSMutableDictionary)_reportApplicationIdentifierByBundleIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_reportApplicationIdentifierByBundleIdentifier:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)totalScreenWakeDuration
{
  return self->_totalScreenWakeDuration;
}

- (void)setTotalScreenWakeDuration:(double)a3
{
  self->_double totalScreenWakeDuration = a3;
}

- (double)_totalChargingDuration
{
  return self->__totalChargingDuration;
}

- (void)set_totalChargingDuration:(double)a3
{
  self->__totalChargingDuration = a3;
}

- (double)_firstAppLaunchTimeRelativeToInterval
{
  return self->__firstAppLaunchTimeRelativeToInterval;
}

- (void)set_firstAppLaunchTimeRelativeToInterval:(double)a3
{
  self->__firstAppLaunchTimeRelativeToInterval = a3;
}

@end