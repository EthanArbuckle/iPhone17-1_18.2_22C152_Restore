@interface NLEmbedding
+ (BOOL)_writeEmbeddingForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 orData:(id)a7 error:(id *)a8;
+ (BOOL)assetsAvailableForEmbeddingType:(id)a3 language:(id)a4;
+ (BOOL)writeEmbeddingForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language revision:(NSUInteger)revision toURL:(NSURL *)url error:(NSError *)error;
+ (BOOL)writeEmbeddingMLModelForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 options:(id)a7 error:(id *)a8;
+ (NLEmbedding)embeddingWithContentsOfURL:(NSURL *)url error:(NSError *)error;
+ (NLEmbedding)embeddingWithData:(id)a3 error:(id *)a4;
+ (NLEmbedding)embeddingWithMLModel:(id)a3 error:(id *)a4;
+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language;
+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision;
+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language;
+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision;
+ (NSIndexSet)supportedRevisionsForLanguage:(NLLanguage)language;
+ (NSIndexSet)supportedSentenceEmbeddingRevisionsForLanguage:(NLLanguage)language;
+ (NSUInteger)currentRevisionForLanguage:(NLLanguage)language;
+ (NSUInteger)currentSentenceEmbeddingRevisionForLanguage:(NLLanguage)language;
+ (id)_embeddingWithContentsOfURL:(id)a3 error:(id *)a4;
+ (id)_embeddingWithData:(id)a3 error:(id *)a4;
+ (id)contextualWordEmbeddingForLanguage:(id)a3;
+ (id)contextualWordEmbeddingForLanguage:(id)a3 revision:(unint64_t)a4;
+ (id)embeddingDataForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 error:(id *)a6;
+ (id)modelDescriptionForEmbedding:(id)a3;
+ (id)supportedContextualWordEmbeddingRevisionsForLanguage:(id)a3;
+ (id)supportedRevisionsForType:(id)a3 locale:(id)a4;
+ (id)transformerContextualTokenEmbeddingForLanguage:(id)a3;
+ (unint64_t)currentContextualWordEmbeddingRevisionForLanguage:(id)a3;
+ (unint64_t)currentRevisionForType:(id)a3 locale:(id)a4;
+ (void)requestAssetsForEmbeddingType:(id)a3 language:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)containsString:(NSString *)string;
- (BOOL)getVector:(float *)vector forString:(NSString *)string;
- (BOOL)usesUntokenizedSentences;
- (NLDistance)distanceBetweenString:(NSString *)firstString andString:(NSString *)secondString distanceType:(NLDistanceType)distanceType;
- (NLEmbedding)initWithContentsOfURL:(id)a3 error:(id *)p_isa;
- (NLEmbedding)initWithData:(id)a3 error:(id *)a4;
- (NLEmbedding)initWithLocale:(__CFLocale *)a3;
- (NLEmbedding)initWithMLModel:(id)a3 error:(id *)a4;
- (NLEmbedding)initWithNLModel:(id)a3 error:(id *)p_isa;
- (NLEmbedding)initWithType:(id)a3 architecture:(id)a4 locale:(id)a5 version:(id)a6;
- (NLEmbedding)initWithType:(id)a3 locale:(id)a4 version:(id)a5;
- (NLLanguage)language;
- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType;
- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType;
- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType;
- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType;
- (NSArray)vectorForString:(NSString *)string;
- (NSUInteger)dimension;
- (NSUInteger)revision;
- (NSUInteger)vocabularySize;
- (id)_initWithContentsOfURL:(id)a3 error:(id *)p_isa;
- (id)_initWithData:(id)a3 error:(id *)p_isa;
- (id)initContextualEmbeddingWithLocale:(__CFLocale *)a3;
- (id)initSentenceEmbeddingWithLocale:(__CFLocale *)a3;
- (id)vectorsForTokenizedSentences:(id)a3 maxTokens:(unint64_t)a4;
- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5;
- (id)vectorsForUntokenizedSentences:(id)a3 maxTokens:(unint64_t)a4;
- (void)_createEmbeddingRefWithContentsOfURL:(id)a3;
- (void)_createEmbeddingRefWithData:(id)a3;
- (void)_embeddingRef;
- (void)dealloc;
- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block;
- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block;
- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block;
- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block;
- (void)setUsesUntokenizedSentences:(BOOL)a3;
@end

