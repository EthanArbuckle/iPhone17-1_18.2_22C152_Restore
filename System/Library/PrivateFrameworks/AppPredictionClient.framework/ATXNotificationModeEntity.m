@interface ATXNotificationModeEntity
+ (BOOL)supportsSecureCoding;
- (ATXAppModeEntity)appEntity;
- (ATXContactModeEntity)contactEntity;
- (ATXModeEntityScore)scoreMetadata;
- (ATXNotificationModeEntity)initWithAppEntity:(id)a3;
- (ATXNotificationModeEntity)initWithAppEntity:(id)a3 contactEntity:(id)a4;
- (ATXNotificationModeEntity)initWithCoder:(id)a3;
- (ATXNotificationModeEntity)initWithContactEntity:(id)a3;
- (ATXNotificationModeEntity)initWithUNNotification:(id)a3;
- (ATXNotificationModeEntity)initWithUserNotification:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (double)receiveTimestamp;
- (id)contactEntityFromUserNotification:(id)a3;
- (id)contactIdFromUserNotification:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)jsonDict;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppEntity:(id)a3;
- (void)setContactEntity:(id)a3;
- (void)setReceiveTimestamp:(double)a3;
- (void)setScoreMetadata:(id)a3;
@end

@implementation ATXNotificationModeEntity

- (ATXNotificationModeEntity)initWithAppEntity:(id)a3
{
  return [(ATXNotificationModeEntity *)self initWithAppEntity:a3 contactEntity:0];
}

- (ATXNotificationModeEntity)initWithContactEntity:(id)a3
{
  return [(ATXNotificationModeEntity *)self initWithAppEntity:0 contactEntity:a3];
}

- (ATXNotificationModeEntity)initWithAppEntity:(id)a3 contactEntity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationModeEntity;
  v9 = [(ATXNotificationModeEntity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appEntity, a3);
    objc_storeStrong((id *)&v10->_contactEntity, a4);
  }

  return v10;
}

- (ATXNotificationModeEntity)initWithUserNotification:(id)a3
{
  id v4 = a3;
  v5 = [ATXAppModeEntity alloc];
  v6 = [v4 bundleID];
  id v7 = [(ATXAppModeEntity *)v5 initWithBundleId:v6];

  id v8 = [(ATXNotificationModeEntity *)self contactEntityFromUserNotification:v4];

  v9 = [(ATXNotificationModeEntity *)self initWithAppEntity:v7 contactEntity:v8];
  return v9;
}

- (id)contactEntityFromUserNotification:(id)a3
{
  id v4 = a3;
  v5 = [(ATXNotificationModeEntity *)self contactIdFromUserNotification:v4];
  v6 = [v4 rawIdentifiers];

  id v7 = [v6 firstObject];

  if (v5) {
    id v8 = [[ATXContactModeEntity alloc] initWithDisplayName:0 rawIdentifier:v7 cnContactId:v5 stableContactIdentifier:0];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)contactIdFromUserNotification:(id)a3
{
  id v3 = a3;
  if ([v3 isGroupMessage])
  {
    id v4 = [v3 threadID];
  }
  else
  {
    v5 = [v3 contactIDs];

    id v4 = [v5 firstObject];
    id v3 = v5;
  }

  return v4;
}

- (ATXNotificationModeEntity)initWithUNNotification:(id)a3
{
  id v4 = [[ATXAppModeEntity alloc] initWithBundleId:@"com.apple.Music"];
  v5 = [[ATXContactModeEntity alloc] initWithDisplayName:0 rawIdentifier:@"sample" cnContactId:0];
  v6 = [(ATXNotificationModeEntity *)self initWithAppEntity:v4 contactEntity:v5];

  return v6;
}

- (id)identifier
{
  id v3 = [NSString alloc];
  id v4 = [(ATXAppModeEntity *)self->_appEntity bundleId];
  v5 = [(ATXContactModeEntity *)self->_contactEntity identifier];
  v6 = (void *)[v3 initWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (id)jsonDict
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"entityIdentifier";
  id v3 = [(ATXNotificationModeEntity *)self identifier];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"scoreMetadata";
  v11[0] = v4;
  v5 = [(ATXNotificationModeEntity *)self scoreMetadata];
  v6 = [v5 jsonDict];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (!v3) {

  }
  return v8;
}

- (NSString)debugDescription
{
  v2 = [(ATXNotificationModeEntity *)self jsonDict];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(ATXNotificationModeEntity *)self identifier];
  v5 = [(ATXNotificationModeEntity *)self scoreMetadata];
  [v5 score];
  id v7 = (void *)[v3 initWithFormat:@"entityIdentifier: %@, score: %.3f", v4, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXNotificationModeEntity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(ATXNotificationModeEntity *)self identifier];
      id v7 = [(ATXNotificationModeEntity *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ATXNotificationModeEntity *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXNotificationModeEntity *)self appEntity];
  [v4 encodeObject:v5 forKey:@"codingKeyForAppEntity"];

  uint64_t v6 = [(ATXNotificationModeEntity *)self contactEntity];
  [v4 encodeObject:v6 forKey:@"codingKeyForContactEntity"];

  id v7 = [(ATXNotificationModeEntity *)self scoreMetadata];
  [v4 encodeObject:v7 forKey:@"codingKeyForScoreMetadata"];
}

- (ATXNotificationModeEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  char v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForAppEntity" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.notificationModeEntity" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_notification_management();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForContactEntity" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.notificationModeEntity" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_notification_management();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForScoreMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.notificationModeEntity" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        self = [(ATXNotificationModeEntity *)self initWithAppEntity:v8 contactEntity:v14];
        [(ATXNotificationModeEntity *)self setScoreMetadata:v19];
        v10 = self;
      }
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXNotificationModeEntity allocWithZone:a3];
  v5 = [(ATXNotificationModeEntity *)self appEntity];
  uint64_t v6 = [(ATXNotificationModeEntity *)self contactEntity];
  id v7 = [(ATXNotificationModeEntity *)v4 initWithAppEntity:v5 contactEntity:v6];

  return v7;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
}

- (ATXAppModeEntity)appEntity
{
  return self->_appEntity;
}

- (void)setAppEntity:(id)a3
{
}

- (ATXContactModeEntity)contactEntity
{
  return self->_contactEntity;
}

- (void)setContactEntity:(id)a3
{
}

- (double)receiveTimestamp
{
  return self->_receiveTimestamp;
}

- (void)setReceiveTimestamp:(double)a3
{
  self->_receiveTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactEntity, 0);
  objc_storeStrong((id *)&self->_appEntity, 0);

  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

@end