@interface AFLanguageDetectionUserContext
+ (BOOL)supportsSecureCoding;
+ (id)defaultContextWithPrimaryLanguage:(id)a3;
- (AFLanguageDetectionUserContext)init;
- (AFLanguageDetectionUserContext)initWithCoder:(id)a3;
- (BOOL)isUpdateAvailableForLanguageDetectorContext;
- (BOOL)shouldSimulateLanguageDetectorAssetsAvailability;
- (BOOL)wasLanguageToggled;
- (NSArray)dictationLanguages;
- (NSArray)keyboardConvoRecentMessages;
- (NSArray)multiLingualKeyboardLanguages;
- (NSDictionary)keyboardConversationLanguagePriors;
- (NSDictionary)keyboardGlobalLanguagePriors;
- (NSDictionary)languageCodeOverrides;
- (NSNumber)dictationInputOrigin;
- (NSString)currentKeyboard;
- (NSString)globalLastUsedKeyboard;
- (NSString)prevMessageLanguage;
- (NSString)primaryLanguageCode;
- (id)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)finalFilteredDictationLanguages;
- (id)getContextForAnalytics;
- (id)getDictationLanguagesForSupportedLocales:(id)a3 error:(id *)a4;
- (id)getSiriDictationLanguagesFromLanguages:(id)a3;
- (id)languageDetectorUserContext;
- (id)priorsByReplacingKeyboardLanguage:(id)a3;
- (id)simulatingLanguageCodes;
- (id)siriDictationLanguageForLanguage:(id)a3;
- (id)userContextLanguageCodeForKeyboardLangauge:(id)a3 overrideLanguageCode:(id)a4;
- (unsigned)languageDetectorContextChangeBits;
- (void)_removeContextValueForKey:(id)a3 context:(id)a4;
- (void)_setContextValue:(id)a3 forKey:(id)a4 context:(id)a5;
- (void)_setDictationLanguageCodeMappingCache:(id)a3;
- (void)_setFinalFilteredDictationLanguages:(id)a3;
- (void)_setLanguageDetectorContext:(id)a3;
- (void)_setUserContextChangeBit:(unsigned int)a3;
- (void)_updateContextValue:(id)a3 forKey:(id)a4 context:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentKeyboard:(id)a3;
- (void)setDictationInputOrigin:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setGlobalLastUsedKeyboard:(id)a3;
- (void)setKeyboardConversationLanguagePriors:(id)a3;
- (void)setKeyboardConvoRecentMessages:(id)a3;
- (void)setKeyboardGlobalLanguagePriors:(id)a3;
- (void)setLanguageCodeOverrides:(id)a3;
- (void)setMultiLingualKeyboardLanguages:(id)a3;
- (void)setPrevMessageLanguage:(id)a3;
- (void)setPrimaryLanguageCode:(id)a3;
- (void)setShouldSimulateLanguageDetectorAssetsAvailability:(BOOL)a3;
- (void)setSimulatingLanguageCodes:(id)a3;
- (void)setWasLanguageToggled:(BOOL)a3;
@end

@implementation AFLanguageDetectionUserContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationInputOrigin, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConversationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_keyboardConvoRecentMessages, 0);
  objc_storeStrong((id *)&self->_multiLingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_globalLastUsedKeyboard, 0);
  objc_storeStrong((id *)&self->_prevMessageLanguage, 0);
  objc_storeStrong((id *)&self->_languageCodeOverrides, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_currentKeyboard, 0);
  objc_storeStrong((id *)&self->_dictationLanguageMappingCache, 0);
  objc_storeStrong((id *)&self->_finalDictationLanguages, 0);
  objc_storeStrong((id *)&self->_simulatingLanguageCodes, 0);
  objc_storeStrong((id *)&self->_lidUserContext, 0);
}

- (void)setDictationInputOrigin:(id)a3
{
}

