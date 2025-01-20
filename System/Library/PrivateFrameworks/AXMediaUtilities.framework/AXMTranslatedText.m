@interface AXMTranslatedText
+ (BOOL)supportsSecureCoding;
+ (id)text:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 targetLocale:(id)a6;
- (AXMTranslatedText)initWithCoder:(id)a3;
- (BOOL)isLowConfidence;
- (NSLocale)targetLocale;
- (NSString)text;
- (double)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setLowConfidence:(BOOL)a3;
- (void)setTargetLocale:(id)a3;
- (void)setText:(id)a3;
@end

@implementation AXMTranslatedText

+ (id)text:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 targetLocale:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  v11 = objc_alloc_init(AXMTranslatedText);
  [(AXMTranslatedText *)v11 setText:v10];

  [(AXMTranslatedText *)v11 setConfidence:a4];
  [(AXMTranslatedText *)v11 setTargetLocale:v9];

  [(AXMTranslatedText *)v11 setLowConfidence:v6];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMTranslatedText)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMTranslatedText;
  v5 = [(AXMTranslatedText *)&v9 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    [(AXMTranslatedText *)v5 setText:v6];

    [v4 decodeDoubleForKey:@"confidence"];
    -[AXMTranslatedText setConfidence:](v5, "setConfidence:");
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetLocale"];
    [(AXMTranslatedText *)v5 setTargetLocale:v7];

    -[AXMTranslatedText setLowConfidence:](v5, "setLowConfidence:", [v4 decodeBoolForKey:@"lowConfidence"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AXMTranslatedText *)self text];
  [v6 encodeObject:v4 forKey:@"text"];

  [(AXMTranslatedText *)self confidence];
  objc_msgSend(v6, "encodeDouble:forKey:", @"confidence");
  v5 = [(AXMTranslatedText *)self targetLocale];
  [v6 encodeObject:v5 forKey:@"targetLocale"];

  objc_msgSend(v6, "encodeBool:forKey:", -[AXMTranslatedText isLowConfidence](self, "isLowConfidence"), @"lowConfidence");
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void)setLowConfidence:(BOOL)a3
{
  self->_lowConfidence = a3;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end