@interface DNDAppConfigurationActionMO
+ (id)fetchRequest;
- (Class)dnd_settingsType;
@end

@implementation DNDAppConfigurationActionMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AppConfigurationAction"];
}

- (Class)dnd_settingsType
{
  return (Class)objc_opt_class();
}

@end