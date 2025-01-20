@interface DRSConfigMetadataMO
+ (id)fetchRequest;
@end

@implementation DRSConfigMetadataMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSConfigMetadataMO"];
}

@end