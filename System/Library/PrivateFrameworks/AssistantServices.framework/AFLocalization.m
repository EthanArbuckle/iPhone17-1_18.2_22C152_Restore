@interface AFLocalization
+ (id)sharedInstance;
- ($6A2B22629575B71C8C7D7AB7AB1FFF1A)_voiceMaps;
- (AFLocalization)init;
- (id)_getVoiceOrdering;
- (id)_localizedStringForKey:(id)a3 tables:(id)a4 localizations:(id)a5 bundle:(id)a6;
- (id)_relevantTablesForTableName:(id)a3 tableExtension:(id)a4 bundle:(id)a5;
- (id)_voicesFromVoiceMapWithLanguage:(id)a3;
- (id)allOutputVoiceIdentifiersForSiriLanguage:(id)a3;
- (id)baseLocaleToDialectMapForLanguage:(id)a3;
- (id)compactDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4;
- (id)defaultOutputVoiceForSiriSessionLanguage:(id)a3;
- (id)dialectForBaseLanguageCode:(id)a3;
- (id)dialectsMap;
- (id)getBaseLocale:(id)a3;
- (id)getValidOutputVoiceWithDialects:(id)a3;
- (id)loadInfoForVoicesWithLanguageCode:(id)a3;
- (id)localizedCompactNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4;
- (id)localizedGenderOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4;
- (id)localizedNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4;
- (id)localizedNameOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4;
- (id)localizedNameOfOutputVoiceWithIdentifier:(id)a3 inDisplayLanguage:(id)a4;
- (id)localizedNameOfVoiceGender:(int64_t)a3 inDisplayLanguage:(id)a4;
- (id)localizedStringForKey:(id)a3 gender:(int64_t)a4 table:(id)a5 bundle:(id)a6 languageCode:(id)a7;
- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5 languageCode:(id)a6;
- (id)localizedUIUtteranceForKey:(id)a3 languageCode:(id)a4;
- (id)longDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4;
- (id)outputVoiceColorDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4;
- (id)outputVoiceComparator;
- (id)outputVoiceDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4;
- (id)voiceNamesForOutputLanguageCode:(id)a3 gender:(int64_t)a4;
- (id)voiceSimilarToVoice:(id)a3 inSiriSessionLanguage:(id)a4;
@end

@implementation AFLocalization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tables, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)getValidOutputVoiceWithDialects:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 languageCode];
  v5 = [v3 name];
  uint64_t v6 = [v3 gender];
  v7 = +[AFLocalization sharedInstance];
  v8 = [v7 allOutputVoiceIdentifiersForSiriLanguage:v4];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v8;
  uint64_t v34 = [v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (!v34)
  {

    v21 = v10;
    if (v5) {
      [v9 containsObject:v5];
    }
    v11 = 0;
    goto LABEL_29;
  }
  id obj = v10;
  v30 = v5;
  v31 = v4;
  v11 = 0;
  uint64_t v33 = *(void *)v41;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v41 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v35 = v12;
      uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v14 = +[AFLocalization sharedInstance];
      v15 = [v14 voiceNamesForOutputLanguageCode:v13 gender:v6];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v54 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            if (!v11) {
              v11 = [[AFVoiceInfo alloc] initWithLanguageCode:v13 gender:v6 name:v20 footprint:2 isCustom:1];
            }
            [v9 addObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v54 count:16];
        }
        while (v17);
      }

      uint64_t v12 = v35 + 1;
    }
    while (v35 + 1 != v34);
    uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
  }
  while (v34);
  v21 = obj;

  v5 = v30;
  if (v30)
  {
    v4 = v31;
    if (([v9 containsObject:v30] & 1) != 0 || !v11) {
      goto LABEL_29;
    }
  }
  else
  {
    v4 = v31;
    if (!v11)
    {
LABEL_29:
      v27 = (AFVoiceInfo *)v3;
      goto LABEL_30;
    }
  }
  v22 = [(AFVoiceInfo *)v11 name];

  if (v22 == v30) {
    goto LABEL_29;
  }
  v23 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = [(AFVoiceInfo *)v11 name];
    v26 = [(AFVoiceInfo *)v11 languageCode];
    *(_DWORD *)buf = 136316162;
    v45 = "-[AFLocalization getValidOutputVoiceWithDialects:]";
    __int16 v46 = 2112;
    v47 = v30;
    __int16 v48 = 2112;
    v49 = v4;
    __int16 v50 = 2112;
    v51 = v25;
    __int16 v52 = 2112;
    v53 = v26;
    _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s Invalid output voice '%@:%@' found. Updated to '%@:%@'", buf, 0x34u);

    v21 = obj;
  }
  v27 = v11;
  v11 = v27;
LABEL_30:
  v28 = v27;

  return v28;
}

