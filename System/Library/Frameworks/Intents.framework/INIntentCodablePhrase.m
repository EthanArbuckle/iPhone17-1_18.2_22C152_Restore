@interface INIntentCodablePhrase
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INIntentCodableDescription)_codableDescription;
- (INIntentCodablePhrase)initWithCoder:(id)a3;
- (NSString)localizedPhrase;
- (NSString)localizedPronunciationHint;
- (NSString)phrase;
- (NSString)phraseLocID;
- (NSString)pronunciationHint;
- (NSString)pronunciationHintLocID;
- (id)__INCodableDescriptionPhraseIDKey;
- (id)__INCodableDescriptionPhraseKey;
- (id)__INCodableDescriptionPronunciationHintIDKey;
- (id)__INCodableDescriptionPronunciationHintKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedPhraseForLanguage:(id)a3;
- (id)localizedPhraseWithLocalizer:(id)a3;
- (id)localizedPronunciationHintForLanguage:(id)a3;
- (id)localizedPronunciationHintWithLocalizer:(id)a3;
- (unint64_t)hash;
- (void)_setCodableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPhrase:(id)a3;
- (void)setPhraseLocID:(id)a3;
- (void)setPronunciationHint:(id)a3;
- (void)setPronunciationHintLocID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INIntentCodablePhrase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseLocID, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_pronunciationHintLocID, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);

  objc_destroyWeak((id *)&self->_codableDescription);
}

- (void)setPhraseLocID:(id)a3
{
}

- (NSString)phraseLocID
{
  return self->_phraseLocID;
}

- (void)setPhrase:(id)a3
{
}

- (NSString)phrase
{
  return self->_phrase;
}

- (void)setPronunciationHintLocID:(id)a3
{
}

- (NSString)pronunciationHintLocID
{
  return self->_pronunciationHintLocID;
}

- (void)setPronunciationHint:(id)a3
{
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (void)_setCodableDescription:(id)a3
{
}

- (INIntentCodableDescription)_codableDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableDescription);

  return (INIntentCodableDescription *)WeakRetained;
}

- (INIntentCodablePhrase)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INIntentCodablePhrase;
  v5 = [(INIntentCodablePhrase *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"phrase"];
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phraseLocID"];
    phraseLocID = v5->_phraseLocID;
    v5->_phraseLocID = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"pronunciationHint"];
    pronunciationHint = v5->_pronunciationHint;
    v5->_pronunciationHint = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pronunciationHintLocID"];
    pronunciationHintLocID = v5->_pronunciationHintLocID;
    v5->_pronunciationHintLocID = (NSString *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codableDescription"];
    objc_storeWeak((id *)&v5->_codableDescription, v20);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentCodablePhrase *)self phrase];
  [v4 encodeObject:v5 forKey:@"phrase"];

  v6 = [(INIntentCodablePhrase *)self phraseLocID];
  [v4 encodeObject:v6 forKey:@"phraseLocID"];

  uint64_t v7 = [(INIntentCodablePhrase *)self pronunciationHint];
  [v4 encodeObject:v7 forKey:@"pronunciationHint"];

  v8 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
  [v4 encodeObject:v8 forKey:@"pronunciationHintLocID"];

  id v9 = [(INIntentCodablePhrase *)self _codableDescription];
  [v4 encodeConditionalObject:v9 forKey:@"_codableDescription"];
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20 = [(INIntentCodablePhrase *)self __INCodableDescriptionPhraseKey];
  v22[0] = v20;
  uint64_t v5 = [(INIntentCodablePhrase *)self localizedPhraseWithLocalizer:v4];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = (void *)v5;
  v23[0] = v5;
  v19 = [(INIntentCodablePhrase *)self __INCodableDescriptionPhraseIDKey];
  v22[1] = v19;
  uint64_t v7 = [(INIntentCodablePhrase *)self phraseLocID];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[1] = v8;
  id v9 = [(INIntentCodablePhrase *)self __INCodableDescriptionPronunciationHintKey];
  v22[2] = v9;
  v21 = v4;
  v10 = [(INIntentCodablePhrase *)self localizedPronunciationHintWithLocalizer:v4];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[2] = v11;
  v12 = [(INIntentCodablePhrase *)self __INCodableDescriptionPronunciationHintIDKey];
  v22[3] = v12;
  v13 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  if (!v13) {

  }
  if (!v10) {
  if (!v7)
  }

  if (!v6) {
  uint64_t v16 = objc_msgSend(v15, "if_dictionaryWithNonEmptyValues");
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INIntentCodablePhrase *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentCodablePhrase *)self __INCodableDescriptionPhraseKey];
  v6 = [v4 objectForKey:v5];
  phrase = self->_phrase;
  self->_phrase = v6;

  v8 = [(INIntentCodablePhrase *)self __INCodableDescriptionPhraseIDKey];
  id v9 = [v4 objectForKey:v8];
  phraseLocID = self->_phraseLocID;
  self->_phraseLocID = v9;

  uint64_t v11 = [(INIntentCodablePhrase *)self __INCodableDescriptionPronunciationHintKey];
  v12 = [v4 objectForKey:v11];
  pronunciationHint = self->_pronunciationHint;
  self->_pronunciationHint = v12;

  id v16 = [(INIntentCodablePhrase *)self __INCodableDescriptionPronunciationHintIDKey];
  uint64_t v14 = [v4 objectForKey:v16];

  pronunciationHintLocID = self->_pronunciationHintLocID;
  self->_pronunciationHintLocID = v14;
}

