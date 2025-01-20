@interface CESRSpeechProfileSettings
+ (BOOL)_instanceSupportsAssistant:(unsigned __int8)a3;
+ (BOOL)_instanceSupportsDictation:(unsigned __int8)a3;
+ (id)defaultSettings;
+ (void)disableOverrideAcceptAllSets;
+ (void)enableOverrideAcceptAllSets;
- (BOOL)isSupportedSet:(id)a3 instanceOptions:(unsigned __int8)a4;
- (BOOL)isUserExclusiveSet:(id)a3;
- (BOOL)refreshLocales;
- (BOOL)refreshLocalesIfNeeded;
- (CESRSpeechProfileSettings)initWithAssistantLocale:(id)a3 dictationLocales:(id)a4;
- (id)_assistantLocale;
- (id)_dictationLocales;
- (void)enumerateRequiredInstances:(id)a3;
@end

@implementation CESRSpeechProfileSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationLocales, 0);

  objc_storeStrong((id *)&self->_assistantLocale, 0);
}

- (BOOL)isUserExclusiveSet:(id)a3
{
  return 0;
}

- (BOOL)isSupportedSet:(id)a3 instanceOptions:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 itemType];
  if (+[CESRUtilities isCustomerInstall])
  {
LABEL_2:
    if ((int)v6 <= 19667)
    {
      if ((int)v6 > 13883)
      {
        if ((int)v6 <= 15571)
        {
          if (v6 == 13884 || v6 == 14706) {
            goto LABEL_48;
          }
          int v7 = 14816;
        }
        else if ((int)v6 > 17033)
        {
          if (v6 == 17034) {
            goto LABEL_48;
          }
          int v7 = 18540;
        }
        else
        {
          if (v6 == 15572) {
            goto LABEL_48;
          }
          int v7 = 16251;
        }
        goto LABEL_47;
      }
      if ((int)v6 <= 7718)
      {
        if (v6 == 800 || v6 == 5595) {
          goto LABEL_48;
        }
        int v7 = 7690;
        goto LABEL_47;
      }
      if (v6 == 7719) {
        goto LABEL_48;
      }
      if (v6 == 12010)
      {
LABEL_40:
        char v13 = [(id)objc_opt_class() _instanceSupportsAssistant:v4];
        goto LABEL_51;
      }
      int v12 = 12996;
    }
    else
    {
      if ((int)v6 <= 42183)
      {
        if ((int)v6 <= 30597)
        {
          if (v6 == 19668 || v6 == 25883) {
            goto LABEL_48;
          }
          int v7 = 26512;
        }
        else
        {
          if ((int)v6 <= 36433)
          {
            if (v6 != 30598)
            {
              int v7 = 32965;
              goto LABEL_47;
            }
LABEL_48:
            if ([(id)objc_opt_class() _instanceSupportsAssistant:v4])
            {
              char v11 = 1;
              goto LABEL_52;
            }
            char v13 = [(id)objc_opt_class() _instanceSupportsDictation:v4];
LABEL_51:
            char v11 = v13;
            goto LABEL_52;
          }
          if (v6 == 36434) {
            goto LABEL_48;
          }
          int v7 = 38251;
        }
LABEL_47:
        if (v6 == v7) {
          goto LABEL_48;
        }
        goto LABEL_53;
      }
      if ((int)v6 > 53481)
      {
        if ((int)v6 > 61508)
        {
          if (v6 == 61509) {
            goto LABEL_48;
          }
          int v7 = 63369;
        }
        else
        {
          if (v6 == 53482) {
            goto LABEL_48;
          }
          int v7 = 61352;
        }
        goto LABEL_47;
      }
      if (v6 == 42184 || v6 == 44935) {
        goto LABEL_48;
      }
      int v12 = 49066;
    }
    if (v6 != v12)
    {
LABEL_53:
      v15 = [MEMORY[0x1E4F70B80] descriptionForTypeIdentifier:v6];
      v16 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:]";
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Set itemType: %@ ignored on this OS platform", buf, 0x16u);
      }

      char v11 = 0;
      goto LABEL_52;
    }
    goto LABEL_40;
  }
  v8 = [MEMORY[0x1E4F70B80] descriptionForTypeIdentifier:v6];
  v9 = _BOOLValueForKey((const __CFString *)[NSString stringWithFormat:@"Accept %@", @"*"]);
  if (!v9)
  {
    v9 = _BOOLValueForKey((const __CFString *)[NSString stringWithFormat:@"Accept %@", v8]);
    if (!v9)
    {

      goto LABEL_2;
    }
  }
  v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:]";
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Using settings override: (%@) for set: %@", buf, 0x20u);
  }
  char v11 = [v9 BOOLValue];

LABEL_52:
  return v11;
}

