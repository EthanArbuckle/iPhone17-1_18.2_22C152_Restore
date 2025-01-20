@interface ATXPosterDescriptorGalleryOptions
+ (BOOL)supportsSecureCoding;
+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3 error:(id *)a4;
- (ATXComplication)inlineComplication;
- (ATXPosterDescriptorGalleryOptions)init;
- (ATXPosterDescriptorGalleryOptions)initWithCoder:(id)a3;
- (BOOL)allowsSystemSuggestedComplications;
- (BOOL)allowsSystemSuggestedComplicationsInLandscape;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPosterDescriptorGalleryOptions:(id)a3;
- (BOOL)isHero;
- (BOOL)isOnlyEligibleForMadeForFocusSection;
- (BOOL)shouldShowAsShuffleStack;
- (NSArray)modularComplications;
- (NSArray)modularLandscapeComplications;
- (NSDictionary)dictionaryRepresentation;
- (NSString)descriptiveTextLocalizationKey;
- (NSString)displayNameLocalizationKey;
- (NSString)spokenNameLocalizationKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)preferredComplications;
- (id)preferredInlineComplication;
- (int64_t)featuredConfidenceLevel;
- (int64_t)focus;
- (int64_t)photoSubtype;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsSystemSuggestedComplications:(BOOL)a3;
- (void)setAllowsSystemSuggestedComplicationsInLandscape:(BOOL)a3;
- (void)setDescriptiveTextLocalizationKey:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setFeaturedConfidenceLevel:(int64_t)a3;
- (void)setFocus:(int64_t)a3;
- (void)setHero:(BOOL)a3;
- (void)setInlineComplication:(id)a3;
- (void)setModularComplications:(id)a3;
- (void)setModularLandscapeComplications:(id)a3;
- (void)setOnlyEligibleForMadeForFocusSection:(BOOL)a3;
- (void)setPhotoSubtype:(int64_t)a3;
- (void)setPreferredComplications:(id)a3;
- (void)setPreferredInlineComplication:(id)a3;
- (void)setShouldShowAsShuffleStack:(BOOL)a3;
- (void)setSpokenNameLocalizationKey:(id)a3;
@end

@implementation ATXPosterDescriptorGalleryOptions

- (ATXPosterDescriptorGalleryOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXPosterDescriptorGalleryOptions;
  result = [(ATXPosterDescriptorGalleryOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_allowsSystemSuggestedComplications = 257;
    result->_featuredConfidenceLevel = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = objc_opt_new();
  id v4 = [NSString alloc];
  v5 = [(ATXPosterDescriptorGalleryOptions *)self modularComplications];
  v6 = (void *)[v4 initWithFormat:@"modularComplications: %@", v5];
  [v3 addObject:v6];

  id v7 = [NSString alloc];
  v8 = [(ATXPosterDescriptorGalleryOptions *)self modularLandscapeComplications];
  v9 = (void *)[v7 initWithFormat:@"modularLandscapeComplications: %@", v8];
  [v3 addObject:v9];

  id v10 = [NSString alloc];
  v11 = [(ATXPosterDescriptorGalleryOptions *)self inlineComplication];
  v12 = (void *)[v10 initWithFormat:@"inlineComplication: %@", v11];
  [v3 addObject:v12];

  id v13 = [NSString alloc];
  if ([(ATXPosterDescriptorGalleryOptions *)self allowsSystemSuggestedComplications])
  {
    v14 = @"YES";
  }
  else
  {
    v14 = @"NO";
  }
  v15 = (void *)[v13 initWithFormat:@"allowsSystemSuggestedComplications: %@", v14];
  [v3 addObject:v15];

  id v16 = [NSString alloc];
  if ([(ATXPosterDescriptorGalleryOptions *)self allowsSystemSuggestedComplicationsInLandscape])
  {
    v17 = @"YES";
  }
  else
  {
    v17 = @"NO";
  }
  v18 = (void *)[v16 initWithFormat:@"allowsSystemSuggestedComplicationsInLandscape: %@", v17];
  [v3 addObject:v18];

  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"featuredConfidenceLevel: %zd", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"));
  [v3 addObject:v19];

  id v20 = [NSString alloc];
  v21 = [(ATXPosterDescriptorGalleryOptions *)self displayNameLocalizationKey];
  v22 = (void *)[v20 initWithFormat:@"displayNameLocalizationKey: %@", v21];
  [v3 addObject:v22];

  id v23 = [NSString alloc];
  v24 = [(ATXPosterDescriptorGalleryOptions *)self spokenNameLocalizationKey];
  v25 = (void *)[v23 initWithFormat:@"spokenNameLocalizationKey: %@", v24];
  [v3 addObject:v25];

  id v26 = [NSString alloc];
  v27 = [(ATXPosterDescriptorGalleryOptions *)self descriptiveTextLocalizationKey];
  v28 = (void *)[v26 initWithFormat:@"descriptiveTextLocalizationKey: %@", v27];
  [v3 addObject:v28];

  id v29 = [NSString alloc];
  if ([(ATXPosterDescriptorGalleryOptions *)self isHero]) {
    v30 = @"YES";
  }
  else {
    v30 = @"NO";
  }
  v31 = (void *)[v29 initWithFormat:@"hero: %@", v30];
  [v3 addObject:v31];

  id v32 = [NSString alloc];
  if ([(ATXPosterDescriptorGalleryOptions *)self shouldShowAsShuffleStack]) {
    v33 = @"YES";
  }
  else {
    v33 = @"NO";
  }
  v34 = (void *)[v32 initWithFormat:@"shouldShowAsShuffleStack: %@", v33];
  [v3 addObject:v34];

  v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"photoSubtype: %zd", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"));
  [v3 addObject:v35];

  v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"focus: %zd", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"));
  [v3 addObject:v36];

  id v37 = [NSString alloc];
  if ([(ATXPosterDescriptorGalleryOptions *)self isOnlyEligibleForMadeForFocusSection])
  {
    v38 = @"YES";
  }
  else
  {
    v38 = @"NO";
  }
  v39 = (void *)[v37 initWithFormat:@"isOnlyEligibleForMadeForFocusSection: %@", v38];
  [v3 addObject:v39];

  id v40 = [NSString alloc];
  v41 = [v3 componentsJoinedByString:@", "];
  v42 = (void *)[v40 initWithFormat:@"<ATXPosterDescriptorGalleryOptions: %@>", v41];

  return v42;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterDescriptorGalleryOptions)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (ATXPosterDescriptorGalleryOptions *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"modularComplications"];

  if (!v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v12 = [v10 setWithArray:v11];
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"preferredComplications"];

    v9 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_21);
  }
  [(ATXPosterDescriptorGalleryOptions *)v5 setModularComplications:v9];
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v16 = [v14 setWithArray:v15];
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"modularLandscapeComplications"];

  [(ATXPosterDescriptorGalleryOptions *)v5 setModularLandscapeComplications:v17];
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inlineComplication"];
  if (!v18)
  {
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredInlineComplication"];
    id v20 = v19;
    if (v19)
    {
      v18 = ATXComplicationFromCHSWidget(v19);
    }
    else
    {
      v18 = 0;
    }
  }
  [(ATXPosterDescriptorGalleryOptions *)v5 setInlineComplication:v18];
  if ([v4 containsValueForKey:@"allowsSystemSuggestedComplications"]) {
    -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplications:](v5, "setAllowsSystemSuggestedComplications:", [v4 decodeBoolForKey:@"allowsSystemSuggestedComplications"]);
  }
  if ([v4 containsValueForKey:@"allowsSystemSuggestedComplicationsInLandscape"]) {
    -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplicationsInLandscape:](v5, "setAllowsSystemSuggestedComplicationsInLandscape:", [v4 decodeBoolForKey:@"allowsSystemSuggestedComplicationsInLandscape"]);
  }
  if ([v4 containsValueForKey:@"featuredConfidenceLevel"]) {
    -[ATXPosterDescriptorGalleryOptions setFeaturedConfidenceLevel:](v5, "setFeaturedConfidenceLevel:", [v4 decodeIntegerForKey:@"featuredConfidenceLevel"]);
  }
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocalizationKey"];
  [(ATXPosterDescriptorGalleryOptions *)v5 setDisplayNameLocalizationKey:v21];

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spokenNameLocalizationKey"];
  [(ATXPosterDescriptorGalleryOptions *)v5 setSpokenNameLocalizationKey:v22];

  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptiveTextLocalizationKey"];
  [(ATXPosterDescriptorGalleryOptions *)v5 setDescriptiveTextLocalizationKey:v23];

  -[ATXPosterDescriptorGalleryOptions setHero:](v5, "setHero:", [v4 decodeBoolForKey:@"hero"]);
  if ([v4 containsValueForKey:@"blankTemplate"]) {
    -[ATXPosterDescriptorGalleryOptions setHero:](v5, "setHero:", [v4 decodeBoolForKey:@"blankTemplate"]);
  }
  -[ATXPosterDescriptorGalleryOptions setShouldShowAsShuffleStack:](v5, "setShouldShowAsShuffleStack:", [v4 decodeBoolForKey:@"shouldShowAsShuffleStack"]);
  -[ATXPosterDescriptorGalleryOptions setPhotoSubtype:](v5, "setPhotoSubtype:", [v4 decodeIntegerForKey:@"photoSubtype"]);
  -[ATXPosterDescriptorGalleryOptions setFocus:](v5, "setFocus:", [v4 decodeIntegerForKey:@"focus"]);
  -[ATXPosterDescriptorGalleryOptions setOnlyEligibleForMadeForFocusSection:](v5, "setOnlyEligibleForMadeForFocusSection:", [v4 decodeBoolForKey:@"onlyEligibleForMadeForFocusSection"]);

  return v5;
}