- (id)localizedPronunciationHintWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
  v6 = [(INIntentCodablePhrase *)self pronunciationHint];
  uint64_t v7 = [(INIntentCodablePhrase *)self _codableDescription];
  v8 = [v7 _localizationTable];
  id v9 = INLocalizedStringFromCodable(v5, v6, v8, v4, 0);

  return v9;
}

- (id)localizedPronunciationHintForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INIntentCodablePhrase *)self localizedPronunciationHintWithLocalizer:v4];

  return v5;
}

- (NSString)localizedPronunciationHint
{
  return (NSString *)[(INIntentCodablePhrase *)self localizedPronunciationHintForLanguage:0];
}

- (id)localizedPhraseWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentCodablePhrase *)self phraseLocID];
  v6 = [(INIntentCodablePhrase *)self phrase];
  uint64_t v7 = [(INIntentCodablePhrase *)self _codableDescription];
  v8 = [v7 _localizationTable];
  id v9 = INLocalizedStringFromCodable(v5, v6, v8, v4, 0);

  return v9;
}

- (id)localizedPhraseForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INIntentCodablePhrase *)self localizedPhraseWithLocalizer:v4];

  return v5;
}

- (NSString)localizedPhrase
{
  return (NSString *)[(INIntentCodablePhrase *)self localizedPhraseForLanguage:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = [(INIntentCodablePhrase *)self phrase];
    v6 = [v4 phrase];
    id v7 = v5;
    id v8 = v6;
    id v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      char v10 = 0;
      uint64_t v11 = v8;
      id v12 = v7;
      if (!v7 || !v8) {
        goto LABEL_31;
      }
      int v13 = [v7 isEqualToString:v8];

      if (!v13)
      {
        char v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    uint64_t v14 = [(INIntentCodablePhrase *)self pronunciationHint];
    v15 = [v4 pronunciationHint];
    id v12 = v14;
    id v16 = v15;
    uint64_t v11 = v16;
    if (v12 == v16)
    {
    }
    else
    {
      char v10 = 0;
      v17 = v16;
      id v18 = v12;
      if (!v12 || !v16) {
        goto LABEL_30;
      }
      int v19 = [v12 isEqualToString:v16];

      if (!v19)
      {
        char v10 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v20 = [(INIntentCodablePhrase *)self phraseLocID];
    v21 = [v4 phraseLocID];
    id v18 = v20;
    id v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      char v10 = 0;
      if (v18)
      {
        v23 = v22;
        id v24 = v18;
        if (v22)
        {
          int v25 = [v18 isEqualToString:v22];

          if (!v25)
          {
            char v10 = 0;
LABEL_29:
            v17 = v30;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_21;
        }
      }
      else
      {
        v23 = v22;
        id v24 = 0;
      }
LABEL_28:

      goto LABEL_29;
    }

LABEL_21:
    v26 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
    v27 = [v4 pronunciationHintLocID];
    id v24 = v26;
    id v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v24 && v28) {
        char v10 = [v24 isEqualToString:v28];
      }
    }

    goto LABEL_28;
  }
  char v10 = 0;
LABEL_33:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(INIntentCodablePhrase *)self phrase];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(INIntentCodablePhrase *)self phraseLocID];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(INIntentCodablePhrase *)self pronunciationHint];
  uint64_t v8 = [v7 hash];
  id v9 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[INIntentCodablePhrase allocWithZone:a3] init];
  uint64_t v5 = [(INIntentCodablePhrase *)self pronunciationHint];
  [(INIntentCodablePhrase *)v4 setPronunciationHint:v5];

  uint64_t v6 = [(INIntentCodablePhrase *)self pronunciationHintLocID];
  [(INIntentCodablePhrase *)v4 setPronunciationHintLocID:v6];

  id v7 = [(INIntentCodablePhrase *)self phrase];
  [(INIntentCodablePhrase *)v4 setPhrase:v7];

  uint64_t v8 = [(INIntentCodablePhrase *)self phraseLocID];
  [(INIntentCodablePhrase *)v4 setPhraseLocID:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INCodableDescriptionPronunciationHintIDKey
{
  v2 = [(INIntentCodablePhrase *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePronunciationHintIDKey");

  return v3;
}

- (id)__INCodableDescriptionPronunciationHintKey
{
  v2 = [(INIntentCodablePhrase *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePronunciationHintKey");

  return v3;
}

- (id)__INCodableDescriptionPhraseIDKey
{
  v2 = [(INIntentCodablePhrase *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePhraseIDKey");

  return v3;
}

- (id)__INCodableDescriptionPhraseKey
{
  v2 = [(INIntentCodablePhrase *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePhraseKey");

  return v3;
}

@end