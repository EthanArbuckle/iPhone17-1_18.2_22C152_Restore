@interface BRLTTable
- (BOOL)_isEqualToTable:(id)a3;
- (BOOL)isCustomBrailleTable;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsTranslationByCell;
- (BOOL)supportsTranslationMode8Dot;
- (BOOL)supportsTranslationModeContracted;
- (BRLTTable)initWithIdentifier:(id)a3;
- (BRLTTable)initWithServiceIdentifier:(id)a3 language:(id)a4 variant:(id)a5;
- (BRLTTable)initWithServiceIdentifier:(id)a3 tableIdentifier:(id)a4;
- (NSArray)replacements;
- (NSBundle)_bundle;
- (NSString)candidateSelectionLanguage;
- (NSString)identifier;
- (NSString)language;
- (NSString)localizedLanguage;
- (NSString)localizedName;
- (NSString)localizedNameWithService;
- (NSString)localizedService;
- (NSString)localizedVariant;
- (NSString)serviceIdentifier;
- (NSString)tableIdentifier;
- (NSString)variant;
- (id)_brailleTableDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)set_bundle:(id)a3;
@end

@implementation BRLTTable

- (BRLTTable)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRLTTable;
  v5 = [(BRLTTable *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "brl_serviceIdentifier");
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "brl_language");
    language = v5->_language;
    v5->_language = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "brl_variant");
    variant = v5->_variant;
    v5->_variant = (NSString *)v10;
  }
  return v5;
}

- (BRLTTable)initWithServiceIdentifier:(id)a3 tableIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "brl_language");
  v9 = objc_msgSend(v6, "brl_variant");

  uint64_t v10 = [(BRLTTable *)self initWithServiceIdentifier:v7 language:v8 variant:v9];
  return v10;
}

- (BRLTTable)initWithServiceIdentifier:(id)a3 language:(id)a4 variant:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRLTTable;
  v11 = [(BRLTTable *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    serviceIdentifier = v11->_serviceIdentifier;
    v11->_serviceIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    language = v11->_language;
    v11->_language = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    variant = v11->_variant;
    v11->_variant = (NSString *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[BRLTTable allocWithZone:a3] initWithServiceIdentifier:self->_serviceIdentifier language:self->_language variant:self->_variant];
  v5 = [(BRLTTable *)self _bundle];
  [(BRLTTable *)v4 set_bundle:v5];

  return v4;
}

- (NSString)identifier
{
  v3 = NSString;
  id v4 = [(BRLTTable *)self serviceIdentifier];
  v5 = [(BRLTTable *)self language];
  id v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  id v7 = [(BRLTTable *)self variant];

  if (v7)
  {
    id v8 = [(BRLTTable *)self variant];
    uint64_t v9 = [v6 stringByAppendingFormat:@"-%@", v8];

    id v6 = (void *)v9;
  }
  return (NSString *)v6;
}

- (NSString)tableIdentifier
{
  v3 = [(BRLTTable *)self language];
  id v4 = [(BRLTTable *)self variant];

  if (v4)
  {
    v5 = [(BRLTTable *)self variant];
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  return (NSString *)v3;
}

- (NSString)localizedName
{
  v3 = [(BRLTTable *)self _brailleTableDictionary];
  id v4 = [v3 objectForKey:@"identifierIsLanguage"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = [(BRLTTable *)self tableIdentifier];
    uint64_t v7 = BRLTLocalizedNameForLanguage(v6);
  }
  else
  {
    uint64_t v6 = [(BRLTTable *)self localizedVariant];
    if (v6)
    {
      id v8 = NSString;
      uint64_t v9 = BRLTLocalizedStringForKey(@"table.name.with.variant");
      id v10 = [(BRLTTable *)self localizedLanguage];
      v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, v6);

      goto LABEL_7;
    }
    uint64_t v7 = [(BRLTTable *)self localizedLanguage];
  }
  v11 = (void *)v7;
LABEL_7:

  return (NSString *)v11;
}

- (NSString)localizedNameWithService
{
  v3 = [(BRLTTable *)self _brailleTableDictionary];
  id v4 = [v3 objectForKey:@"identifierIsLanguage"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = BRLTLocalizedStringForKey(@"table.name.with.service");
    id v8 = [(BRLTTable *)self tableIdentifier];
    uint64_t v9 = BRLTLocalizedNameForLanguage(v8);
    id v10 = [(BRLTTable *)self localizedService];
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v9, v10, v15);
  }
  else
  {
    uint64_t v7 = [(BRLTTable *)self localizedVariant];
    v11 = NSString;
    if (v7)
    {
      id v8 = BRLTLocalizedStringForKey(@"table.name.with.variant.and.service");
      uint64_t v9 = [(BRLTTable *)self localizedLanguage];
      id v10 = [(BRLTTable *)self localizedService];
      uint64_t v14 = v7;
      v15 = v10;
    }
    else
    {
      id v8 = BRLTLocalizedStringForKey(@"table.name.with.service");
      uint64_t v9 = [(BRLTTable *)self localizedLanguage];
      id v10 = [(BRLTTable *)self localizedService];
      uint64_t v14 = v10;
    }
    objc_msgSend(v11, "localizedStringWithFormat:", v8, v9, v14, v15);
  uint64_t v12 = };

  return (NSString *)v12;
}

