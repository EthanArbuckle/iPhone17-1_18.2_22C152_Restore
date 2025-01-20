@interface AXLanguageManager
+ (AXLanguageManager)sharedInstance;
+ (BOOL)voiceOverSupportedInCurrentLanguage;
+ (id)commonPunctuationCharacters;
+ (id)dialectForAlternativeVoiceIdentifier:(id)a3;
+ (id)doNotTranslateWords;
+ (id)nameForAlternativeVoiceIdentifier:(id)a3;
+ (id)nonlocalizedNameForLanguage:(id)a3;
+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3;
+ (id)stringByReplacingFatWidthCharactersWithBasicCharacters:(id)a3;
- (AXDialectMap)dialectForCurrentLocale;
- (AXDialectMap)dialectForCurrentRegion;
- (AXDialectMap)dialectForSystemLanguage;
- (AXDialectMap)dialectForUserLocale;
- (AXLanguageManager)init;
- (BOOL)_unitTest_didUpdateForLocaleChange;
- (BOOL)didUpdateForLocaleChange;
- (BOOL)isCharacterCommon:(unsigned __int16)a3;
- (BOOL)isStringComposedByCommonCharacters:(id)a3;
- (NSArray)langMaps;
- (NSCharacterSet)commonCharacters;
- (NSLocale)userLocale;
- (NSSet)preferredLanguageIDsFromUserSelectedKeyboards;
- (NSString)systemLanguageID;
- (id)_dialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6;
- (id)_exemplarCharacterSetFromLanguages:(id)a3;
- (id)_loadLangMaps;
- (id)_preferredOverrideDialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6;
- (id)_synthesisProviderDialectMapPerLanguage;
- (id)_systemPreferredDialectThatCanSpeak:(id)a3;
- (id)ambiguousDialectsFromUserKeyboardPreferences;
- (id)basicDescription;
- (id)characterSetForRanges:(id)a3;
- (id)debugDescription;
- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4;
- (id)dialectForLanguageID:(id)a3;
- (id)dialectThatCanSpeakCharacter:(unsigned __int16)a3;
- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3;
- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4;
- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5;
- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5 preferOverrides:(BOOL)a6;
- (id)dialectsThatCanSpeakString:(id)a3;
- (id)dialectsThatCanSpeakString:(id)a3 overridePreferredLanguages:(id)a4;
- (id)outputLanguageIdentifierForLanguage:(id)a3;
- (void)_addDialectMapsForLanguageCodes:(id)a3 toResults:(id)a4;
- (void)_handleUserLocaleDidChange:(id)a3;
- (void)dealloc;
- (void)setCommonCharacters:(id)a3;
- (void)setDialectForCurrentLocale:(id)a3;
- (void)setDialectForCurrentRegion:(id)a3;
- (void)setDialectForSystemLanguage:(id)a3;
- (void)setLangMaps:(id)a3;
- (void)setUserLocale:(id)a3;
- (void)set_unitTest_didUpdateForLocaleChange:(BOOL)a3;
- (void)updateCachedDialects;
@end

@implementation AXLanguageManager

+ (AXLanguageManager)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_32);
  }
  v2 = (void *)sharedInstance__shared;

  return (AXLanguageManager *)v2;
}

uint64_t __35__AXLanguageManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXLanguageManager);
  uint64_t v1 = sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)voiceOverSupportedInCurrentLanguage
{
  if (voiceOverSupportedInCurrentLanguage_onceToken != -1) {
    dispatch_once(&voiceOverSupportedInCurrentLanguage_onceToken, &__block_literal_global_2);
  }
  return (voiceOverSupportedInCurrentLanguage_Supported & 1) == 0;
}

void __56__AXLanguageManager_voiceOverSupportedInCurrentLanguage__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages;
  voiceOverSupportedInCurrentLanguage_NonSupportedLanguages = v0;

  [(id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages addObject:@"vi"];
  [(id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages addObject:@"ca"];
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v3, "hasPrefix:", v9, (void)v10) & 1) != 0
          || [v3 isEqualToString:v9])
        {
          voiceOverSupportedInCurrentLanguage_Supported = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

+ (id)nonlocalizedNameForLanguage:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
  uint64_t v5 = [v4 localizedStringForLanguage:v3 context:3];

  if (!v5)
  {
    uint64_t v6 = (void *)nonlocalizedNameForLanguage__AXBundle;
    if (!nonlocalizedNameForLanguage__AXBundle)
    {
      uint64_t v7 = NSOpenStepRootDirectory();
      v8 = [v7 stringByAppendingString:@"System/Library/PreferenceBundles/AccessibilitySettings.bundle"];

      uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithPath:v8];
      long long v10 = (void *)nonlocalizedNameForLanguage__AXBundle;
      nonlocalizedNameForLanguage__AXBundle = v9;

      uint64_t v6 = (void *)nonlocalizedNameForLanguage__AXBundle;
    }
    uint64_t v5 = [v6 localizedStringForKey:v3 value:v3 table:@"RegionNamesNonLocalized"];
  }
  if ([v5 isEqualToString:v3]) {
    id v11 = 0;
  }
  else {
    id v11 = v5;
  }

  return v11;
}

