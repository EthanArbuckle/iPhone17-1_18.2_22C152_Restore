@interface TDAvaliableVectorSize
+ (id)fetchRequest;
@end

@implementation TDAvaliableVectorSize

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"AvaliableVectorSize"];
}

@end