- (NSNumber)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (NSDictionary)keyboardConversationLanguagePriors
{
  return self->_keyboardConversationLanguagePriors;
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (NSArray)keyboardConvoRecentMessages
{
  return self->_keyboardConvoRecentMessages;
}

- (NSArray)multiLingualKeyboardLanguages
{
  return self->_multiLingualKeyboardLanguages;
}

- (NSString)globalLastUsedKeyboard
{
  return self->_globalLastUsedKeyboard;
}

- (NSString)prevMessageLanguage
{
  return self->_prevMessageLanguage;
}

- (BOOL)wasLanguageToggled
{
  return self->_languageToggled;
}

- (void)setLanguageCodeOverrides:(id)a3
{
}

- (NSDictionary)languageCodeOverrides
{
  return self->_languageCodeOverrides;
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (NSString)currentKeyboard
{
  return self->_currentKeyboard;
}

- (id)simulatingLanguageCodes
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal) {
    v3 = self->_simulatingLanguageCodes;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)setSimulatingLanguageCodes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (AFIsInternalInstall_onceToken == -1)
  {
    if (!v4) {
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = v4;
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    v5 = v10;
    if (!v10) {
      goto LABEL_6;
    }
  }
  if (AFIsInternalInstall_isInternal)
  {
    v9 = v5;
    uint64_t v6 = [v5 count];
    v5 = v9;
    if (v6)
    {
      v7 = (NSArray *)[v9 copy];
      simulatingLanguageCodes = self->_simulatingLanguageCodes;
      self->_simulatingLanguageCodes = v7;

      v5 = v9;
    }
  }
LABEL_6:
}

- (BOOL)shouldSimulateLanguageDetectorAssetsAvailability
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  return AFIsInternalInstall_isInternal && self->_simulateLanguageDetectorAssetsAvailability;
}

- (void)setShouldSimulateLanguageDetectorAssetsAvailability:(BOOL)a3
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal) {
    self->_simulateLanguageDetectorAssetsAvailability = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setWasLanguageToggled:self->_languageToggled];
  [v4 setCurrentKeyboard:self->_currentKeyboard];
  [v4 setPrimaryLanguageCode:self->_primaryLanguageCode];
  [v4 setPrevMessageLanguage:self->_prevMessageLanguage];
  [v4 setGlobalLastUsedKeyboard:self->_globalLastUsedKeyboard];
  [v4 setMultiLingualKeyboardLanguages:self->_multiLingualKeyboardLanguages];
  [v4 setKeyboardConvoRecentMessages:self->_keyboardConvoRecentMessages];
  [v4 setDictationLanguages:self->_dictationLanguages];
  [v4 setKeyboardConversationLanguagePriors:self->_keyboardConversationLanguagePriors];
  [v4 setKeyboardGlobalLanguagePriors:self->_keyboardGlobalLanguagePriors];
  [v4 setLanguageCodeOverrides:self->_languageCodeOverrides];
  [v4 setSimulatingLanguageCodes:self->_simulatingLanguageCodes];
  [v4 setShouldSimulateLanguageDetectorAssetsAvailability:self->_simulateLanguageDetectorAssetsAvailability];
  [v4 _setUserContextChangeBit:self->_userContextChangeBit];
  [v4 _setLanguageDetectorContext:self->_lidUserContext];
  [v4 _setFinalFilteredDictationLanguages:self->_finalDictationLanguages];
  [v4 _setDictationLanguageCodeMappingCache:self->_dictationLanguageMappingCache];
  return v4;
}

- (id)finalFilteredDictationLanguages
{
  return self->_finalDictationLanguages;
}

