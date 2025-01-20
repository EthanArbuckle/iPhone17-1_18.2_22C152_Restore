@interface MKFCKSharedUserPhoto
+ (id)fetchRequest;
@end

@implementation MKFCKSharedUserPhoto

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserPhoto"];
}

@end