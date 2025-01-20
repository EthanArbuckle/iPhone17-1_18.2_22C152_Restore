@interface VOSubstitution
+ (id)fetchRequest;
@end

@implementation VOSubstitution

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VOSubstitution"];
}

@end