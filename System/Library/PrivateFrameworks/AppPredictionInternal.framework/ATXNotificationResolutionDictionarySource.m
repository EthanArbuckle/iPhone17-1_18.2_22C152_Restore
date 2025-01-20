@interface ATXNotificationResolutionDictionarySource
- (ATXNotificationResolutionDictionarySource)initWithResolutionDictionary:(id)a3;
- (id)resolutionsForNotifications:(id)a3;
@end

@implementation ATXNotificationResolutionDictionarySource

- (ATXNotificationResolutionDictionarySource)initWithResolutionDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationResolutionDictionarySource;
  v6 = [(ATXNotificationResolutionDictionarySource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolutionDictionary, a3);
  }

  return v7;
}

- (id)resolutionsForNotifications:(id)a3
{
  return self->_resolutionDictionary;
}

- (void).cxx_destruct
{
}

@end