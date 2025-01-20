@interface MKFLocalAppleMediaSensorPairing
+ (id)fetchRequest;
@end

@implementation MKFLocalAppleMediaSensorPairing

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalAppleMediaSensorPairing"];
}

@end