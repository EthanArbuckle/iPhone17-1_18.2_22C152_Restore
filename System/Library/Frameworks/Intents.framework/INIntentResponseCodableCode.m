@interface INIntentResponseCodableCode
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isSuccess;
- (INIntentResponseCodableCode)initWithCoder:(id)a3;
- (INIntentResponseCodableDescription)_codableDescription;
- (NSArray)parameterNames;
- (NSString)conciseFormatString;
- (NSString)conciseFormatStringLocID;
- (NSString)formatString;
- (NSString)formatStringLocID;
- (NSString)name;
- (id)__INCodableDescriptionConciseFormatStringDictionaryKey;
- (id)__INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey;
- (id)__INCodableDescriptionConciseFormatStringIDKey;
- (id)__INCodableDescriptionConciseFormatStringKey;
- (id)__INCodableDescriptionConciseFormatStringLanguageCodeKey;
- (id)__INCodableDescriptionFormatStringDictionaryKey;
- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey;
- (id)__INCodableDescriptionFormatStringIDKey;
- (id)__INCodableDescriptionFormatStringKey;
- (id)__INCodableDescriptionFormatStringLanguageCodeKey;
- (id)__INCodableDescriptionNameKey;
- (id)__INCodableDescriptionSuccessKey;
- (id)_parameterNamesFromString:(id)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)value;
- (void)_setCodableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConciseFormatString:(id)a3;
- (void)setConciseFormatStringLocID:(id)a3;
- (void)setFormatString:(id)a3;
- (void)setFormatStringLocID:(id)a3;
- (void)setName:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setValue:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INIntentResponseCodableCode

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponseCodableCode *)self __INCodableDescriptionNameKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  [(INIntentResponseCodableCode *)self setName:v6];

  v7 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringKey];
  v8 = [v4 objectForKeyedSubscript:v7];
  [(INIntentResponseCodableCode *)self setFormatString:v8];

  v9 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringIDKey];
  v10 = [v4 objectForKeyedSubscript:v9];
  [(INIntentResponseCodableCode *)self setFormatStringLocID:v10];

  v11 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringKey];
  v12 = [v4 objectForKeyedSubscript:v11];
  [(INIntentResponseCodableCode *)self setConciseFormatString:v12];

  v13 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringIDKey];
  v14 = [v4 objectForKeyedSubscript:v13];
  [(INIntentResponseCodableCode *)self setConciseFormatStringLocID:v14];

  v15 = [(INIntentResponseCodableCode *)self __INCodableDescriptionSuccessKey];
  v16 = [v4 objectForKeyedSubscript:v15];

  -[INIntentResponseCodableCode setSuccess:](self, "setSuccess:", [v16 BOOLValue]);
  v17 = [(INIntentResponseCodableCode *)self name];
  int v18 = [v17 isEqualToString:@"failure"];

  if ((v18 & 1) != 0
    || ([(INIntentResponseCodableCode *)self name],
        v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 isEqualToString:@"success"],
        v19,
        v20))
  {
    [(INIntentResponseCodableCode *)self setSuccess:v18 ^ 1u];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (id)__INCodableDescriptionSuccessKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeSuccessKey");

  return v3;
}

- (id)__INCodableDescriptionNameKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeNameKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringIDKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringKey");

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringIDKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringIDKey");

  return v3;
}

- (INIntentResponseCodableDescription)_codableDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__codableDescription);

  return (INIntentResponseCodableDescription *)WeakRetained;
}

- (id)__INCodableDescriptionConciseFormatStringKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringKey");

  return v3;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (void)setName:(id)a3
{
}

- (void)setFormatStringLocID:(id)a3
{
}

- (void)setFormatString:(id)a3
{
}

- (void)setConciseFormatStringLocID:(id)a3
{
}

- (void)setConciseFormatString:(id)a3
{
}

- (void)_setCodableDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__codableDescription);
  objc_storeStrong((id *)&self->_conciseFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_conciseFormatString, 0);
  objc_storeStrong((id *)&self->_formatStringLocID, 0);
  objc_storeStrong((id *)&self->_formatString, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)conciseFormatStringLocID
{
  return self->_conciseFormatStringLocID;
}

- (NSString)conciseFormatString
{
  return self->_conciseFormatString;
}

