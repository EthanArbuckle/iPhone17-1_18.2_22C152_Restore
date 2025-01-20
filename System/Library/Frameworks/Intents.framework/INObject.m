@interface INObject
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (INImage)displayImage;
- (INObject)initWithCoder:(id)a3;
- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString;
- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint;
- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage;
- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage;
- (NSArray)alternativeSpeakableMatches;
- (NSMutableDictionary)_valueForKeyDictionary;
- (NSString)description;
- (NSString)displayString;
- (NSString)identifier;
- (NSString)pronunciationHint;
- (NSString)subtitleString;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_localizedCopyWithLocalizer:(id)a3;
- (id)_intents_readableSubtitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)valueForProperty:(id)a3;
- (unint64_t)hash;
- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeSpeakableMatches:(NSArray *)alternativeSpeakableMatches;
- (void)setDisplayImage:(INImage *)displayImage;
- (void)setSubtitleString:(NSString *)subtitleString;
@end

@implementation INObject

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint
{
  v8 = identifier;
  v9 = displayString;
  v10 = pronunciationHint;
  v19.receiver = self;
  v19.super_class = (Class)INObject;
  v11 = [(INObject *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v11->_displayString;
    v11->_displayString = (NSString *)v14;

    uint64_t v16 = [(NSString *)v10 copy];
    v17 = v11->_pronunciationHint;
    v11->_pronunciationHint = (NSString *)v16;
  }
  return v11;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString
{
  return [(INObject *)self initWithIdentifier:identifier displayString:displayString pronunciationHint:0];
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(INObject *)self _valueForKeyDictionary];
  if (v4)
  {
    v6 = objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");
    v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)_valueForKeyDictionary
{
  valueForKeyDictionary = self->_valueForKeyDictionary;
  if (!valueForKeyDictionary)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = self->_valueForKeyDictionary;
    self->_valueForKeyDictionary = v4;

    valueForKeyDictionary = self->_valueForKeyDictionary;
  }

  return valueForKeyDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_valueForKeyDictionary, 0);
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (INImage)displayImage
{
  return self->_displayImage;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSubtitleString:(NSString *)subtitleString
{
}

- (void)setDisplayImage:(INImage *)displayImage
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setAlternativeSpeakableMatches:(NSArray *)alternativeSpeakableMatches
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = alternativeSpeakableMatches;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v21 = v4;
    v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = [v11 spokenPhrase];

          if (v12)
          {
            v13 = [INSpeakableString alloc];
            uint64_t v14 = [(INObject *)self identifier];
            v15 = [v11 spokenPhrase];
            uint64_t v16 = [v11 pronunciationHint];
            v17 = [(INSpeakableString *)v13 initWithVocabularyIdentifier:v14 spokenPhrase:v15 pronunciationHint:v16];

            [v5 addObject:v17];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    v18 = (NSArray *)[v5 copy];
    objc_super v19 = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = v18;

    id v4 = v21;
  }
  else
  {
    v20 = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = 0;
  }
}

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(INObject *)self identifier];
  uint64_t v7 = [(INObject *)self displayString];
  uint64_t v8 = [v4 languageCode];
  uint64_t v9 = [v7 localizeForLanguage:v8];
  v10 = [(INObject *)self pronunciationHint];
  v11 = [v4 languageCode];

  uint64_t v12 = [v10 localizeForLanguage:v11];
  v13 = (void *)[v5 initWithIdentifier:v6 displayString:v9 pronunciationHint:v12];

  return v13;
}

- (id)_intents_readableSubtitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INObject *)self subtitleString];
  uint64_t v7 = [v5 languageCode];

  uint64_t v8 = [v6 localizeForLanguage:v7];

  return v8;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INObject *)self displayString];
  uint64_t v7 = [v5 languageCode];

  uint64_t v8 = [v6 localizeForLanguage:v7];

  return v8;
}

