@interface _DKStructuredMetadataMO
+ (id)fetchRequest;
@end

@implementation _DKStructuredMetadataMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"StructuredMetadata"];
}

@end