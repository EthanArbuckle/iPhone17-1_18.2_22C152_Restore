@interface IPPronounValidator
+ (BOOL)canDisplayPronounPicker;
+ (BOOL)currentUILocaleSupportsPronounPicking;
+ (BOOL)languageSupportsPronounPicking:(id)a3;
+ (BOOL)shouldDisplayPronounPickerByDefault;
+ (id)initialPronounPickerLanguage;
+ (id)preferredPronounLocalizationForLanguage:(id)a3;
+ (id)supportedPronounLocalizations;
- (BOOL)pronounHasValidChars:(id)a3;
- (BOOL)pronounIsValidLength:(id)a3;
- (BOOL)userSuppliedPronouns:(id)a3 matchKnownPronouns:(id)a4;
- (IPPronounValidator)initWithLocale:(id)a3;
- (NSArray)displayedMorphologies;
- (NSArray)examplePlaceholders;
- (NSArray)exampleStrings;
- (NSArray)knownPronouns;
- (NSMutableArray)rememberedPronouns;
- (NSRegularExpression)validationRegex;
- (NSString)language;
- (NSString)propertyPreferenceName;
- (id)autofillPronouns:(id)a3;
- (id)morphologyFromString:(id)a3;
- (int64_t)maxPronounLength;
- (void)_clearUserEntries;
- (void)fillInMissingEntriesInArray:(id)a3 fromArray:(id)a4;
- (void)rememberUserEntry:(id)a3;
- (void)setDisplayedMorphologies:(id)a3;
- (void)setExamplePlaceholders:(id)a3;
- (void)setExampleStrings:(id)a3;
- (void)setKnownPronouns:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMaxPronounLength:(int64_t)a3;
- (void)setPropertyPreferenceName:(id)a3;
- (void)setRememberedPronouns:(id)a3;
- (void)setValidationRegex:(id)a3;
@end

@implementation IPPronounValidator

- (IPPronounValidator)initWithLocale:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)IPPronounValidator;
  v5 = [(IPPronounValidator *)&v50 init];
  if (v5)
  {
    if (v4)
    {
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = [v4 localeIdentifier];
      uint64_t v8 = +[IPPronounValidator preferredPronounLocalizationForLanguage:v7];
      v9 = (void *)v8;
      v10 = @"en";
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v11 = v10;

      uint64_t v12 = [NSString stringWithFormat:@"PronounInfo_%@", v11];
      v13 = (void *)MEMORY[0x263F08AC0];
      v14 = (void *)MEMORY[0x263EFF8F8];
      v44 = (void *)v12;
      v45 = v6;
      v15 = objc_msgSend(v6, "pathForResource:ofType:inDirectory:forLocalization:");
      v16 = [v14 dataWithContentsOfFile:v15];
      v17 = [v13 propertyListWithData:v16 options:0 format:0 error:0];

      v18 = (void *)MEMORY[0x263F08AE8];
      v19 = [v17 objectForKeyedSubscript:@"LegalCharactersRegex"];
      v20 = [v18 regularExpressionWithPattern:v19 options:0 error:0];
      [(IPPronounValidator *)v5 setValidationRegex:v20];

      v21 = [v17 objectForKeyedSubscript:@"MaxPronounLength"];
      -[IPPronounValidator setMaxPronounLength:](v5, "setMaxPronounLength:", (int)[v21 intValue]);

      v22 = [v17 objectForKeyedSubscript:@"KnownPronouns"];
      [(IPPronounValidator *)v5 setKnownPronouns:v22];

      v23 = [v17 objectForKeyedSubscript:@"ExampleStrings"];
      [(IPPronounValidator *)v5 setExampleStrings:v23];

      v24 = [v17 objectForKeyedSubscript:@"ExampleStringPlaceholders"];
      [(IPPronounValidator *)v5 setExamplePlaceholders:v24];

      v25 = [NSString stringWithFormat:@"RememberedPronouns_%@", v11];
      [(IPPronounValidator *)v5 setPropertyPreferenceName:v25];

      v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v27 = [(IPPronounValidator *)v5 propertyPreferenceName];
      v28 = [v26 arrayForKey:v27];
      v29 = (void *)[v28 mutableCopy];
      [(IPPronounValidator *)v5 setRememberedPronouns:v29];

      v30 = [(IPPronounValidator *)v5 rememberedPronouns];

      if (!v30)
      {
        v31 = [MEMORY[0x263EFF980] array];
        [(IPPronounValidator *)v5 setRememberedPronouns:v31];
      }
      [(IPPronounValidator *)v5 setLanguage:v11];
      v32 = [MEMORY[0x263EFF980] array];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v33 = [v17 objectForKeyedSubscript:@"DisplayedMorphologies"];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v47;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v47 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = [(IPPronounValidator *)v5 morphologyFromString:*(void *)(*((void *)&v46 + 1) + 8 * v37)];
            [v32 addObject:v38];

            ++v37;
          }
          while (v35 != v37);
          uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v35);
      }

      v39 = [MEMORY[0x263EFF8C0] arrayWithArray:v32];
      [(IPPronounValidator *)v5 setDisplayedMorphologies:v39];

      v40 = v45;
    }
    else
    {
      v41 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:&stru_26F10C080 options:0 error:0];
      [(IPPronounValidator *)v5 setValidationRegex:v41];

      [(IPPronounValidator *)v5 setMaxPronounLength:0];
      uint64_t v42 = MEMORY[0x263EFFA68];
      [(IPPronounValidator *)v5 setExampleStrings:MEMORY[0x263EFFA68]];
      [(IPPronounValidator *)v5 setExamplePlaceholders:v42];
      [(IPPronounValidator *)v5 setPropertyPreferenceName:&stru_26F10C080];
      v40 = [MEMORY[0x263EFF980] array];
      [(IPPronounValidator *)v5 setRememberedPronouns:v40];
    }
  }
  return v5;
}

