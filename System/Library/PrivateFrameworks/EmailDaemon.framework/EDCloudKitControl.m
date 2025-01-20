@interface EDCloudKitControl
+ (id)fetchRequest;
@end

@implementation EDCloudKitControl

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudKitControl"];
}

@end