+ (id)commonPunctuationCharacters
{
  if (commonPunctuationCharacters_onceToken != -1) {
    dispatch_once(&commonPunctuationCharacters_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)commonPunctuationCharacters_charSet;

  return v2;
}

uint64_t __48__AXLanguageManager_commonPunctuationCharacters__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"~!@#*$%&+|=(){}[]<>,./?:'_-\"\\""];;
  uint64_t v1 = commonPunctuationCharacters_charSet;
  commonPunctuationCharacters_charSet = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)doNotTranslateWords
{
  if (doNotTranslateWords_onceToken != -1) {
    dispatch_once(&doNotTranslateWords_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)doNotTranslateWords_Set;

  return v2;
}

void __40__AXLanguageManager_doNotTranslateWords__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = (void *)doNotTranslateWords_Set;
  doNotTranslateWords_Set = (uint64_t)v0;

  long long v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v12 pathForResource:@"DNTTerms" ofType:@"plist"];
  v3 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = (void *)doNotTranslateWords_Set;
        long long v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        id v11 = [v8 stringByTrimmingCharactersInSet:v10];
        [v9 addObject:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3
{
  return (id)[MEMORY[0x1E4FAF298] stringByReplacingEmojiCharactersWithEmojiDescriptions:a3 stringForPauses:@" \x1B\\pause=350\\ " language:0 rangeReplacements:0 appendEmojiSuffix:0];
}

+ (id)stringByReplacingFatWidthCharactersWithBasicCharacters:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 65296, 75);
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = v5;
    uint64_t v8 = [v3 length];
    uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
    long long v10 = [v3 substringToIndex:v7];
    id v6 = [v9 stringWithString:v10];

    if (v7 >= v8)
    {
      uint64_t v11 = v7;
    }
    else
    {
      uint64_t v11 = v7;
      do
      {
        uint64_t v12 = [v3 characterAtIndex:v7];
        if ([v4 characterIsMember:v12])
        {
          uint64_t v13 = v7 - v11;
          if (v7 > v11)
          {
            long long v14 = objc_msgSend(v3, "substringWithRange:", v11, v13);
            [v6 appendString:v14];
          }
          objc_msgSend(v6, "appendFormat:", @"%C ", v13, (unsigned __int16)(v12 + 288));
          uint64_t v11 = ++v7;
        }
        else
        {
          ++v7;
        }
      }
      while (v7 != v8);
    }
    if (v8 > v11)
    {
      long long v15 = objc_msgSend(v3, "substringWithRange:", v11, v8 - v11);
      [v6 appendString:v15];
    }
  }

  return v6;
}

- (AXLanguageManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXLanguageManager;
  v2 = [(AXLanguageManager *)&v13 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(AXLanguageManager *)v2 setUserLocale:v3];

    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__handleUserLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    id v5 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [v5 formUnionWithCharacterSet:v6];

    uint64_t v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v5 formUnionWithCharacterSet:v7];

    uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789•■"];
    [v5 formUnionWithCharacterSet:v8];

    uint64_t v9 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    [v5 formUnionWithCharacterSet:v9];

    [(AXLanguageManager *)v2 setCommonCharacters:v5];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_updateLocaleForLanguagePreference, (CFStringRef)*MEMORY[0x1E4FB9260], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v11 = v2;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)AXLanguageManager;
  [(AXLanguageManager *)&v5 dealloc];
}

- (id)basicDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"AXLanguageManager:<%p>. %lu lang maps", self, -[NSArray count](self->_langMaps, "count"));
}

- (id)debugDescription
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(AXLanguageManager *)self basicDescription];
  objc_super v5 = [v3 stringWithFormat:@"%@\n", v4];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v23 = self;
  obj = self->_langMaps;
  uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        uint64_t v8 = [v7 description];
        [v5 appendFormat:@"  %@\n", v8];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v9 = [v7 dialects];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v15 = [v7 userPreferredDialect];

              uint64_t v16 = [v14 description];
              v17 = (void *)v16;
              if (v15 == v14) {
                uint64_t v18 = @"    USER-PREF %@\n";
              }
              else {
                uint64_t v18 = @"    %@\n";
              }
              objc_msgSend(v5, "appendFormat:", v18, v16);
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  v19 = [(AXLanguageManager *)v23 dialectForSystemLanguage];
  [v5 appendFormat:@"system Lang dialect: %@\n", v19];

  v20 = [(AXLanguageManager *)v23 dialectForCurrentLocale];
  [v5 appendFormat:@"system current locale dialect: %@\n", v20];

  v21 = [(AXLanguageManager *)v23 dialectForCurrentRegion];
  [v5 appendFormat:@"system current region dialect: %@\n", v21];

  return v5;
}

- (NSString)systemLanguageID
{
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    objc_super v5 = AXCLanguageCanonicalFormToGeneralLanguage();
  }
  else
  {
    uint64_t v4 = [(AXLanguageManager *)self userLocale];
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
    objc_super v5 = AXCLanguageCanonicalFormToGeneralLanguage();
  }

  return (NSString *)v5;
}

