@interface SHMetadataMO
+ (id)fetchRequest;
@end

@implementation SHMetadataMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SHMetadataMO"];
}

@end