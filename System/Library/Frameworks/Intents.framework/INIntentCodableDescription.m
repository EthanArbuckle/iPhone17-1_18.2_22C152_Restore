@interface INIntentCodableDescription
+ (BOOL)supportsSecureCoding;
+ (id)__CategoryKey;
+ (id)__ClassNameKey;
+ (id)__ClassPrefixKey;
+ (id)__ConfigurableKey;
+ (id)__DefaultImageNameKey;
+ (id)__DeprecatedKey;
+ (id)__DescriptionIDKey;
+ (id)__DescriptionKey;
+ (id)__EligibleForWidgetsKey;
+ (id)__EntityKey;
+ (id)__ForegroundKey;
+ (id)__HashKey;
+ (id)__IneligibleForSuggestionsKey;
+ (id)__InputKey;
+ (id)__Key;
+ (id)__KeyParameterKey;
+ (id)__NameKey;
+ (id)__ParameterKey;
+ (id)__ParametersKey;
+ (id)__PhrasesKey;
+ (id)__SummaryKey;
+ (id)__TitleIDKey;
+ (id)__TitleKey;
+ (id)__UserConfirmationRequiredKey;
+ (id)__VerbAssociationsKey;
+ (id)__VerbKey;
+ (id)_intentClassNameWithDictionary:(id)a3;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isConfigurable;
- (BOOL)isDeprecated;
- (BOOL)isEligibleForSuggestions;
- (BOOL)isEligibleForWidgets;
- (BOOL)isForeground;
- (BOOL)userConfirmationRequired;
- (INCodableAttribute)inputAttribute;
- (INCodableAttribute)keyAttribute;
- (INIntentCodableDescription)initWithCoder:(id)a3;
- (NSArray)entityVerbs;
- (NSArray)phrases;
- (NSNumber)versioningHash;
- (NSString)_inputAttributeName;
- (NSString)_keyAttributeName;
- (NSString)defaultImageName;
- (NSString)descriptiveText;
- (NSString)descriptiveTextLocID;
- (NSString)localizedDescriptiveText;
- (NSString)localizedTitle;
- (NSString)title;
- (NSString)titleLocID;
- (NSString)verb;
- (id)_attributeKey;
- (id)_attributesKey;
- (id)_ignoredAttributeTags;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDescriptiveTextWithLocalizer:(id)a3;
- (id)localizedTitleWithLocalizer:(id)a3;
- (id)resolvableParameterCombinationsWithParameterCombinations:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)codableDescriptionType;
- (int64_t)intentCategory;
- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4;
- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4;
- (void)_setInputAttributeName:(id)a3;
- (void)_setKeyAttributeName:(id)a3;
- (void)_updateWithIntentCodableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurable:(BOOL)a3;
- (void)setDefaultImageName:(id)a3;
- (void)setDeprecated:(BOOL)a3;
- (void)setDescriptiveText:(id)a3;
- (void)setDescriptiveTextLocID:(id)a3;
- (void)setEligibleForSuggestions:(BOOL)a3;
- (void)setEligibleForWidgets:(BOOL)a3;
- (void)setEntityVerbs:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setIntentCategory:(int64_t)a3;
- (void)setPhrases:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocID:(id)a3;
- (void)setUserConfirmationRequired:(BOOL)a3;
- (void)setVerb:(id)a3;
- (void)setVersioningHash:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INIntentCodableDescription

- (id)attributes
{
  v11.receiver = self;
  v11.super_class = (Class)INIntentCodableDescription;
  v3 = [(INCodableDescription *)&v11 attributes];
  v4 = [v3 objectForKeyedSubscript:&unk_1EDBA74F8];

  if (!v4)
  {
    v5 = (void *)[v3 mutableCopy];
    v6 = objc_alloc_init(INCodableObjectAttribute);
    [(INCodableAttribute *)v6 setModifier:1];
    [(INCodableAttribute *)v6 setPropertyName:@"_metadata"];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(INCodableObjectAttribute *)v6 setTypeName:v8];

    [(INCodableAttribute *)v6 setDisplayPriorityRank:&unk_1EDBA7510];
    [v5 setObject:v6 forKeyedSubscript:&unk_1EDBA74F8];

    uint64_t v9 = [v5 copy];
    [(INCodableDescription *)self setAttributes:v9];

    v3 = (void *)v9;
  }

  return v3;
}

- (id)_attributeKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__ParameterKey");
}

+ (id)__ParameterKey
{
  return @"INIntentParameter";
}

+ (id)__NameKey
{
  return @"INIntentName";
}

