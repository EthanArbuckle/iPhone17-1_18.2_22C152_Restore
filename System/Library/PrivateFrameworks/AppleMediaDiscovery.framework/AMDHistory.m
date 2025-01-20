@interface AMDHistory
+ (id)fetchRequest;
@end

@implementation AMDHistory

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDHistory", a2, a1);
}

@end