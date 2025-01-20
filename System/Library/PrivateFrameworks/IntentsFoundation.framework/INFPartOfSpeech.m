@interface INFPartOfSpeech
+ (id)adjectiveWithIdentifier:(id)a3 language:(id)a4;
+ (id)nounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5;
+ (id)nounWithIdentifier:(id)a3 language:(id)a4;
- (INFPartOfSpeech)init;
- (INFPartOfSpeech)initWithDictionary:(id)a3 identifier:(id)a4;
- (INFPartOfSpeech)initWithPartOfSpeechType:(unint64_t)a3 identifier:(id)a4 language:(id)a5;
- (NSMutableDictionary)variants;
- (NSString)language;
- (id)contributingSentenceContext;
- (id)dictionaryRepresentation;
- (id)identifier;
- (id)stringForContext:(id)a3;
- (id)stringForVariants:(unint64_t)a3;
- (id)stringForVariantsDescriptor:(id)a3;
- (unint64_t)gender;
- (unint64_t)partOfSpeechType;
- (void)setGender:(unint64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setPartOfSpeechType:(unint64_t)a3;
- (void)setString:(id)a3 forVariants:(unint64_t)a4;
- (void)setString:(id)a3 forVariantsDescriptor:(id)a4;
- (void)setVariants:(id)a3;
- (void)validateSelf;
@end

@implementation INFPartOfSpeech

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variants, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setVariants:(id)a3
{
}

- (NSMutableDictionary)variants
{
  return self->_variants;
}

- (void)setPartOfSpeechType:(unint64_t)a3
{
  self->_partOfSpeechType = a3;
}

- (unint64_t)partOfSpeechType
{
  return self->_partOfSpeechType;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t partOfSpeechType = self->_partOfSpeechType;
  if (partOfSpeechType)
  {
    v5 = @"LOCPartOfSpeechTypeNone";
    if (partOfSpeechType == 1) {
      v5 = @"LOCPartOfSpeechTypeNoun";
    }
    if (partOfSpeechType == 2) {
      v6 = @"LOCPartOfSpeechTypeAdjective";
    }
    else {
      v6 = v5;
    }
    v7 = v6;
    [v3 setObject:v7 forKeyedSubscript:@"LOCPartOfSpeechType"];
  }
  unint64_t gender = self->_gender;
  if (gender)
  {
    v9 = @"LOCGenderNone";
    if (gender == 1) {
      v9 = @"LOCGenderFeminine";
    }
    if (gender == 2) {
      v10 = @"LOCGenderMasculine";
    }
    else {
      v10 = v9;
    }
    v11 = v10;
    [v3 setObject:v11 forKeyedSubscript:@"LOCGender"];
  }
  [v3 setObject:self->_variants forKeyedSubscript:@"LOCVariants"];
  [v3 setObject:self->_language forKeyedSubscript:@"LOCLanguageIdentifier"];
  return v3;
}

- (id)stringForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 number];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = +[INFVariantsDescriptor variant];
  [v8 setPlurality:v7];
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  uint64_t v9 = [(INFPartOfSpeech *)self stringForVariantsDescriptor:v8];
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    do
    {
      v13 = [v8 variantByRemovingOneAttribute];
      char v14 = [v8 isEqual:v13];

      if (v14)
      {
        v10 = 0;
        goto LABEL_10;
      }
      uint64_t v11 = [v8 variantByRemovingOneAttribute];

      uint64_t v12 = [(INFPartOfSpeech *)self stringForVariantsDescriptor:v11];
      v8 = (void *)v11;
    }
    while (!v12);
    v10 = (void *)v12;
    v8 = (void *)v11;
  }
LABEL_10:
  v15 = [(INFPartOfSpeech *)self stringForVariantsDescriptor:v8];

  return v15;
}

- (id)contributingSentenceContext
{
  v3 = +[INFSentenceContext sentenceContext];
  id v4 = v3;
  if (self->_gender) {
    objc_msgSend(v3, "setGender:");
  }
  return v4;
}

- (id)stringForVariantsDescriptor:(id)a3
{
  variants = self->_variants;
  id v4 = [a3 dictionaryKey];
  v5 = [(NSMutableDictionary *)variants objectForKeyedSubscript:v4];

  return v5;
}

- (void)setString:(id)a3 forVariantsDescriptor:(id)a4
{
  variants = self->_variants;
  id v6 = a3;
  id v7 = [a4 dictionaryKey];
  [(NSMutableDictionary *)variants setObject:v6 forKeyedSubscript:v7];
}

- (id)stringForVariants:(unint64_t)a3
{
  id v4 = +[INFVariantsDescriptor variantWithVariants:a3];
  v5 = [(INFPartOfSpeech *)self stringForVariantsDescriptor:v4];

  return v5;
}

- (void)setString:(id)a3 forVariants:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[INFVariantsDescriptor variantWithVariants:a4];
  [(INFPartOfSpeech *)self setString:v6 forVariantsDescriptor:v7];
}

- (void)validateSelf
{
  if (self->_partOfSpeechType == 2) {
    self->_unint64_t gender = 0;
  }
}

- (void)setGender:(unint64_t)a3
{
  self->_unint64_t gender = a3;
  [(INFPartOfSpeech *)self validateSelf];
}

- (unint64_t)gender
{
  return self->_gender;
}

- (INFPartOfSpeech)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(INFPartOfSpeech *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"LOCLanguageIdentifier"];
    uint64_t v10 = [v9 copy];
    language = v8->_language;
    v8->_language = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"LOCVariants"];
    variants = v8->_variants;
    v8->_variants = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v8->_identifier, a4);
    id v14 = [v6 objectForKeyedSubscript:@"LOCPartOfSpeechType"];
    if ([v14 isEqualToString:@"LOCPartOfSpeechTypeNoun"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqualToString:@"LOCPartOfSpeechTypeAdjective"])
    {
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 0;
    }

    v8->_unint64_t partOfSpeechType = v15;
    id v16 = [v6 objectForKeyedSubscript:@"LOCGender"];
    if ([v16 isEqualToString:@"LOCGenderFeminine"])
    {
      uint64_t v17 = 1;
    }
    else if ([v16 isEqualToString:@"LOCGenderMasculine"])
    {
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v17 = 0;
    }

    v8->_unint64_t gender = v17;
  }

  return v8;
}

- (INFPartOfSpeech)initWithPartOfSpeechType:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(INFPartOfSpeech *)self init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_unint64_t partOfSpeechType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    uint64_t v13 = [v10 copy];
    language = v12->_language;
    v12->_language = (NSString *)v13;
  }
  return v12;
}

- (INFPartOfSpeech)init
{
  v8.receiver = self;
  v8.super_class = (Class)INFPartOfSpeech;
  v2 = [(INFPartOfSpeech *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    variants = v2->_variants;
    v2->_variants = (NSMutableDictionary *)v3;

    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1F37C4EF0;

    v2->_unint64_t partOfSpeechType = 0;
    v2->_unint64_t gender = 0;
    language = v2->_language;
    v2->_language = (NSString *)&stru_1F37C4EF0;
  }
  return v2;
}

+ (id)adjectiveWithIdentifier:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[objc_alloc((Class)a1) initWithPartOfSpeechType:2 identifier:v7 language:v6];

  return v8;
}

+ (id)nounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  id v6 = [a1 nounWithIdentifier:a4 language:a5];
  [v6 setGender:a3];
  return v6;
}

+ (id)nounWithIdentifier:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[objc_alloc((Class)a1) initWithPartOfSpeechType:1 identifier:v7 language:v6];

  return v8;
}

@end