- (NSString)localizedService
{
  v2 = [(BRLTTable *)self serviceIdentifier];
  v3 = BRLTLocalizedStringForKey(v2);

  return (NSString *)v3;
}

- (NSString)localizedLanguage
{
  v3 = [(BRLTTable *)self _bundle];
  id v4 = [v3 localizedInfoDictionary];
  int v5 = [(BRLTTable *)self language];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (![v6 length])
  {
    uint64_t v7 = [(BRLTTable *)self language];
    id v8 = BRLTLocalizedNameForLanguage(v7);

    uint64_t v9 = BRLTLocalizedStringForKey(v8);

    uint64_t v6 = (void *)v9;
  }
  return (NSString *)v6;
}

- (NSString)localizedVariant
{
  v3 = [(BRLTTable *)self variant];
  uint64_t v4 = [v3 length];

  if (!v4) {
    goto LABEL_11;
  }
  if (_os_feature_enabled_impl())
  {
    int v5 = [(BRLTTable *)self variant];
    int v6 = [v5 isEqualToString:@"g1"];

    if (v6)
    {
      uint64_t v7 = @"variant.g1";
LABEL_9:
      uint64_t v12 = BRLTLocalizedStringForKey(v7);
      goto LABEL_25;
    }
    id v8 = [(BRLTTable *)self variant];
    int v9 = [v8 isEqualToString:@"g2"];

    if (v9)
    {
      uint64_t v7 = @"variant.g2";
      goto LABEL_9;
    }
    id v10 = [(BRLTTable *)self variant];
    int v11 = [v10 isEqualToString:@"8dot"];

    if (v11)
    {
      uint64_t v7 = @"variant.8dot";
      goto LABEL_9;
    }
    objc_super v13 = [(BRLTTable *)self variant];
    int v14 = [v13 isEqualToString:@"6dot"];

    if (v14)
    {
LABEL_11:
      uint64_t v12 = 0;
      goto LABEL_25;
    }
  }
  v15 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"_"];
  uint64_t v16 = [(BRLTTable *)self variant];
  uint64_t v17 = [v16 rangeOfCharacterFromSet:v15 options:4];

  v18 = [(BRLTTable *)self variant];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v19 = 0;
  }
  else
  {
    v20 = [(BRLTTable *)self variant];
    uint64_t v21 = [v20 substringToIndex:v17];

    v22 = [(BRLTTable *)self variant];
    objc_super v19 = [v22 substringFromIndex:v17 + 1];

    v18 = (void *)v21;
  }
  v23 = NSString;
  v24 = [(BRLTTable *)self language];
  v25 = [v23 stringWithFormat:@"%@.%@.variant", v24, v18];

  uint64_t v12 = BRLTLocalizedStringForKey(v25);
  if ([v19 isEqualToString:@"g1"])
  {
    v26 = NSString;
    v27 = @"variant.name.g1";
LABEL_23:
    v28 = BRLTLocalizedStringForKey(v27);
    uint64_t v29 = objc_msgSend(v26, "stringWithFormat:", v28, v12);

    uint64_t v12 = (void *)v29;
    goto LABEL_24;
  }
  if ([v19 isEqualToString:@"g2"])
  {
    v26 = NSString;
    v27 = @"variant.name.g2";
    goto LABEL_23;
  }
  if ([v19 isEqualToString:@"8dot"])
  {
    v26 = NSString;
    v27 = @"variant.name.8dot";
    goto LABEL_23;
  }
  if ([v19 isEqualToString:@"computer"])
  {
    v26 = NSString;
    v27 = @"variant.name.computer";
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  return (NSString *)v12;
}

