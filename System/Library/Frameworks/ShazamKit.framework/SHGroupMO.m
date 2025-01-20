@interface SHGroupMO
+ (id)fetchRequest;
@end

@implementation SHGroupMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SHGroupMO"];
}

@end