- (NSArray)langMaps
{
  langMaps = self->_langMaps;
  if (!langMaps)
  {
    uint64_t v4 = [(AXLanguageManager *)self _loadLangMaps];
    objc_super v5 = self->_langMaps;
    self->_langMaps = v4;

    langMaps = self->_langMaps;
  }

  return langMaps;
}

- (AXDialectMap)dialectForSystemLanguage
{
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  if (!dialectForSystemLanguage)
  {
    [(AXLanguageManager *)self updateCachedDialects];
    dialectForSystemLanguage = self->_dialectForSystemLanguage;
    if (!dialectForSystemLanguage)
    {
      _AXLogWithFacility();
      dialectForSystemLanguage = self->_dialectForSystemLanguage;
    }
  }

  return dialectForSystemLanguage;
}

- (void)setDialectForSystemLanguage:(id)a3
{
  id v5 = a3;
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  p_dialectForSystemLanguage = &self->_dialectForSystemLanguage;
  id v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForSystemLanguage, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_dialectForSystemLanguage, a3);
  }
}

- (AXDialectMap)dialectForUserLocale
{
  v2 = [(AXLanguageManager *)self dialectForSystemLanguage];
  id v3 = [v2 langMap];
  uint64_t v4 = [v3 userLocaleDialect];

  return (AXDialectMap *)v4;
}

- (AXDialectMap)dialectForCurrentLocale
{
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  if (!dialectForCurrentLocale)
  {
    [(AXLanguageManager *)self updateCachedDialects];
    dialectForCurrentLocale = self->_dialectForCurrentLocale;
  }

  return dialectForCurrentLocale;
}

- (AXDialectMap)dialectForCurrentRegion
{
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  if (!dialectForCurrentRegion)
  {
    [(AXLanguageManager *)self updateCachedDialects];
    dialectForCurrentRegion = self->_dialectForCurrentRegion;
  }

  return dialectForCurrentRegion;
}

- (void)setDialectForCurrentLocale:(id)a3
{
  id v5 = a3;
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  p_dialectForCurrentLocale = &self->_dialectForCurrentLocale;
  id v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForCurrentLocale, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_dialectForCurrentLocale, a3);
  }
}

- (void)setDialectForCurrentRegion:(id)a3
{
  id v5 = a3;
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  p_dialectForCurrentRegion = &self->_dialectForCurrentRegion;
  id v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForCurrentRegion, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_dialectForCurrentRegion, a3);
  }
}

- (id)dialectForLanguageID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [(AXLanguageManager *)self outputLanguageIdentifierForLanguage:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;

      id v5 = v8;
    }
    else
    {
      uint64_t v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v5;
        _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_INFO, "We passed in %@ to TTSPreferencesCopyDefaultOutputLanguageIdentifierForLanguage and got back nil", buf, 0xCu);
      }
    }
    uint64_t v11 = [(AXLanguageManager *)self dialectForSystemLanguage];
    uint64_t v12 = [v11 specificLanguageID];
    int v13 = [v12 hasPrefix:v5];

    if (v13)
    {
      id v9 = v11;
    }
    else
    {
      long long v14 = [(AXLanguageManager *)self dialectForCurrentLocale];
      long long v15 = [v14 specificLanguageID];
      int v16 = [v15 hasPrefix:v5];

      if (v16)
      {
        id v9 = v14;
      }
      else
      {
        v17 = [(AXLanguageManager *)self dialectForCurrentRegion];
        uint64_t v18 = [v17 specificLanguageID];
        int v19 = [v18 hasPrefix:v5];

        if (v19)
        {
          id v9 = v17;
        }
        else
        {
          v37 = v17;
          id v38 = (id)[v5 rangeOfString:@"-"];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          obuint64_t j = [(AXLanguageManager *)self langMaps];
          uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v46;
            v36 = v14;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v46 != v22) {
                  objc_enumerationMutation(obj);
                }
                v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v25 = objc_msgSend(v24, "generalLanguageID", v36);
                if ([v5 hasPrefix:v25])
                {

LABEL_25:
                  if (v38 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    long long v43 = 0u;
                    long long v44 = 0u;
                    long long v41 = 0u;
                    long long v42 = 0u;
                    id v39 = [v24 dialects];
                    uint64_t v28 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
                    if (v28)
                    {
                      uint64_t v29 = v28;
                      uint64_t v30 = *(void *)v42;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v29; ++j)
                        {
                          if (*(void *)v42 != v30) {
                            objc_enumerationMutation(v39);
                          }
                          long long v32 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                          long long v33 = [v32 specificLanguageID];
                          char v34 = [v33 isEqualToString:v5];

                          if (v34)
                          {
                            id v9 = v32;

                            goto LABEL_37;
                          }
                        }
                        uint64_t v29 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
                        if (v29) {
                          continue;
                        }
                        break;
                      }
                    }
                  }
                  id v9 = [v24 defaultDialect];
LABEL_37:

                  long long v14 = v36;
                  goto LABEL_38;
                }
                uint64_t v26 = [v24 alternateLanguageIDs];
                int v27 = [v26 containsObject:v5];

                if (v27) {
                  goto LABEL_25;
                }
              }
              uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
              long long v14 = v36;
              if (v21) {
                continue;
              }
              break;
            }
          }

          id v9 = 0;
