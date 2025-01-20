@interface GATSettings
+ (BOOL)isEnabled;
+ (BOOL)setupPrompt;
+ (BOOL)useConfirmationPrompts;
- (GATSettings)init;
@end

@implementation GATSettings

+ (BOOL)isEnabled
{
  return sub_24FAA845C();
}

+ (BOOL)useConfirmationPrompts
{
  return sub_24FAA845C();
}

+ (BOOL)setupPrompt
{
  return sub_24FAA845C();
}

- (GATSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)GATSettings;
  return [(GATSettings *)&v3 init];
}

@end