- (id)_attributesKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__ParametersKey");
}

+ (id)__ParametersKey
{
  return @"INIntentParameters";
}

- (NSNumber)versioningHash
{
  return self->_versioningHash;
}

- (BOOL)userConfirmationRequired
{
  return self->_userConfirmationRequired;
}

- (NSString)verb
{
  return self->_verb;
}

- (int64_t)intentCategory
{
  return self->_intentCategory;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INIntentCodableDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)INIntentCodableDescription;
  v5 = [(INRootCodableDescription *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"title"];
    [(INIntentCodableDescription *)v5 setTitle:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleLocID"];
    [(INIntentCodableDescription *)v5 setTitleLocID:v10];

    objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"descriptiveText"];
    [(INIntentCodableDescription *)v5 setDescriptiveText:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptiveTextLocID"];
    [(INIntentCodableDescription *)v5 setDescriptiveTextLocID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verb"];
    [(INIntentCodableDescription *)v5 setVerb:v16];

    -[INIntentCodableDescription setIntentCategory:](v5, "setIntentCategory:", [v4 decodeIntegerForKey:@"intentCategory"]);
    -[INIntentCodableDescription setUserConfirmationRequired:](v5, "setUserConfirmationRequired:", [v4 decodeBoolForKey:@"userConfirmationRequired"]);
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultImageName"];
    [(INIntentCodableDescription *)v5 setDefaultImageName:v17];

    -[INIntentCodableDescription setConfigurable:](v5, "setConfigurable:", [v4 decodeBoolForKey:@"configurable"]);
    -[INIntentCodableDescription setForeground:](v5, "setForeground:", [v4 decodeBoolForKey:@"foreground"]);
    -[INIntentCodableDescription setDeprecated:](v5, "setDeprecated:", [v4 decodeBoolForKey:@"deprecated"]);
    -[INIntentCodableDescription setEligibleForSuggestions:](v5, "setEligibleForSuggestions:", [v4 decodeBoolForKey:@"eligibleForSuggestions"]);
    -[INIntentCodableDescription setEligibleForWidgets:](v5, "setEligibleForWidgets:", [v4 decodeBoolForKey:@"eligibleForWidgets"]);
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_inputAttributeName"];
    [(INIntentCodableDescription *)v5 _setInputAttributeName:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyAttributeName"];
    [(INIntentCodableDescription *)v5 _setKeyAttributeName:v19];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityVerbs"];
    v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = MEMORY[0x1E4F1CBF0];
    }
    [(INIntentCodableDescription *)v5 setEntityVerbs:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versioningHash"];
    [(INIntentCodableDescription *)v5 setVersioningHash:v23];
  }
  return v5;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)INIntentCodableDescription;
  [(INCodableDescription *)&v65 updateWithDictionary:v4];
  v5 = [(id)objc_opt_class() _intentClassNameWithDictionary:v4];
  [(INCodableDescription *)self setClassName:v5];

  v6 = objc_msgSend((id)objc_opt_class(), "__TitleKey");
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];

  v8 = objc_msgSend((id)objc_opt_class(), "__DescriptionKey");
  uint64_t v9 = [v4 objectForKeyedSubscript:v8];

  if (v7)
  {
    v10 = v9;
    uint64_t v9 = (void *)v7;
  }
  else
  {
    objc_super v11 = objc_msgSend((id)objc_opt_class(), "__SummaryKey");
    v10 = [v4 objectForKeyedSubscript:v11];
  }
  [(INIntentCodableDescription *)self setTitle:v9];
  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "__TitleIDKey");
  v13 = [v4 objectForKeyedSubscript:v12];
  [(INIntentCodableDescription *)self setTitleLocID:v13];

  [(INIntentCodableDescription *)self setDescriptiveText:v10];
  v14 = objc_msgSend((id)objc_opt_class(), "__DescriptionIDKey");
  v15 = [v4 objectForKeyedSubscript:v14];
  [(INIntentCodableDescription *)self setDescriptiveTextLocID:v15];

  v16 = objc_msgSend((id)objc_opt_class(), "__VerbKey");
  v17 = [v4 objectForKeyedSubscript:v16];
  [(INIntentCodableDescription *)self setVerb:v17];

  v18 = objc_msgSend((id)objc_opt_class(), "__CategoryKey");
  v19 = [v4 objectForKeyedSubscript:v18];
  [(INIntentCodableDescription *)self setIntentCategory:INIntentCategoryWithString(v19)];

  uint64_t v20 = objc_msgSend((id)objc_opt_class(), "__DefaultImageNameKey");
  v21 = [v4 objectForKeyedSubscript:v20];
  [(INIntentCodableDescription *)self setDefaultImageName:v21];

  uint64_t v22 = objc_msgSend((id)objc_opt_class(), "__UserConfirmationRequiredKey");
  v23 = [v4 objectForKeyedSubscript:v22];
  -[INIntentCodableDescription setUserConfirmationRequired:](self, "setUserConfirmationRequired:", [v23 BOOLValue]);

  v24 = objc_msgSend((id)objc_opt_class(), "__ConfigurableKey");
  objc_super v25 = [v4 objectForKeyedSubscript:v24];
  -[INIntentCodableDescription setConfigurable:](self, "setConfigurable:", [v25 BOOLValue]);

  v26 = objc_msgSend((id)objc_opt_class(), "__DeprecatedKey");
  v27 = [v4 objectForKeyedSubscript:v26];
  -[INIntentCodableDescription setDeprecated:](self, "setDeprecated:", [v27 BOOLValue]);

  v28 = objc_msgSend((id)objc_opt_class(), "__ForegroundKey");
  v29 = [v4 objectForKeyedSubscript:v28];
  -[INIntentCodableDescription setForeground:](self, "setForeground:", [v29 BOOLValue]);

  v30 = objc_msgSend((id)objc_opt_class(), "__IneligibleForSuggestionsKey");
  v31 = [v4 objectForKeyedSubscript:v30];
  -[INIntentCodableDescription setEligibleForSuggestions:](self, "setEligibleForSuggestions:", [v31 BOOLValue] ^ 1);

  v32 = objc_msgSend((id)objc_opt_class(), "__EligibleForWidgetsKey");
  v33 = [v4 objectForKeyedSubscript:v32];
  -[INIntentCodableDescription setEligibleForWidgets:](self, "setEligibleForWidgets:", [v33 BOOLValue]);

  v34 = objc_msgSend((id)objc_opt_class(), "__InputKey");
  v35 = [v4 objectForKeyedSubscript:v34];
  [(INIntentCodableDescription *)self _setInputAttributeName:v35];

  v36 = objc_msgSend((id)objc_opt_class(), "__KeyParameterKey");
  v37 = [v4 objectForKeyedSubscript:v36];
  [(INIntentCodableDescription *)self _setKeyAttributeName:v37];

  v38 = objc_msgSend((id)objc_opt_class(), "__VerbAssociationsKey");
  uint64_t v39 = [v4 objectForKeyedSubscript:v38];
  v40 = (void *)v39;
  if (v39) {
    uint64_t v41 = v39;
  }
  else {
    uint64_t v41 = MEMORY[0x1E4F1CBF0];
  }
  [(INIntentCodableDescription *)self setEntityVerbs:v41];

  v42 = objc_msgSend((id)objc_opt_class(), "__EntityKey");
  v43 = [v4 objectForKeyedSubscript:v42];
  [(INCodableDescription *)self setSemanticRoot:v43];

  v44 = objc_msgSend((id)objc_opt_class(), "__HashKey");
  v45 = [v4 objectForKeyedSubscript:v44];
  [(INIntentCodableDescription *)self setVersioningHash:v45];

  v46 = objc_msgSend((id)objc_opt_class(), "__PhrasesKey");
  v47 = [v4 objectForKey:v46];

  if (v47)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v48 = v47;
    }
    else {
      v48 = 0;
    }
  }
  else
  {
    v48 = 0;
  }
  id v49 = v48;

  if ([v49 count])
  {
    v59 = v10;
    id v60 = v4;
    v50 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v51 = v49;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v62 != v54) {
            objc_enumerationMutation(v51);
          }
          uint64_t v56 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v57 = objc_alloc_init(INIntentCodablePhrase);
            [(INIntentCodablePhrase *)v57 _setCodableDescription:self];
            [(INIntentCodablePhrase *)v57 updateWithDictionary:v56];
            [(NSArray *)v50 if_addObjectIfNonNil:v57];
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v53);
    }

    phrases = self->_phrases;
    self->_phrases = v50;

    id v4 = v60;
    v10 = v59;
  }
}

