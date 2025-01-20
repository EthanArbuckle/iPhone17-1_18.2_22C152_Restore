@interface INCodableAttributeDialog
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isDefaultDialog;
- (BOOL)isEqual:(id)a3;
- (INCodableAttribute)_codableAttribute;
- (INCodableAttributeDialog)initWithCoder:(id)a3;
- (INCodableDescription)_codableDescription;
- (NSString)formatString;
- (NSString)formatStringID;
- (id)__INCodableDescriptionFormatStringDictionaryKey;
- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey;
- (id)__INCodableDescriptionFormatStringIDKey;
- (id)__INCodableDescriptionFormatStringKey;
- (id)__INCodableDescriptionFormatStringLanguageCodeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4;
- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 forLanguage:(id)a5;
- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 localizer:(id)a5;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setCodableAttribute:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultDialog:(BOOL)a3;
- (void)setFormatString:(id)a3;
- (void)setFormatStringID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttributeDialog

- (INCodableAttributeDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableAttributeDialog;
  v5 = [(INCodableAttributeDialog *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"formatString"];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatStringID"];
    formatStringID = v5->_formatStringID;
    v5->_formatStringID = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codableAttribute"];
    [(INCodableAttributeDialog *)v5 _setCodableAttribute:v13];
  }
  return v5;
}

- (void)_setCodableAttribute:(id)a3
{
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  formatString = self->_formatString;
  self->_formatString = v6;

  id v10 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringIDKey];
  v8 = [v4 objectForKeyedSubscript:v10];

  formatStringID = self->_formatStringID;
  self->_formatStringID = v8;
}

- (INCodableDescription)_codableDescription
{
  v2 = [(INCodableAttributeDialog *)self _codableAttribute];
  v3 = [v2 _codableDescription];

  return (INCodableDescription *)v3;
}

- (INCodableAttribute)_codableAttribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);

  return (INCodableAttribute *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringID, 0);
  objc_storeStrong((id *)&self->_formatString, 0);

  objc_destroyWeak((id *)&self->_codableAttribute);
}

- (void)setDefaultDialog:(BOOL)a3
{
  self->_defaultDialog = a3;
}

- (BOOL)isDefaultDialog
{
  return self->_defaultDialog;
}

- (void)setFormatStringID:(id)a3
{
}

- (NSString)formatStringID
{
  return self->_formatStringID;
}

- (void)setFormatString:(id)a3
{
}