@implementation NLEmbedding

- (NLEmbedding)initWithType:(id)a3 architecture:(id)a4 locale:(id)a5 version:(id)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v15 = *MEMORY[0x1E4F5C890];
  v22[0] = *MEMORY[0x1E4F5C8A0];
  v22[1] = v15;
  v23[0] = v10;
  v23[1] = v12;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v17 = [v14 dictionaryWithDictionary:v16];

  if (v11) {
    [v17 setObject:v11 forKey:*MEMORY[0x1E4F5C878]];
  }
  if (v13) {
    [v17 setObject:v13 forKey:*MEMORY[0x1E4F5C8C8]];
  }
  v18 = (NLEmbedding *)NLStringEmbeddingCreateWithOptions();
  if (v18)
  {
    if (NLStringEmbeddingGetDimension() < 1)
    {
      v18 = 0;
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)NLEmbedding;
      v19 = [(NLEmbedding *)&v21 init];
      if (v19)
      {
        v19->_embedding = v18;
        v19->_usesUntokenizedSentences = 0;
      }
      self = v19;
      v18 = self;
    }
  }

  return v18;
}

- (NLEmbedding)initWithType:(id)a3 locale:(id)a4 version:(id)a5
{
  return [(NLEmbedding *)self initWithType:a3 architecture:0 locale:a4 version:a5];
}

- (BOOL)usesUntokenizedSentences
{
  return self->_usesUntokenizedSentences;
}

- (void)setUsesUntokenizedSentences:(BOOL)a3
{
  self->_usesUntokenizedSentences = a3;
}

- (NLEmbedding)initWithLocale:(__CFLocale *)a3
{
  return [(NLEmbedding *)self initWithType:*MEMORY[0x1E4F5C8A8] locale:a3 version:0];
}

- (id)initContextualEmbeddingWithLocale:(__CFLocale *)a3
{
  return [(NLEmbedding *)self initWithType:*MEMORY[0x1E4F5C8B0] architecture:*MEMORY[0x1E4F5C880] locale:a3 version:0];
}

- (id)initSentenceEmbeddingWithLocale:(__CFLocale *)a3
{
  return [(NLEmbedding *)self initWithType:*MEMORY[0x1E4F5C8B8] locale:a3 version:0];
}

- (void)_createEmbeddingRefWithContentsOfURL:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [a3 path];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = 0;
  if ([v4 fileExistsAtPath:v3 isDirectory:&v11]) {
    BOOL v5 = v11 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F5C8A8];
    uint64_t v8 = *MEMORY[0x1E4F5C898];
    v12[0] = *MEMORY[0x1E4F5C8A0];
    v12[1] = v8;
    v13[0] = v7;
    v13[1] = v3;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v6 = (void *)NLStringEmbeddingCreateWithOptions();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_initWithContentsOfURL:(id)a3 error:(id *)p_isa
{
  BOOL v5 = self;
  v14[1] = *MEMORY[0x1E4F143B8];
  v6 = [(NLEmbedding *)self _createEmbeddingRefWithContentsOfURL:a3];
  if (v6 && (uint64_t v7 = v6, NLStringEmbeddingGetDimension() >= 1))
  {
    v12.receiver = v5;
    v12.super_class = (Class)NLEmbedding;
    uint64_t v8 = [(NLEmbedding *)&v12 init];
    if (v8) {
      v8->_embedding = v7;
    }
    BOOL v5 = v8;
    p_isa = (id *)&v5->super.isa;
  }
  else if (p_isa)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Failed to load embedding file";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *p_isa = [v9 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v10];

    p_isa = 0;
  }

  return p_isa;
}

