@interface INCodableEnumValueSynonym
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableEnum)_codableEnum;
- (INCodableEnumValue)_codableEnumValue;
- (INCodableEnumValueSynonym)initWithCoder:(id)a3;
- (NSString)localizedPronunciationHint;
- (NSString)localizedSynonym;
- (NSString)pronunciationHint;
- (NSString)pronunciationHintLocID;
- (NSString)synonym;
- (NSString)synonymLocID;
- (id)__INCodableEnumPronunciationHintIDKey;
- (id)__INCodableEnumPronunciationHintKey;
- (id)__INCodableEnumSynonymIDKey;
- (id)__INCodableEnumSynonymKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedPronunciationHintForLanguage:(id)a3;
- (id)localizedPronunciationHintWithLocalizer:(id)a3;
- (id)localizedSynonymForLanguage:(id)a3;
- (id)localizedSynonymWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setCodableEnumValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPronunciationHint:(id)a3;
- (void)setPronunciationHintLocID:(id)a3;
- (void)setSynonym:(id)a3;
- (void)setSynonymLocID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableEnumValueSynonym

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymLocID, 0);
  objc_storeStrong((id *)&self->_synonym, 0);
  objc_storeStrong((id *)&self->_pronunciationHintLocID, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);

  objc_destroyWeak((id *)&self->_codableEnumValue);
}

- (void)setSynonymLocID:(id)a3
{
}

- (NSString)synonymLocID
{
  return self->_synonymLocID;
}

- (void)setSynonym:(id)a3
{
}

- (NSString)synonym
{
  return self->_synonym;
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

- (void)_setCodableEnumValue:(id)a3
{
}

- (INCodableEnumValue)_codableEnumValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableEnumValue);

  return (INCodableEnumValue *)WeakRetained;
}

- (INCodableEnumValueSynonym)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableEnumValueSynonym;
  v5 = [(INCodableEnumValueSynonym *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"synonym"];
    [(INCodableEnumValueSynonym *)v5 setSynonym:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"synonymLocID"];
    [(INCodableEnumValueSynonym *)v5 setSynonymLocID:v10];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pronunciationHint"];
    [(INCodableEnumValueSynonym *)v5 setPronunciationHint:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pronunciationHintLocID"];
    [(INCodableEnumValueSynonym *)v5 setPronunciationHintLocID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codableEnumValue"];
    [(INCodableEnumValueSynonym *)v5 _setCodableEnumValue:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableEnumValueSynonym *)self synonym];
  [v4 encodeObject:v5 forKey:@"synonym"];

  v6 = [(INCodableEnumValueSynonym *)self synonymLocID];
  [v4 encodeObject:v6 forKey:@"synonymLocID"];

  uint64_t v7 = [(INCodableEnumValueSynonym *)self pronunciationHint];
  [v4 encodeObject:v7 forKey:@"pronunciationHint"];

  v8 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  [v4 encodeObject:v8 forKey:@"pronunciationHintLocID"];

  id v9 = [(INCodableEnumValueSynonym *)self _codableEnumValue];
  [v4 encodeConditionalObject:v9 forKey:@"_codableEnumValue"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [(INCodableEnumValueSynonym *)self synonym];
  id v9 = objc_msgSend(v8, "intents_encodeForPlistRepresentationWithParameters:", v6);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, @"synonym");

  v10 = [(INCodableEnumValueSynonym *)self synonymLocID];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, @"synonymLocID");

  v11 = [(INCodableEnumValueSynonym *)self pronunciationHint];
  uint64_t v12 = objc_msgSend(v11, "intents_encodeForPlistRepresentationWithParameters:", v6);

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, @"pronunciationHint");
  v13 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, @"pronunciationHintLocID");

  v14 = (void *)[v7 copy];

  return v14;
}

- (INCodableEnum)_codableEnum
{
  v2 = [(INCodableEnumValueSynonym *)self _codableEnumValue];
  v3 = [v2 _codableEnum];

  return (INCodableEnum *)v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20 = [(INCodableEnumValueSynonym *)self __INCodableEnumSynonymKey];
  v22[0] = v20;
  uint64_t v5 = [(INCodableEnumValueSynonym *)self localizedSynonymWithLocalizer:v4];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  objc_super v18 = (void *)v5;
  v23[0] = v5;
  v19 = [(INCodableEnumValueSynonym *)self __INCodableEnumSynonymIDKey];
  v22[1] = v19;
  uint64_t v7 = [(INCodableEnumValueSynonym *)self synonymLocID];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[1] = v8;
  id v9 = [(INCodableEnumValueSynonym *)self __INCodableEnumPronunciationHintKey];
  v22[2] = v9;
  v21 = v4;
  v10 = [(INCodableEnumValueSynonym *)self localizedPronunciationHintWithLocalizer:v4];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[2] = v11;
  uint64_t v12 = [(INCodableEnumValueSynonym *)self __INCodableEnumPronunciationHintIDKey];
  v22[3] = v12;
  v13 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  if (!v13) {

  }
  if (!v10) {
  if (!v7)
  }

  if (!v6) {
  v16 = objc_msgSend(v15, "if_dictionaryWithNonEmptyValues");
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INCodableEnumValueSynonym *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INCodableEnumValueSynonym *)self __INCodableEnumSynonymKey];
  id v6 = [v4 objectForKey:v5];
  [(INCodableEnumValueSynonym *)self setSynonym:v6];

  uint64_t v7 = [(INCodableEnumValueSynonym *)self __INCodableEnumSynonymIDKey];
  v8 = [v4 objectForKey:v7];
  [(INCodableEnumValueSynonym *)self setSynonymLocID:v8];

  id v9 = [(INCodableEnumValueSynonym *)self __INCodableEnumPronunciationHintKey];
  v10 = [v4 objectForKey:v9];
  [(INCodableEnumValueSynonym *)self setPronunciationHint:v10];

  id v12 = [(INCodableEnumValueSynonym *)self __INCodableEnumPronunciationHintIDKey];
  v11 = [v4 objectForKey:v12];

  [(INCodableEnumValueSynonym *)self setPronunciationHintLocID:v11];
}

