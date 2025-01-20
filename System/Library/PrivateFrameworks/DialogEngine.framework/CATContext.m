@interface CATContext
- (BOOL)isMultiUserEnabled;
- (BOOL)requiresUserGrounding;
- (CATContext)init;
- (CATContext)initWithInputLocale:(id)a3 outputVoiceLocale:(id)a4;
- (NSDictionary)userSettings;
- (NSString)siriLocale;
- (NSString)siriVoiceGender;
- (id)toDictionary;
- (int64_t)currentTime;
- (unsigned)randomSeed;
- (void)setCurrentTime:(int64_t)a3;
- (void)setIsMultiUserEnabled:(BOOL)a3;
- (void)setRandomSeed:(unsigned int)a3;
- (void)setRequiresUserGrounding:(BOOL)a3;
- (void)setSiriLocale:(id)a3;
- (void)setSiriVoiceGender:(id)a3;
- (void)setUserSettings:(id)a3;
@end

@implementation CATContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_siriVoiceGender, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
}

- (void)setUserSettings:(id)a3
{
}

- (NSDictionary)userSettings
{
  return self->_userSettings;
}

- (void)setCurrentTime:(int64_t)a3
{
  self->_currentTime = a3;
}

- (int64_t)currentTime
{
  return self->_currentTime;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->_randomSeed = a3;
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (void)setRequiresUserGrounding:(BOOL)a3
{
  self->_requiresUserGrounding = a3;
}

- (BOOL)requiresUserGrounding
{
  return self->_requiresUserGrounding;
}

- (void)setIsMultiUserEnabled:(BOOL)a3
{
  self->_isMultiUserEnabled = a3;
}

- (BOOL)isMultiUserEnabled
{
  return self->_isMultiUserEnabled;
}

- (void)setSiriVoiceGender:(id)a3
{
}

- (NSString)siriVoiceGender
{
  return self->_siriVoiceGender;
}

- (void)setSiriLocale:(id)a3
{
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (id)toDictionary
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"locale";
  v3 = [(CATContext *)self siriLocale];
  v13[0] = v3;
  v12[1] = @"gender";
  v4 = [(CATContext *)self siriVoiceGender];
  v13[1] = v4;
  v12[2] = @"multiuser";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CATContext isMultiUserEnabled](self, "isMultiUserEnabled"));
  v13[2] = v5;
  v12[3] = @"grounding";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CATContext requiresUserGrounding](self, "requiresUserGrounding"));
  v13[3] = v6;
  v12[4] = @"randomSeed";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CATContext randomSeed](self, "randomSeed"));
  v13[4] = v7;
  v12[5] = @"currentTime";
  v8 = objc_msgSend(NSNumber, "numberWithLong:", -[CATContext currentTime](self, "currentTime"));
  v13[5] = v8;
  v12[6] = @"userSettings";
  v9 = [(CATContext *)self userSettings];
  v13[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (CATContext)initWithInputLocale:(id)a3 outputVoiceLocale:(id)a4
{
  v31[14] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CATContext;
  v7 = [(CATContext *)&v28 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v26 = [v8 localeIdentifier];

    v9 = [v27 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    v10 = v9;
    if (!v9 || ![v9 length])
    {
      id v11 = v26;

      v10 = v11;
    }
    v12 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    v13 = v12;
    if (!v12 || ![v12 length])
    {
      id v14 = v26;

      v13 = v14;
    }
    v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
    v16 = [v15 languageCode];

    v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
    v18 = [v17 languageCode];

    id v19 = v10;
    id v20 = v19;
    if ([v16 isEqualToString:v18])
    {
      v30[0] = &unk_1F212EDF8;
      v30[1] = &unk_1F212EE10;
      v31[0] = @"en_CA";
      v31[1] = @"en_IN";
      v30[2] = &unk_1F212EE28;
      v30[3] = &unk_1F212EE40;
      v31[2] = @"en_IN";
      v31[3] = @"en_SG";
      v30[4] = &unk_1F212EE58;
      v30[5] = &unk_1F212EE70;
      v31[4] = @"en_NZ";
      v31[5] = @"es_US";
      v30[6] = &unk_1F212EE88;
      v30[7] = &unk_1F212EEA0;
      v31[6] = @"es_CL";
      v31[7] = @"es_CL";
      v30[8] = &unk_1F212EEB8;
      v30[9] = &unk_1F212EED0;
      v31[8] = @"fr_BE";
      v31[9] = @"fr_CH";
      v30[10] = &unk_1F212EEE8;
      v30[11] = &unk_1F212EF00;
      v31[10] = @"de_CH";
      v31[11] = @"de_AT";
      v30[12] = &unk_1F212EF18;
      v30[13] = &unk_1F212EF30;
      v31[12] = @"it_CH";
      v31[13] = @"zh_CN";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:14];
      v29[0] = v19;
      v29[1] = v13;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      v23 = [v21 objectForKey:v22];

      if (v23) {
        v24 = v23;
      }
      else {
        v24 = v13;
      }
      id v20 = v24;
    }
    [(CATContext *)v7 setSiriLocale:v20];
    [(CATContext *)v7 setSiriVoiceGender:@"unknown"];
    [(CATContext *)v7 setIsMultiUserEnabled:0];
    [(CATContext *)v7 setRequiresUserGrounding:0];
    [(CATContext *)v7 setRandomSeed:0];
    [(CATContext *)v7 setCurrentTime:0];
    [(CATContext *)v7 setUserSettings:&unk_1F212EFD0];
  }
  return v7;
}

- (CATContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)CATContext;
  v2 = [(CATContext *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(CATContext *)v2 setSiriLocale:@"en"];
    [(CATContext *)v3 setSiriVoiceGender:@"unknown"];
    [(CATContext *)v3 setIsMultiUserEnabled:0];
    [(CATContext *)v3 setRequiresUserGrounding:0];
    [(CATContext *)v3 setRandomSeed:0];
    [(CATContext *)v3 setCurrentTime:0];
    [(CATContext *)v3 setUserSettings:&unk_1F212EFA8];
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"***", v4);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** ACTION REQUIRED:", v5);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** This CAT request was issued by code using the default constructor", v6);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** of the CATContext object. This code must be updated to use the", v7);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** initWithInputLocale:outputVoiceLocale: constructor. Left unchanged,", v8);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** this code will not work for non-English locales. #siri-cat-help", v9);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"***", v10);
  }
  return v3;
}

@end