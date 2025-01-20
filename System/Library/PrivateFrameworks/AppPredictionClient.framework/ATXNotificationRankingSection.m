@interface ATXNotificationRankingSection
+ (BOOL)supportsSecureCoding;
- (ATXNotificationRankingFeatureSet)featureSet;
- (ATXNotificationRankingSection)initWithCoder:(id)a3;
- (ATXNotificationRankingSection)initWithUserNotifications:(id)a3 featureSet:(id)a4;
- (NSArray)userNotifications;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationRankingSection

- (ATXNotificationRankingSection)initWithUserNotifications:(id)a3 featureSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationRankingSection;
  v8 = [(ATXNotificationRankingSection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    userNotifications = v8->_userNotifications;
    v8->_userNotifications = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_featureSet, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  featureSet = self->_featureSet;
  id v5 = a3;
  [v5 encodeObject:featureSet forKey:@"featureSet"];
  [v5 encodeObject:self->_userNotifications forKey:@"userNotifications"];
}

- (ATXNotificationRankingSection)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v8 = [v6 setWithArray:v7];
  uint64_t v9 = __atxlog_handle_notification_categorization();
  v10 = objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, @"userNotifications", v4, 1, @"ATXNotificationRankingSectionError", -1, v9, v16[0]);

  v11 = [v4 error];

  if (v11)
  {
    objc_super v12 = 0;
  }
  else
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureSet"];
    v14 = [v4 error];

    if (v14)
    {
      objc_super v12 = 0;
    }
    else
    {
      self = [(ATXNotificationRankingSection *)self initWithUserNotifications:v10 featureSet:v13];
      objc_super v12 = self;
    }
  }
  return v12;
}

- (NSArray)userNotifications
{
  return self->_userNotifications;
}

- (ATXNotificationRankingFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);

  objc_storeStrong((id *)&self->_userNotifications, 0);
}

@end