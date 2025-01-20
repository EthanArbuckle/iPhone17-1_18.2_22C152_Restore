@interface ATXDeviceUsageEvents
+ (BOOL)supportsSecureCoding;
- (ATXDeviceUsageEvents)initWithCoder:(id)a3;
- (ATXDeviceUsageEvents)initWithContinuousDeviceUsageEvent:(id)a3 mindlessCyclingEvents:(id)a4;
- (NSArray)continuousDeviceUsageEvents;
- (NSArray)mindlessCyclingEvents;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXDeviceUsageEvents

- (ATXDeviceUsageEvents)initWithContinuousDeviceUsageEvent:(id)a3 mindlessCyclingEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDeviceUsageEvents;
  v8 = [(ATXDeviceUsageEvents *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    continuousDeviceUsageEvents = v8->_continuousDeviceUsageEvents;
    v8->_continuousDeviceUsageEvents = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    mindlessCyclingEvents = v8->_mindlessCyclingEvents;
    v8->_mindlessCyclingEvents = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXDeviceUsageEvents *)self continuousDeviceUsageEvents];
  [v4 encodeObject:v5 forKey:@"continuousDeviceUsageEvents"];

  id v6 = [(ATXDeviceUsageEvents *)self mindlessCyclingEvents];
  [v4 encodeObject:v6 forKey:@"mindlessCyclingEvents"];
}

- (ATXDeviceUsageEvents)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v8 = [v6 setWithArray:v7];
  uint64_t v9 = __atxlog_handle_usage_insights();
  v10 = [v5 robustDecodeObjectOfClasses:v8 forKey:@"continuousDeviceUsageEvents" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.UsageInsights" errorCode:-1 logHandle:v9];

  uint64_t v11 = [v4 error];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F93B90];
    objc_super v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v16 = [v14 setWithArray:v15];
    v17 = __atxlog_handle_usage_insights();
    v18 = objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, @"mindlessCyclingEvents", v4, 0, @"com.apple.proactive.UsageInsights", -1, v17, v21[0]);

    v19 = [v4 error];

    if (v19)
    {
      v12 = 0;
    }
    else
    {
      self = [(ATXDeviceUsageEvents *)self initWithContinuousDeviceUsageEvent:v10 mindlessCyclingEvents:v18];
      v12 = self;
    }
  }
  return v12;
}

- (NSArray)continuousDeviceUsageEvents
{
  return self->_continuousDeviceUsageEvents;
}

- (NSArray)mindlessCyclingEvents
{
  return self->_mindlessCyclingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindlessCyclingEvents, 0);

  objc_storeStrong((id *)&self->_continuousDeviceUsageEvents, 0);
}

@end