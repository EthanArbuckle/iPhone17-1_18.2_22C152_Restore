@interface ATXFakeModeEntityScorer
+ (unint64_t)atxModeFromString:(id)a3;
- (ATXFakeModeEntityScorer)init;
- (id)rankedAppsForDenyListForMode:(unint64_t)a3;
- (id)rankedAppsForMode:(unint64_t)a3;
- (id)rankedAppsForNotificationsForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4;
- (id)rankedContactsForNotificationsForMode:(unint64_t)a3;
- (id)rankedNotificationsForMode:(unint64_t)a3;
- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4;
- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)setDefaultScoreForAllApps:(double)a3;
- (void)setDefaultScoreForAllContacts:(double)a3;
- (void)setScoreForBundleId:(id)a3 score:(double)a4;
- (void)setScoreForContactId:(id)a3 score:(double)a4;
- (void)setScoreForEntity:(id)a3 score:(double)a4;
@end

@implementation ATXFakeModeEntityScorer

- (ATXFakeModeEntityScorer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXFakeModeEntityScorer;
  v2 = [(ATXFakeModeEntityScorer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entityToScoreMapping = v2->_entityToScoreMapping;
    v2->_entityToScoreMapping = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    entityToScoreMappingForDenyList = v2->_entityToScoreMappingForDenyList;
    v2->_entityToScoreMappingForDenyList = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (unint64_t)atxModeFromString:(id)a3
{
  return ATXStringToMode(a3);
}

- (void)setDefaultScoreForAllApps:(double)a3
{
  self->_defaultAppScore = a3;
}

- (void)setDefaultScoreForAllContacts:(double)a3
{
  self->_defaultContactScore = a3;
}

- (void)setScoreForEntity:(id)a3 score:(double)a4
{
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithDouble:a4];
  [(NSMutableDictionary *)self->_entityToScoreMapping setObject:v8 forKeyedSubscript:v7];
}

- (void)setScoreForBundleId:(id)a3 score:(double)a4
{
  id v6 = a3;
  id v8 = [[ATXAppModeEntity alloc] initWithBundleId:v6];

  id v7 = [(ATXAppModeEntity *)v8 identifier];
  [(ATXFakeModeEntityScorer *)self setScoreForEntity:v7 score:a4];
}

- (void)setScoreForContactId:(id)a3 score:(double)a4
{
  id v6 = a3;
  id v8 = [[ATXContactModeEntity alloc] initWithDisplayName:0 rawIdentifier:0 cnContactId:v6];

  id v7 = [(ATXContactModeEntity *)v8 cnContactId];
  [(ATXFakeModeEntityScorer *)self setScoreForEntity:v7 score:a4];
}

- (id)rankedAppsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedAppsForNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedContactsForNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        entityToScoreMapping = self->_entityToScoreMapping;
        v11 = [v9 identifier];
        v12 = [(NSMutableDictionary *)entityToScoreMapping objectForKeyedSubscript:v11];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [NSNumber numberWithDouble:self->_defaultAppScore];
        }
        v15 = v14;

        v16 = [ATXModeEntityScore alloc];
        [v15 doubleValue];
        double v18 = v17;
        v19 = objc_opt_new();
        v20 = [(ATXModeEntityScore *)v16 initWithScore:0 featureVector:v19 uuid:v18];

        [v9 setScoreMetadata:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_67);
  [(ATXFakeModeEntityScorer *)self scoreApps:v7 mode:a4];
  id v8 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_12_1);
  [(ATXFakeModeEntityScorer *)self scoreContacts:v8 mode:a4 reply:&__block_literal_global_15_0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "appEntity", (void)v24);
        v16 = [v15 scoreMetadata];

        double v17 = [v14 contactEntity];
        double v18 = [v17 scoreMetadata];

        if (v16) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          if (v16) {
            v20 = v16;
          }
          else {
            v20 = v18;
          }
        }
        else
        {
          [v16 score];
          double v22 = v21;
          [v18 score];
          if (v22 <= v23) {
            v20 = v18;
          }
          else {
            v20 = v16;
          }
        }
        [v14 setScoreMetadata:v20];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
}

uint64_t __51__ATXFakeModeEntityScorer_scoreNotifications_mode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appEntity];
}

