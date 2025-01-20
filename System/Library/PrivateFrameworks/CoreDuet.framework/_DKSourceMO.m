@interface _DKSourceMO
+ (id)fetchRequest;
@end

@implementation _DKSourceMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Source"];
  return v2;
}

@end