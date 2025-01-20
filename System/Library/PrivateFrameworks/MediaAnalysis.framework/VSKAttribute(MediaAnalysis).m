@interface VSKAttribute(MediaAnalysis)
+ (id)mad_embeddingVersionAttribute;
@end

@implementation VSKAttribute(MediaAnalysis)

+ (id)mad_embeddingVersionAttribute
{
  id v0 = objc_alloc(MEMORY[0x1E4FB3BC8]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB3BD8]) initWithIntegerDefaultValue:0];
  v2 = (void *)[v0 initWithName:@"embeddingVersion" columnType:v1];

  return v2;
}

@end