- (void)enumerateRequiredInstances:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, NSLocale *, uint64_t))a3;
  if (self->_assistantLocale)
  {
    if (-[NSSet containsObject:](self->_dictationLocales, "containsObject:")) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    v4[2](v4, self->_assistantLocale, v5);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(NSSet *)self->_dictationLocales allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(NSLocale **)(*((void *)&v12 + 1) + 8 * i);
        if (([(NSLocale *)v11 isEqual:self->_assistantLocale] & 1) == 0) {
          v4[2](v4, v11, 2);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)refreshLocalesIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[CESRSpeechProfileSettings refreshLocalesIfNeeded]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Refreshing locales if needed.", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v4 = [(CESRSpeechProfileSettings *)self _assistantLocale];
  assistantLocale = self->_assistantLocale;
  self->_assistantLocale = v4;

  uint64_t v6 = [(CESRSpeechProfileSettings *)self _dictationLocales];
  dictationLocales = self->_dictationLocales;
  self->_dictationLocales = v6;

  return 1;
}

- (BOOL)refreshLocales
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[CESRSpeechProfileSettings refreshLocales]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Refreshing locales.", (uint8_t *)&v9, 0xCu);
  }
  if (self->_assistantLocale)
  {
    uint64_t v4 = +[CESRUtilities installedAssistantLocale];
    assistantLocale = self->_assistantLocale;
    self->_assistantLocale = v4;
  }
  if (self->_dictationLocales)
  {
    uint64_t v6 = +[CESRUtilities installedDictationLocales];
    dictationLocales = self->_dictationLocales;
    self->_dictationLocales = v6;
  }
  return 1;
}

- (id)_dictationLocales
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!+[CESRUtilities isOfflineDictationSupported])
  {
    uint64_t v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CESRSpeechProfileSettings _dictationLocales]";
      uint64_t v8 = "%s Offline dictation not supported";
LABEL_10:
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0xCu);
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  if (!+[CESRUtilities isDictationEnabled])
  {
    uint64_t v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CESRSpeechProfileSettings _dictationLocales]";
      uint64_t v8 = "%s Dictation disabled in settings";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  dictationLocales = self->_dictationLocales;
  if (!dictationLocales)
  {
    uint64_t v4 = +[CESRUtilities installedDictationLocales];
    uint64_t v5 = self->_dictationLocales;
    self->_dictationLocales = v4;

    dictationLocales = self->_dictationLocales;
  }
  uint64_t v6 = dictationLocales;
LABEL_12:

  return v6;
}

- (id)_assistantLocale
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (+[CESRUtilities isSiriUODSupported])
  {
    if (+[CESRUtilities isSiriUODwithASROnServerSupported])
    {
      v2 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        uint64_t v7 = "-[CESRSpeechProfileSettings _assistantLocale]";
        v3 = "%s Siri UOD with ASR on Server supported";
LABEL_11:
        _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, v3, (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      if (+[CESRUtilities isAssistantEnabled])
      {
        uint64_t v4 = +[CESRUtilities installedAssistantLocale];
        goto LABEL_13;
      }
      v2 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        uint64_t v7 = "-[CESRSpeechProfileSettings _assistantLocale]";
        v3 = "%s Siri Assistant disabled in settings";
        goto LABEL_11;
      }
    }
  }
  else
  {
    v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CESRSpeechProfileSettings _assistantLocale]";
      v3 = "%s Siri UOD Not supported";
      goto LABEL_11;
    }
  }
  uint64_t v4 = 0;
LABEL_13:

  return v4;
}

- (CESRSpeechProfileSettings)initWithAssistantLocale:(id)a3 dictationLocales:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CESRSpeechProfileSettings;
  uint64_t v8 = [(CESRSpeechProfileSettings *)&v15 init];
  int v9 = v8;
  if (v8)
  {
    if (v6)
    {
      int v10 = (NSLocale *)v6;
    }
    else
    {
      int v10 = [(CESRSpeechProfileSettings *)v8 _assistantLocale];
    }
    assistantLocale = v9->_assistantLocale;
    v9->_assistantLocale = v10;

    if (v7)
    {
      uint64_t v12 = (NSSet *)v7;
    }
    else
    {
      uint64_t v12 = [(CESRSpeechProfileSettings *)v9 _dictationLocales];
    }
    dictationLocales = v9->_dictationLocales;
    v9->_dictationLocales = v12;
  }
  return v9;
}

+ (void)disableOverrideAcceptAllSets
{
  CFStringRef v2 = (const __CFString *)[NSString stringWithFormat:@"Accept %@", @"*"];

  CFPreferencesSetAppValue(v2, 0, @"com.apple.SpeechProfile");
}

+ (void)enableOverrideAcceptAllSets
{
  CFStringRef v2 = (const __CFString *)[NSString stringWithFormat:@"Accept %@", @"*"];
  v3 = (const void *)MEMORY[0x1E4F1CC38];

  CFPreferencesSetAppValue(v2, v3, @"com.apple.SpeechProfile");
}

+ (BOOL)_instanceSupportsDictation:(unsigned __int8)a3
{
  return (a3 >> 1) & 1;
}

+ (BOOL)_instanceSupportsAssistant:(unsigned __int8)a3
{
  return a3 & 1;
}

+ (id)defaultSettings
{
  CFStringRef v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssistantLocale:0 dictationLocales:0];

  return v2;
}

@end