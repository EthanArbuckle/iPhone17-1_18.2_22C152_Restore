@interface GKLocalizedAchievementDescription
- (GKGame)game;
- (NSString)iconImageName;
- (id)_localizedStringFromKey:(id)a3;
- (id)achievedDescription;
- (id)title;
- (id)unachievedDescription;
- (void)setGame:(id)a3;
- (void)setIconImageName:(id)a3;
@end

@implementation GKLocalizedAchievementDescription

- (id)_localizedStringFromKey:(id)a3
{
  id v4 = a3;
  v5 = [(GKLocalizedAchievementDescription *)self game];
  v6 = [v5 gameDescriptorDictionary];
  v7 = +[GKContentPropertyList localPropertyListForGameDescriptor:v6];

  v8 = [v7 localizedStringForKey:v4];

  return v8;
}

- (id)title
{
  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  v3 = [(GKLocalizedAchievementDescription *)&v6 title];
  id v4 = [(GKLocalizedAchievementDescription *)self _localizedStringFromKey:v3];

  return v4;
}

- (id)achievedDescription
{
  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  v3 = [(GKLocalizedAchievementDescription *)&v6 achievedDescription];
  id v4 = [(GKLocalizedAchievementDescription *)self _localizedStringFromKey:v3];

  return v4;
}

- (id)unachievedDescription
{
  v6.receiver = self;
  v6.super_class = (Class)GKLocalizedAchievementDescription;
  v3 = [(GKLocalizedAchievementDescription *)&v6 unachievedDescription];
  id v4 = [(GKLocalizedAchievementDescription *)self _localizedStringFromKey:v3];

  return v4;
}

- (GKGame)game
{
  return (GKGame *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGame:(id)a3
{
}

- (NSString)iconImageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIconImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageName, 0);

  objc_storeStrong((id *)&self->_game, 0);
}

@end