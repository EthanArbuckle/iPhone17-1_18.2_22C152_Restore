@interface FCCAchievementNotificationContent
- (ACHAchievement)achievement;
- (FCCAchievementNotificationContent)initWithAchievement:(id)a3;
- (FCCAchievementNotificationContent)initWithTransportData:(id)a3;
- (id)transportData;
@end

@implementation FCCAchievementNotificationContent

- (FCCAchievementNotificationContent)initWithAchievement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCAchievementNotificationContent;
  v6 = [(FCCAchievementNotificationContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_achievement, a3);
  }

  return v7;
}

- (FCCAchievementNotificationContent)initWithTransportData:(id)a3
{
  id v4 = a3;
  id v5 = [[FCCAchievementNotificationContentProtobuf alloc] initWithData:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F49530]);
  v7 = [(FCCAchievementNotificationContentProtobuf *)v5 achievementData];
  v8 = (void *)[v6 initWithData:v7];

  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F49508]) initWithCodable:v8];
  v10 = [(FCCAchievementNotificationContent *)self initWithAchievement:v9];

  return v10;
}

- (id)transportData
{
  v2 = objc_alloc_init(FCCAchievementNotificationContentProtobuf);
  v3 = ACHCodableFromAchievement();
  id v4 = [v3 data];
  [(FCCAchievementNotificationContentProtobuf *)v2 setAchievementData:v4];

  id v5 = [(FCCAchievementNotificationContentProtobuf *)v2 data];

  return v5;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void).cxx_destruct
{
}

@end