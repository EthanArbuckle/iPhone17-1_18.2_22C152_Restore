@interface DUDefinitionDictionary
+ (id)displayNameForLanguageIdentifier:(id)a3 context:(int64_t)a4;
- (BOOL)_hasDefinitionForTerm:(id)a3;
- (BOOL)activated;
- (BOOL)isAppleDictionary;
- (BOOL)isTTYDictionary;
- (BOOL)needsDownloadNewerVersion;
- (DUDefinitionDictionary)initWithAsset:(id)a3;
- (MAAsset)rawAsset;
- (NSString)definitionLanguage;
- (NSString)localizedDictionaryName;
- (NSString)localizedLanguageName;
- (NSString)localizedSortName;
- (__DCSDictionary)dictionaryRef;
- (float)progress;
- (id)_definitionValueForTerm:(id)a3;
- (id)description;
- (int64_t)preferredOrder;
- (void)dealloc;
- (void)setActivated:(BOOL)a3;
- (void)setAssetToUpgrade:(id)a3;
- (void)setIsAppleDictionary:(BOOL)a3;
- (void)setIsTTYDictionary:(BOOL)a3;
- (void)setPreferredOrder:(int64_t)a3;
- (void)setProgress:(float)a3;
@end

@implementation DUDefinitionDictionary

- (DUDefinitionDictionary)initWithAsset:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DUDefinitionDictionary;
  v6 = [(DUDefinitionDictionary *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawAsset, a3);
    v8 = [(MAAsset *)v7->_rawAsset attributes];
    uint64_t v9 = [v8 objectForKey:@"Language"];
    definitionLanguage = v7->_definitionLanguage;
    v7->_definitionLanguage = (NSString *)v9;

    if ([(MAAsset *)v7->_rawAsset wasLocal])
    {
      v11 = [(MAAsset *)v7->_rawAsset attributes];
      [(MAAsset *)v7->_rawAsset getLocalFileUrl];
      v7->_dictionary = (__DCSDictionary *)DCSDictionaryCreateWithAssetAttributes();

      v7->_activated = 0;
    }
    v12 = [(MAAsset *)v7->_rawAsset attributes];
    v13 = [v12 objectForKeyedSubscript:@"DictionaryPackageName"];

    -[DUDefinitionDictionary setIsAppleDictionary:](v7, "setIsAppleDictionary:", [v13 isEqualToString:@"Apple Dictionary.dictionary"]);
    -[DUDefinitionDictionary setIsTTYDictionary:](v7, "setIsTTYDictionary:", [v13 isEqualToString:@"TTY Abbreviations Dictionary.dictionary"]);
  }
  return v7;
}

- (void)dealloc
{
  dictionary = self->_dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_dictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DUDefinitionDictionary;
  [(DUDefinitionDictionary *)&v4 dealloc];
}

- (void)setAssetToUpgrade:(id)a3
{
}

- (NSString)localizedLanguageName
{
  v2 = [(MAAsset *)self->_rawAsset attributes];
  v3 = [v2 objectForKey:@"IndexLanguages"];

  if ([v3 count])
  {
    objc_super v4 = objc_opt_class();
    id v5 = [v3 objectAtIndexedSubscript:0];
    v6 = [v4 displayNameForLanguageIdentifier:v5 context:3];

    if ([v3 count] == 1)
    {
      id v7 = v6;
    }
    else if ([v3 count] == 2)
    {
      v8 = objc_opt_class();
      uint64_t v9 = [v3 objectAtIndexedSubscript:1];
      v10 = [v8 displayNameForLanguageIdentifier:v9 context:5];

      id v7 = [NSString stringWithFormat:@"%@-%@", v6, v10];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)localizedSortName
{
  if ([(DUDefinitionDictionary *)self isAppleDictionary]
    || [(DUDefinitionDictionary *)self isTTYDictionary])
  {
    v3 = [(DUDefinitionDictionary *)self localizedDictionaryName];
  }
  else
  {
    v3 = [(DUDefinitionDictionary *)self localizedLanguageName];
  }
  return (NSString *)v3;
}

- (NSString)localizedDictionaryName
{
  if ([(DUDefinitionDictionary *)self isAppleDictionary])
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v4 = v3;
    id v5 = @"Apple Dictionary";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_26E6B3A00 table:@"DictionaryUI"];
    goto LABEL_6;
  }
  if ([(DUDefinitionDictionary *)self isTTYDictionary])
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v4 = v3;
    id v5 = @"TTY Dictionary";
    goto LABEL_5;
  }
  objc_super v4 = [(MAAsset *)self->_rawAsset attributes];
  v6 = [v4 objectForKey:@"DictionaryPackageDisplayName"];
  if (![v6 length])
  {
    v8 = [v4 objectForKey:@"DictionaryPackageName"];

    v6 = [v8 stringByDeletingPathExtension];
  }
  if (![v6 length])
  {
    uint64_t v9 = [(DUDefinitionDictionary *)self localizedLanguageName];

    v6 = (void *)v9;
  }
