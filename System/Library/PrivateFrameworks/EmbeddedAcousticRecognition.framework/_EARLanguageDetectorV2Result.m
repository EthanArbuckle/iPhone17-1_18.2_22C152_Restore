@interface _EARLanguageDetectorV2Result
- (NSDictionary)confidences;
- (NSString)dominantLocale;
- (unint64_t)detectedLanguage;
- (void)setConfidences:(id)a3;
- (void)setDetectedLanguage:(unint64_t)a3;
- (void)setDominantLocale:(id)a3;
@end

@implementation _EARLanguageDetectorV2Result

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
}

- (unint64_t)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)setDetectedLanguage:(unint64_t)a3
{
  self->_detectedLanguage = a3;
}

- (NSString)dominantLocale
{
  return self->_dominantLocale;
}

- (void)setDominantLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantLocale, 0);
  objc_storeStrong((id *)&self->_confidences, 0);
}

@end