@interface INCodableEnumValue
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableEnum)_codableEnum;
- (INCodableEnumValue)initWithCoder:(id)a3;
- (NSArray)synonyms;
- (NSString)displayName;
- (NSString)displayNameLocID;
- (NSString)localizedDisplayName;
- (NSString)localizedName;
- (NSString)name;
- (id)__INCodableEnumDisplayNameIDKey;
- (id)__INCodableEnumDisplayNameKey;
- (id)__INCodableEnumIndexKey;
- (id)__INCodableEnumNameKey;
- (id)__INCodableEnumSynonymsKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDisplayNameForLanguage:(id)a3;
- (id)localizedDisplayNameWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)index;
- (unint64_t)hash;
- (void)_setCodableEnum:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameLocID:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setLocalizedName:(id)a3;
- (void)setName:(id)a3;
- (void)setSynonyms:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableEnumValue

- (int64_t)index
{
  return self->_index;
}

- (void)_setCodableEnum:(id)a3
{
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCodableEnumValue *)self __INCodableEnumIndexKey];
  v6 = [v4 objectForKey:v5];
  -[INCodableEnumValue setIndex:](self, "setIndex:", [v6 integerValue]);

  v7 = [(INCodableEnumValue *)self __INCodableEnumNameKey];
  v8 = [v4 objectForKey:v7];
  [(INCodableEnumValue *)self setName:v8];

  v9 = [(INCodableEnumValue *)self __INCodableEnumDisplayNameKey];
  v10 = [v4 objectForKey:v9];
  [(INCodableEnumValue *)self setDisplayName:v10];

  v11 = [(INCodableEnumValue *)self __INCodableEnumDisplayNameIDKey];
  v12 = [v4 objectForKey:v11];
  [(INCodableEnumValue *)self setDisplayNameLocID:v12];

  v13 = [(INCodableEnumValue *)self __INCodableEnumSynonymsKey];
  v14 = [v4 objectForKey:v13];

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  if ([v16 count])
  {
    id v25 = v4;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = objc_alloc_init(INCodableEnumValueSynonym);
            [(INCodableEnumValueSynonym *)v24 _setCodableEnumValue:self];
            [(INCodableEnumValueSynonym *)v24 updateWithDictionary:v23];
            objc_msgSend(v17, "if_addObjectIfNonNil:", v24);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [(INCodableEnumValue *)self setSynonyms:v17];
    id v4 = v25;
  }
}

- (id)__INCodableEnumSynonymsKey
{
  v2 = [(INCodableEnumValue *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymsKey");

  return v3;
}

- (id)__INCodableEnumNameKey
{
  v2 = [(INCodableEnumValue *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueNameKey");

  return v3;
}

- (id)__INCodableEnumIndexKey
{
  v2 = [(INCodableEnumValue *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueIndexKey");

  return v3;
}

- (id)__INCodableEnumDisplayNameIDKey
{
  v2 = [(INCodableEnumValue *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueDisplayNameIDKey");

  return v3;
}

- (INCodableEnum)_codableEnum
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableEnum);

  return (INCodableEnum *)WeakRetained;
}

- (id)__INCodableEnumDisplayNameKey
{
  v2 = [(INCodableEnumValue *)self _codableEnum];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueDisplayNameKey");

  return v3;
}

- (void)setName:(id)a3
{
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void)setDisplayNameLocID:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  v11 = objc_msgSend(v10, "if_flatMap:", &__block_literal_global_71161);
  if (v11)
  {
    char v12 = objc_msgSend(v7, "_intents_compareValue:relation:", v11, a4);
  }
  else
  {
    v13 = NSNumber;
    id v14 = v8;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v16 index];
    id v18 = [v13 numberWithInteger:v17];
    char v12 = objc_msgSend(v7, "_intents_compareValue:relation:", v18, a4);
  }
  return v12;
}

id __90__INCodableEnumValue_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "index"));
  id v4 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_displayNameLocID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_codableEnum);
}

- (void)setSynonyms:(id)a3
{
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)displayNameLocID
{
  return self->_displayNameLocID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)name
{
  return self->_name;
}