- (NSString)formatStringLocID
{
  return self->_formatStringLocID;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (int64_t)value
{
  return self->_value;
}

- (INIntentResponseCodableCode)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INIntentResponseCodableCode;
  v5 = [(INIntentResponseCodableCode *)&v18 init];
  if (v5)
  {
    -[INIntentResponseCodableCode setValue:](v5, "setValue:", [v4 decodeIntegerForKey:@"value"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(INIntentResponseCodableCode *)v5 setName:v6];

    -[INIntentResponseCodableCode setSuccess:](v5, "setSuccess:", [v4 decodeBoolForKey:@"success"]);
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"formatString"];
    [(INIntentResponseCodableCode *)v5 setFormatString:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatStringLocID"];
    [(INIntentResponseCodableCode *)v5 setFormatStringLocID:v11];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"conciseFormatString"];
    [(INIntentResponseCodableCode *)v5 setConciseFormatString:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conciseFormatStringLocID"];
    [(INIntentResponseCodableCode *)v5 setConciseFormatStringLocID:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t value = self->_value;
  id v5 = a3;
  [v5 encodeInteger:value forKey:@"value"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeBool:self->_success forKey:@"success"];
  [v5 encodeObject:self->_formatString forKey:@"formatString"];
  [v5 encodeObject:self->_formatStringLocID forKey:@"formatStringLocID"];
  [v5 encodeObject:self->_conciseFormatString forKey:@"conciseFormatString"];
  [v5 encodeObject:self->_conciseFormatStringLocID forKey:@"conciseFormatStringLocID"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_value, @"value");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_name, @"name");
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_success, @"success");
  uint64_t v8 = [(NSString *)self->_formatString intents_encodeForPlistRepresentationWithParameters:v6];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, @"formatString");

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_formatStringLocID, @"formatStringLocID");
  v9 = [(NSString *)self->_conciseFormatString intents_encodeForPlistRepresentationWithParameters:v6];

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, @"conciseFormatString");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_conciseFormatStringLocID, @"conciseFormatStringLocID");

  return v7;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v85[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v6 = [(INIntentResponseCodableCode *)self formatStringLocID];
  v7 = [(INIntentResponseCodableCode *)self formatString];
  uint64_t v8 = [v5 _localizationTable];
  id v79 = 0;
  uint64_t v9 = INLocalizedStringFromCodable(v6, v7, v8, v4, &v79);
  id v10 = v79;

  v11 = [(INIntentResponseCodableCode *)self conciseFormatStringLocID];
  v12 = [(INIntentResponseCodableCode *)self conciseFormatString];
  uint64_t v13 = [v5 _localizationTable];
  id v78 = 0;
  v73 = INLocalizedStringFromCodable(v11, v12, v13, v4, &v78);
  id v71 = v78;

  v66 = [(INIntentResponseCodableCode *)self __INCodableDescriptionNameKey];
  v84[0] = v66;
  uint64_t v14 = [(INIntentResponseCodableCode *)self name];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v14;
  v85[0] = v14;
  v64 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringKey];
  v84[1] = v64;
  uint64_t v16 = v9;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = v4;
  v60 = (void *)v16;
  v85[1] = v16;
  v63 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringIDKey];
  v84[2] = v63;
  uint64_t v17 = [(INIntentResponseCodableCode *)self formatStringLocID];
  objc_super v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v9;
  v59 = (void *)v17;
  v85[2] = v17;
  v62 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringKey];
  v84[3] = v62;
  v19 = v73;
  if (!v73)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = v15;
  id v69 = v10;
  v70 = v5;
  v85[3] = v19;
  int v20 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringIDKey];
  v84[4] = v20;
  v21 = [(INIntentResponseCodableCode *)self conciseFormatStringLocID];
  v22 = v21;
  if (!v21)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[4] = v22;
  v23 = [(INIntentResponseCodableCode *)self __INCodableDescriptionSuccessKey];
  v84[5] = v23;
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntentResponseCodableCode isSuccess](self, "isSuccess"));
  v25 = v24;
  if (!v24)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v85[5] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:6];
  v72 = (void *)[v26 mutableCopy];

  if (!v24) {
  if (!v21)
  }

  v27 = v69;
  v28 = v70;
  v29 = v72;
  if (!v73) {

  }
  v30 = v68;
  if (!v18) {

  }
  if (!v68) {
  if (!v65)
  }

  v31 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringLanguageCodeKey];
  [v72 setObject:v69 forKeyedSubscript:v31];

  v32 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringLanguageCodeKey];
  [v72 setObject:v71 forKeyedSubscript:v32];

  v33 = [v67 languageCode];
  uint64_t v34 = [v33 length];

  if (v34)
  {
    if ([v68 length])
    {
      v35 = [(INIntentResponseCodableCode *)self formatString];
      v36 = [(INIntentResponseCodableCode *)self formatStringLocID];
      id v77 = v35;
      v37 = [v70 _localizationTable];
      id v76 = 0;
      v38 = INStringsDictEntryForKeyInTable(v36, &v77, v37, v67, &v76);
      id v39 = v77;

      id v40 = v76;
      if (v38)
      {
        v41 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringKey];
        v82[0] = v41;
        v42 = v39;
        if (!v39)
        {
          v42 = [MEMORY[0x1E4F1CA98] null];
        }
        v83[0] = v42;
        v43 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringDictionaryKey];
        v82[1] = v43;
        v83[1] = v38;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
        [v72 addEntriesFromDictionary:v44];

        if (!v39) {
        v45 = [(INIntentResponseCodableCode *)self __INCodableDescriptionFormatStringDictionaryLanguageCodeKey];
        }
        [v72 setObject:v40 forKeyedSubscript:v45];

        v30 = v68;
        v27 = v69;
        v28 = v70;
      }

      v29 = v72;
    }
    if ([v73 length])
    {
      v46 = [(INIntentResponseCodableCode *)self conciseFormatString];
      v47 = [(INIntentResponseCodableCode *)self conciseFormatStringLocID];
      id v75 = v46;
      v48 = [v28 _localizationTable];
      id v74 = 0;
      v49 = INStringsDictEntryForKeyInTable(v47, &v75, v48, v67, &v74);
      id v50 = v75;

      id v51 = v74;
      if (v49)
      {
        v52 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringKey];
        v80[0] = v52;
        v53 = v50;
        if (!v50)
        {
          v53 = [MEMORY[0x1E4F1CA98] null];
        }
        v81[0] = v53;
        v54 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringDictionaryKey];
        v80[1] = v54;
        v81[1] = v49;
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
        [v72 addEntriesFromDictionary:v55];

        if (!v50) {
        v56 = [(INIntentResponseCodableCode *)self __INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey];
        }
        [v72 setObject:v51 forKeyedSubscript:v56];

        v30 = v68;
        v27 = v69;
        v28 = v70;
      }

      v29 = v72;
    }
  }
  v57 = objc_msgSend(v29, "if_dictionaryWithNonEmptyValues");

  return v57;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INIntentResponseCodableCode *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (id)_parameterNamesFromString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_msgSend(MEMORY[0x1E4F28FD8], "_intents_sharedFormatRegularExpression");
    id v6 = objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "resultByAdjustingRangesWithOffset:", 0, (void)v18);
          uint64_t v13 = [v12 rangeAtIndex:1];
          v15 = objc_msgSend(v3, "substringWithRange:", v13, v14);
          if (v15) {
            [v4 addObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v16 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (NSArray)parameterNames
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(INIntentResponseCodableCode *)self _parameterNamesFromString:self->_formatString];
  id v5 = [(INIntentResponseCodableCode *)self _parameterNamesFromString:self->_conciseFormatString];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  id v7 = [v3 setWithArray:v6];
  uint64_t v8 = [v7 allObjects];

  return (NSArray *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(INIntentResponseCodableCode);
  -[INIntentResponseCodableCode setValue:](v5, "setValue:", objc_msgSend(v4, "intents_intForKey:", @"value"));
  id v6 = objc_msgSend(v4, "intents_stringForKey:", @"name");
  [(INIntentResponseCodableCode *)v5 setName:v6];

  -[INIntentResponseCodableCode setSuccess:](v5, "setSuccess:", objc_msgSend(v4, "intents_BOOLForKey:", @"success"));
  id v7 = objc_msgSend(v4, "intents_stringForKey:", @"formatString");
  [(INIntentResponseCodableCode *)v5 setFormatString:v7];

  uint64_t v8 = objc_msgSend(v4, "intents_stringForKey:", @"formatStringLocID");
  [(INIntentResponseCodableCode *)v5 setFormatStringLocID:v8];

  uint64_t v9 = objc_msgSend(v4, "intents_stringForKey:", @"conciseFormatString");
  [(INIntentResponseCodableCode *)v5 setConciseFormatString:v9];

  uint64_t v10 = objc_msgSend(v4, "intents_stringForKey:", @"conciseFormatStringLocID");

  [(INIntentResponseCodableCode *)v5 setConciseFormatStringLocID:v10];

  return v5;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringDictionaryLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringDictionaryKey");

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringLanguageCodeKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringDictionaryLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringDictionaryKey
{
  v2 = [(INIntentResponseCodableCode *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringDictionaryKey");

  return v3;
}

@end