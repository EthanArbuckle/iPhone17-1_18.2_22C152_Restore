@interface DNDSystemActionMO
+ (id)fetchRequest;
- (Class)dnd_settingsType;
@end

@implementation DNDSystemActionMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SystemAction"];
}

- (Class)dnd_settingsType
{
  return (Class)objc_opt_class();
}

@end