ATXComplication *__51__ATXPosterDescriptorGalleryOptions_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return ATXComplicationFromCHSWidget(a2);
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ATXPosterDescriptorGalleryOptions *)self modularComplications];
  [v10 encodeObject:v4 forKey:@"modularComplications"];

  v5 = [(ATXPosterDescriptorGalleryOptions *)self modularLandscapeComplications];
  [v10 encodeObject:v5 forKey:@"modularLandscapeComplications"];

  v6 = [(ATXPosterDescriptorGalleryOptions *)self inlineComplication];
  [v10 encodeObject:v6 forKey:@"inlineComplication"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications"), @"allowsSystemSuggestedComplications");
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"), @"allowsSystemSuggestedComplicationsInLandscape");
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"), @"featuredConfidenceLevel");
  id v7 = [(ATXPosterDescriptorGalleryOptions *)self displayNameLocalizationKey];
  [v10 encodeObject:v7 forKey:@"displayNameLocalizationKey"];

  v8 = [(ATXPosterDescriptorGalleryOptions *)self spokenNameLocalizationKey];
  [v10 encodeObject:v8 forKey:@"spokenNameLocalizationKey"];

  v9 = [(ATXPosterDescriptorGalleryOptions *)self descriptiveTextLocalizationKey];
  [v10 encodeObject:v9 forKey:@"descriptiveTextLocalizationKey"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"), @"hero");
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"), @"shouldShowAsShuffleStack");
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"), @"photoSubtype");
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"), @"onlyEligibleForMadeForFocusSection");
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"), @"focus");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ATXPosterDescriptorGalleryOptions allocWithZone:a3] init];
  v5 = [(ATXPosterDescriptorGalleryOptions *)self modularComplications];
  [(ATXPosterDescriptorGalleryOptions *)v4 setModularComplications:v5];

  v6 = [(ATXPosterDescriptorGalleryOptions *)self modularLandscapeComplications];
  [(ATXPosterDescriptorGalleryOptions *)v4 setModularLandscapeComplications:v6];

  id v7 = [(ATXPosterDescriptorGalleryOptions *)self inlineComplication];
  [(ATXPosterDescriptorGalleryOptions *)v4 setInlineComplication:v7];

  [(ATXPosterDescriptorGalleryOptions *)v4 setAllowsSystemSuggestedComplications:[(ATXPosterDescriptorGalleryOptions *)self allowsSystemSuggestedComplications]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setAllowsSystemSuggestedComplicationsInLandscape:[(ATXPosterDescriptorGalleryOptions *)self allowsSystemSuggestedComplicationsInLandscape]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setFeaturedConfidenceLevel:[(ATXPosterDescriptorGalleryOptions *)self featuredConfidenceLevel]];
  v8 = [(ATXPosterDescriptorGalleryOptions *)self displayNameLocalizationKey];
  [(ATXPosterDescriptorGalleryOptions *)v4 setDisplayNameLocalizationKey:v8];

  v9 = [(ATXPosterDescriptorGalleryOptions *)self spokenNameLocalizationKey];
  [(ATXPosterDescriptorGalleryOptions *)v4 setSpokenNameLocalizationKey:v9];

  id v10 = [(ATXPosterDescriptorGalleryOptions *)self descriptiveTextLocalizationKey];
  [(ATXPosterDescriptorGalleryOptions *)v4 setDescriptiveTextLocalizationKey:v10];

  [(ATXPosterDescriptorGalleryOptions *)v4 setHero:[(ATXPosterDescriptorGalleryOptions *)self isHero]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setShouldShowAsShuffleStack:[(ATXPosterDescriptorGalleryOptions *)self shouldShowAsShuffleStack]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setPhotoSubtype:[(ATXPosterDescriptorGalleryOptions *)self photoSubtype]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setFocus:[(ATXPosterDescriptorGalleryOptions *)self focus]];
  [(ATXPosterDescriptorGalleryOptions *)v4 setOnlyEligibleForMadeForFocusSection:[(ATXPosterDescriptorGalleryOptions *)self isOnlyEligibleForMadeForFocusSection]];
  return v4;
}

+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = [v5 objectForKeyedSubscript:@"modularComplications"];
  objc_opt_class();
  v45 = v7;
  if (objc_opt_isKindOfClass())
  {
    v43 = v6;
    v46 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = +[ATXComplication complicationFromDictionaryRepresentation:v13 error:a4];
            id v15 = (id)v14;
            if (*a4)
            {
              id v26 = 0;
              v6 = v43;
              id v7 = v45;
              goto LABEL_62;
            }
            if (v14) {
              [v46 addObject:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v16 = (void *)[v46 copy];
    v6 = v43;
    [v43 setModularComplications:v16];

    id v7 = v45;
  }
  v17 = [v5 objectForKeyedSubscript:@"modularLandscapeComplications"];
  objc_opt_class();
  v46 = v17;
  if (objc_opt_isKindOfClass())
  {
    id v41 = v5;
    id v8 = (id)objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v15 = v17;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = +[ATXComplication complicationFromDictionaryRepresentation:v22 error:a4];
            v24 = (void *)v23;
            if (*a4)
            {
              id v26 = 0;
              id v5 = v41;
              goto LABEL_61;
            }
            if (v23) {
              [v8 addObject:v23];
            }
          }
        }
        uint64_t v19 = [v15 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v25 = (void *)[v8 copy];
    [v6 setModularLandscapeComplications:v25];

    id v5 = v41;
    id v7 = v45;
  }
  id v8 = [v5 objectForKeyedSubscript:@"inlineComplication"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = +[ATXComplication complicationFromDictionaryRepresentation:v8 error:a4];
    if (*a4)
    {
      id v26 = 0;
      goto LABEL_62;
    }
    [v6 setInlineComplication:v15];
  }
  id v15 = [v5 objectForKeyedSubscript:@"allowsSystemSuggestedComplications"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAllowsSystemSuggestedComplications:", objc_msgSend(v15, "BOOLValue"));
  }
  v24 = [v5 objectForKeyedSubscript:@"allowsSystemSuggestedComplicationsInLandscape"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAllowsSystemSuggestedComplicationsInLandscape:", objc_msgSend(v24, "BOOLValue"));
  }
  v27 = [v5 objectForKeyedSubscript:@"featuredConfidenceLevel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setFeaturedConfidenceLevel:", objc_msgSend(v27, "integerValue"));
  }
  uint64_t v28 = [v5 objectForKeyedSubscript:@"displayNameLocalizationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setDisplayNameLocalizationKey:v28];
  }
  uint64_t v29 = [v5 objectForKeyedSubscript:@"spokenNameLocalizationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setSpokenNameLocalizationKey:v29];
  }
  uint64_t v30 = [v5 objectForKeyedSubscript:@"descriptiveTextLocalizationKey"];
  objc_opt_class();
  v44 = (void *)v30;
  if (objc_opt_isKindOfClass()) {
    [v6 setDescriptiveTextLocalizationKey:v30];
  }
  v31 = [v5 objectForKeyedSubscript:@"hero"];
  objc_opt_class();
  v38 = v31;
  v39 = (void *)v29;
  id v40 = (void *)v28;
  v42 = v27;
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v6, "setHero:", objc_msgSend(v31, "BOOLValue"));
  }
  else
  {
    id v32 = [v5 objectForKeyedSubscript:@"blankTemplate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setHero:", objc_msgSend(v32, "BOOLValue"));
    }
  }
  v33 = [v5 objectForKeyedSubscript:@"shouldShowAsShuffleStack"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setShouldShowAsShuffleStack:", objc_msgSend(v33, "BOOLValue"));
  }
  v34 = [v5 objectForKeyedSubscript:@"photoSubtype"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPhotoSubtype:", objc_msgSend(v34, "integerValue"));
  }
  v35 = [v5 objectForKeyedSubscript:@"focus"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setFocus:", objc_msgSend(v35, "integerValue"));
  }
  v36 = [v5 objectForKeyedSubscript:@"onlyEligibleForMadeForFocusSection"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setOnlyEligibleForMadeForFocusSection:", objc_msgSend(v36, "BOOLValue"));
  }
  id v26 = v6;

