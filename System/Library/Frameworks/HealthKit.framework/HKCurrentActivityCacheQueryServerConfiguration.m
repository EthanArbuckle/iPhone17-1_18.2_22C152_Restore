@interface HKCurrentActivityCacheQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKCurrentActivityCacheQueryServerConfiguration)initWithCoder:(id)a3;
- (NSDateComponents)statisticsIntervalComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStatisticsIntervalComponents:(id)a3;
@end

@implementation HKCurrentActivityCacheQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  v4 = [(HKQueryServerConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDateComponents *)self->_statisticsIntervalComponents copy];
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCurrentActivityCacheQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  uint64_t v5 = [(HKQueryServerConfiguration *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_statisticsIntervalComponents);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    statisticsIntervalComponents = v5->_statisticsIntervalComponents;
    v5->_statisticsIntervalComponents = (NSDateComponents *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v7 encodeWithCoder:v4];
  statisticsIntervalComponents = self->_statisticsIntervalComponents;
  uint64_t v6 = NSStringFromSelector(sel_statisticsIntervalComponents);
  objc_msgSend(v4, "encodeObject:forKey:", statisticsIntervalComponents, v6, v7.receiver, v7.super_class);
}

- (NSDateComponents)statisticsIntervalComponents
{
  return self->_statisticsIntervalComponents;
}

- (void)setStatisticsIntervalComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end