- (NLEmbedding)initWithContentsOfURL:(id)a3 error:(id *)p_isa
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 path];
  uint64_t v8 = [v7 pathExtension];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v24 = 0;
  if (([v9 fileExistsAtPath:v7 isDirectory:&v24] & 1) == 0)
  {
    if (!p_isa) {
      goto LABEL_9;
    }
    objc_super v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Could not find embedding file";
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = (__CFString **)v30;
    uint64_t v15 = &v29;
    goto LABEL_7;
  }
  if (v24) {
    goto LABEL_3;
  }
  if ([v8 isEqualToString:@"mlmodel"])
  {
    if (!p_isa) {
      goto LABEL_9;
    }
    objc_super v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = @"Cannot load embedding from uncompiled mlmodel file";
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = &v28;
    uint64_t v15 = &v27;
LABEL_7:
    v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    *p_isa = [v12 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v16];

    goto LABEL_8;
  }
  if (v24)
  {
LABEL_3:
    uint64_t v10 = +[NLModel modelWithContentsOfURL:v6 error:p_isa];
    if (v10)
    {
      char v11 = (void *)v10;
      self = [(NLEmbedding *)self initWithNLModel:v10 error:p_isa];

      p_isa = (id *)&self->super.isa;
      goto LABEL_9;
    }
LABEL_8:
    p_isa = 0;
    goto LABEL_9;
  }
  v18 = [(NLEmbedding *)self _createEmbeddingRefWithContentsOfURL:v6];
  if (!v18 || (v19 = v18, NLStringEmbeddingGetDimension() < 1))
  {
    if (p_isa)
    {
      objc_super v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26 = @"Failed to load embedding file";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      *p_isa = [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v22];
    }
    goto LABEL_3;
  }
  v23.receiver = self;
  v23.super_class = (Class)NLEmbedding;
  v20 = [(NLEmbedding *)&v23 init];
  if (v20) {
    v20->_embedding = v19;
  }
  self = v20;
  p_isa = (id *)&self->super.isa;
LABEL_9:

  return (NLEmbedding *)p_isa;
}

- (void)_createEmbeddingRefWithData:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5C888];
  v9[0] = *MEMORY[0x1E4F5C8A0];
  v9[1] = v3;
  v10[0] = *MEMORY[0x1E4F5C8A8];
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v7 = (void *)NLStringEmbeddingCreateWithOptions();
  return v7;
}

- (id)_initWithData:(id)a3 error:(id *)p_isa
{
  id v5 = self;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(NLEmbedding *)self _createEmbeddingRefWithData:a3];
  if (v6 && (uint64_t v7 = v6, NLStringEmbeddingGetDimension() >= 1))
  {
    v12.receiver = v5;
    v12.super_class = (Class)NLEmbedding;
    uint64_t v8 = [(NLEmbedding *)&v12 init];
    if (v8) {
      v8->_embedding = v7;
    }
    id v5 = v8;
    p_isa = (id *)&v5->super.isa;
  }
  else if (p_isa)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Failed to load embedding data";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *p_isa = [v9 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:5 userInfo:v10];

    p_isa = 0;
  }

  return p_isa;
}

- (NLEmbedding)initWithData:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NLEmbedding *)self _createEmbeddingRefWithData:v6];
  if (v7 && (uint64_t v8 = v7, NLStringEmbeddingGetDimension() >= 1))
  {
    v16.receiver = self;
    v16.super_class = (Class)NLEmbedding;
    v9 = [(NLEmbedding *)&v16 init];
    if (v9) {
      v9->_embedding = v8;
    }
    self = v9;
    uint64_t v10 = self;
  }
  else
  {
    if (a4)
    {
      char v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Failed to load embedding data";
      objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a4 = [v11 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:5 userInfo:v12];
    }
    uint64_t v13 = +[NLModel modelWithData:v6 error:a4];
    if (v13)
    {
      v14 = (void *)v13;
      self = [(NLEmbedding *)self initWithNLModel:v13 error:a4];

      uint64_t v10 = self;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (void)_embeddingRef
{
  return self->_embedding;
}

- (NLEmbedding)initWithNLModel:(id)a3 error:(id *)p_isa
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 embedding];
  v9 = (const void *)[v8 _embeddingRef];

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)NLEmbedding;
    uint64_t v10 = [(NLEmbedding *)&v14 init];
    if (v10)
    {
      v10->_embedding = (void *)CFRetain(v9);
      objc_storeStrong((id *)&v10->_nlModel, a3);
    }
    self = v10;
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    char v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Failed to load embedding file";
    objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *p_isa = [v11 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:6 userInfo:v12];

    p_isa = 0;
  }

  return (NLEmbedding *)p_isa;
}

