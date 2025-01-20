@interface INParameterCombination
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isPrimary;
- (BOOL)supportsBackgroundExecution;
- (INCodableLocalizationTable)_localizationTable;
- (INParameterCombination)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)localizedSubtitleFormatString;
- (NSString)localizedTitleFormatString;
- (NSString)subtitleFormatString;
- (NSString)subtitleFormatStringLocID;
- (NSString)titleFormatString;
- (NSString)titleFormatStringLocID;
- (id)_dictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedSubtitleFormatStringWithLocalizer:(id)a3;
- (id)localizedTitleFormatStringWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)_setLocalizationTable:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setSubtitleFormatString:(id)a3;
- (void)setSubtitleFormatStringLocID:(id)a3;
- (void)setSupportsBackgroundExecution:(BOOL)a3;
- (void)setTitleFormatString:(id)a3;
- (void)setTitleFormatStringLocID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INParameterCombination

- (void)_setLocalizationTable:(id)a3
{
}

- (INParameterCombination)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)INParameterCombination;
  v5 = [(INParameterCombination *)&v21 init];
  if (v5)
  {
    -[INParameterCombination setSupportsBackgroundExecution:](v5, "setSupportsBackgroundExecution:", [v4 decodeBoolForKey:@"supportsBackgroundExecution"]);
    -[INParameterCombination setPrimary:](v5, "setPrimary:", [v4 decodeBoolForKey:@"primary"]);
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"titleFormatString"];
    [(INParameterCombination *)v5 setTitleFormatString:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleFormatStringLocID"];
    [(INParameterCombination *)v5 setTitleFormatStringLocID:v10];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"subtitleFormatString"];
    [(INParameterCombination *)v5 setSubtitleFormatString:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleFormatStringLocID"];
    [(INParameterCombination *)v5 setSubtitleFormatStringLocID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizationTable"];
    [(INParameterCombination *)v5 _setLocalizationTable:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationTable"];

    if (v17)
    {
      v18 = objc_alloc_init(INCodableLocalizationTable);
      v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationTable"];
      [(INCodableLocalizationTable *)v18 setTableName:v19];

      [(INParameterCombination *)v5 _setLocalizationTable:v18];
    }
  }

  return v5;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationSupportsBackgroundExecution"];
  -[INParameterCombination setSupportsBackgroundExecution:](self, "setSupportsBackgroundExecution:", [v5 BOOLValue]);

  v6 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationIsPrimary"];
  -[INParameterCombination setPrimary:](self, "setPrimary:", [v6 BOOLValue]);

  uint64_t v7 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationTitle"];
  [(INParameterCombination *)self setTitleFormatString:v7];

  v8 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationTitleID"];
  [(INParameterCombination *)self setTitleFormatStringLocID:v8];

  v9 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationSubtitle"];
  [(INParameterCombination *)self setSubtitleFormatString:v9];

  id v10 = [v4 objectForKeyedSubscript:@"INIntentParameterCombinationSubtitleID"];

  [(INParameterCombination *)self setSubtitleFormatStringLocID:v10];
}

- (void)setTitleFormatStringLocID:(id)a3
{
}

- (void)setTitleFormatString:(id)a3
{
}

- (void)setSupportsBackgroundExecution:(BOOL)a3
{
  self->_supportsBackgroundExecution = a3;
}

- (void)setSubtitleFormatStringLocID:(id)a3
{
}

- (void)setSubtitleFormatString:(id)a3
{
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)titleFormatString
{
  return self->_titleFormatString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
  objc_storeStrong((id *)&self->_titleFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_titleFormatString, 0);

  objc_storeStrong((id *)&self->_localizationTable, 0);
}

- (NSString)subtitleFormatStringLocID
{
  return self->_subtitleFormatStringLocID;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (NSString)titleFormatStringLocID
{
  return self->_titleFormatStringLocID;
}

- (BOOL)supportsBackgroundExecution
{
  return self->_supportsBackgroundExecution;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (INCodableLocalizationTable)_localizationTable
{
  return self->_localizationTable;
}

- (id)_dictionaryRepresentation
{
  v26[8] = *MEMORY[0x1E4F143B8];
  v25[0] = @"supportsBackgroundExecution";
  if ([(INParameterCombination *)self supportsBackgroundExecution]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v26[0] = v3;
  v25[1] = @"isPrimary";
  if ([(INParameterCombination *)self isPrimary]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v26[1] = v4;
  v25[2] = @"titleFormatString";
  uint64_t v5 = [(INParameterCombination *)self titleFormatString];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v5;
  v26[2] = v5;
  v25[3] = @"titleFormatStringLocID";
  uint64_t v7 = [(INParameterCombination *)self titleFormatStringLocID];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  objc_super v21 = (void *)v7;
  v26[3] = v7;
  v25[4] = @"subtitleFormatString";
  uint64_t v9 = [(INParameterCombination *)self subtitleFormatString];
  id v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v9;
  v26[4] = v9;
  v25[5] = @"subtitleFormatStringLocID";
  v11 = [(INParameterCombination *)self subtitleFormatStringLocID];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = v6;
  v26[5] = v12;
  v25[6] = @"_localizationTable.tableName";
  v13 = [(INParameterCombination *)self _localizationTable];
  v14 = [v13 tableName];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[6] = v15;
  v25[7] = @"_localizationTable.bundleIdentifier";
  v16 = [(INParameterCombination *)self _localizationTable];
  v17 = [v16 bundleIdentifier];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[7] = v18;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:8];
  if (!v17) {

  }
  if (!v14) {
  if (!v11)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v24) {

  }
  return v23;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INParameterCombination;
  v6 = [(INParameterCombination *)&v11 description];
  uint64_t v7 = [(INParameterCombination *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INParameterCombination *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  BOOL supportsBackgroundExecution = self->_supportsBackgroundExecution;
  id v5 = a3;
  [v5 encodeBool:supportsBackgroundExecution forKey:@"supportsBackgroundExecution"];
  [v5 encodeBool:self->_primary forKey:@"primary"];
  [v5 encodeObject:self->_titleFormatString forKey:@"titleFormatString"];
  [v5 encodeObject:self->_titleFormatStringLocID forKey:@"titleFormatStringLocID"];
  [v5 encodeObject:self->_subtitleFormatString forKey:@"subtitleFormatString"];
  [v5 encodeObject:self->_subtitleFormatStringLocID forKey:@"subtitleFormatStringLocID"];
  [v5 encodeObject:self->_localizationTable forKey:@"_localizationTable"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v8 = [v6 dictionary];
  objc_msgSend(v8, "intents_setBoolIfTrue:forKey:", self->_supportsBackgroundExecution, @"supportsBackgroundExecution");
  objc_msgSend(v8, "intents_setBoolIfTrue:forKey:", self->_primary, @"primary");
  uint64_t v9 = [(NSString *)self->_titleFormatString intents_encodeForPlistRepresentationWithParameters:v7];
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v9, @"titleFormatString");

  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", self->_titleFormatStringLocID, @"titleFormatStringLocID");
  id v10 = [(NSString *)self->_subtitleFormatString intents_encodeForPlistRepresentationWithParameters:v7];

  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v10, @"subtitleFormatString");
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", self->_subtitleFormatStringLocID, @"subtitleFormatStringLocID");
  localizationTable = self->_localizationTable;
  id v16 = 0;
  objc_msgSend(v8, "intents_setWidgetPlistRepresentable:forKey:error:", localizationTable, @"_localizationTable", &v16);
  id v12 = v16;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    v14 = (void *)[v8 copy];
  }

  return v14;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v65[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INParameterCombination *)self titleFormatStringLocID];
  v6 = [(INParameterCombination *)self titleFormatString];
  id v7 = [(INParameterCombination *)self _localizationTable];
  id v59 = 0;
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, &v59);
  id v51 = v59;

  uint64_t v9 = [(INParameterCombination *)self subtitleFormatStringLocID];
  id v10 = [(INParameterCombination *)self subtitleFormatString];
  objc_super v11 = [(INParameterCombination *)self _localizationTable];
  id v58 = 0;
  v53 = INLocalizedStringFromCodable(v9, v10, v11, v4, &v58);
  id v49 = v58;

  v64[0] = @"INIntentParameterCombinationSupportsBackgroundExecution";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INParameterCombination supportsBackgroundExecution](self, "supportsBackgroundExecution"));
  v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v12;
  v65[0] = v12;
  v64[1] = @"INIntentParameterCombinationIsPrimary";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[INParameterCombination isPrimary](self, "isPrimary"));
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v14;
  v65[1] = v14;
  v64[2] = @"INIntentParameterCombinationTitle";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[2] = v16;
  v64[3] = @"INIntentParameterCombinationTitleID";
  v17 = [(INParameterCombination *)self titleFormatStringLocID];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v8;
  v65[3] = v18;
  v64[4] = @"INIntentParameterCombinationSubtitle";
  v19 = v53;
  if (!v53)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = v4;
  v65[4] = v19;
  v64[5] = @"INIntentParameterCombinationSubtitleID";
  objc_super v21 = [(INParameterCombination *)self subtitleFormatStringLocID];
  v22 = v21;
  if (!v21)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[5] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:6];
  v52 = (void *)[v23 mutableCopy];

  if (!v21) {
  v24 = v20;
  }
  if (!v53) {

  }
  if (!v17) {
  if (v50)
  }
  {
    if (v15) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_21;
    }
  }

