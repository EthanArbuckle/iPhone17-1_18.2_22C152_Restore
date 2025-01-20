@interface DNDApplicationMO
+ (id)fetchRequest;
@end

@implementation DNDApplicationMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Application"];
}

@end