- (NLEmbedding)initWithMLModel:(id)a3 error:(id *)a4
{
  id v6 = +[NLModel modelWithMLModel:error:](NLModel, "modelWithMLModel:error:", a3);
  if (v6)
  {
    self = [(NLEmbedding *)self initWithNLModel:v6 error:a4];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)dealloc
{
  embedding = self->_embedding;
  if (embedding) {
    CFRelease(embedding);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLEmbedding;
  [(NLEmbedding *)&v4 dealloc];
}

+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v3)
  {
    objc_super v4 = [NLEmbedding alloc];
    id v5 = [(NLEmbedding *)v4 initWithType:*MEMORY[0x1E4F5C8A8] locale:v3 version:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)contextualWordEmbeddingForLanguage:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v3)
  {
    objc_super v4 = [NLEmbedding alloc];
    id v5 = [(NLEmbedding *)v4 initWithType:*MEMORY[0x1E4F5C8B0] architecture:*MEMORY[0x1E4F5C880] locale:v3 version:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v3)
  {
    objc_super v4 = [NLEmbedding alloc];
    id v5 = [(NLEmbedding *)v4 initWithType:*MEMORY[0x1E4F5C8B8] locale:v3 version:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision
{
  id v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v5)
  {
    id v6 = [NLEmbedding alloc];
    uint64_t v7 = *MEMORY[0x1E4F5C8A8];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:revision];
    v9 = [(NLEmbedding *)v6 initWithType:v7 locale:v5 version:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)contextualWordEmbeddingForLanguage:(id)a3 revision:(unint64_t)a4
{
  id v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v5)
  {
    id v6 = [NLEmbedding alloc];
    uint64_t v7 = *MEMORY[0x1E4F5C8B0];
    uint64_t v8 = *MEMORY[0x1E4F5C880];
    v9 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v10 = [(NLEmbedding *)v6 initWithType:v7 architecture:v8 locale:v5 version:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)transformerContextualTokenEmbeddingForLanguage:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v3)
  {
    objc_super v4 = [NLEmbedding alloc];
    uint64_t v5 = *MEMORY[0x1E4F5C8B0];
    uint64_t v6 = *MEMORY[0x1E4F5C860];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v8 = [(NLEmbedding *)v4 initWithType:v5 architecture:v6 locale:v3 version:v7];

    if (v8) {
      [(NLEmbedding *)v8 setUsesUntokenizedSentences:1];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision
{
  uint64_t v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v5)
  {
    uint64_t v6 = [NLEmbedding alloc];
    uint64_t v7 = *MEMORY[0x1E4F5C8B8];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:revision];
    v9 = [(NLEmbedding *)v6 initWithType:v7 locale:v5 version:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsString:(NSString *)string
{
  [(NLEmbedding *)self distanceBetweenString:string andString:string distanceType:0];
  return v3 < 2.0;
}

- (NLDistance)distanceBetweenString:(NSString *)firstString andString:(NSString *)secondString distanceType:(NLDistanceType)distanceType
{
  NLStringEmbeddingGetDistance();
  return v5;
}

- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
}

- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = block;
  uint64_t v8 = (void *)NLStringEmbeddingCopyNeighborsWithDistances();
  v9 = [v8 allKeys];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__NLEmbedding_enumerateNeighborsForString_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke;
  v26[3] = &unk_1E5C53768;
  id v10 = v8;
  id v27 = v10;
  char v11 = [v9 sortedArrayUsingComparator:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
      v18 = [v10 objectForKey:v17];
      [v18 doubleValue];
      double v20 = v19;

      char v21 = 0;
      v7[2](v7, v17, &v21, v20);
      if (v21) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __96__NLEmbedding_enumerateNeighborsForString_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType
{
  return [(NLEmbedding *)self neighborsForString:string maximumCount:maxCount maximumDistance:distanceType distanceType:2.0];
}

- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType
{
  id v10 = string;
  char v11 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __76__NLEmbedding_neighborsForString_maximumCount_maximumDistance_distanceType___block_invoke;
  v16[3] = &unk_1E5C54918;
  id v12 = v11;
  id v17 = v12;
  [(NLEmbedding *)self enumerateNeighborsForString:v10 maximumCount:maxCount maximumDistance:distanceType distanceType:v16 usingBlock:maxDistance];
  if ([v12 count] || -[NLEmbedding containsString:](self, "containsString:", v10)) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13;

  return v14;
}

uint64_t __76__NLEmbedding_neighborsForString_maximumCount_maximumDistance_distanceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
}

- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = block;
  uint64_t v8 = (void *)NLStringEmbeddingCopyNeighborsForVectorWithDistances();
  uint64_t v9 = [v8 allKeys];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__NLEmbedding_enumerateNeighborsForVector_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke;
  v26[3] = &unk_1E5C53768;
  id v10 = v8;
  id v27 = v10;
  char v11 = [v9 sortedArrayUsingComparator:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
      v18 = [v10 objectForKey:v17];
      [v18 doubleValue];
      double v20 = v19;

      char v21 = 0;
      v7[2](v7, v17, &v21, v20);
      if (v21) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __96__NLEmbedding_enumerateNeighborsForVector_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType
{
  return [(NLEmbedding *)self neighborsForVector:vector maximumCount:maxCount maximumDistance:distanceType distanceType:2.0];
}

- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType
{
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  char v11 = vector;
  id v12 = [v10 array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__NLEmbedding_neighborsForVector_maximumCount_maximumDistance_distanceType___block_invoke;
  v15[3] = &unk_1E5C54918;
  id v13 = v12;
  id v16 = v13;
  [(NLEmbedding *)self enumerateNeighborsForVector:v11 maximumCount:maxCount maximumDistance:distanceType distanceType:v15 usingBlock:maxDistance];

  return (NSArray *)v13;
}

uint64_t __76__NLEmbedding_neighborsForVector_maximumCount_maximumDistance_distanceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSUInteger)dimension
{
  return NLStringEmbeddingGetDimension();
}

- (NSUInteger)vocabularySize
{
  return MEMORY[0x1F41140A8](self->_embedding, a2);
}

- (NSArray)vectorForString:(NSString *)string
{
  double v3 = (void *)NLStringEmbeddingCopyVector();

  return (NSArray *)v3;
}

- (BOOL)getVector:(float *)vector forString:(NSString *)string
{
  id v6 = (void *)NLStringEmbeddingCopyData();
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 bytes];
    if ([(NLEmbedding *)self dimension])
    {
      unint64_t v9 = 0;
      do
      {
        vector[v9] = *(float *)(v8 + 4 * v9);
        ++v9;
      }
      while (v9 < [(NLEmbedding *)self dimension]);
    }
  }

  return v7 != 0;
}

- (id)vectorsForTokenizedSentences:(id)a3 maxTokens:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  uint64_t Dimension = NLStringEmbeddingGetDimension();
  uint64_t v8 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * a4 * v6 * Dimension];
  unint64_t v9 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * Dimension];
  id v10 = v8;
  [v10 mutableBytes];
  id v11 = v9;
  [v11 mutableBytes];
  LODWORD(a4) = NLStringEmbeddingFillWordVectors();

  if (a4) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)vectorsForUntokenizedSentences:(id)a3 maxTokens:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  uint64_t Dimension = NLStringEmbeddingGetDimension();
  uint64_t v8 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * a4 * v6 * Dimension];
  unint64_t v9 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * Dimension];
  id v10 = v8;
  [v10 mutableBytes];
  id v11 = v9;
  [v11 mutableBytes];
  LODWORD(a4) = NLStringEmbeddingFillTokenVectorsWithShape();

  if (a4) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(NLEmbedding *)self usesUntokenizedSentences]) {
    [(NLEmbedding *)self vectorsForUntokenizedSentences:v9 maxTokens:a5];
  }
  else {
  id v10 = [(NLEmbedding *)self vectorsForTokenizedSentences:v8 maxTokens:a5];
  }

  return v10;
}

