@interface INCodableStringAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)disableAutocorrect;
- (BOOL)disableSmartDashes;
- (BOOL)disableSmartQuotes;
- (BOOL)isMultiline;
- (INCodableStringAttributeMetadata)initWithCoder:(id)a3;
- (NSString)defaultValue;
- (NSString)defaultValueID;
- (NSString)localizedDefaultValue;
- (id)__INCodableDescriptionCapitalizationKey;
- (id)__INCodableDescriptionDefaultValueIDKey;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionDisableAutocorrectKey;
- (id)__INCodableDescriptionDisableSmartDashesKey;
- (id)__INCodableDescriptionDisableSmartQuotesKey;
- (id)__INCodableDescriptionMultilineKey;
- (id)__INIntentResponseCodableDescriptionCapitalizationKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueIDKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionDisableAutocorrectKey;
- (id)__INIntentResponseCodableDescriptionDisableSmartDashesKey;
- (id)__INIntentResponseCodableDescriptionDisableSmartQuotesKey;
- (id)__INIntentResponseCodableDescriptionMultilineKey;
- (id)__INTypeCodableDescriptionCapitalizationKey;
- (id)__INTypeCodableDescriptionDefaultValueIDKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionDisableAutocorrectKey;
- (id)__INTypeCodableDescriptionDisableSmartDashesKey;
- (id)__INTypeCodableDescriptionDisableSmartQuotesKey;
- (id)__INTypeCodableDescriptionMultilineKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDefaultValueWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)capitalization;
- (void)encodeWithCoder:(id)a3;
- (void)setCapitalization:(int64_t)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDefaultValueID:(id)a3;
- (void)setDisableAutocorrect:(BOOL)a3;
- (void)setDisableSmartDashes:(BOOL)a3;
- (void)setDisableSmartQuotes:(BOOL)a3;
- (void)setMultiline:(BOOL)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableStringAttributeMetadata

- (INCodableStringAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableStringAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v12 initWithCoder:v4];
  if (v5)
  {
    -[INCodableStringAttributeMetadata setMultiline:](v5, "setMultiline:", [v4 decodeBoolForKey:@"multiline"]);
    -[INCodableStringAttributeMetadata setDisableAutocorrect:](v5, "setDisableAutocorrect:", [v4 decodeBoolForKey:@"disableAutocorrect"]);
    -[INCodableStringAttributeMetadata setDisableSmartDashes:](v5, "setDisableSmartDashes:", [v4 decodeBoolForKey:@"disableSmartDashes"]);
    -[INCodableStringAttributeMetadata setDisableSmartQuotes:](v5, "setDisableSmartQuotes:", [v4 decodeBoolForKey:@"disableSmartQuotes"]);
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"defaultValue"];
    [(INCodableStringAttributeMetadata *)v5 setDefaultValue:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValueID"];
    [(INCodableStringAttributeMetadata *)v5 setDefaultValueID:v10];

    -[INCodableStringAttributeMetadata setCapitalization:](v5, "setCapitalization:", [v4 decodeIntegerForKey:@"capitalization"]);
  }

  return v5;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (void)setDisableSmartQuotes:(BOOL)a3
{
  self->_disableSmartQuotes = a3;
}

- (void)setDisableSmartDashes:(BOOL)a3
{
  self->_disableSmartDashes = a3;
}

- (void)setDisableAutocorrect:(BOOL)a3
{
  self->_disableAutocorrect = a3;
}

- (void)setDefaultValueID:(id)a3
{
}

- (void)setDefaultValue:(id)a3
{
}

- (void)setCapitalization:(int64_t)a3
{
  self->_capitalization = a3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)INCodableStringAttributeMetadata;
  [(INCodableAttributeMetadata *)&v40 updateWithDictionary:v4];
  v5 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionMultilineKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  self->_multiline = v9;
  v10 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableAutocorrectKey];
  v11 = [v4 objectForKeyedSubscript:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v12 = v11;
    }
    else {
      objc_super v12 = 0;
    }
  }
  else
  {
    objc_super v12 = 0;
  }
  id v13 = v12;

  char v14 = [v13 BOOLValue];
  self->_disableAutocorrect = v14;
  v15 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableSmartDashesKey];
  v16 = [v4 objectForKeyedSubscript:v15];

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  char v19 = [v18 BOOLValue];
  self->_disableSmartDashes = v19;
  v20 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableSmartQuotesKey];
  v21 = [v4 objectForKeyedSubscript:v20];

  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  id v23 = v22;

  char v24 = [v23 BOOLValue];
  self->_disableSmartQuotes = v24;
  v25 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v26 = [v4 objectForKeyedSubscript:v25];

  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  defaultValue = self->_defaultValue;
  self->_defaultValue = v28;

  v30 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDefaultValueIDKey];
  v31 = [v4 objectForKeyedSubscript:v30];

  if (v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }
  v33 = v32;

  defaultValueID = self->_defaultValueID;
  self->_defaultValueID = v33;

  v35 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionCapitalizationKey];
  v36 = [v4 objectForKeyedSubscript:v35];

  if (v36)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
  }
  else
  {
    v37 = 0;
  }
  id v38 = v37;

  int64_t v39 = INCodableStringAttributeMetadataCapitalizationWithString(v38);
  self->_capitalization = v39;
}

- (id)__INCodableDescriptionMultilineKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");

  return v3;
}

- (id)__INCodableDescriptionDisableSmartQuotesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");

  return v3;
}

- (id)__INCodableDescriptionDisableSmartDashesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");

  return v3;
}

