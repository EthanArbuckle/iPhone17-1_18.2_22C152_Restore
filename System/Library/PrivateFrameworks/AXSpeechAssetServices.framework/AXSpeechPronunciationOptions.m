@interface AXSpeechPronunciationOptions
+ (BOOL)supportsSecureCoding;
- (AXSpeechPronunciationOptions)initWithCoder:(id)a3;
- (NSString)language;
- (NSString)orthography;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
@end

@implementation AXSpeechPronunciationOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSpeechPronunciationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSpeechPronunciationOptions;
  v5 = [(AXSpeechPronunciationOptions *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orthograpy"];
    [(AXSpeechPronunciationOptions *)v5 setOrthography:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    [(AXSpeechPronunciationOptions *)v5 setLanguage:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXSpeechPronunciationOptions *)self orthography];
  [v4 encodeObject:v5 forKey:@"orthograpy"];

  id v6 = [(AXSpeechPronunciationOptions *)self language];
  [v4 encodeObject:v6 forKey:@"language"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AXSpeechPronunciationOptions *)self orthography];
  v5 = [(AXSpeechPronunciationOptions *)self language];
  id v6 = [v3 stringWithFormat:@"AXSpeechPronunciationOptions: %@ %@", v4, v5];

  return v6;
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_orthography, 0);
}

@end