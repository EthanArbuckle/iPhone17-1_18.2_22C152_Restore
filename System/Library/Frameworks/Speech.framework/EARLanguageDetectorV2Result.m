@interface EARLanguageDetectorV2Result
+ (BOOL)supportsSecureCoding;
- (EARLanguageDetectorV2Result)initWithCoder:(id)a3;
- (EARLanguageDetectorV2Result)initWithLanguageDetectorV2Result:(id)a3;
- (NSDictionary)confidences;
- (NSString)dominantLocale;
- (unint64_t)detectedLangauge;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidences:(id)a3;
- (void)setDetectedLangauge:(unint64_t)a3;
- (void)setDominantLocale:(id)a3;
@end

@implementation EARLanguageDetectorV2Result

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantLocale, 0);

  objc_storeStrong((id *)&self->_confidences, 0);
}

- (void)setDominantLocale:(id)a3
{
}

- (NSString)dominantLocale
{
  return self->_dominantLocale;
}

- (void)setDetectedLangauge:(unint64_t)a3
{
  self->_detectedLangauge = a3;
}

- (unint64_t)detectedLangauge
{
  return self->_detectedLangauge;
}

- (void)setConfidences:(id)a3
{
}

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (EARLanguageDetectorV2Result)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EARLanguageDetectorV2Result;
  v5 = [(EARLanguageDetectorV2Result *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"_confidences"];
    confidences = v5->_confidences;
    v5->_confidences = (NSDictionary *)v7;

    v5->_detectedLangauge = [v4 decodeIntegerForKey:@"_detectedLangauge"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dominantLocale"];
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  confidences = self->_confidences;
  id v5 = a3;
  [v5 encodeObject:confidences forKey:@"_confidences"];
  [v5 encodeInteger:self->_detectedLangauge forKey:@"_detectedLangauge"];
  [v5 encodeObject:self->_dominantLocale forKey:@"_dominantLocale"];
}

- (EARLanguageDetectorV2Result)initWithLanguageDetectorV2Result:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARLanguageDetectorV2Result;
  id v5 = [(EARLanguageDetectorV2Result *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 confidences];
    uint64_t v7 = [v6 copy];
    confidences = v5->_confidences;
    v5->_confidences = (NSDictionary *)v7;

    v5->_detectedLangauge = [v4 detectedLanguage];
    uint64_t v9 = [v4 dominantLocale];
    uint64_t v10 = [v9 copy];
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end