- (id)__INCodableDescriptionDisableAutocorrectKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INCodableDescriptionCapitalizationKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValueID, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

- (int64_t)capitalization
{
  return self->_capitalization;
}

- (NSString)defaultValueID
{
  return self->_defaultValueID;
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)disableSmartQuotes
{
  return self->_disableSmartQuotes;
}

- (BOOL)disableSmartDashes
{
  return self->_disableSmartDashes;
}

- (BOOL)disableAutocorrect
{
  return self->_disableAutocorrect;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableStringAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_multiline, @"multiline", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_disableAutocorrect forKey:@"disableAutocorrect"];
  [v4 encodeBool:self->_disableSmartDashes forKey:@"disableSmartDashes"];
  [v4 encodeBool:self->_disableSmartQuotes forKey:@"disableSmartQuotes"];
  [v4 encodeObject:self->_defaultValue forKey:@"defaultValue"];
  [v4 encodeObject:self->_defaultValueID forKey:@"defaultValueID"];
  [v4 encodeInteger:self->_capitalization forKey:@"capitalization"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableStringAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v7)
  {
    char v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_multiline, @"multiline");
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableAutocorrect, @"disableAutocorrect");
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableSmartDashes, @"disableSmartDashes");
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableSmartQuotes, @"disableSmartQuotes");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, @"defaultValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValueID, @"defaultValueID");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_capitalization, @"capitalization");
    char v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)localizedDefaultValueWithLocalizer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(INCodableStringAttributeMetadata *)self defaultValueID];
  v6 = [(INCodableStringAttributeMetadata *)self defaultValue];
  id v7 = [(INCodableAttributeMetadata *)self _localizationTable];
  id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedDefaultValue
{
  v3 = objc_opt_new();
  id v4 = [(INCodableStringAttributeMetadata *)self localizedDefaultValueWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v38[7] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)INCodableStringAttributeMetadata;
  id v4 = a3;
  v31 = [(INCodableAttributeMetadata *)&v36 dictionaryRepresentationWithLocalizer:v4];
  v35 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionMultilineKey];
  v37[0] = v35;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableStringAttributeMetadata isMultiline](self, "isMultiline"));
  v34 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v5;
  v38[0] = v5;
  v33 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableAutocorrectKey];
  v37[1] = v33;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableStringAttributeMetadata disableAutocorrect](self, "disableAutocorrect"));
  v32 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v6;
  v38[1] = v6;
  v30 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableSmartDashesKey];
  v37[2] = v30;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableStringAttributeMetadata disableSmartDashes](self, "disableSmartDashes"));
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = v8;
  char v24 = (void *)v7;
  v38[2] = v7;
  v28 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDisableSmartQuotesKey];
  v37[3] = v28;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableStringAttributeMetadata disableSmartQuotes](self, "disableSmartQuotes"));
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  id v23 = (void *)v9;
  v38[3] = v9;
  v27 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v37[4] = v27;
  objc_super v11 = [(INCodableStringAttributeMetadata *)self localizedDefaultValueWithLocalizer:v4];

  id v12 = v11;
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[4] = v12;
  id v13 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionDefaultValueIDKey];
  v37[5] = v13;
  char v14 = [(INCodableStringAttributeMetadata *)self defaultValueID];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[5] = v15;
  v16 = [(INCodableStringAttributeMetadata *)self __INCodableDescriptionCapitalizationKey];
  v37[6] = v16;
  int64_t v17 = [(INCodableStringAttributeMetadata *)self capitalization];
  if ((unint64_t)(v17 - 1) > 2) {
    id v18 = @"None";
  }
  else {
    id v18 = off_1E5519800[v17 - 1];
  }
  v38[6] = v18;
  char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:7];
  v20 = objc_msgSend(v31, "if_dictionaryByAddingEntriesFromDictionary:", v19);

  if (!v14) {
  if (!v11)
  }

  if (!v10) {
  if (!v29)
  }

  if (!v32) {
  if (!v34)
  }

  v21 = objc_msgSend(v20, "if_dictionaryWithNonEmptyValues");

  return v21;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___INCodableStringAttributeMetadata;
  id v15 = 0;
  uint64_t v7 = objc_msgSendSuper2(&v14, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v15);
  id v8 = v15;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    objc_msgSend(v7, "setMultiline:", objc_msgSend(v6, "intents_BOOLForKey:", @"multiline"));
    objc_msgSend(v7, "setDisableAutocorrect:", objc_msgSend(v6, "intents_BOOLForKey:", @"disableAutocorrect"));
    objc_msgSend(v7, "setDisableSmartDashes:", objc_msgSend(v6, "intents_BOOLForKey:", @"disableSmartDashes"));
    objc_msgSend(v7, "setDisableSmartQuotes:", objc_msgSend(v6, "intents_BOOLForKey:", @"disableSmartQuotes"));
    objc_super v11 = objc_msgSend(v6, "intents_stringForKey:", @"defaultValue");
    [v7 setDefaultValue:v11];

    id v12 = objc_msgSend(v6, "intents_stringForKey:", @"defaultValueID");
    [v7 setDefaultValueID:v12];

    objc_msgSend(v7, "setCapitalization:", objc_msgSend(v6, "intents_intForKey:", @"capitalization"));
    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionMultilineKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisableSmartQuotesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisableSmartDashesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisableAutocorrectKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionCapitalizationKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMultilineKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableSmartQuotesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableSmartDashesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableAutocorrectKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCapitalizationKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");

  return v3;
}

@end