- (NSString)formatString
{
  return self->_formatString;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableAttributeDialog *)self formatString];
  [v4 encodeObject:v5 forKey:@"formatString"];

  v6 = [(INCodableAttributeDialog *)self formatStringID];
  [v4 encodeObject:v6 forKey:@"formatStringID"];

  id v7 = [(INCodableAttributeDialog *)self _codableAttribute];
  [v4 encodeConditionalObject:v7 forKey:@"_codableAttribute"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  v8 = [(INCodableAttributeDialog *)self formatString];
  uint64_t v9 = objc_msgSend(v8, "intents_encodeForPlistRepresentationWithParameters:", v6);

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, @"formatString");
  id v10 = [(INCodableAttributeDialog *)self formatStringID];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, @"formatStringID");

  return v7;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCodableAttributeDialog *)self _codableAttribute];
  if ([(INCodableAttributeDialog *)self isDefaultDialog])
  {
    id v6 = [[INCodableLocalizationTable alloc] initWithBundleIdentifier:@"com.apple.Intents" tableName:@"Localizable"];
  }
  else
  {
    id v7 = [v5 _codableDescription];
    id v6 = [v7 _localizationTable];
  }
  v8 = [(INCodableAttributeDialog *)self formatStringID];
  uint64_t v9 = [(INCodableAttributeDialog *)self formatString];
  id v45 = 0;
  id v10 = INLocalizedStringFromCodable(v8, v9, v6, v4, &v45);
  id v11 = v45;

  if ([(INCodableAttributeDialog *)self isDefaultDialog])
  {
    v12 = [v5 propertyName];
    uint64_t v13 = [v10 stringByReplacingOccurrencesOfString:@"__PARAMETER_NAME__" withString:v12];

    id v10 = (void *)v13;
  }
  id v41 = v11;
  v42 = v6;
  v14 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringKey];
  v48[0] = v14;
  objc_super v15 = v10;
  if (!v10)
  {
    objc_super v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = v5;
  v49[0] = v15;
  v16 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringIDKey];
  v48[1] = v16;
  v17 = [(INCodableAttributeDialog *)self formatStringID];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  v20 = (void *)[v19 mutableCopy];

  if (!v17) {
  if (!v10)
  }

  v21 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringLanguageCodeKey];
  v22 = v41;
  [v20 setObject:v41 forKeyedSubscript:v21];

  v23 = [v4 languageCode];
  uint64_t v24 = [v23 length];

  v25 = v42;
  if (v24 && [v10 length])
  {
    v26 = [(INCodableAttributeDialog *)self formatString];
    v27 = [(INCodableAttributeDialog *)self formatStringID];
    id v43 = 0;
    id v44 = v26;
    v28 = INStringsDictEntryForKeyInTable(v27, &v44, v42, v4, &v43);
    id v29 = v44;

    id v39 = v43;
    if ([(INCodableAttributeDialog *)self isDefaultDialog])
    {
      v30 = [v40 propertyName];
      uint64_t v31 = [v29 stringByReplacingOccurrencesOfString:@"__PARAMETER_NAME__" withString:v30];

      id v29 = (id)v31;
    }
    if (v28)
    {
      v32 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringKey];
      v46[0] = v32;
      v33 = v29;
      if (!v29)
      {
        v33 = [MEMORY[0x1E4F1CA98] null];
      }
      v47[0] = v33;
      v34 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringDictionaryKey];
      v46[1] = v34;
      v47[1] = v28;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      [v20 addEntriesFromDictionary:v35];

      if (!v29) {
      v36 = [(INCodableAttributeDialog *)self __INCodableDescriptionFormatStringDictionaryLanguageCodeKey];
      }
      [v20 setObject:v39 forKeyedSubscript:v36];

      v22 = v41;
      v25 = v42;
    }
  }
  v37 = objc_msgSend(v20, "if_dictionaryWithNonEmptyValues", v39);

  return v37;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INCodableAttributeDialog *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 localizer:(id)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 backingStore];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [(INCodableAttributeDialog *)self _codableAttribute];
  v50 = @"displayName";
  uint64_t v15 = [v14 localizedDisplayNameWithLocalizer:v10];
  v16 = (void *)v15;
  v17 = &stru_1EDA6DB28;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v51[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  v19 = (void *)[v18 mutableCopy];

  v20 = [v14 metadata];
  uint64_t v21 = [v20 _localizedDialogTokensWithLocalizer:v10];

  if (v21) {
    [v19 addEntriesFromDictionary:v21];
  }
  if (v9) {
    [v19 addEntriesFromDictionary:v9];
  }
  v47 = (void *)v21;
  v48 = v19;
  if ([(INCodableAttributeDialog *)self isDefaultDialog])
  {
    v22 = [[INCodableLocalizationTable alloc] initWithBundleIdentifier:@"com.apple.Intents" tableName:@"Localizable"];
  }
  else
  {
    v23 = [v14 _codableDescription];
    v22 = [v23 _localizationTable];
  }
  uint64_t v24 = [(INCodableAttributeDialog *)self formatString];
  v25 = [(INCodableLocalizationTable *)v22 bundleIdentifier];
  v26 = (__CFBundle *)[v10 bundleWithIdentifier:v25 fileURL:0];

  v46 = v22;
  if (v26)
  {
    id v44 = v13;
    id v45 = v10;
    v42 = v14;
    id v43 = v9;
    v27 = v8;
    uint64_t v28 = [v8 _type];
    id v29 = [(INCodableAttributeDialog *)self formatStringID];
    v30 = [(INCodableAttributeDialog *)self formatString];
    uint64_t v31 = [(INCodableLocalizationTable *)v22 tableName];
    if (v28 == 2)
    {
      v32 = v27;
      uint64_t v33 = INLocalizedFormatStringFromCodable(v29, v30, v31, v26, v45, v44, v48, 0, 0);
      v26 = 0;
    }
    else
    {
      id v49 = 0;
      v32 = v27;
      uint64_t v33 = INLocalizedFormatStringFromSlotComposing(v29, v30, v31, v26, v45, v27, v48, &v49);
      v26 = (__CFBundle *)v49;
    }

    uint64_t v24 = (void *)v33;
    id v8 = v32;
    id v9 = v43;
    id v13 = v44;
    v14 = v42;
    id v10 = v45;
  }
  if ([(INCodableAttributeDialog *)self isDefaultDialog])
  {
    v34 = [v14 propertyName];
    uint64_t v35 = [v24 stringByReplacingOccurrencesOfString:@"__PARAMETER_NAME__" withString:v34];

    uint64_t v24 = (void *)v35;
  }
  if ([v8 _type] == 2)
  {
    v36 = v48;
    v37 = INReplaceVariablesInFormatStringFromCodable(v24, v10, v13, v48, 0);
  }
  else
  {
    v38 = [v10 languageCode];
    if ([v38 isEqualToString:v26])
    {
      id v39 = v10;
    }
    else
    {
      id v39 = +[INStringLocalizer localizerForLanguage:v26];
    }
    v40 = v39;

    v37 = INReplaceVariablesInFormatStringFromSlotComposing(v24, v40, v8);

    v36 = v48;
  }

  return v37;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 forLanguage:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[INStringLocalizer localizerForLanguage:a5];
  id v11 = [(INCodableAttributeDialog *)self localizedDialogWithIntent:v9 tokens:v8 localizer:v10];

  return v11;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(INCodableAttributeDialog *)self localizedDialogWithIntent:v7 tokens:v6 localizer:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (v11.receiver = self,
        v11.super_class = (Class)INCodableAttributeDialog,
        [(INCodableAttributeDialog *)&v11 isEqual:v4]))
  {
    v5 = [(INCodableAttributeDialog *)self formatStringID];
    id v6 = [v4 formatStringID];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [(INCodableAttributeDialog *)self formatString];
      id v8 = [v4 formatString];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(INCodableAttributeDialog *)self formatString];
  uint64_t v4 = [v3 hash];
  v5 = [(INCodableAttributeDialog *)self formatStringID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(INCodableAttributeDialog *)self formatString];
  [v4 setFormatString:v5];

  unint64_t v6 = [(INCodableAttributeDialog *)self formatStringID];
  [v4 setFormatStringID:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init((Class)a1);
  uint64_t v7 = objc_msgSend(v5, "intents_stringForKey:", @"formatString");
  id v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = objc_msgSend(v5, "intents_stringForKey:", @"formatStringID");

  id v10 = (void *)v6[4];
  v6[4] = v9;

  return v6;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringIDKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringDictionaryLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringDictionaryKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringKey");

  return v3;
}

@end