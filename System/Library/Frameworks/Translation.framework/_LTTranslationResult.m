@interface _LTTranslationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isFinal;
- (NSArray)alignments;
- (NSArray)translations;
- (NSLocale)locale;
- (NSString)identifier;
- (NSString)sanitizedSourceString;
- (NSString)sourceString;
- (_LTDisambiguableResult)disambiguableResult;
- (_LTTranslationResult)init;
- (_LTTranslationResult)initWithCoder:(id)a3;
- (int64_t)route;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignments:(id)a3;
- (void)setDisambiguableResult:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setRoute:(int64_t)a3;
- (void)setSanitizedSourceString:(id)a3;
- (void)setSourceString:(id)a3;
- (void)setTranslations:(id)a3;
@end

@implementation _LTTranslationResult

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_translations forKey:@"translations"];
  [v5 encodeObject:self->_sourceString forKey:@"sourceString"];
  [v5 encodeObject:self->_sanitizedSourceString forKey:@"sanitizedSourceString"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
  [v5 encodeObject:self->_alignments forKey:@"alignments"];
  [v5 encodeInteger:self->_route forKey:@"route"];
  [v5 encodeObject:self->_disambiguableResult forKey:@"disambiguableResult"];
}

- (_LTTranslationResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)_LTTranslationResult;
  v2 = [(_LTTranslationResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_isFinal = 1;
    v4 = v2;
  }

  return v3;
}

- (_LTTranslationResult)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_LTTranslationResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"translations"];
    translations = v5->_translations;
    v5->_translations = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceString"];
    sourceString = v5->_sourceString;
    v5->_sourceString = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedSourceString"];
    sanitizedSourceString = v5->_sanitizedSourceString;
    v5->_sanitizedSourceString = (NSString *)v17;

    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    v5->_route = [v4 decodeIntegerForKey:@"route"];
    v19 = (void *)MEMORY[0x263EFFA08];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v21 = [v19 setWithArray:v20];

    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"alignments"];
    alignments = v5->_alignments;
    v5->_alignments = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disambiguableResult"];
    disambiguableResult = v5->_disambiguableResult;
    v5->_disambiguableResult = (_LTDisambiguableResult *)v24;

    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)translations
{
  return self->_translations;
}

- (void)setTranslations:(id)a3
{
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
}

- (NSString)sanitizedSourceString
{
  return self->_sanitizedSourceString;
}

- (void)setSanitizedSourceString:(id)a3
{
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (int64_t)route
{
  return self->_route;
}

- (void)setRoute:(int64_t)a3
{
  self->_route = a3;
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
}

- (_LTDisambiguableResult)disambiguableResult
{
  return self->_disambiguableResult;
}

- (void)setDisambiguableResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguableResult, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_sanitizedSourceString, 0);
  objc_storeStrong((id *)&self->_sourceString, 0);
  objc_storeStrong((id *)&self->_translations, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end