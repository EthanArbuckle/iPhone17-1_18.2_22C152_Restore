@interface DNDPerAppSettingsMO
+ (id)fetchRequest;
@end

@implementation DNDPerAppSettingsMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PerAppSettings"];
}

@end