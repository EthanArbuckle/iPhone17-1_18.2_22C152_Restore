@interface MKFLocalElementTimePeriod
+ (id)fetchRequest;
@end

@implementation MKFLocalElementTimePeriod

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalElementTimePeriod"];
}

@end