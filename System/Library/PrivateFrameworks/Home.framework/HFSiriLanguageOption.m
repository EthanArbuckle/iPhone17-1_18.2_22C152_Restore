@interface HFSiriLanguageOption
+ (NAIdentity)na_identity;
- (BOOL)isDefaultVoiceForRecognitionLanguage;
- (BOOL)isEqual:(id)a3;
- (HFSiriLanguageOption)init;
- (HFSiriLanguageOption)initWithHomeKitSettingLanguageValue:(id)a3;
- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 outputGender:(int64_t)a5 voiceName:(id)a6 defaultVoiceForRecognitionLanguage:(BOOL)a7;
- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputVoice:(id)a4 defaultVoiceForRecognitionLanguage:(BOOL)a5;
- (HFSiriLanguageOption)initWithSerializedRepresentation:(id)a3;
- (HMSettingLanguageValue)settingLanguageValue;
- (NSString)description;
- (NSString)localizedOutputVoice;
- (NSString)localizedOutputVoiceAccent;
- (NSString)localizedOutputVoiceColor;
- (NSString)localizedRecognitionLanguage;
- (NSString)outputLanguage;
- (NSString)recognitionLanguage;
- (NSString)serializableVoiceName;
- (NSString)voiceNameWithDefaultFallback;
- (id)allSerializedRepresentations;
- (id)outputVoice;
- (id)serializedRepresentation;
- (int64_t)outputGender;
- (unint64_t)hash;
- (void)setSerializableVoiceName:(id)a3;
- (void)setSettingLanguageValue:(id)a3;
@end

@implementation HFSiriLanguageOption

- (HFSiriLanguageOption)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithRecognitionLanguage_outputLanguage_outputGender_voiceName_defaultVoiceForRecognitionLanguage_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSiriLanguageOption.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFSiriLanguageOption init]",
    v5);

  return 0;
}

- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputVoice:(id)a4 defaultVoiceForRecognitionLanguage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 languageCode];
  uint64_t v11 = [v8 gender];
  v12 = [v8 name];

  v13 = [(HFSiriLanguageOption *)self initWithRecognitionLanguage:v9 outputLanguage:v10 outputGender:v11 voiceName:v12 defaultVoiceForRecognitionLanguage:v5];
  return v13;
}

- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 outputGender:(int64_t)a5 voiceName:(id)a6 defaultVoiceForRecognitionLanguage:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_11:
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HFSiriLanguageOption.m", 45, @"Invalid parameter not satisfying: %@", @"outputLanguage" object file lineNumber description];

    if (!v15) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"HFSiriLanguageOption.m", 44, @"Invalid parameter not satisfying: %@", @"recognitionLanguage" object file lineNumber description];

  if (!v14) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  v16 = [MEMORY[0x263F28530] sharedInstance];
  v17 = [v16 voiceNamesForOutputLanguageCode:v14 gender:a5];
  v18 = [v17 firstObject];

  if ([v18 isEqualToString:v15])
  {

    id v15 = 0;
  }

LABEL_7:
  v27.receiver = self;
  v27.super_class = (Class)HFSiriLanguageOption;
  v19 = [(HFSiriLanguageOption *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v13 copy];
    recognitionLanguage = v19->_recognitionLanguage;
    v19->_recognitionLanguage = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    outputLanguage = v19->_outputLanguage;
    v19->_outputLanguage = (NSString *)v22;

    v19->_outputGender = a5;
    v19->_defaultVoiceForRecognitionLanguage = a7;
    objc_storeStrong((id *)&v19->_serializableVoiceName, v15);
  }

  return v19;
}

- (HFSiriLanguageOption)initWithHomeKitSettingLanguageValue:(id)a3
{
  id v5 = a3;
  v6 = +[HFUtilities voiceInfoFromSettingLanguageValue:v5];
  v7 = [v5 inputLanguageCode];
  id v8 = [v5 outputVoiceLanguageCode];
  uint64_t v9 = [v6 gender];
  v10 = [v6 name];
  uint64_t v11 = [(HFSiriLanguageOption *)self initWithRecognitionLanguage:v7 outputLanguage:v8 outputGender:v9 voiceName:v10 defaultVoiceForRecognitionLanguage:1];

  if (v11) {
    objc_storeStrong((id *)&v11->_settingLanguageValue, a3);
  }

  return v11;
}