- (id)morphologyFromString:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setGrammaticalPerson:3];
  v15 = v3;
  [v3 componentsSeparatedByString:@"-"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [&unk_26F10D528 objectForKeyedSubscript:v9];
        v11 = v10;
        if (v10) {
          objc_msgSend(v4, "setGrammaticalCase:", (int)objc_msgSend(v10, "intValue"));
        }
        uint64_t v12 = [&unk_26F10D550 objectForKeyedSubscript:v9];

        if (v12) {
          objc_msgSend(v4, "setDetermination:", (int)objc_msgSend(v12, "intValue"));
        }
        v13 = [&unk_26F10D578 objectForKeyedSubscript:v9];

        if (v13) {
          objc_msgSend(v4, "setGrammaticalPerson:", (int)objc_msgSend(v13, "intValue"));
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)pronounIsValidLength:(id)a3
{
  unint64_t v4 = [a3 length];
  return v4 <= [(IPPronounValidator *)self maxPronounLength];
}

- (BOOL)pronounHasValidChars:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  uint64_t v6 = [(IPPronounValidator *)self validationRegex];
  uint64_t v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  uint64_t v9 = v8;

  return !v7 && v5 == v9;
}

- (id)autofillPronouns:(id)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 mutableCopy];
  char v5 = _os_feature_enabled_impl();
  uint64_t v6 = [(IPPronounValidator *)self rememberedPronouns];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    v36[0] = v6;
    uint64_t v8 = [(IPPronounValidator *)self knownPronouns];
    v36[1] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  }
  else
  {
    uint64_t v35 = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v26 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              if ([(IPPronounValidator *)self userSuppliedPronouns:v4 matchKnownPronouns:v21])
              {
                [(IPPronounValidator *)self fillInMissingEntriesInArray:v4 fromArray:v21];
                id v22 = v4;

                goto LABEL_22;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = v24;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v22 = 0;
    }
    while (v12);
  }
  else
  {
    id v22 = 0;
  }
LABEL_22:

  return v22;
}

- (void)rememberUserEntry:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = objc_msgSend(v4, "pronouns", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
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
        uint64_t v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) pronoun];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(IPPronounValidator *)self rememberedPronouns];
  uint64_t v13 = [v12 indexOfObject:v5];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [(IPPronounValidator *)self rememberedPronouns];
    [v14 removeObjectAtIndex:v13];
  }
  v15 = [(IPPronounValidator *)self rememberedPronouns];
  [v15 insertObject:v5 atIndex:0];

  id v16 = [(IPPronounValidator *)self rememberedPronouns];
  unint64_t v17 = [v16 count];

  if (v17 >= 9)
  {
    uint64_t v18 = [(IPPronounValidator *)self rememberedPronouns];
    [v18 removeLastObject];
  }
  uint64_t v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  long long v20 = [(IPPronounValidator *)self rememberedPronouns];
  uint64_t v21 = [(IPPronounValidator *)self propertyPreferenceName];
  [v19 setObject:v20 forKey:v21];
}

