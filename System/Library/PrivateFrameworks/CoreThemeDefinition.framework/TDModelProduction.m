@interface TDModelProduction
+ (id)fetchRequest;
@end

@implementation TDModelProduction

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"ModelIOProduction"];

  return v2;
}

@end