- (HFSiriLanguageOption)initWithSerializedRepresentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@","];
  if ((unint64_t)[v5 count] > 3)
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    id v8 = [v5 objectAtIndexedSubscript:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke;
    v15[3] = &unk_264094500;
    id v9 = v5;
    id v16 = v9;
    uint64_t v10 = __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke((uint64_t)v15);
    uint64_t v11 = [v9 objectAtIndexedSubscript:3];
    uint64_t v12 = [v11 isEqualToString:@"d"];

    id v13 = 0;
    if ((unint64_t)[v9 count] >= 5)
    {
      id v13 = [v9 objectAtIndexedSubscript:4];
    }
    self = [(HFSiriLanguageOption *)self initWithRecognitionLanguage:v6 outputLanguage:v8 outputGender:v10 voiceName:v13 defaultVoiceForRecognitionLanguage:v12];

    v7 = self;
  }
  else
  {
    v6 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Unexpected Siri language format %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

uint64_t __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2];
  if ([v1 isEqualToString:@"m"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"f"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"n"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    if (([v1 isEqualToString:@"?"] & 1) == 0) {
      NSLog(&cfstr_UnknownGenderO.isa, v1);
    }
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)serializedRepresentation
{
  void v15[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFSiriLanguageOption *)self outputGender]- 1;
  if (v3 > 2) {
    id v4 = @"?";
  }
  else {
    id v4 = off_26409C1F0[v3];
  }
  BOOL v5 = [(HFSiriLanguageOption *)self isDefaultVoiceForRecognitionLanguage];
  v6 = @"n";
  if (v5) {
    v6 = @"d";
  }
  v7 = v6;
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = [(HFSiriLanguageOption *)self recognitionLanguage];
  v15[0] = v9;
  uint64_t v10 = [(HFSiriLanguageOption *)self outputLanguage];
  v15[1] = v10;
  v15[2] = v4;
  v15[3] = v7;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
  uint64_t v12 = [v8 arrayWithArray:v11];

  if (self->_serializableVoiceName) {
    objc_msgSend(v12, "addObject:");
  }
  id v13 = [v12 componentsJoinedByString:@","];

  return v13;
}

__CFString *__48__HFSiriLanguageOption_serializedRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) outputGender];
  if ((unint64_t)(v1 - 1) > 2) {
    return @"?";
  }
  else {
    return off_26409C1F0[v1 - 1];
  }
}