- (BOOL)supportsTranslationModeContracted
{
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"supportsContraction"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = [v4 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTranslationMode8Dot
{
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"supports8dot"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = [v4 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSArray)replacements
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"replacements"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v20 = v3;
      char v7 = objc_opt_new();
      id v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"."];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      objc_super v19 = v4;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v14 rangeOfCharacterFromSet:v8 options:4] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = NSString;
              uint64_t v16 = [(BRLTTable *)self serviceIdentifier];
              uint64_t v17 = [v15 stringWithFormat:@"%@.%@", v16, v14];
              [v7 addObject:v17];
            }
            else
            {
              [v7 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }

      uint64_t v4 = v19;
      v3 = v20;
    }
    else
    {
      char v7 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    char v7 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v7;
}

- (BOOL)isCustomBrailleTable
{
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"customBraille"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = [v4 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTranslationByCell
{
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"supportsTranslationByCell"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = [v4 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)candidateSelectionLanguage
{
  v2 = [(BRLTTable *)self _brailleTableDictionary];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"candidateSelectionLanguage"];
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = v4;
    }
    else {
      char v7 = &stru_26CCBD108;
    }
  }
  else
  {
    char v7 = &stru_26CCBD108;
  }

  return (NSString *)v7;
}

- (id)_brailleTableDictionary
{
  v3 = [(BRLTTable *)self _bundle];
  uint64_t v4 = [(BRLTTable *)self identifier];
  int v5 = [v3 bundleIdentifier];
  int v6 = v5;
  if (v5)
  {
    char v7 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
  }
  else
  {
    char v7 = 0;
  }
  id v8 = [v3 objectForInfoDictionaryKey:@"BrailleTables"];
  id v9 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v14 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = [v8 objectForKey:v7];
  uint64_t v12 = self;
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
LABEL_10:
    id v14 = v11;
    uint64_t v11 = v14;
    goto LABEL_11;
  }
  id v14 = 0;
LABEL_11:

LABEL_12:
  return v14;
}

- (NSBundle)_bundle
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_bundle = &self->_bundle;
  bundle = self->_bundle;
  if (!bundle)
  {
    +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v15 = long long v19 = 0u;
    int v5 = [v15 translatorBundles];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v10 bundleIdentifier];
          uint64_t v12 = [(BRLTTable *)self serviceIdentifier];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            objc_storeStrong((id *)p_bundle, v10);
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    bundle = *p_bundle;
  }
  return bundle;
}

- (BOOL)_isEqualToTable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRLTTable *)self serviceIdentifier];
  uint64_t v6 = [v4 serviceIdentifier];
  if (v5 | v6 && ![(id)v5 isEqualToString:v6])
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v7 = [(BRLTTable *)self language];
    uint64_t v8 = [v4 language];
    if (v7 | v8 && ![(id)v7 isEqualToString:v8])
    {
      char v11 = 0;
    }
    else
    {
      uint64_t v9 = [(BRLTTable *)self variant];
      uint64_t v10 = [v4 variant];
      if (v9 | v10) {
        char v11 = [(id)v9 isEqualToString:v10];
      }
      else {
        char v11 = 1;
      }
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRLTTable;
  if ([(BRLTTable *)&v7 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRLTTable *)self _isEqualToTable:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(BRLTTable *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)BRLTTable;
  id v4 = [(BRLTTable *)&v10 description];
  BOOL v5 = [(BRLTTable *)self serviceIdentifier];
  uint64_t v6 = [(BRLTTable *)self language];
  objc_super v7 = [(BRLTTable *)self variant];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ service:%@ lang:%@ variant:%@>", v4, v5, v6, v7];

  return v8;
}

- (void)set_bundle:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end