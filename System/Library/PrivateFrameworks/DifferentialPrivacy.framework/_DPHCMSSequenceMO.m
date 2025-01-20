@interface _DPHCMSSequenceMO
+ (id)fetchRequest;
@end

@implementation _DPHCMSSequenceMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"HCMSSequence"];
  return v2;
}

@end