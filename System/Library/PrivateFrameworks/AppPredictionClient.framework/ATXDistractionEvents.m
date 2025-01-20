@interface ATXDistractionEvents
+ (BOOL)supportsSecureCoding;
- (ATXDistractionEvents)initWithAllDeliveredNotifications:(id)a3 allInterruptingAppSessions:(id)a4;
- (ATXDistractionEvents)initWithCoder:(id)a3;
- (NSArray)allDeliveredNotifications;
- (NSArray)allInterruptingAppSessions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXDistractionEvents

- (ATXDistractionEvents)initWithAllDeliveredNotifications:(id)a3 allInterruptingAppSessions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDistractionEvents;
  v8 = [(ATXDistractionEvents *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    allDeliveredNotifications = v8->_allDeliveredNotifications;
    v8->_allDeliveredNotifications = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    allInterruptingAppSessions = v8->_allInterruptingAppSessions;
    v8->_allInterruptingAppSessions = (NSArray *)v11;
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
  v5 = [(ATXDistractionEvents *)self allDeliveredNotifications];
  [v4 encodeObject:v5 forKey:@"allDeliveredNotifications"];

  id v6 = [(ATXDistractionEvents *)self allInterruptingAppSessions];
  [v4 encodeObject:v6 forKey:@"allInterruptingAppSessions"];
}

- (ATXDistractionEvents)initWithCoder:(id)a3
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
  v10 = [v5 robustDecodeObjectOfClasses:v8 forKey:@"allDeliveredNotifications" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.UsageInsights" errorCode:-1 logHandle:v9];

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
    v18 = objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, @"allInterruptingAppSessions", v4, 0, @"com.apple.proactive.UsageInsights", -1, v17, v21[0]);

    v19 = [v4 error];

    if (v19)
    {
      v12 = 0;
    }
    else
    {
      self = [(ATXDistractionEvents *)self initWithAllDeliveredNotifications:v10 allInterruptingAppSessions:v18];
      v12 = self;
    }
  }
  return v12;
}

- (NSArray)allDeliveredNotifications
{
  return self->_allDeliveredNotifications;
}

- (NSArray)allInterruptingAppSessions
{
  return self->_allInterruptingAppSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInterruptingAppSessions, 0);

  objc_storeStrong((id *)&self->_allDeliveredNotifications, 0);
}

@end