- (NLLanguage)language
{
  v2 = (void *)NLStringEmbeddingCopyModelLocale();
  double v3 = [v2 localeIdentifier];

  return (NLLanguage)v3;
}

- (NSUInteger)revision
{
  NSUInteger valuePtr = 0;
  NSUInteger result = NLStringEmbeddingCopyVersion();
  if (result)
  {
    double v3 = (const void *)result;
    CFNumberGetValue((CFNumberRef)result, kCFNumberNSIntegerType, &valuePtr);
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

+ (id)supportedRevisionsForType:(id)a3 locale:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)NLStringEmbeddingCopySupportedVersions();
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "unsignedIntegerValue", (void)v12));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    CFRelease(v6);
  }

  return v5;
}

+ (NSIndexSet)supportedRevisionsForLanguage:(NLLanguage)language
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v4)
  {
    id v5 = [a1 supportedRevisionsForType:*MEMORY[0x1E4F5C8A8] locale:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSIndexSet *)v5;
}

+ (id)supportedContextualWordEmbeddingRevisionsForLanguage:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v4)
  {
    id v5 = [a1 supportedRevisionsForType:*MEMORY[0x1E4F5C8B0] locale:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (NSIndexSet)supportedSentenceEmbeddingRevisionsForLanguage:(NLLanguage)language
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v4)
  {
    id v5 = [a1 supportedRevisionsForType:*MEMORY[0x1E4F5C8B8] locale:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSIndexSet *)v5;
}

+ (unint64_t)currentRevisionForType:(id)a3 locale:(id)a4
{
  unint64_t result = NLStringEmbeddingCopyCurrentVersion();
  if (result)
  {
    id v5 = (const void *)result;
    unint64_t v6 = [(id)result unsignedIntegerValue];
    CFRelease(v5);
    return v6;
  }
  return result;
}

+ (NSUInteger)currentRevisionForLanguage:(NLLanguage)language
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v4) {
    NSUInteger v5 = [a1 currentRevisionForType:*MEMORY[0x1E4F5C8A8] locale:v4];
  }
  else {
    NSUInteger v5 = 0;
  }

  return v5;
}

