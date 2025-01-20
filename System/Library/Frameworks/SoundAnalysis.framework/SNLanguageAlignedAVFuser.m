@interface SNLanguageAlignedAVFuser
+ (BOOL)supportsFusionOfVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4;
- (SNLanguageAlignedAVFuser)init;
- (SNLanguageAlignedAVFuser)initWithVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4 error:(id *)a5;
- (id)fuseVisionEmbedding:(id)a3 audioEmbedding:(id)a4 error:(id *)a5;
@end

@implementation SNLanguageAlignedAVFuser

- (SNLanguageAlignedAVFuser)init
{
}

- (SNLanguageAlignedAVFuser)initWithVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4 error:(id *)a5
{
  return (SNLanguageAlignedAVFuser *)sub_1DC982770(a3, a4);
}

- (id)fuseVisionEmbedding:(id)a3 audioEmbedding:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1DC982A18((uint64_t)v7, (uint64_t)v8);

  return v10;
}

+ (BOOL)supportsFusionOfVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4
{
  return sub_1DC982DE8(a3, a4);
}

- (void).cxx_destruct
{
}

@end