@interface NLLanguageRecognizer
+ (NLLanguage)dominantLanguageForString:(NSString *)string;
- (NLLanguage)dominantLanguage;
- (NLLanguageRecognizer)init;
- (NSArray)languageConstraints;
- (NSDictionary)languageHints;
- (NSDictionary)languageHypothesesWithMaximum:(NSUInteger)maxHypotheses;
- (void)dealloc;
- (void)processString:(NSString *)string;
- (void)processString:(id)a3 range:(_NSRange)a4;
- (void)reset;
- (void)setLanguageConstraints:(NSArray *)languageConstraints;
- (void)setLanguageHints:(NSDictionary *)languageHints;
@end

@implementation NLLanguageRecognizer

- (NLLanguageRecognizer)init
{
  uint64_t v3 = NLLanguageIdentifierCreate();
  if (v3)
  {
    v4 = (void *)v3;
    v7.receiver = self;
    v7.super_class = (Class)NLLanguageRecognizer;
    v5 = [(NLLanguageRecognizer *)&v7 init];
    self = v5;
    if (v5) {
      v5->_identifier = v4;
    }
  }
  return self;
}

- (void)dealloc
{
  if (self->_identifier) {
    NLLanguageIdentifierRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLLanguageRecognizer;
  [(NLLanguageRecognizer *)&v3 dealloc];
}

+ (NLLanguage)dominantLanguageForString:(NSString *)string
{
  objc_super v3 = string;
  [(NSString *)v3 length];
  int TopLanguage = NLLanguageIdentifierGetTopLanguage();

  return (NLLanguage)_getLanguageTag(TopLanguage);
}

- (NLLanguage)dominantLanguage
{
  int TopHypothesis = NLLanguageIdentifierGetTopHypothesis();

  return (NLLanguage)_getLanguageTag(TopHypothesis);
}

- (NSDictionary)languageHypothesesWithMaximum:(NSUInteger)maxHypotheses
{
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (maxHypotheses >= 0x3A) {
    NSUInteger v5 = 58;
  }
  else {
    NSUInteger v5 = maxHypotheses;
  }
  if (maxHypotheses) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 58;
  }
  objc_super v7 = (float *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
  uint64_t TopHypotheses = NLLanguageIdentifierGetTopHypotheses();
  if (TopHypotheses < 1)
  {
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v9 = TopHypotheses;
    v10 = v7 + 1;
    do
    {
      v11 = _getLanguageTag(*((_DWORD *)v10 - 1));
      if (v11)
      {
        v12 = [NSNumber numberWithDouble:*v10];
        [v4 setObject:v12 forKey:v11];
      }
      v10 += 2;

      --v9;
    }
    while (v9);
  }
  free(v7);
LABEL_15:

  return (NSDictionary *)v4;
}

- (void)processString:(id)a3 range:(_NSRange)a4
{
}

- (void)processString:(NSString *)string
{
  v4 = string;
  -[NLLanguageRecognizer processString:range:](self, "processString:range:", v4, 0, [(NSString *)v4 length]);
}

- (void)reset
{
}

- (NSDictionary)languageHints
{
  if (self->_languageHints) {
    return self->_languageHints;
  }
  else {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (void)setLanguageHints:(NSDictionary *)languageHints
{
  v4 = languageHints;
  id v19 = [(NSDictionary *)v4 allKeys];
  unint64_t v5 = [v19 count];
  if (v5 >= 0x3A) {
    uint64_t v6 = 58;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6)
  {
    objc_super v7 = (char *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = [v19 objectAtIndex:i];
      v10 = [(NSDictionary *)v4 objectForKey:v9];
      [v10 doubleValue];
      double v12 = v11;

      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = v13;
        int v15 = [v9 isEqualToString:_languageTags[v13]];
        unint64_t v13 = v14 + 1;
      }
      while (v14 <= 0x38 && !v15);
      if (!v15) {
        LODWORD(v13) = 0;
      }
      v16 = (float *)&v7[8 * i];
      *(_DWORD *)v16 = v13;
      float v17 = v12;
      v16[1] = v17;
    }
    NLLanguageIdentifierSetLanguageHints();
    free(v7);
  }
  else
  {
    NLLanguageIdentifierSetLanguageHints();
  }
  v18 = self->_languageHints;
  self->_languageHints = v4;
}

- (NSArray)languageConstraints
{
  if (self->_languageConstraints) {
    return self->_languageConstraints;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)setLanguageConstraints:(NSArray *)languageConstraints
{
  v4 = languageConstraints;
  unint64_t v5 = [(NSArray *)v4 count];
  if (v5 >= 0x3A) {
    uint64_t v6 = 58;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6)
  {
    objc_super v7 = malloc_type_malloc(4 * v6, 0x100004052888210uLL);
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = [(NSArray *)v4 objectAtIndex:i];
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = v10;
        int v12 = [v9 isEqualToString:_languageTags[v10]];
        unint64_t v10 = v11 + 1;
      }
      while (v11 <= 0x38 && !v12);
      if (!v12) {
        LODWORD(v10) = 0;
      }
      v7[i] = v10;
    }
    NLLanguageIdentifierSetLanguageConstraints();
    free(v7);
  }
  else
  {
    NLLanguageIdentifierSetLanguageConstraints();
  }
  unint64_t v13 = self->_languageConstraints;
  self->_languageConstraints = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageHints, 0);

  objc_storeStrong((id *)&self->_languageConstraints, 0);
}

@end