LABEL_6:

  return (NSString *)v6;
}

+ (id)displayNameForLanguageIdentifier:(id)a3 context:(int64_t)a4
{
  uint64_t v5 = displayNameForLanguageIdentifier_context____onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&displayNameForLanguageIdentifier_context____onceToken, &__block_literal_global);
  }
  id v7 = [(id)displayNameForLanguageIdentifier_context____displayLocale localizedStringForLanguage:v6 context:a4];

  return v7;
}

void __67__DUDefinitionDictionary_displayNameForLanguageIdentifier_context___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF960];
  v1 = [MEMORY[0x263F086E0] mainBundle];
  v2 = [v1 preferredLocalizations];
  v3 = [v2 firstObject];
  id v6 = [v0 canonicalLanguageIdentifierFromString:v3];

  uint64_t v4 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v6];
  uint64_t v5 = (void *)displayNameForLanguageIdentifier_context____displayLocale;
  displayNameForLanguageIdentifier_context____displayLocale = v4;
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 0xFA) {
    uint64_t v6 = 250;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = [v4 substringToIndex:v6];

  dictionary = self->_dictionary;
  if (dictionary)
  {
    [v7 length];
    LOBYTE(dictionary) = DCSHasDefinitionForTerm() != 0;
  }

  return (char)dictionary;
}

- (id)_definitionValueForTerm:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[DUDefinitionValue alloc] initWithDefinitionDictionary:self term:v4];

  [(DUDefinitionValue *)v5 setRawAsset:self->_rawAsset];
  return v5;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
  if (!a3)
  {
    assetToUpgrade = self->_assetToUpgrade;
    if (assetToUpgrade)
    {
      objc_storeStrong((id *)&self->_rawAsset, assetToUpgrade);
      unint64_t v5 = self->_assetToUpgrade;
      self->_assetToUpgrade = 0;
    }
  }
}

- (BOOL)needsDownloadNewerVersion
{
  assetToUpgrade = self->_assetToUpgrade;
  if (assetToUpgrade) {
    LOBYTE(assetToUpgrade) = self->_rawAsset == assetToUpgrade
  }
                          || (uint64_t v4 = [(MAAsset *)assetToUpgrade _contentVersion],
                              v4 > [(MAAsset *)self->_rawAsset _contentVersion])
                          || [(MAAsset *)self->_rawAsset state] == 3;
  return (char)assetToUpgrade;
}

- (__DCSDictionary)dictionaryRef
{
  return self->_dictionary;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DUDefinitionDictionary *)self localizedDictionaryName];
  BOOL v7 = [(DUDefinitionDictionary *)self activated];
  v8 = @"inactive";
  if (v7) {
    v8 = @"active";
  }
  uint64_t v9 = [v3 stringWithFormat:@"%@ <%p>: Dictionary name: %@ (%@), Asset: %@", v5, self, v6, v8, self->_rawAsset];

  return v9;
}

- (MAAsset)rawAsset
{
  return (MAAsset *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)definitionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)activated
{
  return self->_activated;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)isAppleDictionary
{
  return self->_isAppleDictionary;
}

- (void)setIsAppleDictionary:(BOOL)a3
{
  self->_isAppleDictionary = a3;
}

- (BOOL)isTTYDictionary
{
  return self->_isTTYDictionary;
}

- (void)setIsTTYDictionary:(BOOL)a3
{
  self->_isTTYDictionary = a3;
}

- (int64_t)preferredOrder
{
  return self->_preferredOrder;
}

- (void)setPreferredOrder:(int64_t)a3
{
  self->_preferredOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionLanguage, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_assetToUpgrade, 0);
}

@end