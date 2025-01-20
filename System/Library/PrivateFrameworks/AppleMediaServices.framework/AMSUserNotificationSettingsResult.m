@interface AMSUserNotificationSettingsResult
+ (id)_itemsMapForServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (AMSUserNotificationSettingsResult)initWithServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (NSDictionary)itemsMap;
- (NSString)serviceIdentifier;
@end

@implementation AMSUserNotificationSettingsResult

- (AMSUserNotificationSettingsResult)initWithServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationSettingsResult;
  v9 = [(AMSUserNotificationSettingsResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    uint64_t v11 = [(id)objc_opt_class() _itemsMapForServiceIdentifier:v7 dictionaryRepresentation:v8];
    itemsMap = v10->_itemsMap;
    v10->_itemsMap = (NSDictionary *)v11;
  }
  return v10;
}

+ (id)_itemsMapForServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = [v5 stringWithFormat:@"results.notification-preferences.payload.%@", a3];
  id v8 = [v6 valueForKeyPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = objc_msgSend(v9, "ams_mapWithTransform:", &__block_literal_global_141);

  return v10;
}

AMSPair *__92__AMSUserNotificationSettingsResult__itemsMapForServiceIdentifier_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [[AMSUserNotificationSettingsItem alloc] initWithIdentifier:v7 dictionaryRepresentation:v9];
  uint64_t v11 = [[AMSPair alloc] initWithFirst:v7 second:v10];

  return v11;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSDictionary)itemsMap
{
  return self->_itemsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end