LABEL_61:
  id v7 = v45;

LABEL_62:

  return v26;
}

- (NSDictionary)dictionaryRepresentation
{
  v30[12] = *MEMORY[0x1E4F143B8];
  v29[0] = @"modularComplications";
  uint64_t v28 = [(ATXPosterDescriptorGalleryOptions *)self modularComplications];
  uint64_t v3 = objc_msgSend(v28, "_pas_mappedArrayWithTransform:", &__block_literal_global_126);
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v3;
  v30[0] = v3;
  v29[1] = @"modularLandscapeComplications";
  id v26 = [(ATXPosterDescriptorGalleryOptions *)self modularLandscapeComplications];
  uint64_t v5 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_129);
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = v6;
  v27 = v4;
  uint64_t v20 = (void *)v5;
  v30[1] = v5;
  v29[2] = @"inlineComplication";
  v24 = [(ATXPosterDescriptorGalleryOptions *)self inlineComplication];
  uint64_t v7 = [v24 dictionaryRepresentation];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[2] = v7;
  v29[3] = @"allowsSystemSuggestedComplications";
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications", v7));
  v30[3] = v23;
  v29[4] = @"allowsSystemSuggestedComplicationsInLandscape";
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"));
  v30[4] = v22;
  v29[5] = @"featuredConfidenceLevel";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"));
  v30[5] = v9;
  v29[6] = @"displayNameLocalizationKey";
  uint64_t v10 = [(ATXPosterDescriptorGalleryOptions *)self displayNameLocalizationKey];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v11;
  v29[7] = @"hero";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"));
  v30[7] = v12;
  v29[8] = @"shouldShowAsShuffleStack";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"));
  v30[8] = v13;
  v29[9] = @"photoSubtype";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"));
  v30[9] = v14;
  v29[10] = @"focus";
  id v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"));
  v30[10] = v15;
  v29[11] = @"onlyEligibleForMadeForFocusSection";
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"));
  v30[11] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  if (!v10) {
  if (!v8)
  }

  if (!v25) {
  if (!v27)
  }

  return (NSDictionary *)v17;
}

