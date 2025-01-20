@interface AFPhonemeTranscription
+ (BOOL)supportsSecureCoding;
- (AFPhonemeTranscription)initWithCoder:(id)a3;
- (NSArray)phonemeSuggestions;
- (NSString)language;
- (NSString)orthography;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setPhonemeSuggestions:(id)a3;
@end

@implementation AFPhonemeTranscription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phonemeSuggestions, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

- (void)setPhonemeSuggestions:(id)a3
{
}

- (NSArray)phonemeSuggestions
{
  return self->_phonemeSuggestions;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setOrthography:(id)a3
{
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)encodeWithCoder:(id)a3
{
  language = self->_language;
  id v5 = a3;
  [v5 encodeObject:language forKey:@"_language"];
  [v5 encodeObject:self->_orthography forKey:@"_orthography"];
  [v5 encodeObject:self->_phonemeSuggestions forKey:@"_phonemeSuggestions"];
}

- (AFPhonemeTranscription)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFPhonemeTranscription;
  id v5 = [(AFPhonemeTranscription *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_orthography"];
    orthography = v5->_orthography;
    v5->_orthography = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_language"];
    language = v5->_language;
    v5->_language = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_phonemeSuggestions"];
    phonemeSuggestions = v5->_phonemeSuggestions;
    v5->_phonemeSuggestions = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end