- (void)setVersioningHash:(id)a3
{
}

- (void)setVerb:(id)a3
{
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  self->_userConfirmationRequired = a3;
}

- (void)setTitleLocID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setIntentCategory:(int64_t)a3
{
  self->_intentCategory = a3;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (void)setEntityVerbs:(id)a3
{
}

- (void)setEligibleForWidgets:(BOOL)a3
{
  self->_eligibleForWidgets = a3;
}

- (void)setEligibleForSuggestions:(BOOL)a3
{
  self->_eligibleForSuggestions = a3;
}

- (void)setDescriptiveTextLocID:(id)a3
{
}

- (void)setDescriptiveText:(id)a3
{
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (void)setDefaultImageName:(id)a3
{
}

- (void)setConfigurable:(BOOL)a3
{
  self->_configurable = a3;
}

- (void)_setKeyAttributeName:(id)a3
{
}

- (void)_setInputAttributeName:(id)a3
{
}

+ (id)__VerbAssociationsKey
{
  return @"INIntentVerbAssociations";
}

+ (id)__VerbKey
{
  return @"INIntentVerb";
}

+ (id)__UserConfirmationRequiredKey
{
  return @"INIntentUserConfirmationRequired";
}

+ (id)__TitleIDKey
{
  return @"INIntentTitleID";
}

+ (id)__TitleKey
{
  return @"INIntentTitle";
}

+ (id)__PhrasesKey
{
  return @"INIntentPhrases";
}

+ (id)__KeyParameterKey
{
  return @"INIntentKeyParameter";
}

+ (id)__InputKey
{
  return @"INIntentInput";
}

+ (id)__IneligibleForSuggestionsKey
{
  return @"INIntentIneligibleForSuggestions";
}

+ (id)__HashKey
{
  return @"INIntentHash";
}

+ (id)__ForegroundKey
{
  return @"INIntentForeground";
}

+ (id)__EntityKey
{
  return @"INIntentEntity";
}

+ (id)__EligibleForWidgetsKey
{
  return @"INIntentEligibleForWidgets";
}

+ (id)__DescriptionIDKey
{
  return @"INIntentDescriptionID";
}

+ (id)__DescriptionKey
{
  return @"INIntentDescription";
}

+ (id)__DeprecatedKey
{
  return @"INIntentDeprecated";
}

+ (id)__DefaultImageNameKey
{
  return @"INIntentDefaultImageName";
}

+ (id)__ConfigurableKey
{
  return @"INIntentConfigurable";
}

+ (id)__CategoryKey
{
  return @"INIntentCategory";
}

+ (id)_intentClassNameWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v5 = [v3 objectForKeyedSubscript:v4];

  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = NSString;
    v8 = objc_msgSend((id)objc_opt_class(), "__ClassPrefixKey");
    uint64_t v9 = [v3 objectForKeyedSubscript:v8];
    v10 = (void *)v9;
    if (v9) {
      objc_super v11 = (__CFString *)v9;
    }
    else {
      objc_super v11 = &stru_1EDA6DB28;
    }
    uint64_t v12 = objc_msgSend((id)objc_opt_class(), "__NameKey");
    v13 = [v3 objectForKey:v12];
    id v6 = [v7 stringWithFormat:@"%@%@Intent", v11, v13];
  }

  return v6;
}