- (id)voiceSimilarToVoice:(id)a3 inSiriSessionLanguage:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(AFLocalization *)self defaultOutputVoiceForSiriSessionLanguage:v7];
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v53 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
    __int16 v54 = 2112;
    id v55 = v7;
    __int16 v56 = 2112;
    id v57 = v8;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s language code: %@ output language code: %@, output voice: %@", buf, 0x2Au);
  }
  id v10 = [v6 languageCode];

  if (!v10)
  {
    uint64_t v35 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_error_impl(&dword_19CF1D000, v35, OS_LOG_TYPE_ERROR, "%s %@ missing languageCode", buf, 0x16u);
    }
    goto LABEL_24;
  }
  id v11 = [v6 name];
  if (!v11)
  {
    uint64_t v12 = [v6 languageCode];
    uint64_t v13 = -[AFLocalization voiceNamesForOutputLanguageCode:gender:](self, "voiceNamesForOutputLanguageCode:gender:", v12, [v6 gender]);
    v14 = [v13 firstObject];

    if (v14)
    {
      id v11 = v14;
      v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v53 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
        __int16 v54 = 2112;
        id v55 = v6;
        __int16 v56 = 2112;
        id v57 = v11;
        _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s Voice name not specified for %@, using %@", buf, 0x20u);
      }

      goto LABEL_9;
    }
    long long v37 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_impl(&dword_19CF1D000, v37, OS_LOG_TYPE_INFO, "%s Voice name not specified for %@, can't determine default name", buf, 0x16u);
    }
LABEL_24:
    v22 = 0;
    goto LABEL_27;
  }
LABEL_9:
  id v41 = v7;
  [(AFLocalization *)self _voiceMaps];
  id v16 = v50;
  __destructor_8_s0_s8_s16_s24((uint64_t)v49);
  id v42 = v6;
  uint64_t v17 = [v6 languageCode];
  long long v39 = v11;
  uint64_t v18 = [v17 stringByAppendingString:v11];

  v44 = v16;
  long long v38 = (void *)v18;
  v19 = [v16 objectForKey:v18];
  long long v40 = v8;
  [(AFLocalization *)self _voicesFromVoiceMapWithLanguage:v8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    v22 = 0;
    uint64_t v23 = *(void *)v46;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v27 = [v26 languageCode];
        v28 = [v26 name];
        v29 = [v27 stringByAppendingString:v28];

        v30 = [v44 objectForKey:v29];
        uint64_t v31 = [v30 integerValue];
        uint64_t v32 = [v19 integerValue];
        if (v31 - v32 >= 0) {
          uint64_t v33 = v31 - v32;
        }
        else {
          uint64_t v33 = v32 - v31;
        }
        if (v33 < v24)
        {
          id v34 = v26;

          uint64_t v24 = v33;
          v22 = v34;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  id v7 = v41;
  id v6 = v42;
  v8 = v40;
LABEL_27:

  return v22;
}

- (id)outputVoiceComparator
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__AFLocalization_outputVoiceComparator__block_invoke;
  v4[3] = &unk_1E5927950;
  v4[4] = self;
  v2 = (void *)MEMORY[0x19F3A50D0](v4, a2);
  return v2;
}

uint64_t __39__AFLocalization_outputVoiceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 name];

  if (!v7)
  {
    uint64_t v20 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_20;
    }
    int v24 = 136315394;
    v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v5;
LABEL_22:
    _os_log_error_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_ERROR, "%s %@ missing name cannot compare voices", (uint8_t *)&v24, 0x16u);
    goto LABEL_11;
  }
  v8 = [v6 name];

  if (!v8)
  {
    uint64_t v20 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v24 = 136315394;
    v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v6;
    goto LABEL_22;
  }
  id v9 = [v5 languageCode];
  id v10 = [v5 name];
  id v11 = [v9 stringByAppendingString:v10];

  uint64_t v12 = [v6 languageCode];
  uint64_t v13 = [v6 name];
  v14 = [v12 stringByAppendingString:v13];

  if (v11 && v14)
  {
    v15 = [*(id *)(a1 + 32) _getVoiceOrdering];
    id v16 = [v15 objectForKey:v11];

    uint64_t v17 = [*(id *)(a1 + 32) _getVoiceOrdering];
    uint64_t v18 = [v17 objectForKey:v14];

    if (v16 && v18)
    {
      uint64_t v19 = [v16 compare:v18];
    }
    else
    {
      v22 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136315650;
        v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
        __int16 v26 = 2112;
        id v27 = v5;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_error_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_ERROR, "%s Cannot resolve ordering for voice one: %@, voice two: %@ ", (uint8_t *)&v24, 0x20u);
      }
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_error_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_ERROR, "%s Cannot compare voices with keys (%@, %@)", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v19 = 0;
  }

