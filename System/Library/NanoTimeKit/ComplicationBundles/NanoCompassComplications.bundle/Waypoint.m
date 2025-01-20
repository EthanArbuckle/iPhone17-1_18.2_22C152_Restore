@interface Waypoint
+ (id)fetchRequest;
@end

@implementation Waypoint

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v2);
}

@end