+ (id)__ClassNameKey
{
  return @"INIntentClassName";
}

- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v8 = [(INIntentCodableDescription *)v7 attributes];
  uint64_t v9 = [v8 allValues];
  v10 = [v6 attributes];
  objc_super v11 = [v10 allValues];
  uint64_t v12 = [v9 arrayByAddingObjectsFromArray:v11];

  v13 = [(id)objc_opt_class() _calculateReferencedCodableDescriptionsFromAttributes:v12 usingTypes:v14];
  [(INRootCodableDescription *)v7 _setReferencedCodableDescriptions:v13];

  objc_sync_exit(v7);
}

+ (id)__ClassPrefixKey
{
  return @"INIntentClassPrefix";
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (NSString)defaultImageName
{
  return self->_defaultImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityVerbs, 0);
  objc_storeStrong((id *)&self->_versioningHash, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_verb, 0);
  objc_storeStrong((id *)&self->_defaultImageName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocID, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_titleLocID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyAttributeName, 0);

  objc_storeStrong((id *)&self->_inputAttributeName, 0);
}

+ (id)__Key
{
  return @"INIntent";
}

- (NSArray)entityVerbs
{
  return self->_entityVerbs;
}

- (void)setPhrases:(id)a3
{
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (BOOL)isEligibleForWidgets
{
  return self->_eligibleForWidgets;
}

- (BOOL)isEligibleForSuggestions
{
  return self->_eligibleForSuggestions;
}

- (BOOL)isConfigurable
{
  return self->_configurable;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (NSString)descriptiveTextLocID
{
  return self->_descriptiveTextLocID;
}

- (NSString)descriptiveText
{
  return self->_descriptiveText;
}

- (NSString)titleLocID
{
  return self->_titleLocID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)_keyAttributeName
{
  return self->_keyAttributeName;
}

- (NSString)_inputAttributeName
{
  return self->_inputAttributeName;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INIntentCodableDescription;
  id v4 = a3;
  [(INRootCodableDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_titleLocID forKey:@"titleLocID"];
  [v4 encodeObject:self->_descriptiveText forKey:@"descriptiveText"];
  [v4 encodeObject:self->_descriptiveTextLocID forKey:@"descriptiveTextLocID"];
  [v4 encodeObject:self->_verb forKey:@"verb"];
  [v4 encodeInteger:self->_intentCategory forKey:@"intentCategory"];
  [v4 encodeBool:self->_userConfirmationRequired forKey:@"userConfirmationRequired"];
  [v4 encodeObject:self->_defaultImageName forKey:@"defaultImageName"];
  [v4 encodeBool:self->_configurable forKey:@"configurable"];
  [v4 encodeBool:self->_foreground forKey:@"foreground"];
  [v4 encodeBool:self->_deprecated forKey:@"deprecated"];
  [v4 encodeBool:self->_eligibleForSuggestions forKey:@"eligibleForSuggestions"];
  [v4 encodeBool:self->_eligibleForWidgets forKey:@"eligibleForWidgets"];
  [v4 encodeObject:self->_inputAttributeName forKey:@"_inputAttributeName"];
  [v4 encodeObject:self->_keyAttributeName forKey:@"_keyAttributeName"];
  [v4 encodeObject:self->_entityVerbs forKey:@"entityVerbs"];
  [v4 encodeObject:self->_versioningHash forKey:@"versioningHash"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INIntentCodableDescription;
  id v15 = 0;
  uint64_t v7 = [(INRootCodableDescription *)&v14 widgetPlistableRepresentationWithParameters:v6 error:&v15];
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
    objc_super v11 = [(NSString *)self->_title intents_encodeForPlistRepresentationWithParameters:v6];
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, @"title");

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_titleLocID, @"titleLocID");
    uint64_t v12 = [(NSString *)self->_descriptiveText intents_encodeForPlistRepresentationWithParameters:v6];
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, @"descriptiveText");

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_descriptiveTextLocID, @"descriptiveTextLocID");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_verb, @"verb");
    objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_intentCategory, @"intentCategory");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_userConfirmationRequired, @"userConfirmationRequired");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_defaultImageName, @"defaultImageName");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_configurable, @"configurable");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_foreground, @"foreground");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_deprecated, @"deprecated");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_eligibleForSuggestions, @"eligibleForSuggestions");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_eligibleForWidgets, @"eligibleForWidgets");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_inputAttributeName, @"_inputAttributeName");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_keyAttributeName, @"_keyAttributeName");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_entityVerbs, @"entityVerbs");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_versioningHash, @"versioningHash");
    id v10 = v7;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);

  return v4;
}