LABEL_20:
  return v19;
}

- (id)voiceNamesForOutputLanguageCode:(id)a3 gender:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = -[AFLocalization _voicesFromVoiceMapWithLanguage:](self, "_voicesFromVoiceMapWithLanguage:", v6, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 gender] == a4)
        {
          v14 = [v13 name];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- ($6A2B22629575B71C8C7D7AB7AB1FFF1A)_voiceMaps
{
  if (_voiceMaps_onceToken != -1) {
    dispatch_once(&_voiceMaps_onceToken, &__block_literal_global_130);
  }
  retstr->var0 = (id)_voiceMaps_voiceMaps_0;
  retstr->var1 = (id)_voiceMaps_voiceMaps_1;
  retstr->var2 = (id)_voiceMaps_voiceMaps_2;
  result = ($6A2B22629575B71C8C7D7AB7AB1FFF1A *)(id)_voiceMaps_voiceMaps_3;
  retstr->var3 = result;
  return result;
}

void __28__AFLocalization__voiceMaps__block_invoke()
{
  v0 = [MEMORY[0x1E4FA4F78] assistantVoiceMaps];
  v1 = [v0 voicesForLanguageMap];
  v2 = [v0 relativeOrderForVoicesMap];
  id v3 = [v0 relativePitchOrderForVoicesMap];
  v4 = [v0 identifiersForVoicesMap];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __28__AFLocalization__voiceMaps__block_invoke_2;
  v15[3] = &unk_1E5927928;
  id v6 = v5;
  id v16 = v6;
  [v1 enumerateKeysAndObjectsUsingBlock:v15];
  id v7 = (void *)_voiceMaps_voiceMaps_0;
  _voiceMaps_voiceMaps_0 = (uint64_t)v6;
  id v8 = v6;

  uint64_t v9 = (void *)_voiceMaps_voiceMaps_2;
  _voiceMaps_voiceMaps_2 = (uint64_t)v2;
  id v10 = v2;

  uint64_t v11 = (void *)_voiceMaps_voiceMaps_1;
  _voiceMaps_voiceMaps_1 = (uint64_t)v3;
  id v12 = v3;

  uint64_t v13 = (void *)_voiceMaps_voiceMaps_3;
  _voiceMaps_voiceMaps_3 = (uint64_t)v4;
  id v14 = v4;
}

void __28__AFLocalization__voiceMaps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = [AFVoiceInfo alloc];
        uint64_t v13 = [v11 assistantGender];
        uint64_t v14 = [v11 isCustom];
        v15 = [v11 name];
        id v16 = [(AFVoiceInfo *)v12 initWithLanguageCode:v4 gender:v13 isCustom:v14 name:v15 footprint:2 contentVersion:0 masteredVersion:0];

        [v6 addObject:v16];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) setObject:v6 forKey:v4];
}

- (id)_getVoiceOrdering
{
  [(AFLocalization *)self _voiceMaps];
  id v2 = v4[2];
  __destructor_8_s0_s8_s16_s24((uint64_t)v4);
  return v2;
}

- (id)_voicesFromVoiceMapWithLanguage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AFLocalization *)self dialectForBaseLanguageCode:v4];
    if ([v5 count] == 1)
    {
      [(AFLocalization *)self _voiceMaps];
      id v6 = [v20[0] objectForKey:v4];
      __destructor_8_s0_s8_s16_s24((uint64_t)v20);
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            [(AFLocalization *)self _voiceMaps];
            uint64_t v13 = [v15[0] objectForKey:v12];
            [v6 addObjectsFromArray:v13];

            __destructor_8_s0_s8_s16_s24((uint64_t)v15);
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    uint64_t v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[AFLocalization _voicesFromVoiceMapWithLanguage:]";
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s nil language code provided", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)loadInfoForVoicesWithLanguageCode:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AFLocalization *)self _voicesFromVoiceMapWithLanguage:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[AFLocalization loadInfoForVoicesWithLanguageCode:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Missing voice map for language %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)defaultOutputVoiceForSiriSessionLanguage:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    AFOutputVoiceLanguageForRecognitionLanguage(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"en-US";
    id v5 = @"en-US";
  }

  return v4;
}

