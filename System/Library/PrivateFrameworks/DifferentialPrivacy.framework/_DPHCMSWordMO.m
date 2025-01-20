@interface _DPHCMSWordMO
+ (id)fetchRequest;
@end

@implementation _DPHCMSWordMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"HCMSWord"];
  return v2;
}

@end