- (id)userContextLanguageCodeForKeyboardLangauge:(id)a3 overrideLanguageCode:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(AFLanguageDetectionUserContext *)self _setDictationLanguageCodeMappingCache:self->_dictationLanguageMappingCache];
    }
    v8 = [(NSMutableDictionary *)self->_dictationLanguageMappingCache objectForKey:v6];
    if (!v8)
    {
      v8 = AFOverrideLanguageCode(v6, v7);
      if (v8) {
        [(NSMutableDictionary *)self->_dictationLanguageMappingCache setObject:v8 forKey:v6];
      }
    }
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315906;
      v12 = "-[AFLanguageDetectionUserContext userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s User context language code mapping %@ -> %@ (override: %@)", (uint8_t *)&v11, 0x2Au);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getDictationLanguagesForSupportedLocales:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v33 = [(AFLanguageDetectionUserContext *)self languageDetectorUserContext];
  v8 = [v33 objectForKey:@"DictationLanguages"];
  if (v8)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    dictationLanguages = v8;
    if ((isKindOfClass & 1) == 0)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"AFLanguageDetectionUserContext.m" lineNumber:409 description:@"The cached dictation languages is not a instance of NSArray"];

      dictationLanguages = v8;
    }
  }
  else
  {
    dictationLanguages = self->_dictationLanguages;
  }
  v32 = a4;
  v12 = dictationLanguages;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v12;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v20 = -[NSDictionary objectForKey:](self->_languageCodeOverrides, "objectForKey:", v19, v32);
        v21 = [(AFLanguageDetectionUserContext *)self userContextLanguageCodeForKeyboardLangauge:v19 overrideLanguageCode:v20];

        if (v21 && [v7 containsObject:v21]) {
          [v13 addObject:v21];
        }
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v16);
  }

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v23 = v13;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(v22, "addObject:", *(void *)(*((void *)&v34 + 1) + 8 * j), v32);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v25);
  }

  if ([v22 count])
  {
    [(AFLanguageDetectionUserContext *)self _setFinalFilteredDictationLanguages:v22];
    id v28 = v22;
    goto LABEL_28;
  }
  if (v32)
  {
    id v29 = +[AFError errorWithCode:2802 description:@"The input dictation languages are not supported by language detector. This is a critical error." underlyingError:0];
    id *v32 = v29;
    v30 = AFSiriLogContextUtility;
    id v28 = 0;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315394;
    v43 = "-[AFLanguageDetectionUserContext getDictationLanguagesForSupportedLocales:error:]";
    __int16 v44 = 2112;
    id v45 = v29;
    _os_log_error_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  id v28 = 0;
LABEL_28:

  return v28;
}

- (id)getContextForAnalytics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AFLanguageDetectionUserContext *)self languageDetectorUserContext];
  [v3 addEntriesFromDictionary:v4];

  [v3 removeObjectForKey:@"RecentConversationalMessages"];
  if ([v3 count]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)languageDetectorUserContext
{
  if (!self->_userContextChangeBit)
  {
    id v6 = (void *)[(NSMutableDictionary *)self->_lidUserContext copy];
    goto LABEL_42;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  lidUserContext = self->_lidUserContext;
  if (isKindOfClass) {
    id v5 = lidUserContext;
  }
  else {
    id v5 = (NSMutableDictionary *)[(NSMutableDictionary *)lidUserContext mutableCopy];
  }
  id v7 = v5;
  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if (userContextChangeBit)
  {
    self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFFE;
    [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"WasLanguageToggled" context:v5];
    v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_languageToggled];
    [(NSMutableDictionary *)v7 setObject:v9 forKey:@"WasLanguageToggled"];

    unsigned int userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 2) == 0)
    {
LABEL_8:
      if ((userContextChangeBit & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_20;
    }
  }
  else if ((userContextChangeBit & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFFD;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"CurrentKeyboard" context:v7];
  id v10 = [(AFLanguageDetectionUserContext *)self siriDictationLanguageForLanguage:self->_primaryLanguageCode];
  if (v10) {
    [(NSMutableDictionary *)v7 setObject:v10 forKey:@"CurrentKeyboard"];
  }

  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 4) == 0)
  {
LABEL_9:
    if ((userContextChangeBit & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_20:
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFFB;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"LastMessageLanguage" context:v7];
  int v11 = [(AFLanguageDetectionUserContext *)self siriDictationLanguageForLanguage:self->_prevMessageLanguage];
  if (v11) {
    [(NSMutableDictionary *)v7 setObject:v11 forKey:@"LastMessageLanguage"];
  }

  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 8) == 0)
  {
LABEL_10:
    if ((userContextChangeBit & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_23:
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFF7;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"GlobalLastUsedKeyboard" context:v7];
  v12 = [(AFLanguageDetectionUserContext *)self siriDictationLanguageForLanguage:self->_globalLastUsedKeyboard];
  if (v12) {
    [(NSMutableDictionary *)v7 setObject:v12 forKey:@"GlobalLastUsedKeyboard"];
  }

  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 0x10) == 0)
  {
LABEL_11:
    if ((userContextChangeBit & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_26:
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFEF;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"MultilingualKeyboardLanguages" context:v7];
  id v13 = [(AFLanguageDetectionUserContext *)self getSiriDictationLanguagesFromLanguages:self->_multiLingualKeyboardLanguages];
  id v14 = [v13 allValues];

  if (v14) {
    [(NSMutableDictionary *)v7 setObject:v14 forKey:@"MultilingualKeyboardLanguages"];
  }

  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 0x20) == 0)
  {
LABEL_12:
    if ((userContextChangeBit & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_29:
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFDF;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"RecentConversationalMessages" context:v7];
  keyboardConvoRecentMessages = self->_keyboardConvoRecentMessages;
  if (keyboardConvoRecentMessages) {
    [(NSMutableDictionary *)v7 setObject:keyboardConvoRecentMessages forKey:@"RecentConversationalMessages"];
  }
  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 0x40) == 0)
  {
LABEL_13:
    if ((userContextChangeBit & 0x80) == 0) {
      goto LABEL_14;
    }
LABEL_35:
    self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFF7F;
    [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"KeyboardConversationLanguagePriors" context:v7];
    id v18 = [(AFLanguageDetectionUserContext *)self priorsByReplacingKeyboardLanguage:self->_keyboardConversationLanguagePriors];
    if (v18) {
      [(NSMutableDictionary *)v7 setObject:v18 forKey:@"KeyboardConversationLanguagePriors"];
    }

    unsigned int userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_38;
  }
