@interface MKFLocalElementTimePeriodSunriseSunSet
+ (id)fetchRequest;
@end

@implementation MKFLocalElementTimePeriodSunriseSunSet

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalElementTimePeriodSunriseSunSet"];
}

@end