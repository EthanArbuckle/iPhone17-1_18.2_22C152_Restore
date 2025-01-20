@interface _DKKeyValueMO
+ (id)fetchRequest;
@end

@implementation _DKKeyValueMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"KeyValue"];
}

@end