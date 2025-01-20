@interface DNDPerModeSettingsMO
+ (id)fetchRequest;
@end

@implementation DNDPerModeSettingsMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PerModeSettings"];
}

@end