uint64_t __61__ATXPosterDescriptorGalleryOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __61__ATXPosterDescriptorGalleryOptions_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPosterDescriptorGalleryOptions *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPosterDescriptorGalleryOptions *)self isEqualToATXPosterDescriptorGalleryOptions:v5];

  return v6;
}

- (BOOL)isEqualToATXPosterDescriptorGalleryOptions:(id)a3
{
  id v4 = (id *)a3;
  modularComplications = self->_modularComplications;
  BOOL v6 = (NSArray *)v4[2];
  if (modularComplications == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = modularComplications;
    char v9 = [(NSArray *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_33:
      BOOL v35 = 0;
      goto LABEL_34;
    }
  }
  modularLandscapeComplications = self->_modularLandscapeComplications;
  uint64_t v11 = (NSArray *)v4[3];
  if (modularLandscapeComplications == v11)
  {
  }
  else
  {
    v12 = v11;
    uint64_t v13 = modularLandscapeComplications;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_33;
    }
  }
  inlineComplication = self->_inlineComplication;
  id v16 = (ATXComplication *)v4[4];
  if (inlineComplication == v16)
  {
  }
  else
  {
    v17 = v16;
    uint64_t v18 = inlineComplication;
    BOOL v19 = [(ATXComplication *)v18 isEqual:v17];

    if (!v19) {
      goto LABEL_33;
    }
  }
  if (self->_allowsSystemSuggestedComplications != *((unsigned __int8 *)v4 + 8)
    || self->_allowsSystemSuggestedComplicationsInLandscape != *((unsigned __int8 *)v4 + 9)
    || self->_featuredConfidenceLevel != v4[5])
  {
    goto LABEL_33;
  }
  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  v21 = (NSString *)v4[6];
  if (displayNameLocalizationKey == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    uint64_t v23 = displayNameLocalizationKey;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_33;
    }
  }
  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  id v26 = (NSString *)v4[7];
  if (spokenNameLocalizationKey == v26)
  {
  }
  else
  {
    v27 = v26;
    uint64_t v28 = spokenNameLocalizationKey;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_33;
    }
  }
  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  v31 = (NSString *)v4[8];
  if (descriptiveTextLocalizationKey == v31)
  {
  }
  else
  {
    id v32 = v31;
    v33 = descriptiveTextLocalizationKey;
    char v34 = [(NSString *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_33;
    }
  }
  if (self->_hero != *((unsigned __int8 *)v4 + 10)
    || self->_shouldShowAsShuffleStack != *((unsigned __int8 *)v4 + 11)
    || self->_photoSubtype != v4[9]
    || self->_focus != v4[10])
  {
    goto LABEL_33;
  }
  BOOL v35 = self->_onlyEligibleForMadeForFocusSection == *((unsigned __int8 *)v4 + 12);
LABEL_34:

  return v35;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_modularComplications hash];
  uint64_t v4 = [(NSArray *)self->_modularLandscapeComplications hash] - v3 + 32 * v3;
  unint64_t v5 = [(ATXComplication *)self->_inlineComplication hash];
  uint64_t v6 = self->_allowsSystemSuggestedComplications - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  uint64_t v7 = self->_allowsSystemSuggestedComplicationsInLandscape - v6 + 32 * v6;
  int64_t v8 = self->_featuredConfidenceLevel - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_displayNameLocalizationKey hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_spokenNameLocalizationKey hash] - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_descriptiveTextLocalizationKey hash];
  uint64_t v12 = self->_hero - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  uint64_t v13 = self->_shouldShowAsShuffleStack - v12 + 32 * v12;
  int64_t v14 = self->_photoSubtype - v13 + 32 * v13;
  int64_t v15 = self->_focus - v14 + 32 * v14;
  return self->_onlyEligibleForMadeForFocusSection - v15 + 32 * v15;
}