- (id)dialectForBaseLanguageCode:(id)a3
{
  id v4 = a3;
  id v5 = [(AFLocalization *)self baseLocaleToDialectMapForLanguage:v4];
  id v6 = [(AFLocalization *)self getBaseLocale:v4];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)getBaseLocale:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "rangeOfString:options:range:", @"[^-]+-[^-]+-", 1024, 0, objc_msgSend(v3, "length"));
  if (v4)
  {
    id v5 = [v3 substringToIndex:v4 - 1];
  }
  else
  {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)allOutputVoiceIdentifiersForSiriLanguage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__AFLocalization_allOutputVoiceIdentifiersForSiriLanguage___block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    if (allOutputVoiceIdentifiersForSiriLanguage__onceToken != -1) {
      dispatch_once(&allOutputVoiceIdentifiersForSiriLanguage__onceToken, block);
    }
    id v5 = [(id)allOutputVoiceIdentifiersForSiriLanguage__dialectMapping objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v11[0] = v4;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

void __59__AFLocalization_allOutputVoiceIdentifiersForSiriLanguage___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)allOutputVoiceIdentifiersForSiriLanguage__dialectMapping;
  allOutputVoiceIdentifiersForSiriLanguage__dialectMapping = (uint64_t)v2;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [*(id *)(a1 + 32) dialectsMap];
  id v5 = [v4 allKeys];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = [*(id *)(a1 + 32) dialectsMap];
        __int16 v12 = [v11 objectForKey:v9];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [*(id *)(a1 + 32) getBaseLocale:*(void *)(*((void *)&v20 + 1) + 8 * v16)];
              if (([v10 containsObject:v17] & 1) == 0) {
                [v10 addObject:v17];
              }

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        [(id)allOutputVoiceIdentifiersForSiriLanguage__dialectMapping setObject:v10 forKey:v9];
        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
}

- (id)baseLocaleToDialectMapForLanguage:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __52__AFLocalization_baseLocaleToDialectMapForLanguage___block_invoke;
    uint64_t v13 = &unk_1E592C678;
    uint64_t v14 = self;
    if (baseLocaleToDialectMapForLanguage__onceToken != -1) {
      dispatch_once(&baseLocaleToDialectMapForLanguage__onceToken, &v10);
    }
    id v5 = -[AFLocalization getBaseLocale:](self, "getBaseLocale:", v4, v10, v11, v12, v13, v14);
    uint64_t v6 = [(id)baseLocaleToDialectMapForLanguage__rootLocaleMap objectForKey:v5];
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      uint64_t v15 = v5;
      v16[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

void __52__AFLocalization_baseLocaleToDialectMapForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) dialectsMap];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = (void *)baseLocaleToDialectMapForLanguage__rootLocaleMap;
  baseLocaleToDialectMapForLanguage__rootLocaleMap = (uint64_t)v3;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "getBaseLocale:", v10, (void)v18);
        __int16 v12 = [(id)baseLocaleToDialectMapForLanguage__rootLocaleMap objectForKey:v11];

        if (!v12)
        {
          uint64_t v13 = (void *)baseLocaleToDialectMapForLanguage__rootLocaleMap;
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v13 setValue:v14 forKey:v11];
        }
        uint64_t v15 = [(id)baseLocaleToDialectMapForLanguage__rootLocaleMap objectForKeyedSubscript:v11];
        char v16 = [v15 containsObject:v10];

        if ((v16 & 1) == 0)
        {
          long long v17 = [(id)baseLocaleToDialectMapForLanguage__rootLocaleMap objectForKeyedSubscript:v11];
          [v17 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (id)dialectsMap
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"AssistantVoiceDialects" ofType:@"plist"];

  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];

  return v4;
}

