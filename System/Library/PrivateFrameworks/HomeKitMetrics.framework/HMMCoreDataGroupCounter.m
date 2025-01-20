@interface HMMCoreDataGroupCounter
+ (id)fetchRequest;
@end

@implementation HMMCoreDataGroupCounter

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
}

@end