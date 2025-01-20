@interface WFSpeechSynthesisVoice
+ (id)availableLanguageCodes;
+ (id)currentLanguageCode;
+ (id)defaultVoiceForLanguageCode:(id)a3;
+ (id)voiceForIdentifier:(id)a3;
+ (id)voiceFromAVVoice:(id)a3;
+ (id)voicesForLanguageCode:(id)a3;
- (AVSpeechSynthesisVoice)avVoice;
- (BOOL)isSiriVoice;
- (NSString)identifier;
- (NSString)languageCode;
- (NSString)name;
- (NSString)vsVoiceName;
- (WFSpeechSynthesisVoice)initWithIdentifier:(id)a3;
- (id)description;
- (void)setAvVoice:(id)a3;
@end

@implementation WFSpeechSynthesisVoice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avVoice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setAvVoice:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)vsVoiceName
{
  [(WFSpeechSynthesisVoice *)self identifier];
  v9[0] = 0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v3 = getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr;
  v14 = getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr;
  if (!getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr)
  {
    v9[1] = (id)MEMORY[0x263EF8330];
    v9[2] = (id)3221225472;
    v9[3] = __getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_block_invoke;
    v9[4] = &unk_264E5EC88;
    v10 = &v11;
    v4 = AccessibilityUtilitiesLibrary();
    v12[3] = (uint64_t)dlsym(v4, "AXGetComponentsInSiriVoiceIdentifier");
    getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(v10[1] + 24);
    v3 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v3)
  {
    ((void (*)(id, void, void, void, id *))v3)(v2, 0, 0, 0, v9);

    id v5 = v9[0];
    return (NSString *)v5;
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL WFAXGetComponentsInSiriVoiceIdentifier(NSString *__strong, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"WFSpeechSynthesisVoice.m", 27, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (AVSpeechSynthesisVoice)avVoice
{
  avVoice = self->_avVoice;
  if (avVoice)
  {
    v3 = avVoice;
  }
  else
  {
    id AVSpeechSynthesisVoiceClass = getAVSpeechSynthesisVoiceClass();
    v6 = [(WFSpeechSynthesisVoice *)self identifier];
    v3 = [AVSpeechSynthesisVoiceClass _voiceFromInternalVoiceListWithIdentifier:v6];
  }
  return v3;
}

- (BOOL)isSiriVoice
{
  v3 = [getAXAlternativeVoicesClass() sharedInstance];
  v4 = [(WFSpeechSynthesisVoice *)self identifier];
  char v5 = [v3 isSiriVoiceIdentifier:v4];

  return v5;
}

- (NSString)languageCode
{
  id v2 = [(WFSpeechSynthesisVoice *)self avVoice];
  v3 = [v2 language];

  return (NSString *)v3;
}

- (NSString)name
{
  v3 = [(WFSpeechSynthesisVoice *)self avVoice];
  v4 = [v3 name];

  char v5 = [getAXAlternativeVoicesClass() sharedInstance];
  v6 = [(WFSpeechSynthesisVoice *)self identifier];
  int v7 = [v5 isSiriVoiceIdentifier:v6];

  if (v7)
  {
    v8 = [(WFSpeechSynthesisVoice *)self identifier];
    uint64_t v9 = [v5 nameForVoiceIdentifier:v8];

    v4 = (void *)v9;
  }

  return (NSString *)v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = [(WFSpeechSynthesisVoice *)self identifier];
  int v7 = [(WFSpeechSynthesisVoice *)self vsVoiceName];
  v8 = [(WFSpeechSynthesisVoice *)self avVoice];
  uint64_t v9 = [v3 stringWithFormat:@"<%p %@> Identifier: %@, (VS voice name: %@ AV voice: %@)", self, v5, v6, v7, v8];

  return v9;
}

- (WFSpeechSynthesisVoice)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSpeechSynthesisVoice.m", 63, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFSpeechSynthesisVoice;
  int v7 = [(WFSpeechSynthesisVoice *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    uint64_t v9 = v8;
  }

  return v8;
}

+ (id)voiceFromAVVoice:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFSpeechSynthesisVoice.m", 202, @"Invalid parameter not satisfying: %@", @"avVoice" object file lineNumber description];
  }
  id v6 = [WFSpeechSynthesisVoice alloc];
  int v7 = [v5 identifier];
  v8 = [(WFSpeechSynthesisVoice *)v6 initWithIdentifier:v7];

  [(WFSpeechSynthesisVoice *)v8 setAvVoice:v5];
  return v8;
}

+ (id)currentLanguageCode
{
  id AVSpeechSynthesisVoiceClass = getAVSpeechSynthesisVoiceClass();
  return (id)[AVSpeechSynthesisVoiceClass currentLanguageCode];
}

+ (id)availableLanguageCodes
{
  id v2 = [getAVSpeechSynthesisVoiceClass() _speechVoicesIncludingSiri];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_19);
  v4 = [MEMORY[0x263EFFA08] setWithArray:v3];

  return v4;
}