+ (unint64_t)currentContextualWordEmbeddingRevisionForLanguage:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v4) {
    unint64_t v5 = [a1 currentRevisionForType:*MEMORY[0x1E4F5C8B0] locale:v4];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (NSUInteger)currentSentenceEmbeddingRevisionForLanguage:(NLLanguage)language
{
  objc_super v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:language];
  if (v4) {
    NSUInteger v5 = [a1 currentRevisionForType:*MEMORY[0x1E4F5C8B8] locale:v4];
  }
  else {
    NSUInteger v5 = 0;
  }

  return v5;
}

+ (BOOL)_writeEmbeddingForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 orData:(id)a7 error:(id *)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v47 = a6;
  memset(v55, 0, sizeof(v55));
  id v49 = a7;
  v50 = a8;
  if ([v13 countByEnumeratingWithState:v55 objects:v65 count:16])
  {
    long long v15 = [v13 objectForKey:**((void **)&v55[0] + 1)];
    unint64_t v16 = [v15 count];
  }
  else
  {
    unint64_t v16 = 0;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v52;
LABEL_6:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v52 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * v21);
      long long v23 = [v17 objectForKey:v22];
      uint64_t v24 = [v23 count];

      if (v16 != v24) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v19) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    NSLog(&cfstr_EmbeddingDicti.isa, v22, v24, v16);

    if (v50)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      v59 = @"Embedding dictionary has mismatched dimensions";
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      [v28 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v29];
      BOOL v30 = 0;
      id *v50 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v14;
      v32 = v47;
      v31 = v49;
      goto LABEL_40;
    }
    BOOL v30 = 0;
    v26 = v14;
    v32 = v47;
    v31 = v49;
  }
  else
  {
LABEL_12:

    if (v16)
    {
      if ((unint64_t)[v17 count] >= 0x7A121) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 3;
      }
      v26 = v14;
      if (v14)
      {
        uint64_t v27 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v14];
      }
      else
      {
        uint64_t v27 = 0;
      }
      v32 = v47;
      unint64_t v34 = 10;
      v48 = (void *)v27;
      do
      {
        if (!(v16 % v34)) {
          break;
        }
        --v34;
      }
      while (v34);
      if (v34 <= 1) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = v34;
      }
      v36 = (void *)MEMORY[0x1E4F1CA60];
      v62[0] = *MEMORY[0x1E4F5C8C8];
      v37 = [NSNumber numberWithUnsignedInteger:a5];
      v63[0] = v37;
      v62[1] = *MEMORY[0x1E4F5C8E0];
      v38 = [NSNumber numberWithUnsignedInteger:v35];
      v63[1] = v38;
      v62[2] = *MEMORY[0x1E4F5C8D8];
      v39 = [NSNumber numberWithUnsignedInteger:v25];
      v63[2] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
      uint64_t v29 = [v36 dictionaryWithDictionary:v40];

      v41 = v48;
      if (v48) {
        [v29 setObject:v48 forKey:*MEMORY[0x1E4F5C890]];
      }
      v31 = v49;
      if (v32)
      {
        v42 = [v32 path];
        [v29 setObject:v42 forKey:*MEMORY[0x1E4F5C898]];
      }
      if (v49) {
        [v29 setObject:v49 forKey:*MEMORY[0x1E4F5C888]];
      }
      char v43 = NLStringEmbeddingSaveCompressedModel();
      BOOL v30 = v43;
      if (v50 && (v43 & 1) == 0)
      {
        v44 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        v61 = @"Failed to save embedding file";
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        v41 = v48;
        id *v50 = [v44 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v45];
      }
    }
    else
    {
      v26 = v14;
      v31 = v49;
      if (!v50)
      {
        BOOL v30 = 0;
        v32 = v47;
        goto LABEL_41;
      }
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57 = @"Embedding dictionary is missing data";
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      [v33 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v29];
      BOOL v30 = 0;
      id *v50 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v47;
    }
