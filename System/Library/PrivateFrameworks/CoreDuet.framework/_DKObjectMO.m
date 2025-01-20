@interface _DKObjectMO
+ (id)fetchRequest;
@end

@implementation _DKObjectMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Object"];
  return v2;
}

@end