uint64_t __51__ATXFakeModeEntityScorer_scoreNotifications_mode___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 contactEntity];
}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4
{
  id v19 = a3;
  id v6 = objc_msgSend(v19, "_pas_mappedArrayWithTransform:", &__block_literal_global_18_1);
  [(ATXFakeModeEntityScorer *)self scoreNotifications:v6 mode:a4];
  if ([v19 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [ATXUserNotificationModelScore alloc];
      id v9 = [v6 objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 scoreMetadata];
      [v10 score];
      double v12 = v11;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v14 = v13;
      v15 = objc_opt_new();
      id v16 = [(ATXUserNotificationModelScore *)v8 initFromModelScoreData:@"ATXModeEntityScorer" modelVersion:0 score:v15 scoreTimestamp:0 scoreUUID:v12 scoreInfo:v14];

      double v17 = [v19 objectAtIndexedSubscript:v7];
      double v18 = [v17 derivedData];
      [v18 addScore:v16];

      ++v7;
    }
    while (v7 < [v19 count]);
  }
}

ATXNotificationModeEntity *__55__ATXFakeModeEntityScorer_scoreUserNotifications_mode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ATXNotificationModeEntity alloc] initWithUserNotification:v2];

  return v3;
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        entityToScoreMappingForDenyList = self->_entityToScoreMappingForDenyList;
        double v11 = [v9 identifier];
        double v12 = [(NSMutableDictionary *)entityToScoreMappingForDenyList objectForKeyedSubscript:v11];
        double v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [NSNumber numberWithDouble:self->_defaultAppScore];
        }
        v15 = v14;

        id v16 = [ATXModeEntityScore alloc];
        [v15 doubleValue];
        double v18 = v17;
        id v19 = objc_opt_new();
        v20 = [(ATXModeEntityScore *)v16 initWithScore:0 featureVector:v19 uuid:v18];

        [v9 setScoreMetadata:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        entityToScoreMappingForDenyList = self->_entityToScoreMappingForDenyList;
        double v11 = [v9 identifier];
        double v12 = [(NSMutableDictionary *)entityToScoreMappingForDenyList objectForKeyedSubscript:v11];
        double v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [NSNumber numberWithDouble:self->_defaultContactScore];
        }
        v15 = v14;

        id v16 = [ATXModeEntityScore alloc];
        [v15 doubleValue];
        double v18 = v17;
        id v19 = objc_opt_new();
        v20 = [(ATXModeEntityScore *)v16 initWithScore:0 featureVector:v19 uuid:v18];

        [v9 setScoreMetadata:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedAppsForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedAppsForNotificationsForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedContactsForNotificationsForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedNotificationsForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedAppsForDenyListForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(ATXFakeModeEntityScorer *)self rankedContactsForDenyListForMode:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v9 = a5;
  id v10 = [(ATXFakeModeEntityScorer *)self rankedContactsForDenyListForMode:a3 options:a4];
  (*((void (**)(id, id, void))a5 + 2))(v9, v10, 0);
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  [(ATXFakeModeEntityScorer *)self scoreApps:a3 mode:a4];
  v8[2](v8, 0);
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v24 = (void (**)(id, void))a5;
  id obj = v7;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        entityToScoreMapping = self->_entityToScoreMapping;
        id v14 = [v12 identifier];
        v15 = [(NSMutableDictionary *)entityToScoreMapping objectForKeyedSubscript:v14];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [NSNumber numberWithDouble:self->_defaultContactScore];
        }
        double v18 = v17;

        id v19 = [ATXModeEntityScore alloc];
        [v18 doubleValue];
        double v21 = v20;
        long long v22 = objc_opt_new();
        long long v23 = [(ATXModeEntityScore *)v19 initWithScore:0 featureVector:v22 uuid:v21];

        [v12 setScoreMetadata:v23];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  v24[2](v24, 0);
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a5;
  [(ATXFakeModeEntityScorer *)self scoreNotifications:a3 mode:a4];
  v8[2](v8, 0);
}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a5;
  [(ATXFakeModeEntityScorer *)self scoreUserNotifications:a3 mode:a4];
  v8[2](v8, 0);
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a5;
  [(ATXFakeModeEntityScorer *)self scoreAppsForDenyList:a3 mode:a4];
  v8[2](v8, 0);
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a5;
  [(ATXFakeModeEntityScorer *)self scoreContactsForDenyList:a3 mode:a4];
  v8[2](v8, 0);
}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityToScoreMappingForDenyList, 0);

  objc_storeStrong((id *)&self->_entityToScoreMapping, 0);
}

@end