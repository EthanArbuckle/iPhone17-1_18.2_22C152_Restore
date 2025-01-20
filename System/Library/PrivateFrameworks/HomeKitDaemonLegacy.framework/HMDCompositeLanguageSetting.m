@interface HMDCompositeLanguageSetting
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeLanguageSetting)initWithInputLanguage:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6 readVersion:(id)a7 writeVersion:(id)a8;
- (NSString)inputLanguageCode;
- (NSString)outputVoiceGenderCode;
- (NSString)outputVoiceLanguageCode;
- (NSString)voiceName;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeLanguageSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

- (NSString)voiceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)outputVoiceGenderCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)inputLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HMDCompositeLanguageSetting;
  v3 = [(HMDCompositeSetting *)&v19 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = [(HMDCompositeLanguageSetting *)self inputLanguageCode];
  v5 = (void *)[v4 initWithName:@"inputLanguageCode" value:v18];
  v20[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCompositeLanguageSetting *)self outputVoiceGenderCode];
  v8 = (void *)[v6 initWithName:@"outputVoiceGenderCode" value:v7];
  v20[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDCompositeLanguageSetting *)self outputVoiceLanguageCode];
  v11 = (void *)[v9 initWithName:@"outputVoiceLanguageCode" value:v10];
  v20[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDCompositeLanguageSetting *)self voiceName];
  v14 = (void *)[v12 initWithName:@"voiceName" value:v13];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCompositeLanguageSetting *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    v7 = v6;
    if (v6 && [(HMDCompositeLanguageSetting *)v6 isEqualValue:self])
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeLanguageSetting;
      BOOL v8 = [(HMDCompositeSetting *)&v10 isEqual:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)isEqualValue:(id)a3
{
  id v4 = (HMDCompositeLanguageSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v19 = 1;
  }
  else
  {
    if ([(HMDCompositeLanguageSetting *)v4 conformsToProtocol:&unk_1F2E11838]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    v7 = v6;
    BOOL v8 = v7;
    if (v7)
    {
      id v9 = [(HMDCompositeLanguageSetting *)v7 inputLanguageCode];
      objc_super v10 = [(HMDCompositeLanguageSetting *)self inputLanguageCode];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(HMDCompositeLanguageSetting *)v8 outputVoiceGenderCode];
        id v12 = [(HMDCompositeLanguageSetting *)self outputVoiceGenderCode];
        if ([v11 isEqualToString:v12])
        {
          v13 = [(HMDCompositeLanguageSetting *)v8 outputVoiceLanguageCode];
          v14 = [(HMDCompositeLanguageSetting *)self outputVoiceLanguageCode];
          if ([v13 isEqualToString:v14])
          {
            v15 = [(HMDCompositeLanguageSetting *)v8 voiceName];
            v16 = [(HMDCompositeLanguageSetting *)self voiceName];
            if (v15 == v16)
            {
              char v19 = 1;
            }
            else
            {
              v22 = v16;
              [(HMDCompositeLanguageSetting *)v8 voiceName];
              v17 = v21 = v13;
              [(HMDCompositeLanguageSetting *)self voiceName];
              v18 = v23 = v15;
              char v19 = [v17 isEqualToString:v18];

              v15 = v23;
              v13 = v21;
              v16 = v22;
            }
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  return v19;
}

- (HMDCompositeLanguageSetting)initWithInputLanguage:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6 readVersion:(id)a7 writeVersion:(id)a8
{
  id v21 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDCompositeLanguageSetting;
  v18 = [(HMDCompositeSetting *)&v22 initWithReadVersion:a7 writeVersion:a8];
  char v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_outputVoiceGenderCode, a5);
    objc_storeStrong((id *)&v19->_inputLanguageCode, a3);
    objc_storeStrong((id *)&v19->_outputVoiceLanguageCode, a4);
    objc_storeStrong((id *)&v19->_voiceName, a6);
  }

  return v19;
}

@end