LABEL_38:
          v17 = v37;
        }
      }
    }
  }
  else
  {
    _AXAssert();
    id v9 = [(AXLanguageManager *)self dialectForSystemLanguage];
  }

  return v9;
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3
{
  return [(AXLanguageManager *)self dialectsThatCanSpeakCharacter:a3 overridePreferredLanguages:0 allowTransliteration:1];
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4
{
  return [(AXLanguageManager *)self dialectsThatCanSpeakCharacter:a3 overridePreferredLanguages:a4 allowTransliteration:1];
}

- (id)_systemPreferredDialectThatCanSpeak:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void *))a3;
  id v5 = [(AXLanguageManager *)self dialectForSystemLanguage];
  if (v4[2](v4, v5))
  {
    v12[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    uint64_t v7 = [(AXLanguageManager *)self dialectForCurrentLocale];
    if (v4[2](v4, v7))
    {
      uint64_t v11 = v7;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    }
    else
    {
      id v8 = [(AXLanguageManager *)self dialectForCurrentRegion];
      if (v4[2](v4, v8))
      {
        uint64_t v10 = v8;
        uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      }
      else
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }

  return v6;
}

- (void)_addDialectMapsForLanguageCodes:(id)a3 toResults:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke;
  v7[3] = &unk_1E5587C40;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsWithOptions:2 usingBlock:v7];
}

void __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke(uint64_t a1)
{
  v2 = AXCLanguageConvertToCanonicalForm();
  id v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_2;
  v14[3] = &unk_1E5587C18;
  id v4 = v2;
  id v15 = v4;
  uint64_t v5 = [v3 indexOfObjectPassingTest:v14];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  id v6 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_3;
  v12[3] = &unk_1E5587C18;
  id v7 = v4;
  id v13 = v7;
  uint64_t v5 = [v6 indexOfObjectPassingTest:v12];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_4;
  v10[3] = &unk_1E5587C18;
  id v11 = v7;
  uint64_t v5 = [v8 indexOfObjectPassingTest:v10];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
    [*(id *)(a1 + 32) removeObjectAtIndex:v5];
    [*(id *)(a1 + 32) insertObject:v9 atIndex:0];
  }
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 specificLanguageID];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 langMap];
  uint64_t v4 = [v3 generalLanguageID];
  uint64_t v5 = [v2 hasPrefix:v4];

  return v5;
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a2, "langMap", 0);
  uint64_t v4 = [v3 alternateLanguageIDs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(a1 + 32) hasPrefix:*(void *)(*((void *)&v11 + 1) + 8 * v8)])
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)_preferredOverrideDialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__9;
  id v39 = __Block_byref_object_dispose__9;
  id v40 = (id)objc_opt_new();
  long long v13 = [(AXLanguageManager *)self langMaps];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __122__AXLanguageManager__preferredOverrideDialectsThatCanSpeak_dialectIsSecondary_overridePreferredLanguages_preferOverrides___block_invoke;
  v29[3] = &unk_1E5587C68;
  BOOL v34 = v6;
  id v14 = v12;
  id v30 = v14;
  id v15 = v10;
  id v31 = v15;
  id v16 = v11;
  id v32 = v16;
  long long v33 = &v35;
  [v13 enumerateObjectsWithOptions:0 usingBlock:v29];

  [(AXLanguageManager *)self _addDialectMapsForLanguageCodes:v14 toResults:v36[5]];
  if (!v6 || ![(id)v36[5] count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", 0, 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = AXCLanguageConvertToCanonicalForm();
          if (v22) {
            [v17 addObject:v22];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }
      while (v19);
    }

    [(AXLanguageManager *)self _addDialectMapsForLanguageCodes:v17 toResults:v36[5]];
  }
  v23 = [(id)v36[5] array];

  _Block_object_dispose(&v35, 8);

  return v23;
}

void __122__AXLanguageManager__preferredOverrideDialectsThatCanSpeak_dialectIsSecondary_overridePreferredLanguages_preferOverrides___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(unsigned char *)(a1 + 64)
    || (uint64_t v5 = *(void **)(a1 + 32),
        [v3 generalLanguageID],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = [v5 containsObject:v6],
        v6,
        v5))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [v4 defaultDialect];
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9)
      {
        id v10 = [v4 defaultDialect];
        char v11 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

        if ((v11 & 1) == 0)
        {
          id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          long long v13 = [v4 defaultDialect];
          [v12 addObject:v13];
        }
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = objc_msgSend(v4, "dialects", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

- (id)_dialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = v12;
  if (v6)
  {
    if ([v12 count])
    {
      int v14 = 1;
      goto LABEL_8;
    }
    uint64_t v15 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "preferOverrides=YES but no overridePreferredLanguages provided. forcing preferOverrides=NO", v22, 2u);
    }
  }
  int v14 = 0;