- (INCodableEnumValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableEnumValue;
  v5 = [(INCodableEnumValue *)&v18 init];
  if (v5)
  {
    -[INCodableEnumValue setIndex:](v5, "setIndex:", [v4 decodeIntegerForKey:@"index"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(INCodableEnumValue *)v5 setName:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"displayName"];
    [(INCodableEnumValue *)v5 setDisplayName:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocID"];
    [(INCodableEnumValue *)v5 setDisplayNameLocID:v11];

    char v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codableEnum"];
    [(INCodableEnumValue *)v5 _setCodableEnum:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"synonyms"];
    [(INCodableEnumValue *)v5 setSynonyms:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableEnumValue index](self, "index"), @"index");
  v5 = [(INCodableEnumValue *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(INCodableEnumValue *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(INCodableEnumValue *)self displayNameLocID];
  [v4 encodeObject:v7 forKey:@"displayNameLocID"];

  uint64_t v8 = [(INCodableEnumValue *)self synonyms];
  [v4 encodeObject:v8 forKey:@"synonyms"];

  id v9 = [(INCodableEnumValue *)self _codableEnum];
  [v4 encodeConditionalObject:v9 forKey:@"_codableEnum"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", -[INCodableEnumValue index](self, "index"), @"index");
  uint64_t v8 = [(INCodableEnumValue *)self name];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, @"name");

  id v9 = [v6 languageCode];
  if (v9)
  {
    id v10 = +[INStringLocalizer localizerForLanguage:v9];
    v11 = [(INCodableEnumValue *)self localizedDisplayNameWithLocalizer:v10];

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, @"localizedName");
  }
  char v12 = [(INCodableEnumValue *)self displayName];
  v13 = objc_msgSend(v12, "intents_encodeForPlistRepresentationWithParameters:", v6);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, @"displayName");

  uint64_t v14 = [(INCodableEnumValue *)self displayNameLocID];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, @"displayNameLocID");

  v15 = [(INCodableEnumValue *)self synonyms];
  id v19 = 0;
  objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", v15, @"synonyms", &v19);
  id v16 = v19;

  if (v16)
  {
    uint64_t v17 = 0;
    if (a4) {
      *a4 = v16;
    }
  }
  else
  {
    uint64_t v17 = (void *)[v7 copy];
  }

  return v17;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v44[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCodableEnumValue *)self __INCodableEnumIndexKey];
  v43[0] = v5;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v6;
  v44[0] = v6;
  v37 = [(INCodableEnumValue *)self __INCodableEnumNameKey];
  v43[1] = v37;
  uint64_t v8 = [(INCodableEnumValue *)self name];
  id v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v8;
  v44[1] = v8;
  v36 = [(INCodableEnumValue *)self __INCodableEnumDisplayNameKey];
  v43[2] = v36;
  uint64_t v10 = [(INCodableEnumValue *)self localizedDisplayNameWithLocalizer:v4];
  v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v31 = (void *)v10;
  v44[2] = v10;
  v35 = [(INCodableEnumValue *)self __INCodableEnumDisplayNameIDKey];
  v43[3] = v35;
  uint64_t v12 = [(INCodableEnumValue *)self displayNameLocID];
  v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v12;
  v44[3] = v12;
  v34 = [(INCodableEnumValue *)self __INCodableEnumSynonymsKey];
  v43[4] = v34;
  uint64_t v14 = [(INCodableEnumValue *)self synonyms];
  uint64_t v15 = [v14 count];

  if (!v15) {
    goto LABEL_19;
  }
  long long v28 = v7;
  long long v29 = v5;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v17 = [(INCodableEnumValue *)self synonyms];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4, v28, v29);
        objc_msgSend(v16, "if_addObjectIfNonNil:", v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v19);
  }

  v7 = v28;
  v5 = v29;
  if (v16)
  {
    int v23 = 0;
    v24 = v16;
  }
  else
  {
LABEL_19:
    v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v28, v29);
    id v16 = 0;
    int v23 = 1;
  }
  v44[4] = v24;
  id v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v44, v43, 5, v28, v29);
  if (v23) {

  }
  if (!v13) {
  if (!v11)
  }

  if (!v9) {
  if (!v7)
  }

  long long v26 = objc_msgSend(v25, "if_dictionaryWithNonEmptyValues");

  return v26;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INCodableEnumValue *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableEnumValue *)self _codableEnum];
  uint64_t v6 = [(INCodableEnumValue *)self displayNameLocID];
  v7 = [(INCodableEnumValue *)self displayName];
  uint64_t v8 = [v5 _localizationTable];
  id v9 = INLocalizedStringFromCodable(v6, v7, v8, v4, 0);

  return v9;
}