LABEL_40:
  }
LABEL_41:

  return v30;
}

+ (BOOL)writeEmbeddingForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language revision:(NSUInteger)revision toURL:(NSURL *)url error:(NSError *)error
{
  return [a1 _writeEmbeddingForDictionary:dictionary language:language revision:revision toURL:url orData:0 error:error];
}

+ (id)embeddingDataForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CA58];
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 data];
  LODWORD(a6) = [a1 _writeEmbeddingForDictionary:v12 language:v11 revision:a5 toURL:0 orData:v13 error:a6];

  if (a6) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

+ (id)modelDescriptionForEmbedding:(id)a3
{
  double v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 revision];
  uint64_t v6 = [v4 dimension];
  uint64_t v7 = [v4 vocabularySize];

  return (id)objc_msgSend(v3, "stringWithFormat:", @"This model is an embedding (version %llu) with dimension %llu and vocabulary size %llu", v5, v6, v7);
}

+ (BOOL)writeEmbeddingMLModelForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 options:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = [a1 embeddingDataForDictionary:a3 language:v14 revision:a5 error:a8];
  if (v17)
  {
    uint64_t v18 = +[NLEmbedding embeddingWithData:v17 error:a8];
    if (v18)
    {
      id v35 = v16;
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v14, @"Language", 0);
      uint64_t v20 = +[NLModelConfiguration defaultModelConfigurationForType:0 options:v19 error:a8];

      uint64_t v21 = [[NLModelImplE alloc] initWithModelData:v17 configuration:v20 labelMap:0 vocabularyMap:0 documentFrequencyMap:0 customEmbeddingData:0 trainingInfo:0 error:0];
      unint64_t v34 = (void *)v20;
      uint64_t v22 = [[NLModel alloc] initWithConfiguration:v20 modelImpl:v21];
      if (v22)
      {
        v32 = v21;
        id v33 = v15;
        long long v23 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v35];
        uint64_t v24 = *MEMORY[0x1E4F1E8A0];
        uint64_t v25 = [v23 objectForKey:*MEMORY[0x1E4F1E8A0]];

        if (!v25)
        {
          v26 = [a1 modelDescriptionForEmbedding:v18];
          [v23 setObject:v26 forKey:v24];
        }
        uint64_t v27 = *MEMORY[0x1E4F1E8B8];
        v28 = [v23 objectForKey:*MEMORY[0x1E4F1E8B8]];

        if (!v28)
        {
          uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a5);
          [v23 setObject:v29 forKey:v27];
        }
        id v15 = v33;
        BOOL v30 = [(NLModel *)v22 writeMLModelToURL:v33 options:v23 error:a8];

        id v16 = v35;
        uint64_t v21 = v32;
      }
      else
      {
        id v16 = v35;
        if (a8)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"NLNaturalLanguageErrorDomain" code:6 userInfo:0];
          BOOL v30 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v30 = 0;
        }
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else if (a8)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"NLNaturalLanguageErrorDomain" code:6 userInfo:0];
    BOOL v30 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

