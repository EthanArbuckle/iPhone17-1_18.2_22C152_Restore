@interface BMRuleMO
+ (id)fetchRequest;
@end

@implementation BMRuleMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Rule"];
}

@end