- (id)_dictionaryRepresentation
{
  v31[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    unsigned int outCount = 0;
    id v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        Name = property_getName(v6[i]);
        if (Name)
        {
          uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", Name, objc_msgSend(NSString, "defaultCStringEncoding"));
          v10 = v9;
          if (v9
            && ([v9 hasPrefix:@"_"] & 1) == 0
            && ([v10 isEqualToString:@"codableDescription"] & 1) == 0)
          {
            v11 = [(INObject *)self valueForProperty:v10];
            if (v11)
            {
              [v3 setObject:v11 forKeyedSubscript:v10];
            }
            else
            {
              uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
              [v3 setObject:v12 forKeyedSubscript:v10];
            }
          }
        }
      }
    }
    free(v6);
  }
  v30[0] = @"identifier";
  identifier = self->_identifier;
  uint64_t v14 = (uint64_t)identifier;
  if (!identifier)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v14;
  v31[0] = v14;
  v30[1] = @"displayString";
  displayString = self->_displayString;
  uint64_t v16 = (uint64_t)displayString;
  if (!displayString)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = v3;
  uint64_t v26 = v16;
  v31[1] = v16;
  v30[2] = @"pronunciationHint";
  pronunciationHint = self->_pronunciationHint;
  objc_super v19 = pronunciationHint;
  if (!pronunciationHint)
  {
    objc_super v19 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v16, v28);
  }
  v31[2] = v19;
  v30[3] = @"alternativeSpeakableMatches";
  alternativeSpeakableMatches = self->_alternativeSpeakableMatches;
  v21 = alternativeSpeakableMatches;
  if (!alternativeSpeakableMatches)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[3] = v21;
  v30[4] = @"subtitleString";
  subtitleString = self->_subtitleString;
  long long v23 = subtitleString;
  if (!subtitleString)
  {
    long long v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[4] = v23;
  long long v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, v30, 5, v26);
  [v17 addEntriesFromDictionary:v24];

  if (subtitleString)
  {
    if (alternativeSpeakableMatches) {
      goto LABEL_27;
    }
  }
  else
  {

    if (alternativeSpeakableMatches)
    {
LABEL_27:
      if (pronunciationHint) {
        goto LABEL_28;
      }
      goto LABEL_35;
    }
  }

  if (pronunciationHint)
  {
LABEL_28:
    if (displayString) {
      goto LABEL_29;
    }
LABEL_36:

    if (identifier) {
      goto LABEL_30;
    }
    goto LABEL_37;
  }
LABEL_35:

  if (!displayString) {
    goto LABEL_36;
  }
LABEL_29:
  if (identifier) {
    goto LABEL_30;
  }
LABEL_37:

