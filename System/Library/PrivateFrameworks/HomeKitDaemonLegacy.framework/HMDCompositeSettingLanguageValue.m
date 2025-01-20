@interface HMDCompositeSettingLanguageValue
- (HMDCompositeSettingLanguageValue)initWithInputLanguage:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6;
- (NSString)inputLanguageCode;
- (NSString)outputVoiceGenderCode;
- (NSString)outputVoiceLanguageCode;
- (NSString)voiceName;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSettingLanguageValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

- (NSString)voiceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)outputVoiceGenderCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)inputLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCompositeSettingLanguageValue *)self inputLanguageCode];
  v5 = (void *)[v3 initWithName:@"inputLanguageCode" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCompositeSettingLanguageValue *)self outputVoiceGenderCode];
  v8 = (void *)[v6 initWithName:@"outputVoiceGenderCode" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDCompositeSettingLanguageValue *)self outputVoiceLanguageCode];
  v11 = (void *)[v9 initWithName:@"outputVoiceLanguageCode" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDCompositeSettingLanguageValue *)self voiceName];
  v14 = (void *)[v12 initWithName:@"voiceName" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (HMDCompositeSettingLanguageValue)initWithInputLanguage:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCompositeSettingLanguageValue;
  v15 = [(HMDCompositeSettingValue *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inputLanguageCode, a3);
    objc_storeStrong((id *)&v16->_outputVoiceLanguageCode, a4);
    objc_storeStrong((id *)&v16->_outputVoiceGenderCode, a5);
    objc_storeStrong((id *)&v16->_voiceName, a6);
  }

  return v16;
}

@end