- (id)localizedPronunciationHintWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INCodableEnumValueSynonym *)self _codableEnumValue];
  id v6 = [v5 _codableEnum];
  uint64_t v7 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  v8 = [(INCodableEnumValueSynonym *)self pronunciationHint];
  id v9 = [v6 _localizationTable];
  v10 = INLocalizedStringFromCodable(v7, v8, v9, v4, 0);

  return v10;
}

- (id)localizedPronunciationHintForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INCodableEnumValueSynonym *)self localizedPronunciationHintWithLocalizer:v4];

  return v5;
}

- (NSString)localizedPronunciationHint
{
  v3 = objc_opt_new();
  id v4 = [(INCodableEnumValueSynonym *)self localizedPronunciationHintWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)localizedSynonymWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INCodableEnumValueSynonym *)self _codableEnumValue];
  id v6 = [v5 _codableEnum];
  uint64_t v7 = [(INCodableEnumValueSynonym *)self synonymLocID];
  v8 = [(INCodableEnumValueSynonym *)self synonym];
  id v9 = [v6 _localizationTable];
  v10 = INLocalizedStringFromCodable(v7, v8, v9, v4, 0);

  return v10;
}

- (id)localizedSynonymForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INCodableEnumValueSynonym *)self localizedSynonymWithLocalizer:v4];

  return v5;
}

- (NSString)localizedSynonym
{
  v3 = objc_opt_new();
  id v4 = [(INCodableEnumValueSynonym *)self localizedSynonymWithLocalizer:v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = [(INCodableEnumValueSynonym *)self synonym];
    id v6 = [v4 synonym];
    id v7 = v5;
    id v8 = v6;
    id v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      char v10 = 0;
      v11 = v8;
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
    v14 = [(INCodableEnumValueSynonym *)self pronunciationHint];
    v15 = [v4 pronunciationHint];
    id v12 = v14;
    id v16 = v15;
    v11 = v16;
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
    v20 = [(INCodableEnumValueSynonym *)self synonymLocID];
    v21 = [v4 synonymLocID];
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
    v26 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
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
  v3 = [(INCodableEnumValueSynonym *)self synonym];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(INCodableEnumValueSynonym *)self synonymLocID];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(INCodableEnumValueSynonym *)self pronunciationHint];
  uint64_t v8 = [v7 hash];
  id v9 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[INCodableEnumValueSynonym allocWithZone:a3] init];
  uint64_t v5 = [(INCodableEnumValueSynonym *)self pronunciationHint];
  [(INCodableEnumValueSynonym *)v4 setPronunciationHint:v5];

  uint64_t v6 = [(INCodableEnumValueSynonym *)self pronunciationHintLocID];
  [(INCodableEnumValueSynonym *)v4 setPronunciationHintLocID:v6];

  id v7 = [(INCodableEnumValueSynonym *)self synonym];
  [(INCodableEnumValueSynonym *)v4 setSynonym:v7];

  uint64_t v8 = [(INCodableEnumValueSynonym *)self synonymLocID];
  [(INCodableEnumValueSynonym *)v4 setSynonymLocID:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(INCodableEnumValueSynonym);
  uint64_t v6 = objc_msgSend(v4, "intents_stringForKey:", @"synonymLocID");
  [(INCodableEnumValueSynonym *)v5 setSynonymLocID:v6];

  id v7 = objc_msgSend(v4, "intents_stringForKey:", @"pronunciationHintLocID");
  [(INCodableEnumValueSynonym *)v5 setPronunciationHintLocID:v7];

  uint64_t v8 = objc_msgSend(v4, "intents_stringForKey:", @"synonym");
  [(INCodableEnumValueSynonym *)v5 setSynonym:v8];

  id v9 = objc_msgSend(v4, "intents_stringForKey:", @"pronunciationHint");

  [(INCodableEnumValueSynonym *)v5 setPronunciationHint:v9];

  return v5;
}

- (id)__INCodableEnumSynonymIDKey
{
  v2 = [(INCodableEnumValueSynonym *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymSynonymIDKey");

  return v3;
}

- (id)__INCodableEnumSynonymKey
{
  v2 = [(INCodableEnumValueSynonym *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymSynonymKey");

  return v3;
}

- (id)__INCodableEnumPronunciationHintIDKey
{
  v2 = [(INCodableEnumValueSynonym *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymPronunciationHintIDKey");

  return v3;
}

- (id)__INCodableEnumPronunciationHintKey
{
  v2 = [(INCodableEnumValueSynonym *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymPronunciationHintKey");

  return v3;
}

@end