- (id)preferredComplications
{
  v2 = [(ATXPosterDescriptorGalleryOptions *)self modularComplications];
  uint64_t v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_132);

  return v3;
}

id __59__ATXPosterDescriptorGalleryOptions_preferredComplications__block_invoke(uint64_t a1, void *a2)
{
  return CHSWidgetFromATXComplication(a2);
}

- (void)setPreferredComplications:(id)a3
{
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_134);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXPosterDescriptorGalleryOptions *)self setModularComplications:v4];
}

ATXComplication *__63__ATXPosterDescriptorGalleryOptions_setPreferredComplications___block_invoke(uint64_t a1, void *a2)
{
  return ATXComplicationFromCHSWidget(a2);
}

- (id)preferredInlineComplication
{
  v2 = [(ATXPosterDescriptorGalleryOptions *)self inlineComplication];
  uint64_t v3 = CHSWidgetFromATXComplication(v2);

  return v3;
}

- (void)setPreferredInlineComplication:(id)a3
{
  ATXComplicationFromCHSWidget(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ATXPosterDescriptorGalleryOptions *)self setInlineComplication:v4];
}

- (NSArray)modularComplications
{
  return self->_modularComplications;
}

- (void)setModularComplications:(id)a3
{
}

- (NSArray)modularLandscapeComplications
{
  return self->_modularLandscapeComplications;
}

