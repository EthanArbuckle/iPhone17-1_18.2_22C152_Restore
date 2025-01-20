@interface AXMTextDetectionOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
- (AXMTextDetectionOptions)initWithCoder:(id)a3;
- (BOOL)shouldApplySemanticTextFiltering;
- (BOOL)usesLanguageCorrection;
- (NSArray)textDetectionLocales;
- (double)normalizedMinimumTextHeightRatio;
- (id)_init;
- (id)description;
- (unint64_t)postProcessingOptions;
- (unint64_t)recognitionLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setNormalizedMinimumTextHeightRatio:(double)a3;
- (void)setPostProcessingOptions:(unint64_t)a3;
- (void)setRecognitionLevel:(unint64_t)a3;
- (void)setTextDetectionLocales:(id)a3;
- (void)setUsesLanguageCorrection:(BOOL)a3;
@end

@implementation AXMTextDetectionOptions

+ (id)defaultOptions
{
  id v2 = [[AXMTextDetectionOptions alloc] _init];

  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMTextDetectionOptions;
  id result = [(AXMTextDetectionOptions *)&v3 init];
  if (result)
  {
    *((void *)result + 2) = 0;
    *((void *)result + 3) = 0;
    *((unsigned char *)result + 8) = 1;
    *((void *)result + 5) = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMTextDetectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMTextDetectionOptions *)self _init];
  if (v5)
  {
    -[AXMTextDetectionOptions setRecognitionLevel:](v5, "setRecognitionLevel:", [v4 decodeIntegerForKey:@"recognitionLevel"]);
    [v4 decodeDoubleForKey:@"normalizedMinimumTextHeightRatio"];
    -[AXMTextDetectionOptions setNormalizedMinimumTextHeightRatio:](v5, "setNormalizedMinimumTextHeightRatio:");
    -[AXMTextDetectionOptions setUsesLanguageCorrection:](v5, "setUsesLanguageCorrection:", [v4 decodeBoolForKey:@"usesLanguageCorrection"]);
    v6 = AXMSecureCodingClasses();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"textDetectionLocales"];
    [(AXMTextDetectionOptions *)v5 setTextDetectionLocales:v7];

    -[AXMTextDetectionOptions setPostProcessingOptions:](v5, "setPostProcessingOptions:", [v4 decodeIntegerForKey:@"postProcessingOptions"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMTextDetectionOptions recognitionLevel](self, "recognitionLevel"), @"recognitionLevel");
  [(AXMTextDetectionOptions *)self normalizedMinimumTextHeightRatio];
  objc_msgSend(v5, "encodeDouble:forKey:", @"normalizedMinimumTextHeightRatio");
  objc_msgSend(v5, "encodeBool:forKey:", -[AXMTextDetectionOptions usesLanguageCorrection](self, "usesLanguageCorrection"), @"usesLanguageCorrection");
  id v4 = [(AXMTextDetectionOptions *)self textDetectionLocales];
  [v5 encodeObject:v4 forKey:@"textDetectionLocales"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMTextDetectionOptions postProcessingOptions](self, "postProcessingOptions"), @"postProcessingOptions");
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithString:@"[ "];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(AXMTextDetectionOptions *)self textDetectionLocales];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) languageCode];
        [v3 appendFormat:@"%@ ", v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"]"];
  v10 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMTextDetectionOptions<%p>\n", self);
  [v10 appendFormat:@"  Options: \n"];
  unint64_t v11 = [(AXMTextDetectionOptions *)self recognitionLevel];
  v12 = @"Accurate";
  if (!v11) {
    v12 = @"Fast";
  }
  [v10 appendFormat:@"    Recognition Level: %@\n", v12];
  [(AXMTextDetectionOptions *)self normalizedMinimumTextHeightRatio];
  objc_msgSend(v10, "appendFormat:", @"    Minimum Text Height Ratio: %.3f\n", v13);
  objc_msgSend(v10, "appendFormat:", @"    Use Language Correction: %ld\n", -[AXMTextDetectionOptions usesLanguageCorrection](self, "usesLanguageCorrection"));
  [v10 appendFormat:@"    Detection Languages: %@\n", v3];
  objc_msgSend(v10, "appendFormat:", @"    Apply Semantic Text Filtering: %ld\n", -[AXMTextDetectionOptions shouldApplySemanticTextFiltering](self, "shouldApplySemanticTextFiltering"));

  return v10;
}

- (BOOL)shouldApplySemanticTextFiltering
{
  return 0;
}

- (void)setNormalizedMinimumTextHeightRatio:(double)a3
{
  self->_normalizedMinimumTextHeightRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (NSArray)textDetectionLocales
{
  textDetectionLocales = self->_textDetectionLocales;
  if (!textDetectionLocales)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v6 = [v5 firstObject];

    if (v6)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v6];
      if (v7) {
        [v4 addObject:v7];
      }
    }
    if (![v4 count])
    {
      v8 = [MEMORY[0x1E4F1CA20] currentLocale];
      if (v8) {
        [v4 addObject:v8];
      }
    }
    v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
    v10 = self->_textDetectionLocales;
    self->_textDetectionLocales = v9;

    textDetectionLocales = self->_textDetectionLocales;
  }

  return textDetectionLocales;
}

- (unint64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setRecognitionLevel:(unint64_t)a3
{
  self->_recognitionLevel = a3;
}

- (double)normalizedMinimumTextHeightRatio
{
  return self->_normalizedMinimumTextHeightRatio;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (void)setTextDetectionLocales:(id)a3
{
}

- (unint64_t)postProcessingOptions
{
  return self->_postProcessingOptions;
}

- (void)setPostProcessingOptions:(unint64_t)a3
{
  self->_postProcessingOptions = a3;
}

- (void).cxx_destruct
{
}

@end