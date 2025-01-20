@interface MADVIDocumentRecognitionRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)targetResolution;
- (BOOL)usesFormFieldDetection;
- (BOOL)usesLanguageCorrection;
- (BOOL)usesLanguageDetection;
- (MADVIDocumentRecognitionRequest)init;
- (MADVIDocumentRecognitionRequest)initWithCoder:(id)a3;
- (MADVIDocumentRecognitionRequest)initWithLanguages:(id)a3;
- (NSArray)languages;
- (float)minimumTextHeight;
- (id)description;
- (int64_t)recognitionLevel;
- (unint64_t)maximumCandidateCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setMaximumCandidateCount:(unint64_t)a3;
- (void)setMinimumTextHeight:(float)a3;
- (void)setRecognitionLevel:(int64_t)a3;
- (void)setUsesFormFieldDetection:(BOOL)a3;
- (void)setUsesLanguageCorrection:(BOOL)a3;
- (void)setUsesLanguageDetection:(BOOL)a3;
@end

@implementation MADVIDocumentRecognitionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIDocumentRecognitionRequest)init
{
  return [(MADVIDocumentRecognitionRequest *)self initWithLanguages:MEMORY[0x1E4F1CBF0]];
}

- (MADVIDocumentRecognitionRequest)initWithLanguages:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIDocumentRecognitionRequest;
  v5 = [(MADVIDocumentRecognitionRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    languages = v5->_languages;
    v5->_languages = (NSArray *)v6;

    v5->_maximumCandidateCount = 3;
    v5->_usesLanguageDetection = 1;
    v5->_usesLanguageCorrection = 1;
    v5->_usesFormFieldDetection = 0;
    v5->_recognitionLevel = 0;
    v5->_minimumTextHeight = 0.0;
  }

  return v5;
}

- (MADVIDocumentRecognitionRequest)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVIDocumentRecognitionRequest;
  v5 = [(MADRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Languages"];
    languages = v5->_languages;
    v5->_languages = (NSArray *)v9;

    v5->_maximumCandidateCount = [v4 decodeIntegerForKey:@"MaximumCandidateCount"];
    v5->_usesLanguageDetection = [v4 decodeBoolForKey:@"UsesLanguageDetection"];
    v5->_usesLanguageCorrection = [v4 decodeBoolForKey:@"UsesLanguageCorrection"];
    v5->_usesFormFieldDetection = [v4 decodeBoolForKey:@"UsesFormFieldDetection"];
    v5->_recognitionLevel = [v4 decodeIntegerForKey:@"RecognitionLevel"];
    [v4 decodeFloatForKey:@"MinimumTextHeight"];
    v5->_minimumTextHeight = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MADVIDocumentRecognitionRequest;
  id v4 = a3;
  [(MADRequest *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, @"Languages", v6.receiver, v6.super_class);
  [v4 encodeInteger:self->_maximumCandidateCount forKey:@"MaximumCandidateCount"];
  [v4 encodeBool:self->_usesLanguageDetection forKey:@"UsesLanguageDetection"];
  [v4 encodeBool:self->_usesLanguageCorrection forKey:@"UsesLanguageCorrection"];
  [v4 encodeBool:self->_usesFormFieldDetection forKey:@"UsesFormFieldDetection"];
  [v4 encodeInteger:self->_recognitionLevel forKey:@"RecognitionLevel"];
  *(float *)&double v5 = self->_minimumTextHeight;
  [v4 encodeFloat:@"MinimumTextHeight" forKey:v5];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"languages: %@, ", self->_languages];
  [v3 appendFormat:@"maximumCandidateCount: %lu, ", self->_maximumCandidateCount];
  [v3 appendFormat:@"usesLanguageDetection: %d, ", self->_usesLanguageDetection];
  [v3 appendFormat:@"usesLanguageCorrection: %d, ", self->_usesLanguageCorrection];
  [v3 appendFormat:@"usesFormFieldDetection: %d, ", self->_usesFormFieldDetection];
  [v3 appendFormat:@"recognitionLevel: %ld, ", self->_recognitionLevel];
  [v3 appendFormat:@"minimumTextHeight: %f, ", self->_minimumTextHeight];
  objc_super v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (unint64_t)maximumCandidateCount
{
  return self->_maximumCandidateCount;
}

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  self->_maximumCandidateCount = a3;
}

- (BOOL)usesLanguageDetection
{
  return self->_usesLanguageDetection;
}

- (void)setUsesLanguageDetection:(BOOL)a3
{
  self->_usesLanguageDetection = a3;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (BOOL)usesFormFieldDetection
{
  return self->_usesFormFieldDetection;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  self->_usesFormFieldDetection = a3;
}

- (int64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setRecognitionLevel:(int64_t)a3
{
  self->_recognitionLevel = a3;
}

- (float)minimumTextHeight
{
  return self->_minimumTextHeight;
}

- (void)setMinimumTextHeight:(float)a3
{
  self->_minimumTextHeight = a3;
}

- (void).cxx_destruct
{
}

@end