- (id)outputVoiceDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AFLocalization outputVoiceDescriptorForOutputLanguageCode:voiceName:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v45 = (uint64_t)v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s languageCode: %@, voiceName: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = [(AFLocalization *)self _voicesFromVoiceMapWithLanguage:v6];
  uint64_t v10 = [(AFLocalization *)self outputVoiceComparator];
  uint64_t v11 = [v9 sortedArrayUsingComparator:v10];

  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  id v34 = __71__AFLocalization_outputVoiceDescriptorForOutputLanguageCode_voiceName___block_invoke;
  uint64_t v35 = &unk_1E59278F8;
  id v12 = v7;
  id v36 = v12;
  long long v37 = buf;
  [v11 enumerateObjectsUsingBlock:&v32];
  if (*(void *)(*(void *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v38 = 136315650;
      long long v39 = "-[AFLocalization outputVoiceDescriptorForOutputLanguageCode:voiceName:]";
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s No descriptor found for language code %@, voice name %@", v38, 0x20u);
    }
    id v14 = 0;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v16 = [(AFLocalization *)self localizedStringForKey:@"VOICE" table:@"SiriLanguages" bundle:v15 languageCode:0];
    long long v17 = (void *)v16;
    long long v18 = @"Voice";
    if (v16) {
      long long v18 = (__CFString *)v16;
    }
    long long v19 = v18;

    uint64_t v20 = [(AFLocalization *)self localizedStringForKey:@"VOICE_AND_NUMBER" table:@"SiriLanguages" bundle:v15 languageCode:0];
    long long v21 = (void *)v20;
    long long v22 = @"%1$@ %2$lu";
    if (v20) {
      long long v22 = (__CFString *)v20;
    }
    uint64_t v23 = v22;

    long long v24 = objc_msgSend(NSString, "localizedStringWithFormat:", v23, v19, *(void *)(*(void *)&buf[8] + 24) + 1, v32, v33, v34, v35);

    long long v25 = [(AFLocalization *)self localizedNameOfOutputVoiceWithIdentifier:v6 inDisplayLanguage:0];
    uint64_t v26 = [(AFLocalization *)self localizedStringForKey:@"REGION_AND_VOICE" table:@"SiriLanguages" bundle:v15 languageCode:0];
    long long v27 = (void *)v26;
    __int16 v28 = @"%1$@ (%2$@)";
    if (v26) {
      __int16 v28 = (__CFString *)v26;
    }
    id v29 = v28;

    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", v29, v25, v24);

    id v14 = [[AFOutputVoiceDescriptor alloc] initWithLocalizedDisplay:v24 localizedDisplayWithRegion:v30];
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

void __71__AFLocalization_outputVoiceDescriptorForOutputLanguageCode_voiceName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 name];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)outputVoiceColorDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4
{
  id v4 = [(AFLocalization *)self outputVoiceDescriptorForOutputLanguageCode:a3 voiceName:a4];
  if (v4)
  {
    id v5 = [AFOutputVoiceColorDescriptor alloc];
    id v6 = [v4 localizedDisplay];
    id v7 = [v4 localizedDisplayWithRegion];
    LODWORD(v8) = 1.0;
    uint64_t v9 = [(AFOutputVoiceColorDescriptor *)v5 initWithHexColor:@"#1190E4" colorName:&stru_1EEE35D28 alpha:v6 localizedOutputVoiceColor:v7 localizedOutputVoice:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)localizedNameOfVoiceGender:(int64_t)a3 inDisplayLanguage:(id)a4
{
  if ((unint64_t)(a3 - 1) > 2) {
    id v5 = @"VOICE_GENDER_UNSPECIFIED";
  }
  else {
    id v5 = off_1E5927970[a3 - 1];
  }
  id v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  double v8 = [v6 bundleForClass:objc_opt_class()];
  uint64_t v9 = [(AFLocalization *)self localizedStringForKey:v5 table:@"SiriLanguages" bundle:v8 languageCode:v7];

  return v9;
}

- (id)localizedGenderOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4
{
  id v6 = a4;
  if (a3) {
    uint64_t v7 = [a3 gender];
  }
  else {
    uint64_t v7 = 0;
  }
  double v8 = [(AFLocalization *)self localizedNameOfVoiceGender:v7 inDisplayLanguage:v6];

  return v8;
}

- (id)localizedNameOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 languageCode];
  double v8 = [(AFLocalization *)self localizedNameOfOutputVoiceWithIdentifier:v7 inDisplayLanguage:v6];

  return v8;
}

- (id)localizedNameOfOutputVoiceWithIdentifier:(id)a3 inDisplayLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    double v8 = [@"VOICE_" stringByAppendingString:v6];
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [(AFLocalization *)self localizedStringForKey:v8 table:@"SiriLanguages" bundle:v9 languageCode:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)localizedNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4
{
  return [(AFLocalization *)self longDisplayNameInLanguage:a4 forSiriLanguage:a3];
}

- (id)localizedCompactNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4
{
  return [(AFLocalization *)self compactDisplayNameInLanguage:a4 forSiriLanguage:a3];
}

