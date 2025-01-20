@interface VSPersistentUserAccount
+ (id)fetchRequest;
@end

@implementation VSPersistentUserAccount

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VSPersistentUserAccount"];
}

@end