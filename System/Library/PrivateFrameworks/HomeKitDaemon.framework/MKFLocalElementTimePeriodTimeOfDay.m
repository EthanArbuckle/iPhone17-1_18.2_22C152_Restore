@interface MKFLocalElementTimePeriodTimeOfDay
+ (id)fetchRequest;
@end

@implementation MKFLocalElementTimePeriodTimeOfDay

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalElementTimePeriodTimeOfDay"];
}

@end