LABEL_30:

  return v17;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INObject;
  v6 = [(INObject *)&v11 description];
  uint64_t v7 = [(INObject *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INObject *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v9, @"identifier");

  v10 = [v6 encodeObject:self->_displayString];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v10, @"displayString");

  objc_super v11 = [v6 encodeObject:self->_pronunciationHint];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v11, @"pronunciationHint");

  uint64_t v12 = [v6 encodeObject:self->_alternativeSpeakableMatches];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v12, @"alternativeSpeakableMatches");

  v13 = [v6 encodeObject:self->_subtitleString];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v13, @"subtitleString");

  uint64_t v14 = [v6 encodeObject:self->_subtitleString];
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v14, @"descriptionString");

  v15 = self;
  uint64_t v16 = v6;
  v17 = [v6 encodeObject:self->_displayImage];
  v18 = v8;
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v17, @"displayImage");

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v32 = v7;
  objc_super v19 = [v7 attributes];
  v20 = [v19 allValues];

  id obj = v20;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v26 = [v25 propertyName];
        uint64_t v27 = [(INObject *)v15 valueForUndefinedKey:v26];
        v28 = [v16 encodeObject:v27 withCodableAttribute:v25];
        v29 = [v25 propertyName];
        objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v28, v29);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  v30 = [v32 semanticRoot];
  objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v30, @"_type");

  return v18;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"identifier"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];
    identifier = self->_identifier;
    self->_identifier = v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"displayString"];
    v15 = [v7 decodeObjectOfClass:v13 from:v14];
    displayString = self->_displayString;
    self->_displayString = v15;

    uint64_t v17 = objc_opt_class();
    v18 = [v8 objectForKeyedSubscript:@"pronunciationHint"];
    objc_super v19 = [v7 decodeObjectOfClass:v17 from:v18];
    pronunciationHint = self->_pronunciationHint;
    self->_pronunciationHint = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v22 = [v8 objectForKeyedSubscript:@"alternativeSpeakableMatches"];
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v24 = v23;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = objc_msgSend(v7, "decodeObjectOfClass:from:", objc_opt_class(), *(void *)(*((void *)&v42 + 1) + 8 * i), (void)v42);
          objc_msgSend(v21, "if_addObjectIfNonNil:", v30);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v27);
    }

    v31 = (NSArray *)[v21 copy];
    alternativeSpeakableMatches = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = v31;

    uint64_t v33 = objc_opt_class();
    long long v34 = [v8 objectForKeyedSubscript:@"subtitleString"];
    long long v35 = v34;
    if (!v34)
    {
      long long v35 = [v8 objectForKeyedSubscript:@"descriptionString"];
    }
    objc_msgSend(v7, "decodeObjectOfClass:from:", v33, v35, (void)v42);
    long long v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitleString = self->_subtitleString;
    self->_subtitleString = v36;

    if (!v34) {
    uint64_t v38 = objc_opt_class();
    }
    uint64_t v39 = [v8 objectForKeyedSubscript:@"displayImage"];
    v40 = [v7 decodeObjectOfClass:v38 from:v39];
    displayImage = self->_displayImage;
    self->_displayImage = v40;
  }
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(v7, "if_stringByLowercasingFirstCharacter");

    v10 = [(INObject *)self _valueForKeyDictionary];
    objc_super v11 = v10;
    if (v6) {
      [v10 setObject:v6 forKeyedSubscript:v9];
    }
    else {
      [v10 removeObjectForKey:v9];
    }
  }
  return v8 != 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_displayString forKey:@"displayString"];
  [v4 encodeObject:self->_pronunciationHint forKey:@"pronunciationHint"];
  [v4 encodeObject:self->_alternativeSpeakableMatches forKey:@"alternativeSpeakableMatches"];
  [v4 encodeObject:self->_subtitleString forKey:@"subtitleString"];
  [v4 encodeObject:self->_displayImage forKey:@"displayImage"];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = +[INSchema _defaultSchemaForBundle:v5];

  id v7 = [v6 _objectDescriptionForTypeOfClass:objc_opt_class()];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(v7, "attributes", 0);
  uint64_t v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) propertyName];
        v15 = [(INObject *)self valueForProperty:v14];
        if (v15) {
          [v4 encodeObject:v15 forKey:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (INObject)initWithCoder:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"displayString"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pronunciationHint"];

  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  long long v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  long long v17 = [v4 decodeObjectOfClasses:v16 forKey:@"alternativeSpeakableMatches"];

  long long v18 = [(INObject *)self initWithIdentifier:v5 displayString:v9 pronunciationHint:v13];
  long long v19 = v18;
  if (v18)
  {
    long long v42 = v13;
    long long v43 = v9;
    long long v44 = v5;
    objc_storeStrong((id *)&v18->_alternativeSpeakableMatches, v17);
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"subtitleString"];
    subtitleString = v19->_subtitleString;
    v19->_subtitleString = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayImage"];
    displayImage = v19->_displayImage;
    v19->_displayImage = (INImage *)v25;

    uint64_t v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v28 = +[INSchema _defaultSchemaForBundle:v27];

    v41 = v28;
    [v28 _objectDescriptionForTypeOfClass:objc_opt_class()];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v40 = long long v48 = 0u;
    v29 = [v40 attributes];
    v30 = [v29 allValues];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v36 = [v35 propertyName];
          long long v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), objc_msgSend(v35, "_unsafeObjectClass"), 0);
          uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:v36];

          [(INObject *)v19 setValue:v38 forProperty:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v32);
    }

    uint64_t v9 = v43;
    id v5 = v44;
    uint64_t v13 = v42;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INObject *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      BOOL v11 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        displayString = self->_displayString;
        if (displayString == v5->_displayString || -[NSString isEqual:](displayString, "isEqual:"))
        {
          pronunciationHint = self->_pronunciationHint;
          if (pronunciationHint == v5->_pronunciationHint
            || -[NSString isEqual:](pronunciationHint, "isEqual:"))
          {
            subtitleString = self->_subtitleString;
            if (subtitleString == v5->_subtitleString || -[NSString isEqual:](subtitleString, "isEqual:"))
            {
              displayImage = self->_displayImage;
              if (displayImage == v5->_displayImage || -[INImage isEqual:](displayImage, "isEqual:")) {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_displayString hash] ^ v3;
  return v4 ^ [(NSString *)self->_pronunciationHint hash];
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage
{
  uint64_t v12 = subtitleString;
  uint64_t v13 = displayImage;
  uint64_t v14 = [(INObject *)self initWithIdentifier:identifier displayString:displayString pronunciationHint:pronunciationHint];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayImage, displayImage);
    uint64_t v16 = [(NSString *)v12 copy];
    long long v17 = v15->_subtitleString;
    v15->_subtitleString = (NSString *)v16;
  }
  return v15;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage
{
  uint64_t v10 = subtitleString;
  BOOL v11 = displayImage;
  uint64_t v12 = [(INObject *)self initWithIdentifier:identifier displayString:displayString pronunciationHint:0];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayImage, displayImage);
    uint64_t v14 = [(NSString *)v10 copy];
    uint64_t v15 = v13->_subtitleString;
    v13->_subtitleString = (NSString *)v14;
  }
  return v13;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:0 displayString:&stru_1EDA6DB28];
    objc_msgSend(v11, "_intents_decodeWithJSONDecoder:codableDescription:from:", v8, v9, v10);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end