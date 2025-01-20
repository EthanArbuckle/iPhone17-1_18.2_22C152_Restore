@interface SFSpeechAnalyzerLanguageDetectorOptions
- (NSArray)languageConstraints;
- (SFSpeechAnalyzerLanguageDetectorOptions)init;
- (unint64_t)alternativeCount;
- (void)setAlternativeCount:(unint64_t)a3;
- (void)setLanguageConstraints:(id)a3;
@end

@implementation SFSpeechAnalyzerLanguageDetectorOptions

- (void).cxx_destruct
{
}

- (void)setAlternativeCount:(unint64_t)a3
{
  self->_alternativeCount = a3;
}

- (unint64_t)alternativeCount
{
  return self->_alternativeCount;
}

- (void)setLanguageConstraints:(id)a3
{
}

- (NSArray)languageConstraints
{
  return self->_languageConstraints;
}

- (SFSpeechAnalyzerLanguageDetectorOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFSpeechAnalyzerLanguageDetectorOptions;
  v2 = [(SFSpeechAnalyzerLanguageDetectorOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    languageConstraints = v2->_languageConstraints;
    v2->_languageConstraints = 0;

    v3->_alternativeCount = 5;
  }
  return v3;
}

@end