- (id)compactDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    double v8 = [@"COMPACT_" stringByAppendingString:v7];
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [(AFLocalization *)self localizedStringForKey:v8 table:@"SiriLanguages" bundle:v9 languageCode:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)longDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (v6)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v6];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    uint64_t v10 = (void *)v8;
    uint64_t v11 = [@"LONG_" stringByAppendingString:v7];
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [(AFLocalization *)self localizedStringForKey:v11 table:@"SiriLanguages" bundle:v12 languageCode:v6];

    if (([v7 hasPrefix:@"zh"] & 1) != 0
      || [v7 hasPrefix:@"yue"])
    {
      if (AFHasGreenTeaCapability_onceToken != -1) {
        dispatch_once(&AFHasGreenTeaCapability_onceToken, &__block_literal_global_69);
      }
      if (AFHasGreenTeaCapability_result) {
        goto LABEL_14;
      }
      if (AFIsChinaSKU_onceToken != -1) {
        dispatch_once(&AFIsChinaSKU_onceToken, &__block_literal_global_74_45520);
      }
      if (AFIsChinaSKU_isRunningOnChinaSKU)
      {
LABEL_14:
        uint64_t v13 = [@"GREENTEA_" stringByAppendingString:v7];
        id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v15 = [(AFLocalization *)self localizedStringForKey:v13 table:@"SiriLanguages" bundle:v14 languageCode:v6];
        uint64_t v16 = (void *)v15;
        if (v15) {
          long long v17 = (void *)v15;
        }
        else {
          long long v17 = v9;
        }
        id v18 = v17;

        uint64_t v9 = v18;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)localizedStringForKey:(id)a3 gender:(int64_t)a4 table:(id)a5 bundle:(id)a6 languageCode:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (unint64_t)a3;
  uint64_t v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__17037;
  long long v38 = __Block_byref_object_dispose__17038;
  id v39 = 0;
  uint64_t v16 = [v14 bundleIdentifier];
  if (![(__CFString *)v13 length])
  {

    uint64_t v13 = @"Localizable";
  }
  if (![v15 length])
  {
    long long v17 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v18 = [v17 objectForKey:*MEMORY[0x1E4F1C430]];

    id v15 = (id)v18;
  }
  id v19 = 0;
  if (v15 && v16)
  {
    uint64_t v20 = @"_MALE";
    if (a4 != 1) {
      uint64_t v20 = 0;
    }
    if (a4 == 2) {
      uint64_t v20 = @"_FEMALE";
    }
    long long v21 = v20;
    if (v21)
    {
      uint64_t v22 = [(id)v12 stringByAppendingString:v21];
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (v12 | v22)
    {
      queue = self->_queue;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __73__AFLocalization_localizedStringForKey_gender_table_bundle_languageCode___block_invoke;
      v26[3] = &unk_1E59278D0;
      v26[4] = self;
      id v27 = v16;
      __int16 v28 = v13;
      id v29 = v15;
      id v30 = (id)v22;
      uint64_t v33 = &v34;
      id v31 = (id)v12;
      id v32 = v14;
      dispatch_sync(queue, v26);
      id v19 = (id)v35[5];
    }
    else
    {
      uint64_t v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v41 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]";
        _os_log_error_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_ERROR, "%s Missing key and genderKey, unable to perform localized string lookup", buf, 0xCu);
      }
      id v19 = 0;
    }
  }
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __73__AFLocalization_localizedStringForKey_gender_table_bundle_languageCode___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v90[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(*(void *)(v1 + 32) + 16) setObject:v2 forKey:*(void *)(v1 + 40)];
  }
  id v3 = [v2 objectForKey:*(void *)(v1 + 48)];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setObject:v3 forKey:*(void *)(v1 + 48)];
  }
  id v4 = [v3 objectForKey:*(void *)(v1 + 56)];
  if (!v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  if (!*(void *)(v1 + 64)) {
    goto LABEL_65;
  }
  id v5 = objc_msgSend(v4, "objectForKey:");
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(v1 + 88) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(v1 + 88) + 8) + 40))
  {
LABEL_65:
    if (!*(void *)(v1 + 72)) {
      goto LABEL_11;
    }
    uint64_t v9 = objc_msgSend(v4, "objectForKey:");
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(v1 + 88) + 8);
    unint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(v1 + 88) + 8) + 40))
    {
LABEL_11:
      CFArrayRef v13 = (const __CFArray *)[*(id *)(v1 + 80) localizations];
      v90[0] = *(void *)(v1 + 56);
      CFArrayRef v14 = CFBundleCopyLocalizationsForPreferences(v13, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1]);
      id v15 = [*(id *)(v1 + 32) _relevantTablesForTableName:*(void *)(v1 + 48) tableExtension:@"loctable" bundle:*(void *)(v1 + 80)];
      uint64_t v16 = *(void *)(v1 + 64);
      v63 = (void *)(v1 + 64);
      long long v17 = v4;
      if (v16)
      {
        uint64_t v18 = [*(id *)(v1 + 32) _localizedStringForKey:v16 tables:v15 localizations:v14 bundle:*(void *)(v1 + 80)];
        if (v18)
        {
          id v19 = (void *)v18;
          uint64_t v20 = v15;
          long long v21 = (id *)(v1 + 64);
          goto LABEL_17;
        }
      }
      uint64_t v22 = *(void *)(v1 + 72);
      v62 = (void *)(v1 + 72);
      if (v22)
      {
        uint64_t v23 = [*(id *)(v1 + 32) _localizedStringForKey:v22 tables:v15 localizations:v14 bundle:*(void *)(v1 + 80)];
        if (v23)
        {
          id v19 = (void *)v23;
          uint64_t v20 = v15;
          long long v21 = (id *)(v1 + 72);
LABEL_17:
          id v24 = *v21;
          if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v25 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
          }
          else
          {
            uint64_t v26 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
              __int16 v82 = 2112;
              id v83 = v4;
              _os_log_debug_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_DEBUG, "%s stringsMap: %@", buf, 0x16u);
            }
            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v27 = v25;
          [v25 setObject:v19 forKey:v24];
          id v4 = v27;

          [v3 setObject:v4 forKey:*(void *)(v1 + 56)];
          uint64_t v28 = [v19 copy];
          uint64_t v29 = *(void *)(*(void *)(v1 + 88) + 8);
          id v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          id v15 = v20;