LABEL_8:
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  if (v14)
  {
    uint64_t v17 = [(AXLanguageManager *)self _preferredOverrideDialectsThatCanSpeak:v10 dialectIsSecondary:v11 overridePreferredLanguages:v13 preferOverrides:1];
    [v16 addObjectsFromArray:v17];

    if ([v16 count]) {
      goto LABEL_14;
    }
    uint64_t v18 = [(AXLanguageManager *)self _systemPreferredDialectThatCanSpeak:v10];
  }
  else
  {
    uint64_t v19 = [(AXLanguageManager *)self _systemPreferredDialectThatCanSpeak:v10];
    [v16 addObjectsFromArray:v19];

    if ([v16 count]) {
      goto LABEL_14;
    }
    uint64_t v18 = [(AXLanguageManager *)self _preferredOverrideDialectsThatCanSpeak:v10 dialectIsSecondary:v11 overridePreferredLanguages:v13 preferOverrides:0];
  }
  long long v20 = (void *)v18;
  [v16 addObjectsFromArray:v18];

LABEL_14:

  return v16;
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5
{
  return [(AXLanguageManager *)self dialectsThatCanSpeakCharacter:a3 overridePreferredLanguages:a4 allowTransliteration:a5 preferOverrides:0];
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5 preferOverrides:(BOOL)a6
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke;
  v10[3] = &__block_descriptor_35_e22_B16__0__AXDialectMap_8l;
  unsigned __int16 v11 = a3;
  BOOL v12 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke_2;
  v8[3] = &__block_descriptor_34_e22_B16__0__AXDialectMap_8l;
  unsigned __int16 v9 = a3;
  BOOL v6 = [(AXLanguageManager *)self _dialectsThatCanSpeak:v10 dialectIsSecondary:v8 overridePreferredLanguages:a4 preferOverrides:a6];

  return v6;
}

uint64_t __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canSpeakCharacter:*(unsigned __int16 *)(a1 + 32) allowTransliteration:*(unsigned __int8 *)(a1 + 34)];
}

uint64_t __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isDialectSecondaryForCharacter:*(unsigned __int16 *)(a1 + 32)];
}

- (id)dialectsThatCanSpeakString:(id)a3
{
  return [(AXLanguageManager *)self dialectsThatCanSpeakString:a3 overridePreferredLanguages:0];
}

- (id)dialectsThatCanSpeakString:(id)a3 overridePreferredLanguages:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AXLanguageManager_dialectsThatCanSpeakString_overridePreferredLanguages___block_invoke;
  v10[3] = &unk_1E5587CD0;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(AXLanguageManager *)self _dialectsThatCanSpeak:v10 dialectIsSecondary:0 overridePreferredLanguages:a4 preferOverrides:0];

  return v8;
}

uint64_t __75__AXLanguageManager_dialectsThatCanSpeakString_overridePreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canSpeakString:*(void *)(a1 + 32)];
}

- (id)dialectThatCanSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXLanguageManager *)self dialectsThatCanSpeakCharacter:a3 overridePreferredLanguages:0 allowTransliteration:1];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v31)
    {
      uint64_t v6 = *(void *)v43;
      id v32 = v5;
      long long v33 = v3;
      uint64_t v30 = *(void *)v43;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v43 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = AXCLanguageConvertToCanonicalForm();
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v9 = v3;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v39;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v39 != v12) {
                  objc_enumerationMutation(v9);
                }
                int v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v15 = objc_msgSend(v14, "langMap", v30);
                uint64_t v16 = [v15 generalLanguageID];
                char v17 = [v8 hasPrefix:v16];

                if (v17)
                {
                  id v4 = v14;

                  id v5 = v32;
                  id v3 = v33;
                  goto LABEL_30;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          ++v7;
          id v5 = v32;
          id v3 = v33;
          uint64_t v6 = v30;
        }
        while (v7 != v31);
        uint64_t v31 = [v32 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v31);
    }

    uint64_t v18 = [v3 firstObject];
    uint64_t v19 = [v18 langMap];
    int v20 = [v19 isAmbiguous];

    if (v20)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v21 = v3;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            long long v27 = objc_msgSend(v26, "specificLanguageID", v30);
            char v28 = [v27 isEqualToString:@"en-US"];

            if (v28)
            {
              id v4 = v26;

              goto LABEL_30;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
    objc_msgSend(v3, "firstObject", v30);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
  }

  return v4;
}

- (id)outputLanguageIdentifierForLanguage:(id)a3
{
  return (id)AXCRemapLanguageCodeToFallbackIfNeccessary();
}

- (id)ambiguousDialectsFromUserKeyboardPreferences
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXLanguageManager *)self preferredLanguageIDsFromUserSelectedKeyboards];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[AXLanguageManager dialectForLanguageID:](self, "dialectForLanguageID:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        uint64_t v11 = [v10 langMap];
        int v12 = [v11 isAmbiguous];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isCharacterCommon:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(AXLanguageManager *)self commonCharacters];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)isStringComposedByCommonCharacters:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (v5 == v8 + v7)
    {
      uint64_t v8 = v5;
      uint64_t v7 = v6;
      id v9 = [(AXLanguageManager *)self commonCharacters];
      uint64_t v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v9, 1, v6 + v5, objc_msgSend(v4, "length") - (v6 + v5));
      uint64_t v6 = v10;

      if (v5 + v6 >= (unint64_t)[v4 length])
      {
        BOOL v11 = v5 != 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_8;
      }
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_8:

  return v11;
}