- (int64_t)codableDescriptionType
{
  return 4;
}

- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v9 = [(INRootCodableDescription *)v7 referencedCodableDescriptions];
  id v10 = [v8 orderedSetWithArray:v9];

  objc_super v11 = [(INIntentCodableDescription *)v7 attributes];
  uint64_t v12 = [v11 allValues];
  v13 = [v6 attributes];
  objc_super v14 = [v13 allValues];
  id v15 = [v12 arrayByAddingObjectsFromArray:v14];

  v16 = [(id)objc_opt_class() _calculateReferencedCodableDescriptionsFromAttributes:v15 usingTypes:v18];
  [v10 addObjectsFromArray:v16];

  v17 = [v10 array];
  [(INRootCodableDescription *)v7 _setReferencedCodableDescriptions:v17];

  objc_sync_exit(v7);
}

- (void)_updateWithIntentCodableDescription:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 _localizationTable];
  [(INCodableDescription *)self _setCustomLocalizationTable:v5];

  id v6 = [v4 title];
  [(INIntentCodableDescription *)self setTitle:v6];

  uint64_t v7 = [v4 titleLocID];
  [(INIntentCodableDescription *)self setTitleLocID:v7];

  id v8 = [v4 descriptiveText];
  [(INIntentCodableDescription *)self setDescriptiveText:v8];

  uint64_t v9 = [v4 descriptiveTextLocID];
  [(INIntentCodableDescription *)self setDescriptiveTextLocID:v9];

  id v10 = [v4 defaultImageName];
  [(INIntentCodableDescription *)self setDefaultImageName:v10];

  if ([v4 isConfigurable])
  {
    objc_super v11 = [v4 inputAttribute];
    uint64_t v12 = [v11 propertyName];
    [(INIntentCodableDescription *)self _setInputAttributeName:v12];

    v13 = [v4 keyAttribute];
    objc_super v14 = [v13 propertyName];
    [(INIntentCodableDescription *)self _setKeyAttributeName:v14];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = [(INIntentCodableDescription *)self attributes];
  v17 = [v16 allValues];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v23 = [v22 propertyName];
        v24 = [v4 attributeByName:v23];

        objc_super v25 = [v24 displayName];
        [v22 setDisplayName:v25];

        v26 = [v24 displayNameID];
        [v22 setDisplayNameID:v26];

        if ([v22 supportsResolution]) {
          objc_msgSend(v22, "setSupportsResolution:", objc_msgSend(v24, "supportsResolution"));
        }
        objc_msgSend(v22, "setSupportsDynamicEnumeration:", objc_msgSend(v24, "supportsDynamicEnumeration"));
        v27 = [v24 metadata];
        [v22 setMetadata:v27];

        v28 = [v24 relationship];
        [v22 setRelationship:v28];

        v29 = [v24 displayPriorityRank];
        [v22 setDisplayPriorityRank:v29];

        v30 = [v22 displayPriorityRank];

        if (v30) {
          [v15 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }

  [v15 sortUsingComparator:&__block_literal_global_37459];
  [(INCodableDescription *)self setDisplayOrderedAttributes:v15];
  v31 = [v4 entityVerbs];
  [(INIntentCodableDescription *)self setEntityVerbs:v31];

  v32 = [v4 semanticRoot];
  [(INCodableDescription *)self setSemanticRoot:v32];
}

uint64_t __66__INIntentCodableDescription__updateWithIntentCodableDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 displayPriorityRank];
  id v6 = [v4 displayPriorityRank];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v97[18] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)INIntentCodableDescription;
  v77 = [(INCodableDescription *)&v94 dictionaryRepresentationWithLocalizer:v4];
  v88 = objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v96[0] = v88;
  uint64_t v5 = [(INCodableDescription *)self className];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v56 = (void *)v5;
  v97[0] = v5;
  v86 = objc_msgSend((id)objc_opt_class(), "__TitleKey");
  v96[1] = v86;
  uint64_t v7 = [(INIntentCodableDescription *)self localizedTitleWithLocalizer:v4];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v7;
  v97[1] = v7;
  v84 = objc_msgSend((id)objc_opt_class(), "__TitleIDKey");
  v96[2] = v84;
  uint64_t v9 = [(INIntentCodableDescription *)self titleLocID];
  id v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v54 = (void *)v9;
  v97[2] = v9;
  v82 = objc_msgSend((id)objc_opt_class(), "__DescriptionKey");
  v96[3] = v82;
  uint64_t v11 = [(INIntentCodableDescription *)self localizedDescriptiveTextWithLocalizer:v4];
  uint64_t v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v53 = (void *)v11;
  v97[3] = v11;
  v80 = objc_msgSend((id)objc_opt_class(), "__DescriptionIDKey");
  v96[4] = v80;
  uint64_t v13 = [(INIntentCodableDescription *)self descriptiveTextLocID];
  objc_super v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v52 = (void *)v13;
  v97[4] = v13;
  v78 = objc_msgSend((id)objc_opt_class(), "__VerbKey");
  v96[5] = v78;
  uint64_t v15 = [(INIntentCodableDescription *)self verb];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  id v51 = (void *)v15;
  v97[5] = v15;
  v76 = objc_msgSend((id)objc_opt_class(), "__CategoryKey");
  v96[6] = v76;
  int64_t v17 = [(INIntentCodableDescription *)self intentCategory];
  if ((unint64_t)(v17 - 1) > 0x13) {
    uint64_t v18 = @"unknown";
  }
  else {
    uint64_t v18 = off_1E551EA00[v17 - 1];
  }
  v85 = v8;
  v87 = v6;
  v75 = v18;
  v97[6] = v75;
  v74 = objc_msgSend((id)objc_opt_class(), "__DefaultImageNameKey");
  v96[7] = v74;
  uint64_t v19 = [(INIntentCodableDescription *)self defaultImageName];
  uint64_t v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v19;
  v97[7] = v19;
  v72 = objc_msgSend((id)objc_opt_class(), "__UserConfirmationRequiredKey");
  v96[8] = v72;
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntentCodableDescription userConfirmationRequired](self, "userConfirmationRequired"));
  v71 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  id v49 = (void *)v21;
  v97[8] = v21;
  v70 = objc_msgSend((id)objc_opt_class(), "__InputKey");
  v96[9] = v70;
  uint64_t v22 = [(INIntentCodableDescription *)self _inputAttributeName];
  v69 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v22;
  v97[9] = v22;
  v68 = objc_msgSend((id)objc_opt_class(), "__KeyParameterKey");
  v96[10] = v68;
  uint64_t v23 = [(INIntentCodableDescription *)self _keyAttributeName];
  v89 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v23;
  v97[10] = v23;
  uint64_t v67 = objc_msgSend((id)objc_opt_class(), "__ConfigurableKey");
  v96[11] = v67;
  v66 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntentCodableDescription isConfigurable](self, "isConfigurable"));
  v97[11] = v66;
  objc_super v65 = objc_msgSend((id)objc_opt_class(), "__ForegroundKey");
  v96[12] = v65;
  long long v64 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntentCodableDescription isForeground](self, "isForeground"));
  v97[12] = v64;
  long long v63 = objc_msgSend((id)objc_opt_class(), "__DeprecatedKey");
  v96[13] = v63;
  long long v62 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntentCodableDescription isDeprecated](self, "isDeprecated"));
  v97[13] = v62;
  long long v61 = objc_msgSend((id)objc_opt_class(), "__EntityKey");
  v96[14] = v61;
  uint64_t v24 = [(INCodableDescription *)self semanticRoot];
  objc_super v25 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = v20;
  v79 = v14;
  v81 = v12;
  v83 = v10;
  v46 = (void *)v24;
  v97[14] = v24;
  id v60 = objc_msgSend((id)objc_opt_class(), "__VerbAssociationsKey");
  v96[15] = v60;
  uint64_t v26 = [(INIntentCodableDescription *)self entityVerbs];
  v59 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v26;
  v97[15] = v26;
  v57 = objc_msgSend((id)objc_opt_class(), "__PhrasesKey");
  v96[16] = v57;
  v27 = [(INIntentCodableDescription *)self phrases];
  uint64_t v28 = [v27 count];

  if (!v28) {
    goto LABEL_38;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v30 = [(INIntentCodableDescription *)self phrases];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v91 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = [*(id *)(*((void *)&v90 + 1) + 8 * i) dictionaryRepresentationWithLocalizer:v4];
        objc_msgSend(v29, "if_addObjectIfNonNil:", v35);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v32);
  }

  if (v29)
  {
    int v36 = 0;
    v37 = v29;
  }
  else
  {
LABEL_38:
    v37 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v45);
    id v29 = 0;
    int v36 = 1;
  }
  v97[16] = v37;
  uint64_t v38 = objc_msgSend((id)objc_opt_class(), "__HashKey");
  v96[17] = v38;
  uint64_t v39 = [(INIntentCodableDescription *)self versioningHash];
  v40 = v39;
  if (!v39)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[17] = v40;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:18];
  v58 = objc_msgSend(v77, "if_dictionaryByAddingEntriesFromDictionary:", v41);

  if (!v39) {
  if (v36)
  }

  if (!v59) {
  if (!v25)
  }

  v42 = v89;
  if (!v89)
  {

    v42 = 0;
  }

  if (!v69) {
  if (!v71)
  }

  if (!v73) {
  if (!v16)
  }

  if (!v79) {
  if (!v81)
  }

  if (!v83) {
  if (!v85)
  }

  if (!v87) {
  v43 = objc_msgSend(v58, "if_dictionaryWithNonEmptyValues");
  }

  return v43;
}