LABEL_61:

          goto LABEL_62;
        }
      }
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      CFArrayRef v31 = v14;
      uint64_t v69 = [(__CFArray *)v31 countByEnumeratingWithState:&v76 objects:v89 count:16];
      if (v69)
      {
        uint64_t v60 = v15;
        id v61 = v2;
        char v64 = 0;
        v65 = v3;
        uint64_t v66 = *(void *)v77;
        CFArrayRef v67 = v31;
        uint64_t v68 = v1;
LABEL_26:
        uint64_t v32 = 0;
        while (1)
        {
          v71 = v4;
          if (*(void *)v77 != v66) {
            objc_enumerationMutation(v31);
          }
          uint64_t v33 = *(void *)(*((void *)&v76 + 1) + 8 * v32);
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v35 = [*(id *)(v1 + 80) URLsForResourcesWithExtension:@"strings" subdirectory:0 localization:v33];
          v70 = [NSString stringWithFormat:@"^%@-*\\w*\\.%@$", *(void *)(v1 + 48), @"strings"];
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:");
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v37 = v35;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v88 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v73 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                id v43 = [v42 lastPathComponent];
                if (objc_msgSend(v36, "numberOfMatchesInString:options:range:", v43, 0, 0, objc_msgSend(v43, "length")))
                {
                  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v42];
                  [v34 addEntriesFromDictionary:v44];
                }
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v72 objects:v88 count:16];
            }
            while (v39);
          }

          uint64_t v45 = [v34 count];
          if (v45)
          {
            uint64_t v1 = v68;
            if (v71 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              [v34 addEntriesFromDictionary:v71];
            }
            else
            {
              uint64_t v46 = AFSiriLogContextConnection;
              if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
                __int16 v82 = 2112;
                id v83 = v71;
                _os_log_debug_impl(&dword_19CF1D000, v46, OS_LOG_TYPE_DEBUG, "%s stringsMap: %@", buf, 0x16u);
              }
            }
            id v4 = v34;

            [v65 setObject:v4 forKey:*(void *)(v68 + 56)];
            char v64 = 1;
          }
          else
          {
            uint64_t v1 = v68;
            id v4 = v71;
          }

          CFArrayRef v31 = v67;
          if (v45) {
            break;
          }
          if (++v32 == v69)
          {
            uint64_t v69 = [(__CFArray *)v67 countByEnumeratingWithState:&v76 objects:v89 count:16];
            if (v69) {
              goto LABEL_26;
            }
            break;
          }
        }

        id v2 = v61;
        id v3 = v65;
        id v15 = v60;
        if (v64) {
          goto LABEL_53;
        }
      }
      else
      {
      }
      long long v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKey:*(void *)(v1 + 56)];

LABEL_53:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_66;
      }
      if (!*v63) {
        goto LABEL_67;
      }
      long long v48 = objc_msgSend(v4, "objectForKey:");
      uint64_t v49 = [v48 copy];
      uint64_t v50 = *(void *)(*(void *)(v1 + 88) + 8);
      v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;

      if (!*(void *)(*(void *)(*(void *)(v1 + 88) + 8) + 40))
      {
LABEL_67:
        if (!*v62) {
          goto LABEL_66;
        }
        __int16 v52 = objc_msgSend(v4, "objectForKey:");
        uint64_t v53 = [v52 copy];
        uint64_t v54 = *(void *)(*(void *)(v1 + 88) + 8);
        id v55 = *(void **)(v54 + 40);
        *(void *)(v54 + 40) = v53;

        if (!*(void *)(*(void *)(*(void *)(v1 + 88) + 8) + 40))
        {
LABEL_66:
          if (!*(void *)(*(void *)(*(void *)(v1 + 88) + 8) + 40))
          {
            __int16 v56 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              id v57 = *(void **)(v1 + 72);
              uint64_t v58 = *(void *)(v1 + 48);
              uint64_t v59 = *(void *)(v1 + 56);
              *(_DWORD *)buf = 136315906;
              v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
              __int16 v82 = 2112;
              id v83 = v57;
              __int16 v84 = 2112;
              uint64_t v85 = v58;
              __int16 v86 = 2112;
              uint64_t v87 = v59;
              _os_log_error_impl(&dword_19CF1D000, v56, OS_LOG_TYPE_ERROR, "%s Missing localization strings for key: %@, table: %@, languageCode: %@", buf, 0x2Au);
            }
          }
        }
      }
      goto LABEL_61;
    }
  }
