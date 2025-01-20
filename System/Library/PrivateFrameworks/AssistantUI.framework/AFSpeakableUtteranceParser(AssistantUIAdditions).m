@interface AFSpeakableUtteranceParser(AssistantUIAdditions)
+ (id)_domainsForStringWithFormat:()AssistantUIAdditions;
+ (id)afui_speakableUtteranceParserForCurrentLanguage;
- (id)_builtInDomains;
- (uint64_t)afui_hasExternalDomainsForStringWithFormat:()AssistantUIAdditions;
@end

@implementation AFSpeakableUtteranceParser(AssistantUIAdditions)

+ (id)afui_speakableUtteranceParserForCurrentLanguage
{
  id v0 = objc_alloc(MEMORY[0x263EFF960]);
  v2 = AFUIGetLanguageCode(v0, v1);
  v3 = (void *)[v0 initWithLocaleIdentifier:v2];

  v4 = (void *)[objc_alloc(MEMORY[0x263F28640]) initWithLocale:v3];

  return v4;
}

- (uint64_t)afui_hasExternalDomainsForStringWithFormat:()AssistantUIAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() _domainsForStringWithFormat:v4];
  if (v5)
  {
    v6 = [a1 _builtInDomains];
    uint64_t v7 = [v5 isSubsetOfSet:v6] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "-[AFSpeakableUtteranceParser(AssistantUIAdditions) afui_hasExternalDomainsForStringWithFormat:]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_INFO, "%s Format string: %@ has external domains: %d", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (id)_builtInDomains
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([a1 handleTTSCodes]) {
    [v2 addObject:@"tts"];
  }
  if ([a1 handlesFunctions]) {
    [v2 addObject:@"fn"];
  }

  return v2;
}

+ (id)_domainsForStringWithFormat:()AssistantUIAdditions
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v5 = [v3 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__AFSpeakableUtteranceParser_AssistantUIAdditions___domainsForStringWithFormat___block_invoke;
  v11[3] = &unk_264692E20;
  id v13 = &v20;
  __int16 v14 = &v16;
  int v15 = v24;
  id v6 = v4;
  id v12 = v6;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v11);
  if (*((unsigned char *)v21 + 24) || *((unsigned char *)v17 + 24))
  {

    uint64_t v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      +[AFSpeakableUtteranceParser(AssistantUIAdditions) _domainsForStringWithFormat:]((uint64_t)v3, v7);
    }
    id v6 = 0;
  }
  v8 = v12;
  id v9 = v6;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

  return v9;
}

+ (void)_domainsForStringWithFormat:()AssistantUIAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "+[AFSpeakableUtteranceParser(AssistantUIAdditions) _domainsForStringWithFormat:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s Malformed parse for format string: %@", (uint8_t *)&v2, 0x16u);
}

@end