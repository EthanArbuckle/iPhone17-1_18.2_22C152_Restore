@interface CLSNLP
+ (id)wordEmbeddingNeighborsWithDistanceForNgram:(id)a3 locale:(id)a4 limit:(unint64_t)a5 distance:(float)a6;
@end

@implementation CLSNLP

+ (id)wordEmbeddingNeighborsWithDistanceForNgram:(id)a3 locale:(id)a4 limit:(unint64_t)a5 distance:(float)a6
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [a3 lowercaseString];
  uint64_t v9 = *MEMORY[0x1E4F5C8A8];
  uint64_t v10 = *MEMORY[0x1E4F5C890];
  v16[0] = *MEMORY[0x1E4F5C8A0];
  v16[1] = v10;
  v17[0] = v9;
  v17[1] = v7;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v12 = (const void *)NLStringEmbeddingCreateWithOptions();
  uint64_t v13 = NLStringEmbeddingCopyNeighborsWithDistances();
  v14 = [MEMORY[0x1E4F1C9E8] dictionary];

  if (v13)
  {

    v14 = (void *)v13;
  }
  if (v12) {
    CFRelease(v12);
  }

  return v14;
}

@end