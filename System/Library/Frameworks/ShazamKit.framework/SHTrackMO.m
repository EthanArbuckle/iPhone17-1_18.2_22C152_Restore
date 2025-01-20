@interface SHTrackMO
+ (id)fetchRequest;
@end

@implementation SHTrackMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SHTrackMO"];
}

@end