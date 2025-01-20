@interface _LTTextLanguageDetectionResult
+ (BOOL)supportsSecureCoding;
- (NSArray)lowConfidenceLocales;
- (NSCountedSet)localeDetectionCount;
- (NSCountedSet)unsupportedLanguageCounts;
- (NSLocale)dominantLocale;
- (NSLocale)dominantUnsupportedLocale;
- (_LTTextLanguageDetectionResult)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDominantLocale:(id)a3;
- (void)setLocaleDetectionCount:(id)a3;
- (void)setLowConfidenceLocales:(id)a3;
- (void)setUnsupportedLanguageCounts:(id)a3;
@end

@implementation _LTTextLanguageDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTTextLanguageDetectionResult)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LTTextLanguageDetectionResult;
  v5 = [(_LTTextLanguageDetectionResult *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dominantLocale"];
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"localeDetectionCount"];
    localeDetectionCount = v5->_localeDetectionCount;
    v5->_localeDetectionCount = (NSCountedSet *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"unsupportedLanguageCount"];
    unsupportedLanguageCounts = v5->_unsupportedLanguageCounts;
    v5->_unsupportedLanguageCounts = (NSCountedSet *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    v20 = [v18 setWithArray:v19];

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"lowConfidenceLocales"];
    lowConfidenceLocales = v5->_lowConfidenceLocales;
    v5->_lowConfidenceLocales = (NSArray *)v21;

    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dominantLocale = self->_dominantLocale;
  id v5 = a3;
  [v5 encodeObject:dominantLocale forKey:@"dominantLocale"];
  [v5 encodeObject:self->_localeDetectionCount forKey:@"localeDetectionCount"];
  [v5 encodeObject:self->_unsupportedLanguageCounts forKey:@"unsupportedLanguageCount"];
  [v5 encodeObject:self->_lowConfidenceLocales forKey:@"lowConfidenceLocales"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(NSCountedSet *)self->_localeDetectionCount count];
  uint64_t v5 = [(NSCountedSet *)self->_unsupportedLanguageCounts count];
  uint64_t v6 = [(NSLocale *)self->_dominantLocale localeIdentifier];
  v7 = [v3 stringWithFormat:@"Detection result locale count: %zd, unsupported count: %zd, dominant: %@, lowConfidenceLocales: %@", v4, v5, v6, self->_lowConfidenceLocales];

  return v7;
}

- (NSLocale)dominantUnsupportedLocale
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(_LTTextLanguageDetectionResult *)self dominantLocale];

  if (v3)
  {
    uint64_t v4 = 0;
    goto LABEL_18;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(_LTTextLanguageDetectionResult *)self unsupportedLanguageCounts];
  uint64_t v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {

    v10 = 0;
LABEL_16:
    uint64_t v4 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  v10 = 0;
  uint64_t v11 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v14 = [(_LTTextLanguageDetectionResult *)self unsupportedLanguageCounts];
      unint64_t v15 = [v14 countForObject:v13];

      if (v15 > v9)
      {
        id v16 = v13;

        unint64_t v9 = v15;
        v10 = v16;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);

  if (!v9 || ([v10 isEqualToString:@"__unknown__"] & 1) != 0) {
    goto LABEL_16;
  }
  uint64_t v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v10];
LABEL_17:

LABEL_18:

  return (NSLocale *)v4;
}

- (NSLocale)dominantLocale
{
  return self->_dominantLocale;
}

- (void)setDominantLocale:(id)a3
{
}

- (NSCountedSet)localeDetectionCount
{
  return self->_localeDetectionCount;
}

- (void)setLocaleDetectionCount:(id)a3
{
}

- (NSCountedSet)unsupportedLanguageCounts
{
  return self->_unsupportedLanguageCounts;
}

- (void)setUnsupportedLanguageCounts:(id)a3
{
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_unsupportedLanguageCounts, 0);
  objc_storeStrong((id *)&self->_localeDetectionCount, 0);

  objc_storeStrong((id *)&self->_dominantLocale, 0);
}

@end