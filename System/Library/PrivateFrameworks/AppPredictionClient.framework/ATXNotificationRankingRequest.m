@interface ATXNotificationRankingRequest
+ (BOOL)supportsSecureCoding;
- (ATXNotificationRankingRequest)initWithCoder:(id)a3;
- (ATXNotificationRankingRequest)initWithUserNotifications:(id)a3 useLLM:(BOOL)a4;
- (BOOL)useLLM;
- (NSArray)userNotifications;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationRankingRequest

- (ATXNotificationRankingRequest)initWithUserNotifications:(id)a3 useLLM:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationRankingRequest;
  v7 = [(ATXNotificationRankingRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    userNotifications = v7->_userNotifications;
    v7->_userNotifications = (NSArray *)v8;

    v7->_useLLM = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  userNotifications = self->_userNotifications;
  id v5 = a3;
  [v5 encodeObject:userNotifications forKey:@"userNotifications"];
  [v5 encodeBool:self->_useLLM forKey:@"useLLM"];
}

- (ATXNotificationRankingRequest)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  v9 = __atxlog_handle_notification_categorization();
  v10 = objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, @"userNotifications", v4, 1, @"ATXNotificationRankingRequestErrorDomain", -1, v9, v14[0]);

  objc_super v11 = [v4 error];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[ATXNotificationRankingRequest initWithUserNotifications:useLLM:](self, "initWithUserNotifications:useLLM:", v10, [v4 decodeBoolForKey:@"useLLM"]);
    v12 = self;
  }

  return v12;
}

- (NSArray)userNotifications
{
  return self->_userNotifications;
}

- (BOOL)useLLM
{
  return self->_useLLM;
}

- (void).cxx_destruct
{
}

@end