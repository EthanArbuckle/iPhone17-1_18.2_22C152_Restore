@interface VoiceOverRotorController
- (BOOL)isItemEnabled:(id)a3;
- (id)itemAfterTogglingEnabledState:(id)a3;
- (id)languageForItem:(id)a3;
- (id)stringForSearchRotorItem:(id)a3;
- (id)titleForItem:(id)a3;
@end

@implementation VoiceOverRotorController

- (id)titleForItem:(id)a3
{
  v4 = [a3 objectForKey:@"RotorItem"];
  v5 = [(VoiceOverRotorController *)self stringForSearchRotorItem:v4];

  return v5;
}

- (BOOL)isItemEnabled:(id)a3
{
  v3 = [a3 objectForKey:@"Enabled"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)itemAfterTogglingEnabledState:(id)a3
{
  id v3 = [a3 mutableCopy];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"Enabled"];
  unsigned int v5 = [v4 BOOLValue];

  v6 = +[NSNumber numberWithInt:v5 ^ 1];
  [v3 setObject:v6 forKeyedSubscript:@"Enabled"];

  return v3;
}

- (id)languageForItem:(id)a3
{
  return [a3 objectForKey:@"Language"];
}

- (id)stringForSearchRotorItem:(id)a3
{
  return 0;
}

@end