LABEL_32:
  self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFFBF;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"DictationLanguages" context:v7];
  uint64_t v16 = [(AFLanguageDetectionUserContext *)self getSiriDictationLanguagesFromLanguages:self->_dictationLanguages];
  uint64_t v17 = [v16 allValues];

  if (v17) {
    [(NSMutableDictionary *)v7 setObject:v17 forKey:@"DictationLanguages"];
  }

  unsigned int userContextChangeBit = self->_userContextChangeBit;
  if ((userContextChangeBit & 0x80) != 0) {
    goto LABEL_35;
  }
LABEL_14:
  if ((userContextChangeBit & 0x100) != 0)
  {
LABEL_38:
    self->_unsigned int userContextChangeBit = userContextChangeBit & 0xFFFFFEFF;
    [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:@"KeyboardGlobalLanguagePriors" context:v7];
    uint64_t v19 = [(AFLanguageDetectionUserContext *)self priorsByReplacingKeyboardLanguage:self->_keyboardGlobalLanguagePriors];
    if (v19) {
      [(NSMutableDictionary *)v7 setObject:v19 forKey:@"KeyboardGlobalLanguagePriors"];
    }
  }
LABEL_41:
  v20 = self->_lidUserContext;
  self->_lidUserContext = v7;
  v21 = v7;

  id v6 = (void *)[(NSMutableDictionary *)v21 copy];
LABEL_42:
  return v6;
}

- (id)context
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_languageToggled];
  [(AFLanguageDetectionUserContext *)self _setContextValue:v4 forKey:@"WasLanguageToggled" context:v3];

  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_currentKeyboard forKey:@"CurrentKeyboard" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_prevMessageLanguage forKey:@"LastMessageLanguage" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_globalLastUsedKeyboard forKey:@"GlobalLastUsedKeyboard" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_multiLingualKeyboardLanguages forKey:@"MultilingualKeyboardLanguages" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_keyboardConvoRecentMessages forKey:@"RecentConversationalMessages" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_dictationLanguages forKey:@"DictationLanguages" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_keyboardConversationLanguagePriors forKey:@"KeyboardConversationLanguagePriors" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_keyboardGlobalLanguagePriors forKey:@"KeyboardGlobalLanguagePriors" context:v3];
  [(AFLanguageDetectionUserContext *)self _setContextValue:self->_primaryLanguageCode forKey:@"CurrentKeyboard" context:v3];
  return v3;
}

- (void)_setDictationLanguageCodeMappingCache:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  dictationLanguageMappingCache = self->_dictationLanguageMappingCache;
  self->_dictationLanguageMappingCache = v4;
}

- (void)_setFinalFilteredDictationLanguages:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  finalDictationLanguages = self->_finalDictationLanguages;
  self->_finalDictationLanguages = v4;
}