- (void)updateCachedDialects
{
  v2 = self;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXLanguageManager *)self systemLanguageID];
  id v4 = [(AXLanguageManager *)v2 outputLanguageIdentifierForLanguage:v3];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v5 = [(AXLanguageManager *)v2 langMaps];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v69 objects:v77 count:16];
  v51 = v2;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v70 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        BOOL v11 = [v10 generalLanguageID];
        int v12 = [v4 hasPrefix:v11];

        if (v12)
        {
          long long v13 = [v10 defaultDialect];
          [(AXLanguageManager *)v2 setDialectForSystemLanguage:v13];
        }
        else
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v13 = [v10 alternateLanguageIDs];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v65 objects:v76 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v66;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v66 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([v4 hasPrefix:*(void *)(*((void *)&v65 + 1) + 8 * j)])
                {
                  uint64_t v18 = [v10 defaultDialect];
                  v2 = v51;
                  [(AXLanguageManager *)v51 setDialectForSystemLanguage:v18];

                  goto LABEL_18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v65 objects:v76 count:16];
              if (v15) {
                continue;
              }
              break;
            }
            v2 = v51;
          }
        }
LABEL_18:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v7);
  }

  uint64_t v19 = [(AXLanguageManager *)v2 userLocale];
  uint64_t v20 = [v19 objectForKey:*MEMORY[0x1E4F1C438]];

  uint64_t v49 = (void *)v20;
  if (v20)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v21 = [(AXLanguageManager *)v2 langMaps];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v75 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v62 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v61 + 1) + 8 * k);
          long long v27 = [v26 generalLanguageID];
          int v28 = [v49 hasPrefix:v27];

          if (v28)
          {
            uint64_t v29 = [v26 defaultDialect];
            [(AXLanguageManager *)v2 setDialectForCurrentLocale:v29];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v61 objects:v75 count:16];
      }
      while (v23);
    }
  }
  uint64_t v30 = [(AXLanguageManager *)v2 userLocale];
  uint64_t v31 = *MEMORY[0x1E4F1C400];
  id v32 = [v30 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v32)
  {
    long long v46 = v4;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = [(AXLanguageManager *)v2 langMaps];
    uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
    if (v50)
    {
      uint64_t v48 = *(void *)v58;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v58 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v52 = v33;
          long long v34 = *(void **)(*((void *)&v57 + 1) + 8 * v33);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v35 = [v34 dialects];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v73 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v54;
            while (2)
            {
              for (uint64_t m = 0; m != v37; ++m)
              {
                if (*(void *)v54 != v38) {
                  objc_enumerationMutation(v35);
                }
                long long v40 = *(void **)(*((void *)&v53 + 1) + 8 * m);
                long long v41 = [v40 locale];
                long long v42 = [v41 objectForKey:v31];
                int v43 = [v42 hasSuffix:v32];

                if (v43)
                {
                  [(AXLanguageManager *)v51 setDialectForCurrentRegion:v40];
                  goto LABEL_47;
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v73 count:16];
              if (v37) {
                continue;
              }
              break;
            }
          }
LABEL_47:

          uint64_t v33 = v52 + 1;
        }
        while (v52 + 1 != v50);
        uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
      }
      while (v50);
    }

    id v4 = v46;
    v2 = v51;
  }
  if (!v2->_dialectForSystemLanguage)
  {
    if (v2->_dialectForCurrentLocale)
    {
      uint64_t v44 = [(AXLanguageManager *)v2 dialectForCurrentLocale];
LABEL_55:
      long long v45 = (void *)v44;
      [(AXLanguageManager *)v2 setDialectForSystemLanguage:v44];

      goto LABEL_56;
    }
    if (v2->_dialectForCurrentRegion)
    {
      uint64_t v44 = [(AXLanguageManager *)v2 dialectForCurrentRegion];
      goto LABEL_55;
    }
  }
LABEL_56:
}

- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F49020];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedInstance];
  id v9 = [v8 descriptionOfWord:v7 forLanguage:v6];

  return v9;
}