- (id)_ignoredAttributeTags
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EDBA74F8];
}

- (id)localizedDescriptiveTextWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentCodableDescription *)self descriptiveTextLocID];
  id v6 = [(INIntentCodableDescription *)self descriptiveText];
  uint64_t v7 = [(INCodableDescription *)self _customLocalizationTable];
  if (v7)
  {
    id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  }
  else
  {
    uint64_t v9 = [(INCodableDescription *)self _localizationTable];
    id v8 = INLocalizedStringFromCodable(v5, v6, v9, v4, 0);
  }

  return v8;
}

- (NSString)localizedDescriptiveText
{
  id v3 = objc_opt_new();
  id v4 = [(INIntentCodableDescription *)self localizedDescriptiveTextWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)localizedTitleWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentCodableDescription *)self titleLocID];
  id v6 = [(INIntentCodableDescription *)self title];
  uint64_t v7 = [(INCodableDescription *)self _customLocalizationTable];
  if (v7)
  {
    id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  }
  else
  {
    uint64_t v9 = [(INCodableDescription *)self _localizationTable];
    id v8 = INLocalizedStringFromCodable(v5, v6, v9, v4, 0);
  }

  return v8;
}

- (NSString)localizedTitle
{
  id v3 = objc_opt_new();
  id v4 = [(INIntentCodableDescription *)self localizedTitleWithLocalizer:v3];

  return (NSString *)v4;
}