- (void)setModularLandscapeComplications:(id)a3
{
}

- (ATXComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (void)setInlineComplication:(id)a3
{
}

- (BOOL)allowsSystemSuggestedComplications
{
  return self->_allowsSystemSuggestedComplications;
}

- (void)setAllowsSystemSuggestedComplications:(BOOL)a3
{
  self->_allowsSystemSuggestedComplications = a3;
}

- (BOOL)allowsSystemSuggestedComplicationsInLandscape
{
  return self->_allowsSystemSuggestedComplicationsInLandscape;
}

- (void)setAllowsSystemSuggestedComplicationsInLandscape:(BOOL)a3
{
  self->_allowsSystemSuggestedComplicationsInLandscape = a3;
}

- (int64_t)featuredConfidenceLevel
{
  return self->_featuredConfidenceLevel;
}

- (void)setFeaturedConfidenceLevel:(int64_t)a3
{
  self->_featuredConfidenceLevel = a3;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (void)setSpokenNameLocalizationKey:(id)a3
{
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (void)setDescriptiveTextLocalizationKey:(id)a3
{
}

- (BOOL)isHero
{
  return self->_hero;
}

- (void)setHero:(BOOL)a3
{
  self->_hero = a3;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (void)setShouldShowAsShuffleStack:(BOOL)a3
{
  self->_shouldShowAsShuffleStack = a3;
}

- (int64_t)photoSubtype
{
  return self->_photoSubtype;
}

- (void)setPhotoSubtype:(int64_t)a3
{
  self->_photoSubtype = a3;
}

- (int64_t)focus
{
  return self->_focus;
}

- (void)setFocus:(int64_t)a3
{
  self->_focus = a3;
}

- (BOOL)isOnlyEligibleForMadeForFocusSection
{
  return self->_onlyEligibleForMadeForFocusSection;
}

- (void)setOnlyEligibleForMadeForFocusSection:(BOOL)a3
{
  self->_onlyEligibleForMadeForFocusSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_modularLandscapeComplications, 0);

  objc_storeStrong((id *)&self->_modularComplications, 0);
}

@end