- (NSSet)preferredLanguageIDsFromUserSelectedKeyboards
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (preferredLanguageIDsFromUserSelectedKeyboards_onceToken != -1) {
    dispatch_once(&preferredLanguageIDsFromUserSelectedKeyboards_onceToken, &__block_literal_global_98);
  }
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [(id)preferredLanguageIDsFromUserSelectedKeyboards_inputController safeValueForKey:@"enabledInputModeIdentifiers"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 rangeOfString:@"-"];
        id v9 = v7;
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v9 = [v7 substringToIndex:v8];
        }
        uint64_t v10 = [v7 rangeOfString:@"@"];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = [v7 substringToIndex:v10];

          id v9 = (void *)v11;
        }
        int v12 = [v9 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        [v2 addObject:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return (NSSet *)v2;
}

uint64_t __66__AXLanguageManager_preferredLanguageIDsFromUserSelectedKeyboards__block_invoke()
{
  uint64_t v0 = [NSClassFromString(&cfstr_Uikeyboardinpu.isa) safeValueForKey:@"sharedInputModeController"];
  uint64_t v1 = preferredLanguageIDsFromUserSelectedKeyboards_inputController;
  preferredLanguageIDsFromUserSelectedKeyboards_inputController = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)characterSetForRanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = v3;
    obuint64_t j = [v3 componentsSeparatedByString:@" "];
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
          id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"-"];
          uint64_t v10 = [v9 objectAtIndex:0];
          uint64_t v11 = [v10 integerValue];
          int v12 = [v9 objectAtIndex:1];
          uint64_t v13 = [v12 integerValue];

          objc_msgSend(v4, "addCharactersInRange:", v11, v13);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v3 = v15;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_loadLangMaps
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(AXLanguageManager *)self _synthesisProviderDialectMapPerLanguage];
  long long v63 = self;
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 pathForResource:@"SynthesizerLanguageMap-UnifiedSpeech" ofType:@"plist"];

  uint64_t v48 = (void *)v6;
  [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v47 = v80 = 0u;
  obuint64_t j = [v47 objectForKey:@"languageMaps"];
  unint64_t v7 = 0x1E5584000;
  uint64_t v53 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v53)
  {
    uint64_t v50 = *(void *)v78;
    v51 = v4;
    uint64_t v52 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v78 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v8;
        id v9 = *(void **)(*((void *)&v77 + 1) + 8 * v8);
        long long v60 = [v9 objectForKey:@"languageID"];
        long long v58 = [v9 objectForKey:@"alternateLanguageIDs"];
        long long v57 = [v9 objectForKey:@"ambiguousWithLanguages"];
        uint64_t v10 = [v9 objectForKey:@"isAmbiguous"];
        unsigned int v56 = [v10 BOOLValue];

        uint64_t v11 = [v9 objectForKey:@"isWestern"];
        unsigned int v55 = [v11 BOOLValue];

        int v12 = [v9 objectForKey:@"isRTL"];
        unsigned int v54 = [v12 BOOLValue];

        uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v61 = [v9 objectForKey:@"localeLanguageMaps"];
        uint64_t v14 = [v61 countByEnumeratingWithState:&v73 objects:v83 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v62 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v74 != v62) {
                objc_enumerationMutation(v61);
              }
              long long v17 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              id v18 = objc_alloc(MEMORY[0x1E4F1CA20]);
              long long v19 = [v17 objectForKey:@"localeID"];
              long long v20 = (void *)[v18 initWithLocaleIdentifier:v19];

              id v21 = [v17 objectForKey:@"languageID"];
              uint64_t v22 = [v17 objectForKey:@"speakableCharacterRanges"];
              uint64_t v23 = [(AXLanguageManager *)v63 characterSetForRanges:v22];
              uint64_t v24 = [v17 objectForKey:@"supplementaryCharacterRanges"];

              uint64_t v25 = [(AXLanguageManager *)v63 characterSetForRanges:v24];
              long long v26 = (void *)v25;
              if (v23) {
                BOOL v27 = v25 == 0;
              }
              else {
                BOOL v27 = 1;
              }
              if (!v27) {
                [v23 formUnionWithCharacterSet:v25];
              }
              int v28 = [v17 objectForKeyedSubscript:@"secondaryLanguageRange"];
              uint64_t v29 = [(AXLanguageManager *)v63 characterSetForRanges:v28];

              uint64_t v30 = [[AXDialectMap alloc] initWithLocale:v20 specificLanguageID:v21 speakableCharacters:v23 secondaryLanguageRange:v29];
              [v13 addObject:v30];
            }
            uint64_t v15 = [v61 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v15);
        }

        id v4 = v51;
        uint64_t v31 = [v51 objectForKey:v60];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v82 count:16];
        id v3 = v52;
        unint64_t v7 = 0x1E5584000uLL;
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v70 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v69 + 1) + 8 * j);
              v68[0] = MEMORY[0x1E4F143A8];
              v68[1] = 3221225472;
              v68[2] = __34__AXLanguageManager__loadLangMaps__block_invoke;
              v68[3] = &unk_1E5587CD0;
              v68[4] = v36;
              if ((objc_msgSend(v13, "ax_containsObjectUsingBlock:", v68) & 1) == 0) {
                [v13 addObject:v36];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v33);
        }
        [v51 removeObjectForKey:v60];
        uint64_t v37 = [[AXLangMap alloc] initWithLanguageID:v60 isWestern:v55 isAmbiguous:v56 isRTL:v54 dialects:v13 alternateLanguageIDs:v58 associatedAmbiguousLanguages:v57];
        [v52 addObject:v37];

        uint64_t v8 = v59 + 1;
      }
      while (v59 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v53);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v38 = [v4 allKeys];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v64 + 1) + 8 * k);
        uint64_t v44 = [v4 objectForKey:v43];
        long long v45 = (void *)[objc_alloc(*(Class *)(v7 + 3968)) initWithLanguageID:v43 isWestern:0 isAmbiguous:0 isRTL:0 dialects:v44 alternateLanguageIDs:0 associatedAmbiguousLanguages:0];
        [v3 addObject:v45];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v64 objects:v81 count:16];
    }
    while (v40);
  }

  return v3;
}