- (INCodableAttribute)keyAttribute
{
  id v3 = [(INIntentCodableDescription *)self _keyAttributeName];

  if (v3)
  {
    id v4 = [(INIntentCodableDescription *)self _keyAttributeName];
    uint64_t v5 = [(INCodableDescription *)self attributeByName:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (INCodableAttribute *)v5;
}

- (INCodableAttribute)inputAttribute
{
  id v3 = [(INIntentCodableDescription *)self _inputAttributeName];

  if (v3)
  {
    id v4 = [(INIntentCodableDescription *)self _inputAttributeName];
    uint64_t v5 = [(INCodableDescription *)self attributeByName:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (INCodableAttribute *)v5;
}

- (id)resolvableParameterCombinationsWithParameterCombinations:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v23 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [(INCodableDescription *)self attributeByName:*(void *)(*((void *)&v25 + 1) + 8 * j)];
              int v16 = [v15 supportsResolution];

              if (!v16)
              {
                char v17 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        char v17 = 0;
LABEL_16:

        uint64_t v18 = [v10 count];
        if ((v17 & 1) == 0 && v18)
        {
          uint64_t v19 = [v23 objectForKeyedSubscript:v10];
          [v22 setObject:v19 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  uint64_t v20 = (void *)[v22 copy];

  return v20;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___INIntentCodableDescription;
  id v25 = 0;
  uint64_t v7 = objc_msgSendSuper2(&v24, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v25);
  id v8 = v25;
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
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"title");
    [v7 setTitle:v11];

    uint64_t v12 = objc_msgSend(v6, "intents_stringForKey:", @"titleLocID");
    [v7 setTitleLocID:v12];

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"descriptiveText");
    [v7 setDescriptiveText:v13];

    objc_super v14 = objc_msgSend(v6, "intents_stringForKey:", @"descriptiveTextLocID");
    [v7 setDescriptiveTextLocID:v14];

    uint64_t v15 = objc_msgSend(v6, "intents_stringForKey:", @"verb");
    [v7 setVerb:v15];

    objc_msgSend(v7, "setIntentCategory:", objc_msgSend(v6, "intents_intForKey:", @"intentCategory"));
    objc_msgSend(v7, "setUserConfirmationRequired:", objc_msgSend(v6, "intents_BOOLForKey:", @"userConfirmationRequired"));
    int v16 = objc_msgSend(v6, "intents_stringForKey:", @"defaultImageName");
    [v7 setDefaultImageName:v16];

    objc_msgSend(v7, "setConfigurable:", objc_msgSend(v6, "intents_BOOLForKey:", @"configurable"));
    objc_msgSend(v7, "setForeground:", objc_msgSend(v6, "intents_BOOLForKey:", @"foreground"));
    objc_msgSend(v7, "setDeprecated:", objc_msgSend(v6, "intents_BOOLForKey:", @"deprecated"));
    objc_msgSend(v7, "setEligibleForSuggestions:", objc_msgSend(v6, "intents_BOOLForKey:", @"eligibleForSuggestions"));
    objc_msgSend(v7, "setEligibleForWidgets:", objc_msgSend(v6, "intents_BOOLForKey:", @"eligibleForWidgets"));
    char v17 = objc_msgSend(v6, "intents_stringForKey:", @"_inputAttributeName");
    [v7 _setInputAttributeName:v17];

    uint64_t v18 = objc_msgSend(v6, "intents_stringForKey:", @"_keyAttributeName");
    [v7 _setKeyAttributeName:v18];

    uint64_t v19 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"entityVerbs", objc_opt_class());
    uint64_t v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = MEMORY[0x1E4F1CBF0];
    }
    [v7 setEntityVerbs:v21];

    id v22 = objc_msgSend(v6, "intents_numberForKey:", @"versioningHash");
    [v7 setVersioningHash:v22];

    id v10 = v7;
  }

  return v10;
}

+ (id)__SummaryKey
{
  return @"INIntentSummary";
}

@end