- (void)_setLanguageDetectorContext:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  lidUserContext = self->_lidUserContext;
  self->_lidUserContext = v4;
}

- (void)_setUserContextChangeBit:(unsigned int)a3
{
  self->_unsigned int userContextChangeBit = a3;
}

- (unsigned)languageDetectorContextChangeBits
{
  return self->_userContextChangeBit;
}

- (BOOL)isUpdateAvailableForLanguageDetectorContext
{
  return self->_userContextChangeBit != 0;
}

- (id)priorsByReplacingKeyboardLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = [(AFLanguageDetectionUserContext *)self getSiriDictationLanguagesFromLanguages:v5];

  if (v6 && [v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__AFLanguageDetectionUserContext_priorsByReplacingKeyboardLanguage___block_invoke;
    v12[3] = &unk_1E59256C0;
    id v13 = v4;
    id v8 = v7;
    id v14 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    v9 = v14;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __68__AFLanguageDetectionUserContext_priorsByReplacingKeyboardLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  id v6 = [*(id *)(a1 + 40) objectForKey:v13];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v5 floatValue];
    float v9 = v8;
    [v6 floatValue];
    *(float *)&double v11 = v9 + v10;
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithFloat:v11];

    id v5 = (void *)v12;
  }
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v13];
  }
}

- (id)getSiriDictationLanguagesFromLanguages:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __73__AFLanguageDetectionUserContext_getSiriDictationLanguagesFromLanguages___block_invoke;
    id v14 = &unk_1E5925698;
    uint64_t v15 = self;
    id v16 = v6;
    id v7 = v6;
    [v5 enumerateObjectsUsingBlock:&v11];
    if (objc_msgSend(v7, "count", v11, v12, v13, v14, v15)) {
      float v8 = v7;
    }
    else {
      float v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __73__AFLanguageDetectionUserContext_getSiriDictationLanguagesFromLanguages___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:");
  if (v3) {
    [*(id *)(a1 + 40) setValue:v3 forKey:v4];
  }
}

- (id)siriDictationLanguageForLanguage:(id)a3
{
  return [(AFLanguageDetectionUserContext *)self userContextLanguageCodeForKeyboardLangauge:a3 overrideLanguageCode:0];
}

- (void)setPrimaryLanguageCode:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  primaryLanguageCode = self->_primaryLanguageCode;
  self->_primaryLanguageCode = v4;

  self->_userContextChangeBit |= 2u;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  keyboardGlobalLanguagePriors = self->_keyboardGlobalLanguagePriors;
  self->_keyboardGlobalLanguagePriors = v4;

  self->_userContextChangeBit |= 0x100u;
}

- (void)setKeyboardConversationLanguagePriors:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  keyboardConversationLanguagePriors = self->_keyboardConversationLanguagePriors;
  self->_keyboardConversationLanguagePriors = v4;

  self->_userContextChangeBit |= 0x80u;
}

- (void)setDictationLanguages:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  dictationLanguages = self->_dictationLanguages;
  self->_dictationLanguages = v4;

  self->_userContextChangeBit |= 0x40u;
}

- (void)setKeyboardConvoRecentMessages:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  keyboardConvoRecentMessages = self->_keyboardConvoRecentMessages;
  self->_keyboardConvoRecentMessages = v4;

  self->_userContextChangeBit |= 0x20u;
}

- (void)setMultiLingualKeyboardLanguages:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  multiLingualKeyboardLanguages = self->_multiLingualKeyboardLanguages;
  self->_multiLingualKeyboardLanguages = v4;

  self->_userContextChangeBit |= 0x10u;
}

- (void)setGlobalLastUsedKeyboard:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  globalLastUsedKeyboard = self->_globalLastUsedKeyboard;
  self->_globalLastUsedKeyboard = v4;

  self->_userContextChangeBit |= 8u;
}

- (void)setPrevMessageLanguage:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  prevMessageLanguage = self->_prevMessageLanguage;
  self->_prevMessageLanguage = v4;

  self->_userContextChangeBit |= 4u;
}

- (void)setCurrentKeyboard:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  currentKeyboard = self->_currentKeyboard;
  self->_currentKeyboard = v4;

  self->_userContextChangeBit |= 2u;
}

