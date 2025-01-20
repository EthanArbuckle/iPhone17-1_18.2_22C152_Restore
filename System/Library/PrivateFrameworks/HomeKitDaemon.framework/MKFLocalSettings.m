@interface MKFLocalSettings
+ (id)fetchRequest;
@end

@implementation MKFLocalSettings

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFLocalSettings"];
}

@end