uint64_t __48__WFSpeechSynthesisVoice_availableLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 language];
}

+ (id)defaultVoiceForLanguageCode:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v5 = (void *)getAXSettingsClass_softClass;
  uint64_t v29 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __getAXSettingsClass_block_invoke;
    v24 = &unk_264E5EC88;
    v25 = &v26;
    __getAXSettingsClass_block_invoke((uint64_t)&v21);
    id v5 = (void *)v27[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v26, 8);
  int v7 = [v6 sharedInstance];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v8 = (void *)getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr;
  uint64_t v29 = getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr;
  if (!getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __getAXSpeechSourceKeySpeechFeaturesSymbolLoc_block_invoke;
    v24 = &unk_264E5EC88;
    v25 = &v26;
    uint64_t v9 = AccessibilityUtilitiesLibrary();
    v10 = dlsym(v9, "AXSpeechSourceKeySpeechFeatures");
    *(void *)(v25[1] + 24) = v10;
    getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr = *(void *)(v25[1] + 24);
    v8 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString *getAXSpeechSourceKeySpeechFeatures(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFSpeechSynthesisVoice.m", 42, @"%s", dlerror());

    __break(1u);
    return result;
  }
  uint64_t v11 = [v7 speechVoiceIdentifierForLanguage:v4 sourceKey:*v8 exists:0];
  if (!v11)
  {
    uint64_t v13 = 0;
LABEL_11:
    if (![v4 length])
    {
      uint64_t v15 = +[WFSpeechSynthesisVoice currentLanguageCode];

      id v4 = (id)v15;
    }
    uint64_t v16 = [getAVSpeechSynthesisVoiceClass() voiceWithLanguage:v4];

    uint64_t v13 = (void *)v16;
    goto LABEL_14;
  }
  objc_super v12 = [getAVSpeechSynthesisVoiceClass() _voiceFromInternalVoiceListWithIdentifier:v11];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_11;
  }
  id v14 = [v12 language];

  if (v14 != v4) {
    goto LABEL_11;
  }
LABEL_14:
  v17 = [a1 voiceFromAVVoice:v13];

  return v17;
}

+ (id)voicesForLanguageCode:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFSpeechSynthesisVoice.m", 84, @"Invalid parameter not satisfying: %@", @"languageCode" object file lineNumber description];
  }
  id v6 = [getAVSpeechSynthesisVoiceClass() _speechVoicesIncludingSiri];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke;
  v12[3] = &unk_264E569B0;
  id v13 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "if_compactMap:", v12);
  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_6535];

  return v9;
}

id __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 language];
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1 && [v3 isInstalled])
  {
    id v5 = +[WFSpeechSynthesisVoice voiceFromAVVoice:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

+ (id)voiceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

@end