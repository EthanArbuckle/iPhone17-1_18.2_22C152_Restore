@interface ATXNotificationContextRequest
+ (BOOL)supportsSecureCoding;
- (ATXEntityContextRequestOptionalSignals)contextRequestSignals;
- (ATXNotificationContextRequest)initWithCoder:(id)a3;
- (ATXNotificationContextRequest)initWithUserNotification:(id)a3 additionalContextSignals:(id)a4;
- (ATXUserNotification)userNotification;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationContextRequest

- (ATXNotificationContextRequest)initWithUserNotification:(id)a3 additionalContextSignals:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationContextRequest;
  v9 = [(ATXNotificationContextRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userNotification, a3);
    objc_storeStrong((id *)&v10->_contextRequestSignals, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXNotificationContextRequest *)self userNotification];
  [v4 encodeObject:v5 forKey:@"userNotification"];

  id v6 = [(ATXNotificationContextRequest *)self contextRequestSignals];
  [v4 encodeObject:v6 forKey:@"contextRequestSignals"];
}

- (ATXNotificationContextRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_categorization();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"userNotification" withCoder:v4 expectNonNull:1 errorDomain:@"ATXNotificationContextRequestErrorDomain" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_notification_categorization();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"contextRequestSignals" withCoder:v4 expectNonNull:0 errorDomain:@"ATXNotificationContextRequestErrorDomain" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = [(ATXNotificationContextRequest *)self initWithUserNotification:v8 additionalContextSignals:v14];
      v10 = self;
    }
  }
  return v10;
}

- (ATXUserNotification)userNotification
{
  return self->_userNotification;
}

- (ATXEntityContextRequestOptionalSignals)contextRequestSignals
{
  return self->_contextRequestSignals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextRequestSignals, 0);

  objc_storeStrong((id *)&self->_userNotification, 0);
}

@end