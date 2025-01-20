@interface ADDictationProperties
- (BOOL)_getIsAutoPunctuationEnabled;
- (BOOL)_getIsDictationEnabled;
- (id)_getEnabledDictationLocales;
- (id)getODDDictationProperties;
@end

@implementation ADDictationProperties

- (BOOL)_getIsAutoPunctuationEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 dictationAutoPunctuationEnabled];

  return v3;
}

- (id)_getEnabledDictationLocales
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 enabledDictationLocales];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = objc_msgSend(v3, "allKeys", 0);
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v3 objectForKey:v10];
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          id v13 = objc_alloc_init((Class)SISchemaLocaleIdentifier);
          v14 = [v10 componentsSeparatedByString:@"_"];
          if ([v14 count] == (id)2)
          {
            v15 = [v14 firstObject];
            [v13 setLanguageCode:v15];

            v16 = [v14 lastObject];
            [v13 setCountryCode:v16];
          }
          [v4 addObject:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_getIsDictationEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 dictationIsEnabled];

  return v3;
}

- (id)getODDDictationProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ADDictationProperties getODDDictationProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDDictationProperties);
  objc_msgSend(v4, "setIsDictationEnabled:", -[ADDictationProperties _getIsDictationEnabled](self, "_getIsDictationEnabled"));
  v5 = [(ADDictationProperties *)self _getEnabledDictationLocales];
  [v4 setEnabledDictationLocales:v5];

  objc_msgSend(v4, "setIsAutoPunctuationEnabled:", -[ADDictationProperties _getIsAutoPunctuationEnabled](self, "_getIsAutoPunctuationEnabled"));
  return v4;
}

@end