LABEL_62:
}

- (id)_localizedStringForKey:(id)a3 tables:(id)a4 localizations:(id)a5 bundle:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9 && [v10 count] && (uint64_t v13 = objc_msgSend(v11, "count"), v12) && v13)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v35 = v11;
    id v14 = v11;
    uint64_t v31 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v31)
    {
      uint64_t v15 = *(void *)v41;
      uint64_t v33 = v14;
      id v34 = v10;
      uint64_t v30 = *(void *)v41;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v14);
          }
          uint64_t v32 = v16;
          uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v18 = v10;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v37;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                id v24 = [NSString stringWithFormat:@"NOT_FOUND:(%@)", v9];
                id v25 = [v12 localizedStringForKey:v9 value:v24 table:v23 localization:v17];
                uint64_t v26 = v25;
                if (v25 && ![v25 isEqualToString:v24])
                {

                  id v10 = v34;
                  goto LABEL_31;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          uint64_t v16 = v32 + 1;
          id v14 = v33;
          id v10 = v34;
          uint64_t v15 = v30;
        }
        while (v32 + 1 != v31);
        uint64_t v31 = [v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v31);
    }

    id v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      long long v47 = "-[AFLocalization _localizedStringForKey:tables:localizations:bundle:]";
      __int16 v48 = 2112;
      id v49 = v9;
      __int16 v50 = 2112;
      id v51 = v10;
      __int16 v52 = 2112;
      id v53 = v14;
      __int16 v54 = 2112;
      id v55 = v12;
      _os_log_error_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_ERROR, "%s Could not find localization for key: %@, tables: %@, localizations: %@, bundle: %@", buf, 0x34u);
    }
    uint64_t v26 = 0;
LABEL_31:
    id v11 = v35;
  }
  else
  {
    uint64_t v28 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      long long v47 = "-[AFLocalization _localizedStringForKey:tables:localizations:bundle:]";
      __int16 v48 = 2112;
      id v49 = v9;
      __int16 v50 = 2112;
      id v51 = v10;
      __int16 v52 = 2112;
      id v53 = v11;
      __int16 v54 = 2112;
      id v55 = v12;
      _os_log_error_impl(&dword_19CF1D000, v28, OS_LOG_TYPE_ERROR, "%s Missing parameter(s). key: %@, tables: %@, localizations: %@, bundle: %@", buf, 0x34u);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_relevantTablesForTableName:(id)a3 tableExtension:(id)a4 bundle:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  id v11 = 0;
  if (!v7) {
    goto LABEL_21;
  }
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v12 = [v7 length];
  id v11 = 0;
  if (!v8 || !v12) {
    goto LABEL_21;
  }
  if (![v8 length])
  {
LABEL_20:
    id v11 = 0;
    goto LABEL_21;
  }
  if (([v8 isEqualToString:@"loctable"] & 1) == 0
    && ([v8 isEqualToString:@"strings"] & 1) == 0)
  {
    uint64_t v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[AFLocalization _relevantTablesForTableName:tableExtension:bundle:]";
      _os_log_error_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_ERROR, "%s tableExtension must be loctable or strings", buf, 0xCu);
    }
    goto LABEL_20;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = [NSString stringWithFormat:@"^%@-*\\w*\\.%@$", v7, v8];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:");
  id v24 = v10;
  id v14 = [v10 URLsForResourcesWithExtension:v8 subdirectory:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) lastPathComponent];
        if (objc_msgSend(v13, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length")))
        {
          uint64_t v20 = [v19 stringByDeletingPathExtension];
          [v11 addObject:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  id v10 = v24;
LABEL_21:

  return v11;
}

- (id)localizedUIUtteranceForKey:(id)a3 languageCode:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 bundleForClass:objc_opt_class()];
  id v10 = [(AFLocalization *)self localizedStringForKey:v8 table:@"UIUtterances-JS" bundle:v9 languageCode:v7];

  return v10;
}

- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5 languageCode:(id)a6
{
  return [(AFLocalization *)self localizedStringForKey:a3 gender:0 table:a4 bundle:a5 languageCode:a6];
}

- (AFLocalization)init
{
  v9.receiver = self;
  v9.super_class = (Class)AFLocalization;
  id v2 = [(AFLocalization *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AFLocalization", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tables = v2->_tables;
    v2->_tables = v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17079 != -1) {
    dispatch_once(&sharedInstance_onceToken_17079, &__block_literal_global_17080);
  }
  id v2 = (void *)sharedInstance_sLocalization;
  return v2;
}

void __32__AFLocalization_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AFLocalization);
  uint64_t v1 = (void *)sharedInstance_sLocalization;
  sharedInstance_sLocalization = (uint64_t)v0;
}

@end