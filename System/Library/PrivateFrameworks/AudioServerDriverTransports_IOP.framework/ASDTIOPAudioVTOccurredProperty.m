@interface ASDTIOPAudioVTOccurredProperty
+ (id)configDictForService:(id)a3;
- (ASDTIOPAudioVTOccurredProperty)initWithConfig:(id)a3;
- (void)phraseDetectEvent;
@end

@implementation ASDTIOPAudioVTOccurredProperty

+ (id)configDictForService:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28D20];
  v8[0] = *MEMORY[0x263F28D40];
  v8[1] = v3;
  v9[0] = @"ASDTIOPAudioVTOccurredProperty";
  v9[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (ASDTIOPAudioVTOccurredProperty)initWithConfig:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  uint64_t v6 = *MEMORY[0x263F28CE8];
  v15[0] = *MEMORY[0x263F28D10];
  v15[1] = v6;
  v16[0] = &unk_26FCB4320;
  v16[1] = MEMORY[0x263EFFA80];
  v15[2] = *MEMORY[0x263F28CF8];
  v16[2] = *MEMORY[0x263F28D48];
  v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v5 asdtAddMissingEntriesFromDictionary:v7];

  v14.receiver = self;
  v14.super_class = (Class)ASDTIOPAudioVTOccurredProperty;
  v8 = [(ASDTIOPAudioVTProperty *)&v14 initWithConfig:v5 propertyDataType:1886155636 qualifierDataType:0];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = [(ASDTIOPAudioVTProperty *)v8 vtDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__ASDTIOPAudioVTOccurredProperty_initWithConfig___block_invoke;
    v11[3] = &unk_265247480;
    objc_copyWeak(&v12, &location);
    [v9 setPhraseDetectEventBlock:v11];

    [(ASDTCustomProperty *)v8 storePropertyValue:MEMORY[0x263EFFA78]];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __49__ASDTIOPAudioVTOccurredProperty_initWithConfig___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained phraseDetectEvent];
}

- (void)phraseDetectEvent
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to store phrase detection event data.", (uint8_t *)&v4, 0xCu);
}

@end