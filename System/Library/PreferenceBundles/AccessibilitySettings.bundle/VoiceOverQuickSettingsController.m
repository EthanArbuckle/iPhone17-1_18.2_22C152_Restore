@interface VoiceOverQuickSettingsController
- (BOOL)canItemBeToggled:(id)a3;
- (BOOL)hideListItem:(id)a3;
- (BOOL)isItemEnabled:(id)a3;
- (id)identifierForItem:(id)a3;
- (id)itemAfterTogglingEnabledState:(id)a3;
- (id)itemsFromPreferences;
- (id)titleForItem:(id)a3;
- (void)updateItemsInPreferences:(id)a3;
@end

@implementation VoiceOverQuickSettingsController

- (id)itemsFromPreferences
{
  v2 = +[VOSSettingsHelper sharedInstance];
  v3 = [v2 userSettingsItems];

  return v3;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSSettingsHelper sharedInstance];
  [v4 saveUserSettingsItems:v3];
}

- (id)titleForItem:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSSettingsHelper sharedInstance];
  v5 = [v3 objectForKey:@"Item"];

  v6 = [v4 nameForItem:v5];

  return v6;
}

- (id)identifierForItem:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSSettingsHelper sharedInstance];
  v5 = [v3 objectForKey:@"Item"];

  v6 = [v4 identifierForItem:v5];

  return v6;
}

- (BOOL)isItemEnabled:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Included"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hideListItem:(id)a3
{
  return 0;
}

- (BOOL)canItemBeToggled:(id)a3
{
  return 1;
}

- (id)itemAfterTogglingEnabledState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  v5 = [v3 objectForKeyedSubscript:@"Included"];

  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 BOOLValue] ^ 1);
  [v4 setObject:v6 forKeyedSubscript:@"Included"];

  return v4;
}

@end