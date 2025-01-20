@interface _LTTranslationCandidate
+ (BOOL)supportsSecureCoding;
- (BOOL)isLowConfidence;
- (NSArray)genderAlternatives;
- (NSArray)preToPostITN;
- (NSArray)senses;
- (NSArray)tokens;
- (NSString)formattedString;
- (NSString)romanization;
- (NSString)sanitizedFormattedString;
- (_LTTranslationCandidate)initWithCoder:(id)a3;
- (_LTTranslationStatistics)statistics;
- (double)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setFormattedString:(id)a3;
- (void)setGenderAlternatives:(id)a3;
- (void)setLowConfidence:(BOOL)a3;
- (void)setPreToPostITN:(id)a3;
- (void)setRomanization:(id)a3;
- (void)setSanitizedFormattedString:(id)a3;
- (void)setSenses:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation _LTTranslationCandidate

- (_LTTranslationCandidate)initWithCoder:(id)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_LTTranslationCandidate;
  v5 = [(_LTTranslationCandidate *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedString"];
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedFormattedString"];
    sanitizedFormattedString = v5->_sanitizedFormattedString;
    v5->_sanitizedFormattedString = (NSString *)v8;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v10;
    v5->_lowConfidence = [v4 decodeBoolForKey:@"lowConfidence"];
    v11 = (void *)MEMORY[0x263EFFA08];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"senses"];
    senses = v5->_senses;
    v5->_senses = (NSArray *)v19;

    v21 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    v23 = [v21 setWithArray:v22];

    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"genders"];
    genderAlternatives = v5->_genderAlternatives;
    v5->_genderAlternatives = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statistics"];
    statistics = v5->_statistics;
    v5->_statistics = (_LTTranslationStatistics *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"romanization"];
    romanization = v5->_romanization;
    v5->_romanization = (NSString *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  formattedString = self->_formattedString;
  id v5 = a3;
  [v5 encodeObject:formattedString forKey:@"formattedString"];
  [v5 encodeObject:self->_sanitizedFormattedString forKey:@"sanitizedFormattedString"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeBool:self->_lowConfidence forKey:@"lowConfidence"];
  [v5 encodeObject:self->_tokens forKey:@"tokens"];
  [v5 encodeObject:self->_senses forKey:@"senses"];
  [v5 encodeObject:self->_genderAlternatives forKey:@"genders"];
  [v5 encodeObject:self->_statistics forKey:@"statistics"];
  [v5 encodeObject:self->_romanization forKey:@"romanization"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (void)setFormattedString:(id)a3
{
}

- (NSString)sanitizedFormattedString
{
  return self->_sanitizedFormattedString;
}

- (void)setSanitizedFormattedString:(id)a3
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

- (NSArray)preToPostITN
{
  return self->_preToPostITN;
}

- (void)setPreToPostITN:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)senses
{
  return self->_senses;
}

- (void)setSenses:(id)a3
{
}

- (NSArray)genderAlternatives
{
  return self->_genderAlternatives;
}

- (void)setGenderAlternatives:(id)a3
{
}

- (_LTTranslationStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (NSString)romanization
{
  return self->_romanization;
}

- (void)setRomanization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_romanization, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_genderAlternatives, 0);
  objc_storeStrong((id *)&self->_senses, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_preToPostITN, 0);
  objc_storeStrong((id *)&self->_sanitizedFormattedString, 0);

  objc_storeStrong((id *)&self->_formattedString, 0);
}

@end