- (void)_clearUserEntries
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [(IPPronounValidator *)self propertyPreferenceName];
  [v4 removeObjectForKey:v3];
}

- (BOOL)userSuppliedPronouns:(id)a3 matchKnownPronouns:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count] || !objc_msgSend(v5, "count")) {
    goto LABEL_10;
  }
  uint64_t v8 = 0;
  char v9 = 0;
  while (1)
  {
    id v10 = [v5 objectAtIndexedSubscript:v8];
    uint64_t v11 = [v6 objectAtIndexedSubscript:v8];
    if ([v10 length]) {
      break;
    }
LABEL_7:

    if (++v8 >= (unint64_t)[v5 count]) {
      goto LABEL_11;
    }
  }
  if ([v10 isEqualToString:v11])
  {
    char v9 = 1;
    goto LABEL_7;
  }

LABEL_10:
  char v9 = 0;
LABEL_11:

  return v9 & 1;
}

- (void)fillInMissingEntriesInArray:(id)a3 fromArray:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ([v10 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v10 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 length];

      if (!v8)
      {
        char v9 = [v5 objectAtIndexedSubscript:v6];
        [v10 setObject:v9 atIndexedSubscript:v6];
      }
      ++v6;
    }
    while (v6 < [v10 count]);
  }
}

+ (BOOL)canDisplayPronounPicker
{
  return 1;
}

+ (BOOL)shouldDisplayPronounPickerByDefault
{
  return 1;
}

+ (id)preferredPronounLocalizationForLanguage:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263EFF960];
    id v4 = a3;
    id v5 = +[IPPronounValidator supportedPronounLocalizations];
    v10[0] = v4;
    unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    uint64_t v7 = [v3 matchedLanguagesFromAvailableLanguages:v5 forPreferredLanguages:v6];

    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (id)supportedPronounLocalizations
{
  return &unk_26F10D5A0;
}

+ (BOOL)currentUILocaleSupportsPronounPicking
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 localeIdentifier];
  BOOL v4 = +[IPPronounValidator languageSupportsPronounPicking:v3];

  return v4;
}

+ (id)initialPronounPickerLanguage
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a1 currentUILocaleSupportsPronounPicking])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v2 = objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      unint64_t v6 = @"en";
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (+[IPPronounValidator languageSupportsPronounPicking:v8])
          {
            unint64_t v6 = v8;
            goto LABEL_14;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v6 = @"en";
    }
LABEL_14:
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

+ (BOOL)languageSupportsPronounPicking:(id)a3
{
  uint64_t v3 = +[IPPronounValidator preferredPronounLocalizationForLanguage:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSRegularExpression)validationRegex
{
  return self->_validationRegex;
}

- (void)setValidationRegex:(id)a3
{
}

- (int64_t)maxPronounLength
{
  return self->_maxPronounLength;
}

- (void)setMaxPronounLength:(int64_t)a3
{
  self->_maxPronounLength = a3;
}

- (NSArray)displayedMorphologies
{
  return self->_displayedMorphologies;
}

- (void)setDisplayedMorphologies:(id)a3
{
}

- (NSArray)exampleStrings
{
  return self->_exampleStrings;
}

- (void)setExampleStrings:(id)a3
{
}

- (NSArray)examplePlaceholders
{
  return self->_examplePlaceholders;
}

- (void)setExamplePlaceholders:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSMutableArray)rememberedPronouns
{
  return self->_rememberedPronouns;
}

- (void)setRememberedPronouns:(id)a3
{
}

- (NSArray)knownPronouns
{
  return self->_knownPronouns;
}

- (void)setKnownPronouns:(id)a3
{
}

- (NSString)propertyPreferenceName
{
  return self->_propertyPreferenceName;
}

- (void)setPropertyPreferenceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyPreferenceName, 0);
  objc_storeStrong((id *)&self->_knownPronouns, 0);
  objc_storeStrong((id *)&self->_rememberedPronouns, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_examplePlaceholders, 0);
  objc_storeStrong((id *)&self->_exampleStrings, 0);
  objc_storeStrong((id *)&self->_displayedMorphologies, 0);
  objc_storeStrong((id *)&self->_validationRegex, 0);
}

@end