@interface INSpeakableString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INSpeakableString)initWithCoder:(id)a3;
- (INSpeakableString)initWithIdentifier:(id)a3 string:(id)a4;
- (INSpeakableString)initWithSpokenPhrase:(NSString *)spokenPhrase;
- (INSpeakableString)initWithVocabularyIdentifier:(NSString *)vocabularyIdentifier spokenPhrase:(NSString *)spokenPhrase pronunciationHint:(NSString *)pronunciationHint;
- (NSArray)alternativeSpeakableMatches;
- (NSString)description;
- (NSString)pronunciationHint;
- (NSString)spokenPhrase;
- (NSString)vocabularyIdentifier;
- (id)_effectiveNSStringValue;
- (id)_initWithVocabularyIdentifier:(id)a3 spokenPhrase:(id)a4 pronunciationHint:(id)a5 alternativeMatches:(id)a6;
- (id)_intents_localizedCopyWithLocalizer:(id)a3;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)spokenPhrases;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPronunciationHint:(id)a3;
- (void)setSpokenPhrase:(id)a3;
- (void)setVocabularyIdentifier:(id)a3;
@end

@implementation INSpeakableString

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(INSpeakableString *)self vocabularyIdentifier];
  v7 = [(INSpeakableString *)self spokenPhrase];
  v8 = [v4 languageCode];

  v9 = [v7 localizeForLanguage:v8];
  v10 = [(INSpeakableString *)self pronunciationHint];
  v11 = (void *)[v5 initWithVocabularyIdentifier:v6 spokenPhrase:v9 pronunciationHint:v10];

  return v11;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INSpeakableString *)self spokenPhrase];
  v7 = [v5 languageCode];

  v8 = [v6 localizeForLanguage:v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);

  objc_storeStrong((id *)&self->_spokenPhrase, 0);
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (void)setVocabularyIdentifier:(id)a3
{
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (void)setPronunciationHint:(id)a3
{
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (void)setSpokenPhrase:(id)a3
{
}

- (NSString)spokenPhrase
{
  return self->_spokenPhrase;
}

- (INSpeakableString)initWithIdentifier:(id)a3 string:(id)a4
{
  return [(INSpeakableString *)self initWithVocabularyIdentifier:a3 spokenPhrase:a4 pronunciationHint:0];
}

- (id)spokenPhrases
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(INSpeakableString *)self spokenPhrase];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSString)description
{
  spokenPhrase = self->_spokenPhrase;
  if (!spokenPhrase) {
    spokenPhrase = self->_vocabularyIdentifier;
  }
  return spokenPhrase;
}

- (void)encodeWithCoder:(id)a3
{
  vocabularyIdentifier = self->_vocabularyIdentifier;
  id v5 = a3;
  [v5 encodeObject:vocabularyIdentifier forKey:@"vocabularyIdentifier"];
  [v5 encodeObject:self->_spokenPhrase forKey:@"spokenPhrase"];
  [v5 encodeObject:self->_pronunciationHint forKey:@"pronunciationHint"];
}

- (INSpeakableString)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vocabularyIdentifier"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"spokenPhrase"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pronunciationHint"];

  v14 = [(INSpeakableString *)self initWithVocabularyIdentifier:v5 spokenPhrase:v9 pronunciationHint:v13];
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  vocabularyIdentifier = self->_vocabularyIdentifier;
  v6 = self->_spokenPhrase;
  uint64_t v7 = vocabularyIdentifier;
  v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v7, v6, self->_pronunciationHint);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = v5;
    vocabularyIdentifier = self->_vocabularyIdentifier;
    BOOL v12 = 0;
    if (vocabularyIdentifier == (NSString *)v5[3]
      || ([v5 vocabularyIdentifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [(NSString *)vocabularyIdentifier isEqual:v8],
          v8,
          v9))
    {
      spokenPhrase = self->_spokenPhrase;
      if (spokenPhrase == (NSString *)v6[1] || -[NSString isEqual:](spokenPhrase, "isEqual:"))
      {
        pronunciationHint = self->_pronunciationHint;
        if (pronunciationHint == (NSString *)v6[2] || -[NSString isEqual:](pronunciationHint, "isEqual:")) {
          BOOL v12 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  *((void *)&v3 + 1) = [(NSString *)self->_vocabularyIdentifier hash];
  *(void *)&long long v3 = [(NSString *)self->_vocabularyIdentifier hash];
  return [(NSString *)self->_spokenPhrase hash] ^ (v3 >> 32);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4 = [(INSpeakableString *)self _effectiveNSStringValue];
  LOWORD(a3) = [v4 characterAtIndex:a3];

  return a3;
}

- (unint64_t)length
{
  v2 = [(INSpeakableString *)self _effectiveNSStringValue];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)_effectiveNSStringValue
{
  vocabularyIdentifier = self->_vocabularyIdentifier;
  if (!vocabularyIdentifier) {
    vocabularyIdentifier = self->_spokenPhrase;
  }
  return vocabularyIdentifier;
}

- (id)_initWithVocabularyIdentifier:(id)a3 spokenPhrase:(id)a4 pronunciationHint:(id)a5 alternativeMatches:(id)a6
{
  id v11 = a6;
  BOOL v12 = [(INSpeakableString *)self initWithVocabularyIdentifier:a3 spokenPhrase:a4 pronunciationHint:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_alternativeSpeakableMatches, a6);
  }

  return v13;
}

- (INSpeakableString)initWithSpokenPhrase:(NSString *)spokenPhrase
{
  return [(INSpeakableString *)self initWithVocabularyIdentifier:spokenPhrase spokenPhrase:spokenPhrase pronunciationHint:0];
}

- (INSpeakableString)initWithVocabularyIdentifier:(NSString *)vocabularyIdentifier spokenPhrase:(NSString *)spokenPhrase pronunciationHint:(NSString *)pronunciationHint
{
  v8 = vocabularyIdentifier;
  int v9 = spokenPhrase;
  v10 = pronunciationHint;
  v19.receiver = self;
  v19.super_class = (Class)INSpeakableString;
  id v11 = [(INSpeakableString *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_vocabularyIdentifier;
    v11->_vocabularyIdentifier = (NSString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v11->_spokenPhrase;
    v11->_spokenPhrase = (NSString *)v14;

    uint64_t v16 = [(NSString *)v10 copy];
    v17 = v11->_pronunciationHint;
    v11->_pronunciationHint = (NSString *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end