- (void)setWasLanguageToggled:(BOOL)a3
{
  self->_languageToggled = a3;
  self->_userContextChangeBit |= 1u;
}

- (void)_setContextValue:(id)a3 forKey:(id)a4 context:(id)a5
{
  if (a3) {
    [(AFLanguageDetectionUserContext *)self _updateContextValue:a3 forKey:a4 context:a5];
  }
  else {
    [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:a4 context:a5];
  }
}

- (void)_updateContextValue:(id)a3 forKey:(id)a4 context:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  id v9 = a4;
  [(AFLanguageDetectionUserContext *)self _removeContextValueForKey:v9 context:v8];
  if (v10) {
    [v8 setObject:v10 forKey:v9];
  }
}

- (void)_removeContextValueForKey:(id)a3 context:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "removeObjectForKey:");
  }
}

- (AFLanguageDetectionUserContext)initWithCoder:(id)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)AFLanguageDetectionUserContext;
  id v5 = [(AFLanguageDetectionUserContext *)&v50 init];
  if (v5)
  {
    v5->_languageToggled = [v4 decodeBoolForKey:@"_languageToggled"];
    v5->_simulateLanguageDetectorAssetsAvailability = [v4 decodeBoolForKey:@"_simulateLanguageDetectorAssetsAvailability"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentKeyboard"];
    currentKeyboard = v5->_currentKeyboard;
    v5->_currentKeyboard = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_primaryLanguageCode"];
    primaryLanguageCode = v5->_primaryLanguageCode;
    v5->_primaryLanguageCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_prevMessageLanguage"];
    prevMessageLanguage = v5->_prevMessageLanguage;
    v5->_prevMessageLanguage = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_globalLastUsedKeyboard"];
    globalLastUsedKeyboard = v5->_globalLastUsedKeyboard;
    v5->_globalLastUsedKeyboard = (NSString *)v12;

    v5->_unsigned int userContextChangeBit = [v4 decodeInt32ForKey:@"_userContextChangeBit"];
    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    id v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_multiLingualKeyboardLanguages"];
    multiLingualKeyboardLanguages = v5->_multiLingualKeyboardLanguages;
    v5->_multiLingualKeyboardLanguages = (NSArray *)v17;

    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v21 = [v19 setWithArray:v20];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_keyboardConvoRecentMessages"];
    keyboardConvoRecentMessages = v5->_keyboardConvoRecentMessages;
    v5->_keyboardConvoRecentMessages = (NSArray *)v22;

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    uint64_t v26 = [v24 setWithArray:v25];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"_dictationLanguages"];
    dictationLanguages = v5->_dictationLanguages;
    v5->_dictationLanguages = (NSArray *)v27;

    id v29 = (void *)MEMORY[0x1E4F1CAD0];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v31 = [v29 setWithArray:v30];
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"_simulatingLanguageCodes"];
    simulatingLanguageCodes = v5->_simulatingLanguageCodes;
    v5->_simulatingLanguageCodes = (NSArray *)v32;

    long long v34 = (void *)MEMORY[0x1E4F1CAD0];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    long long v36 = [v34 setWithArray:v35];
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_finalDictationLanguages"];
    finalDictationLanguages = v5->_finalDictationLanguages;
    v5->_finalDictationLanguages = (NSArray *)v37;

    uint64_t v39 = [v4 decodePropertyListForKey:@"_keyboardConversationLanguagePriors"];
    keyboardConversationLanguagePriors = v5->_keyboardConversationLanguagePriors;
    v5->_keyboardConversationLanguagePriors = (NSDictionary *)v39;

    uint64_t v41 = [v4 decodePropertyListForKey:@"_keyboardGlobalLanguagePriors"];
    keyboardGlobalLanguagePriors = v5->_keyboardGlobalLanguagePriors;
    v5->_keyboardGlobalLanguagePriors = (NSDictionary *)v41;

    uint64_t v43 = [v4 decodePropertyListForKey:@"_languageCodeOverrides"];
    languageCodeOverrides = v5->_languageCodeOverrides;
    v5->_languageCodeOverrides = (NSDictionary *)v43;

    uint64_t v45 = [v4 decodePropertyListForKey:@"_lidUserContext"];
    lidUserContext = v5->_lidUserContext;
    v5->_lidUserContext = (NSMutableDictionary *)v45;

    uint64_t v47 = [v4 decodePropertyListForKey:@"_dictationLanguageMappingCache"];
    dictationLanguageMappingCache = v5->_dictationLanguageMappingCache;
    v5->_dictationLanguageMappingCache = (NSMutableDictionary *)v47;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL languageToggled = self->_languageToggled;
  id v5 = a3;
  [v5 encodeBool:languageToggled forKey:@"_languageToggled"];
  [v5 encodeBool:self->_simulateLanguageDetectorAssetsAvailability forKey:@"_simulateLanguageDetectorAssetsAvailability"];
  [v5 encodeObject:self->_currentKeyboard forKey:@"_currentKeyboard"];
  [v5 encodeObject:self->_primaryLanguageCode forKey:@"_primaryLanguageCode"];
  [v5 encodeObject:self->_prevMessageLanguage forKey:@"_prevMessageLanguage"];
  [v5 encodeObject:self->_globalLastUsedKeyboard forKey:@"_globalLastUsedKeyboard"];
  [v5 encodeInt32:self->_userContextChangeBit forKey:@"_userContextChangeBit"];
  [v5 encodeObject:self->_multiLingualKeyboardLanguages forKey:@"_multiLingualKeyboardLanguages"];
  [v5 encodeObject:self->_keyboardConvoRecentMessages forKey:@"_keyboardConvoRecentMessages"];
  [v5 encodeObject:self->_dictationLanguages forKey:@"_dictationLanguages"];
  [v5 encodeObject:self->_simulatingLanguageCodes forKey:@"_simulatingLanguageCodes"];
  [v5 encodeObject:self->_finalDictationLanguages forKey:@"_finalDictationLanguages"];
  [v5 encodeObject:self->_keyboardConversationLanguagePriors forKey:@"_keyboardConversationLanguagePriors"];
  [v5 encodeObject:self->_keyboardGlobalLanguagePriors forKey:@"_keyboardGlobalLanguagePriors"];
  [v5 encodeObject:self->_languageCodeOverrides forKey:@"_languageCodeOverrides"];
  [v5 encodeObject:self->_lidUserContext forKey:@"_lidUserContext"];
  [v5 encodeObject:self->_dictationLanguageMappingCache forKey:@"_dictationLanguageMappingCache"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"Language toggled = %d,\n", self->_languageToggled);
  [v3 appendFormat:@"Current keyboard = %@,\n", self->_currentKeyboard];
  [v3 appendFormat:@"Previous message language = %@,\n", self->_prevMessageLanguage];
  [v3 appendFormat:@"Last used keyboard = %@,\n", self->_globalLastUsedKeyboard];
  [v3 appendFormat:@"Multilingual keyboard languages = %@,\n", self->_multiLingualKeyboardLanguages];
  [v3 appendFormat:@"Primary language = %@,\n", self->_primaryLanguageCode];
  [v3 appendFormat:@"Dictation languages = %@,\n", self->_dictationLanguages];
  [v3 appendFormat:@"Global Conversational Language Priors = %@,\n", self->_keyboardConversationLanguagePriors];
  [v3 appendFormat:@"Global Keyboard Language Priors = %@,\n", self->_keyboardGlobalLanguagePriors];
  [v3 appendFormat:@"Dictation input origin = %@.\n\n", self->_dictationInputOrigin];
  return v3;
}

- (AFLanguageDetectionUserContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)AFLanguageDetectionUserContext;
  v2 = [(AFLanguageDetectionUserContext *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_unsigned int userContextChangeBit = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lidUserContext = v3->_lidUserContext;
    v3->_lidUserContext = v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictationLanguageMappingCache = v3->_dictationLanguageMappingCache;
    v3->_dictationLanguageMappingCache = v6;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultContextWithPrimaryLanguage:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(AFLanguageDetectionUserContext);
  id v5 = v4;
  if (v3)
  {
    [(AFLanguageDetectionUserContext *)v4 setPrimaryLanguageCode:v3];
    uint64_t v6 = [(AFLanguageDetectionUserContext *)v5 primaryLanguageCode];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(AFLanguageDetectionUserContext *)v5 setDictationLanguages:v7];
  }
  return v5;
}

@end