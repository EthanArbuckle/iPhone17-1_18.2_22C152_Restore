@interface _DKCustomMetadataMO
+ (id)fetchRequest;
@end

@implementation _DKCustomMetadataMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"CustomMetadata"];
  return v2;
}

@end