- (id)allSerializedRepresentations
{
  v30[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = [(HFSiriLanguageOption *)self outputGender] - 1;
  if (v4 > 2) {
    BOOL v5 = @"?";
  }
  else {
    BOOL v5 = off_26409C1F0[v4];
  }
  if ([(HFSiriLanguageOption *)self isDefaultVoiceForRecognitionLanguage]) {
    v6 = @"d";
  }
  else {
    v6 = @"n";
  }
  v7 = v6;
  if ([(HFSiriLanguageOption *)self isDefaultVoiceForRecognitionLanguage]) {
    id v8 = @"n";
  }
  else {
    id v8 = @"d";
  }
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = [(HFSiriLanguageOption *)self recognitionLanguage];
  v30[0] = v11;
  uint64_t v12 = [(HFSiriLanguageOption *)self outputLanguage];
  v30[1] = v12;
  v30[2] = v5;
  v30[3] = v7;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  id v14 = [v10 arrayWithArray:v13];

  id v15 = (void *)MEMORY[0x263EFF980];
  id v16 = [(HFSiriLanguageOption *)self recognitionLanguage];
  v29[0] = v16;
  v17 = [(HFSiriLanguageOption *)self outputLanguage];
  v29[1] = v17;
  v29[2] = v5;
  v29[3] = v9;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  uint64_t v19 = [v15 arrayWithArray:v18];

  if (self->_serializableVoiceName)
  {
    objc_msgSend(v14, "addObject:");
    [v19 addObject:self->_serializableVoiceName];
  }
  else
  {
    uint64_t v20 = [v14 componentsJoinedByString:@","];
    [v3 addObject:v20];

    v21 = [v19 componentsJoinedByString:@","];
    [v3 addObject:v21];

    uint64_t v22 = [(HFSiriLanguageOption *)self voiceName];

    if (!v22) {
      goto LABEL_15;
    }
    v23 = [(HFSiriLanguageOption *)self voiceName];
    [v14 addObject:v23];

    v24 = [(HFSiriLanguageOption *)self voiceName];
    [v19 addObject:v24];
  }
  v25 = [v14 componentsJoinedByString:@","];
  [v3 addObject:v25];

  v26 = [v19 componentsJoinedByString:@","];
  [v3 addObject:v26];

LABEL_15:
  objc_super v27 = (void *)[v3 copy];

  return v27;
}

__CFString *__52__HFSiriLanguageOption_allSerializedRepresentations__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) outputGender];
  if ((unint64_t)(v1 - 1) > 2) {
    return @"?";
  }
  else {
    return off_26409C1F0[v1 - 1];
  }
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_324 != -1) {
    dispatch_once(&_MergedGlobals_324, &__block_literal_global_51_7);
  }
  uint64_t v2 = (void *)qword_26AB2FE70;
  return (NAIdentity *)v2;
}

void __35__HFSiriLanguageOption_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_58_4];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_60_2];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_62_1];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_65_1];
  id v5 = (id)[v0 appendCharacteristic:&__block_literal_global_67_2];
  uint64_t v6 = [v0 build];

  v7 = (void *)qword_26AB2FE70;
  qword_26AB2FE70 = v6;
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 recognitionLanguage];
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 outputLanguage];
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 outputGender];
  return [v2 numberWithInteger:v3];
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isDefaultVoiceForRecognitionLanguage];
  return [v2 numberWithBool:v3];
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 serializableVoiceName];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFSiriLanguageOption *)self recognitionLanguage];
  [v3 appendString:v4 withName:@"recognitionLanguage"];

  id v5 = [(HFSiriLanguageOption *)self outputLanguage];
  [v3 appendString:v5 withName:@"outputLanguage"];

  unint64_t v6 = [(HFSiriLanguageOption *)self outputGender] - 1;
  if (v6 > 2) {
    v7 = @"Any";
  }
  else {
    v7 = off_26409C208[v6];
  }
  [v3 appendString:v7 withName:@"outputGender"];
  id v8 = [(HFSiriLanguageOption *)self serializableVoiceName];
  id v9 = (void *)[(id)HFSiriLanguageOptionSerializableVoiceName copy];
  [v3 appendString:v8 withName:v9];

  uint64_t v10 = [(HFSiriLanguageOption *)self voiceName];
  uint64_t v11 = (void *)[(id)HFSiriLanguageOptionVoiceName copy];
  [v3 appendString:v10 withName:v11];

  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFSiriLanguageOption isDefaultVoiceForRecognitionLanguage](self, "isDefaultVoiceForRecognitionLanguage"), @"defaultVoice");
  id v13 = [v3 build];

  return (NSString *)v13;
}

- (NSString)localizedRecognitionLanguage
{
  uint64_t v3 = [MEMORY[0x263F28530] sharedInstance];
  unint64_t v4 = [(HFSiriLanguageOption *)self recognitionLanguage];
  id v5 = [v3 localizedNameForSiriLanguage:v4 inDisplayLanguage:0];

  if (![v5 length])
  {
    unint64_t v6 = _HFLocalizedStringWithDefaultValue(@"HFSiriRecognitionLanguageUnknownName", @"HFSiriRecognitionLanguageUnknownName", 1);
    if (+[HFUtilities isInternalInstall])
    {
      v7 = NSString;
      uint64_t v8 = [(HFSiriLanguageOption *)self recognitionLanguage];
      id v9 = [v7 stringWithFormat:@"%@ (%@)", v6, v8];

      id v5 = (void *)v8;
    }
    else
    {
      id v9 = v6;
    }

    id v5 = v9;
  }
  return (NSString *)v5;
}