uint64_t __34__AXLanguageManager__loadLangMaps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 specificLanguageID];
  id v4 = [*(id *)(a1 + 32) specificLanguageID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_synthesisProviderDialectMapPerLanguage
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [MEMORY[0x1E4FAF2C8] allSynthesisProviderVoices];
  uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v38;
    unint64_t v4 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        uint64_t v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v29 = v6;
        id v27 = [v6 supportedLanguages];
        uint64_t v30 = [v27 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v30)
        {
          uint64_t v28 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v34 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              id v9 = [*(id *)(v4 + 2592) localeWithLocaleIdentifier:v8];
              uint64_t v10 = [v29 supportedLanguages];
              uint64_t v11 = [(AXLanguageManager *)self _exemplarCharacterSetFromLanguages:v10];

              if (v9)
              {
                int v12 = [AXDialectMap alloc];
                uint64_t v13 = [v9 exemplarCharacterSet];
                uint64_t v14 = [(AXDialectMap *)v12 initWithLocale:v9 specificLanguageID:v8 speakableCharacters:v13 secondaryLanguageRange:v11];

                uint64_t v15 = [v9 languageCode];
                long long v16 = [v3 objectForKey:v15];
                if (v16)
                {
                  v31[0] = MEMORY[0x1E4F143A8];
                  v31[1] = 3221225472;
                  v31[2] = __60__AXLanguageManager__synthesisProviderDialectMapPerLanguage__block_invoke;
                  v31[3] = &unk_1E5587CD0;
                  long long v17 = v14;
                  uint64_t v32 = v17;
                  if ((objc_msgSend(v16, "ax_containsObjectUsingBlock:", v31) & 1) == 0) {
                    [v16 addObject:v17];
                  }
                  [v3 setObject:v16 forKey:v15];
                  id v18 = v32;
                }
                else
                {
                  uint64_t v43 = v14;
                  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
                  long long v19 = self;
                  long long v20 = v3;
                  id v21 = (void *)[v18 mutableCopy];
                  [v20 setObject:v21 forKey:v15];

                  id v3 = v20;
                  self = v19;
                  unint64_t v4 = 0x1E4F1C000;
                }
              }
              else
              {
                uint64_t v14 = AXTTSLogCommon();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v42 = v8;
                  _os_log_error_impl(&dword_18D308000, v14, OS_LOG_TYPE_ERROR, "No locale found for %@", buf, 0xCu);
                }
              }
            }
            uint64_t v30 = [v27 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v30);
        }

        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }

  return v3;
}

uint64_t __60__AXLanguageManager__synthesisProviderDialectMapPerLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 specificLanguageID];
  unint64_t v4 = [*(id *)(a1 + 32) specificLanguageID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_exemplarCharacterSetFromLanguages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v11 = [v10 exemplarCharacterSet];
        [v4 formUnionWithCharacterSet:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_handleUserLocaleDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "autoupdatingCurrentLocale", a3);
  [(AXLanguageManager *)self setUserLocale:v4];

  [(AXLanguageManager *)self updateCachedDialects];

  [(AXLanguageManager *)self set_unitTest_didUpdateForLocaleChange:1];
}

+ (id)nameForAlternativeVoiceIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4FAF288] nameForVoiceIdentifier:a3];
}

+ (id)dialectForAlternativeVoiceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FAF2D8]])
  {
    id v4 = +[AXLanguageManager sharedInstance];
    id v5 = [v4 dialectForLanguageID:@"en-US"];
  }
  else if ([MEMORY[0x1E4FAF288] isSiriVoiceIdentifier:v3])
  {
    TTSGetComponentsInNamedSiriVoiceIdentifier();
    id v6 = 0;
    uint64_t v7 = +[AXLanguageManager sharedInstance];
    id v5 = [v7 dialectForLanguageID:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)didUpdateForLocaleChange
{
  BOOL v3 = [(AXLanguageManager *)self _unitTest_didUpdateForLocaleChange];
  if (v3) {
    [(AXLanguageManager *)self set_unitTest_didUpdateForLocaleChange:0];
  }
  return v3;
}

- (void)setLangMaps:(id)a3
{
}

- (NSCharacterSet)commonCharacters
{
  return self->_commonCharacters;
}

- (void)setCommonCharacters:(id)a3
{
}

- (NSLocale)userLocale
{
  return self->_userLocale;
}

- (void)setUserLocale:(id)a3
{
}

- (BOOL)_unitTest_didUpdateForLocaleChange
{
  return self->__unitTest_didUpdateForLocaleChange;
}

- (void)set_unitTest_didUpdateForLocaleChange:(BOOL)a3
{
  self->__unitTest_didUpdateForLocaleChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_commonCharacters, 0);
  objc_storeStrong((id *)&self->_langMaps, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentRegion, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentLocale, 0);

  objc_storeStrong((id *)&self->_dialectForSystemLanguage, 0);
}

@end