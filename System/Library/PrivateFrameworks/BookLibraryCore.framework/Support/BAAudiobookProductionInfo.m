@interface BAAudiobookProductionInfo
+ (id)fetchRequest;
@end

@implementation BAAudiobookProductionInfo

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"AudiobookProductionInfo"];
}

@end