LABEL_21:
  if (!v13) {

  }
  v25 = v51;
  [v52 setObject:v51 forKeyedSubscript:@"INIntentParameterCombinationTitleLanguageCode"];
  [v52 setObject:v49 forKeyedSubscript:@"INIntentParameterCombinationSubtitleLanguageCode"];
  v26 = [v20 languageCode];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    if ([v50 length])
    {
      v28 = [(INParameterCombination *)self titleFormatString];
      v29 = [(INParameterCombination *)self titleFormatStringLocID];
      id v57 = v28;
      v30 = [(INParameterCombination *)self _localizationTable];
      id v56 = 0;
      v31 = INStringsDictEntryForKeyInTable(v29, &v57, v30, v24, &v56);
      id v32 = v57;

      id v33 = v56;
      if (v31)
      {
        v62[0] = @"INIntentParameterCombinationTitle";
        v34 = v32;
        if (!v32)
        {
          v34 = [MEMORY[0x1E4F1CA98] null];
        }
        v62[1] = @"INIntentParameterCombinationTitleDictionary";
        v63[0] = v34;
        v63[1] = v31;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
        [v52 addEntriesFromDictionary:v35];

        if (!v32) {
        [v52 setObject:v33 forKeyedSubscript:@"INIntentParameterCombinationTitleDictionaryLanguageCode"];
        }
        v25 = v51;
      }
    }
    if ([v53 length])
    {
      v36 = [(INParameterCombination *)self subtitleFormatString];
      v37 = [(INParameterCombination *)self subtitleFormatStringLocID];
      id v55 = v36;
      v38 = [(INParameterCombination *)self _localizationTable];
      id v54 = 0;
      v39 = INStringsDictEntryForKeyInTable(v37, &v55, v38, v24, &v54);
      id v40 = v55;

      id v41 = v54;
      if (v39)
      {
        v60[0] = @"INIntentParameterCombinationSubtitle";
        v42 = v40;
        if (!v40)
        {
          v42 = [MEMORY[0x1E4F1CA98] null];
        }
        v60[1] = @"INIntentParameterCombinationSubtitleDictionary";
        v61[0] = v42;
        v61[1] = v39;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
        [v52 addEntriesFromDictionary:v43];

        if (!v40) {
        [v52 setObject:v41 forKeyedSubscript:@"INIntentParameterCombinationSubtitleDictionaryLanguageCode"];
        }
      }
    }
  }
  v44 = objc_msgSend(v52, "if_dictionaryWithNonEmptyValues");

  return v44;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INParameterCombination *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (id)localizedSubtitleFormatStringWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(INParameterCombination *)self subtitleFormatStringLocID];
  v6 = [(INParameterCombination *)self subtitleFormatString];
  id v7 = [(INParameterCombination *)self _localizationTable];
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedSubtitleFormatString
{
  v3 = objc_opt_new();
  id v4 = [(INParameterCombination *)self localizedSubtitleFormatStringWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)localizedTitleFormatStringWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(INParameterCombination *)self titleFormatStringLocID];
  v6 = [(INParameterCombination *)self titleFormatString];
  id v7 = [(INParameterCombination *)self _localizationTable];
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedTitleFormatString
{
  v3 = objc_opt_new();
  id v4 = [(INParameterCombination *)self localizedTitleFormatStringWithLocalizer:v3];

  return (NSString *)v4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(INParameterCombination);
  -[INParameterCombination setSupportsBackgroundExecution:](v6, "setSupportsBackgroundExecution:", objc_msgSend(v5, "intents_BOOLForKey:", @"supportsBackgroundExecution"));
  -[INParameterCombination setPrimary:](v6, "setPrimary:", objc_msgSend(v5, "intents_BOOLForKey:", @"primary"));
  id v7 = objc_msgSend(v5, "intents_stringForKey:", @"titleFormatString");
  [(INParameterCombination *)v6 setTitleFormatString:v7];

  uint64_t v8 = objc_msgSend(v5, "intents_stringForKey:", @"titleFormatStringLocID");
  [(INParameterCombination *)v6 setTitleFormatStringLocID:v8];

  uint64_t v9 = objc_msgSend(v5, "intents_stringForKey:", @"subtitleFormatString");
  [(INParameterCombination *)v6 setSubtitleFormatString:v9];

  id v10 = objc_msgSend(v5, "intents_stringForKey:", @"subtitleFormatStringLocID");
  [(INParameterCombination *)v6 setSubtitleFormatStringLocID:v10];

  id v16 = 0;
  objc_super v11 = +[NSObject intents_widgetPlistRepresentableInDict:v5 key:@"_localizationTable" error:&v16];

  id v12 = v16;
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = 0;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    [(INParameterCombination *)v6 _setLocalizationTable:v11];
    uint64_t v14 = v6;
  }

  return v14;
}

@end