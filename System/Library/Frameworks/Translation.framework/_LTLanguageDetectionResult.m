@interface _LTLanguageDetectionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isConfident;
- (BOOL)isFinal;
- (NSDictionary)confidences;
- (NSLocale)dominantLanguage;
- (_LTLanguageDetectionResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidences:(id)a3;
- (void)setDominantLanguage:(id)a3;
- (void)setIsConfident:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
@end

@implementation _LTLanguageDetectionResult

- (_LTLanguageDetectionResult)initWithCoder:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageDetectionResult;
  v5 = [(_LTLanguageDetectionResult *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dominantLanguage"];
    [(_LTLanguageDetectionResult *)v5 setDominantLanguage:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    v9 = [v7 setWithArray:v8];

    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"confidences"];
    [(_LTLanguageDetectionResult *)v5 setConfidences:v10];

    v5->_isConfident = [v4 decodeBoolForKey:@"isConfident"];
    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    v11 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(_LTLanguageDetectionResult *)self dominantLanguage];
  [v6 encodeObject:v4 forKey:@"dominantLanguage"];

  v5 = [(_LTLanguageDetectionResult *)self confidences];
  [v6 encodeObject:v5 forKey:@"confidences"];

  objc_msgSend(v6, "encodeBool:forKey:", -[_LTLanguageDetectionResult isConfident](self, "isConfident"), @"isConfident");
  objc_msgSend(v6, "encodeBool:forKey:", -[_LTLanguageDetectionResult isFinal](self, "isFinal"), @"isFinal");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)dominantLanguage
{
  return self->_dominantLanguage;
}

- (void)setDominantLanguage:(id)a3
{
}

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidences, 0);

  objc_storeStrong((id *)&self->_dominantLanguage, 0);
}

@end