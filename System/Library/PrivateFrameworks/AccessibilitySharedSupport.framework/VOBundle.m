@interface VOBundle
+ (id)fetchRequest;
@end

@implementation VOBundle

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VOBundle"];
}

@end