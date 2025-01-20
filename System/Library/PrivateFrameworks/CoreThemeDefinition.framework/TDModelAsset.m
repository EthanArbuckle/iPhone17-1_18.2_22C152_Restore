@interface TDModelAsset
+ (id)fetchRequest;
@end

@implementation TDModelAsset

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"ModelIOAsset"];

  return v2;
}

@end