+ (NLEmbedding)embeddingWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  uint64_t v5 = url;
  uint64_t v6 = [[NLEmbedding alloc] initWithContentsOfURL:v5 error:error];

  return v6;
}

+ (NLEmbedding)embeddingWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [[NLEmbedding alloc] initWithData:v5 error:a4];

  return v6;
}

+ (NLEmbedding)embeddingWithMLModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [[NLEmbedding alloc] initWithMLModel:v5 error:a4];

  return v6;
}

+ (id)_embeddingWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[NLEmbedding alloc] _initWithContentsOfURL:v5 error:a4];

  return v6;
}

+ (id)_embeddingWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[NLEmbedding alloc] _initWithData:v5 error:a4];

  return v6;
}

+ (BOOL)assetsAvailableForEmbeddingType:(id)a3 language:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_10;
  }
  if (![v5 isEqualToString:@"Static"])
  {
    if ([v5 isEqualToString:@"Dynamic"])
    {
      uint64_t v7 = +[NLEmbedding contextualWordEmbeddingForLanguage:v6];
      goto LABEL_6;
    }
    if ([v5 isEqualToString:@"Contextual"])
    {
      uint64_t v8 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:v6];
      char v9 = [v8 hasAvailableAssets];
      goto LABEL_7;
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = +[NLEmbedding wordEmbeddingForLanguage:v6];
LABEL_6:
  uint64_t v8 = (void *)v7;
  char v9 = v7 != 0;
LABEL_7:

LABEL_11:
  return v9;
}

+ (void)requestAssetsForEmbeddingType:(id)a3 language:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if ([v7 isEqualToString:@"Static"])
    {
      id v10 = @"WordEmbedding";
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke;
      v18[3] = &unk_1E5C54570;
      id v11 = &v19;
      id v19 = v9;
      id v12 = v18;
    }
    else
    {
      if (![v7 isEqualToString:@"Dynamic"])
      {
        if (![v7 isEqualToString:@"Contextual"]) {
          goto LABEL_8;
        }
        id v13 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:v8];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_3;
        v14[3] = &unk_1E5C54570;
        id v11 = &v15;
        id v15 = v9;
        [v13 requestEmbeddingAssetsWithCompletionHandler:v14];

        goto LABEL_7;
      }
      id v10 = @"ContextualEmbedding";
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_2;
      v16[3] = &unk_1E5C54570;
      id v11 = &v17;
      id v17 = v9;
      id v12 = v16;
    }
    +[NLTagger requestAssetsForLanguage:v8 tagScheme:v10 completionHandler:v12];
LABEL_7:
  }
LABEL_8:
}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end