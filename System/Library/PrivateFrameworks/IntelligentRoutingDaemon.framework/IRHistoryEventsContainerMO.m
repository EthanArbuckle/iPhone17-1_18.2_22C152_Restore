@interface IRHistoryEventsContainerMO
+ (id)fetchRequest;
@end

@implementation IRHistoryEventsContainerMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRHistoryEventsContainerMO"];
}

@end