- (NSString)localizedOutputVoice
{
  uint64_t v3 = [(HFSiriLanguageOption *)self voiceNameWithDefaultFallback];
  unint64_t v4 = [MEMORY[0x263F28530] sharedInstance];
  id v5 = [(HFSiriLanguageOption *)self outputLanguage];
  unint64_t v6 = [v4 outputVoiceDescriptorForOutputLanguageCode:v5 voiceName:v3];
  v7 = [v6 localizedDisplayWithRegion];

  if (![v7 length])
  {
    uint64_t v8 = _HFLocalizedStringWithDefaultValue(@"HFSiriOutputVoiceUnknownName", @"HFSiriOutputVoiceUnknownName", 1);
    if (+[HFUtilities isInternalInstall])
    {
      id v9 = NSString;
      uint64_t v10 = [(HFSiriLanguageOption *)self voiceName];
      id v11 = [v9 stringWithFormat:@"%@ (%@, %@)", v8, v10, v3];

      v7 = (void *)v10;
    }
    else
    {
      id v11 = v8;
    }

    v7 = v11;
  }

  return (NSString *)v7;
}

- (NSString)localizedOutputVoiceAccent
{
  uint64_t v3 = [MEMORY[0x263F28530] sharedInstance];
  unint64_t v4 = [(HFSiriLanguageOption *)self outputVoice];
  id v5 = [v3 localizedNameOfOutputVoice:v4 inDisplayLanguage:0];

  return (NSString *)v5;
}

- (id)outputVoice
{
  uint64_t v3 = [(HFSiriLanguageOption *)self voiceNameWithDefaultFallback];
  id v4 = objc_alloc(MEMORY[0x263F286E0]);
  id v5 = [(HFSiriLanguageOption *)self outputLanguage];
  unint64_t v6 = objc_msgSend(v4, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v5, -[HFSiriLanguageOption outputGender](self, "outputGender"), 0, v3, 0, 0, 0);

  return v6;
}

- (NSString)localizedOutputVoiceColor
{
  uint64_t v3 = [(HFSiriLanguageOption *)self voiceNameWithDefaultFallback];
  id v4 = [MEMORY[0x263F28530] sharedInstance];
  id v5 = [(HFSiriLanguageOption *)self outputLanguage];
  unint64_t v6 = [v4 outputVoiceDescriptorForOutputLanguageCode:v5 voiceName:v3];
  v7 = [v6 localizedDisplay];

  return (NSString *)v7;
}

- (NSString)voiceNameWithDefaultFallback
{
  uint64_t v3 = self->_serializableVoiceName;
  if (!v3)
  {
    id v4 = [MEMORY[0x263F28530] sharedInstance];
    id v5 = [(HFSiriLanguageOption *)self outputLanguage];
    unint64_t v6 = objc_msgSend(v4, "voiceNamesForOutputLanguageCode:gender:", v5, -[HFSiriLanguageOption outputGender](self, "outputGender"));
    uint64_t v3 = [v6 firstObject];
  }
  return v3;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (int64_t)outputGender
{
  return self->_outputGender;
}

- (BOOL)isDefaultVoiceForRecognitionLanguage
{
  return self->_defaultVoiceForRecognitionLanguage;
}

- (HMSettingLanguageValue)settingLanguageValue
{
  return self->_settingLanguageValue;
}

- (void)setSettingLanguageValue:(id)a3
{
}

- (NSString)serializableVoiceName
{
  return self->_serializableVoiceName;
}

- (void)setSerializableVoiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializableVoiceName, 0);
  objc_storeStrong((id *)&self->_settingLanguageValue, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
}

@end