- (id)localizedDisplayNameForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  v5 = [(INCodableEnumValue *)self localizedDisplayNameWithLocalizer:v4];

  return v5;
}

- (NSString)localizedDisplayName
{
  v3 = objc_opt_new();
  id v4 = [(INCodableEnumValue *)self localizedDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int64_t v5 = [(INCodableEnumValue *)self index];
    if (v5 == [v4 index])
    {
      uint64_t v6 = [(INCodableEnumValue *)self name];
      v7 = [v4 name];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        uint64_t v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_23;
        }
        int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      uint64_t v15 = [(INCodableEnumValue *)self displayName];
      id v16 = [v4 displayName];
      id v13 = v15;
      id v17 = v16;
      uint64_t v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        uint64_t v18 = v17;
        id v19 = v13;
        if (!v13 || !v17)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        int v11 = [v13 isEqualToString:v17];

        if (!v11) {
          goto LABEL_23;
        }
      }
      uint64_t v20 = [(INCodableEnumValue *)self displayNameLocID];
      uint64_t v21 = [v4 displayNameLocID];
      id v19 = v20;
      id v22 = v21;
      uint64_t v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22) {
          LOBYTE(v11) = [v19 isEqualToString:v22];
        }
      }

      goto LABEL_22;
    }
  }
  LOBYTE(v11) = 0;
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(INCodableEnumValue *)self name];
  uint64_t v6 = [v5 hash];
  v7 = [(INCodableEnumValue *)self displayName];
  uint64_t v8 = v6 ^ [v7 hash];
  id v9 = [(INCodableEnumValue *)self displayNameLocID];
  unint64_t v10 = v8 ^ [v9 hash] ^ v4;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[INCodableEnumValue allocWithZone:a3] init];
  [(INCodableEnumValue *)v4 setIndex:[(INCodableEnumValue *)self index]];
  int64_t v5 = [(INCodableEnumValue *)self name];
  [(INCodableEnumValue *)v4 setName:v5];

  uint64_t v6 = [(INCodableEnumValue *)self displayName];
  [(INCodableEnumValue *)v4 setDisplayName:v6];

  v7 = [(INCodableEnumValue *)self displayNameLocID];
  [(INCodableEnumValue *)v4 setDisplayNameLocID:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(INCodableEnumValue);
  -[INCodableEnumValue setIndex:](v6, "setIndex:", objc_msgSend(v5, "intents_intForKey:", @"index"));
  v7 = objc_msgSend(v5, "intents_stringForKey:", @"name");
  [(INCodableEnumValue *)v6 setName:v7];

  uint64_t v8 = objc_msgSend(v5, "intents_stringForKey:", @"localizedName");
  [(INCodableEnumValue *)v6 setLocalizedName:v8];

  id v9 = objc_msgSend(v5, "intents_stringForKey:", @"displayName");
  [(INCodableEnumValue *)v6 setDisplayName:v9];

  unint64_t v10 = objc_msgSend(v5, "intents_stringForKey:", @"displayNameLocID");
  [(INCodableEnumValue *)v6 setDisplayNameLocID:v10];

  id v22 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __66__INCodableEnumValue_makeFromWidgetPlistableRepresentation_error___block_invoke;
  uint64_t v20 = &unk_1E551E178;
  int v11 = v6;
  uint64_t v21 = v11;
  uint64_t v12 = +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:v5 key:@"synonyms" error:&v22 resultTransformer:&v17];

  id v13 = v22;
  int v14 = v13;
  if (v13)
  {
    uint64_t v15 = 0;
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    -[INCodableEnumValue setSynonyms:](v11, "setSynonyms:", v12, v17, v18, v19, v20);
    uint64_t v15 = v11;
  }

  return v15;
}

uint64_t __66__INCodableEnumValue_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCodableEnumValue:*(void *)(a1 + 32)];
}

@end