@interface MADService(Generative_Playground)
+ (uint64_t)getEmbeddingVectorDimension:()Generative_Playground;
@end

@implementation MADService(Generative_Playground)

+ (uint64_t)getEmbeddingVectorDimension:()Generative_Playground
{
  uint64_t v4 = [MEMORY[0x263F54050] getUnifiedEmbeddingVersion];
  v5 = (void *)MEMORY[0x263F54050];

  return [v5 getEmbeddingFormatForVersion:v4 dimension:a3 type:0 error:0];
}

@end