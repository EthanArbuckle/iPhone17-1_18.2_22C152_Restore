@interface AFVoiceInfo
+ (BOOL)supportsSecureCoding;
+ (id)allVoiceInfoForLanguageCode:(id)a3;
+ (id)allVoicesForSiriSessionLanguage:(id)a3;
+ (id)outputVoiceIdentifierForLanguageCode:(id)a3 voiceName:(id)a4;
+ (id)voiceInfoForLanguageCode:(id)a3;
+ (id)voiceInfoForSessionLanguageCode:(id)a3;
+ (int64_t)defaultGenderForOutputVoiceLanguageCode:(id)a3;
+ (int64_t)genderForVSSpeechGender:(int64_t)a3;
- (AFVoiceInfo)initWithCoder:(id)a3;
- (AFVoiceInfo)initWithDictionaryRepresentation:(id)a3;
- (AFVoiceInfo)initWithLanguageCode:(id)a3;
- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 isCustom:(BOOL)a6;
- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5;
- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5 name:(id)a6 footprint:(int64_t)a7 contentVersion:(id)a8 masteredVersion:(id)a9;
- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 name:(id)a5 footprint:(int64_t)a6 isCustom:(BOOL)a7;
- (BOOL)isCustom;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLanguageAndGenderEqual:(id)a3;
- (BOOL)isMatchForSiriVoice:(id)a3;
- (BOOL)isMatchForVoiceAsset:(id)a3;
- (BOOL)isValidForSiriSessionLanguage:(id)a3;
- (BOOL)wasInitializedFromDictionaryRepresentation;
- (NSNumber)contentVersion;
- (NSString)languageCode;
- (NSString)masteredVersion;
- (NSString)name;
- (id)VSVoiceAsset;
- (id)description;
- (id)dictionaryRepresentation;
- (id)footprintString;
- (id)genderString;
- (int64_t)VSSpeechFootprint;
- (int64_t)VSSpeechGender;
- (int64_t)VSSpeechType;
- (int64_t)footprint;
- (int64_t)gender;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGender:(int64_t)a3;
- (void)setIsCustom:(BOOL)a3;
@end

@implementation AFVoiceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (BOOL)wasInitializedFromDictionaryRepresentation
{
  return self->_wasInitializedFromDictionaryRepresentation;
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setIsCustom:(BOOL)a3
{
  self->_isCustom = a3;
}

- (BOOL)isCustom
{
  return self->_isCustom;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (id)footprintString
{
  unint64_t v2 = [(AFVoiceInfo *)self footprint];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1E5924DF0[v2];
  }
}

- (id)genderString
{
  unint64_t v2 = [(AFVoiceInfo *)self gender];
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_1E5924DD0[v2];
  }
}

- (AFVoiceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFVoiceInfo;
  v5 = [(AFVoiceInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_languageCode"];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    v5->_gender = [v4 decodeIntegerForKey:@"_gender"];
    v5->_isCustom = [v4 decodeBoolForKey:@"_isCustom"];
    v5->_footprint = [v4 decodeIntegerForKey:@"_footprint"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contentVersion"];
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_masteredVersion"];
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  languageCode = self->_languageCode;
  id v5 = a3;
  [v5 encodeObject:languageCode forKey:@"_languageCode"];
  [v5 encodeInteger:self->_gender forKey:@"_gender"];
  [v5 encodeBool:self->_isCustom forKey:@"_isCustom"];
  [v5 encodeInteger:self->_footprint forKey:@"_footprint"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_contentVersion forKey:@"_contentVersion"];
  [v5 encodeObject:self->_masteredVersion forKey:@"_masteredVersion"];
}

- (AFVoiceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceInfo;
  id v5 = [(AFVoiceInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"Language"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_languageCode, v6);
    }

    v7 = [v4 objectForKey:@"Gender"];
    if (objc_opt_respondsToSelector()) {
      v5->_gender = [v7 integerValue];
    }

    uint64_t v8 = [v4 objectForKey:@"Custom"];
    if (objc_opt_respondsToSelector()) {
      v5->_isCustom = [v8 BOOLValue];
    }

    v9 = [v4 objectForKey:@"Footprint"];
    if (objc_opt_respondsToSelector()) {
      v5->_footprint = [v9 integerValue];
    }

    uint64_t v10 = [v4 objectForKey:@"Name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_name, v10);
    }

    v11 = [v4 objectForKey:@"ContentVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_contentVersion, v11);
    }

    uint64_t v12 = [v4 objectForKey:@"MasteredVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_masteredVersion, v12);
    }

    v5->_wasInitializedFromDictionaryRepresentation = 1;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_gender];
  [v3 setObject:v4 forKey:@"Gender"];

  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isCustom];
  [v3 setObject:v5 forKey:@"Custom"];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_footprint];
  [v3 setObject:v6 forKey:@"Footprint"];

  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"Language"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"Name"];
  }
  contentVersion = self->_contentVersion;
  if (contentVersion) {
    [v3 setObject:contentVersion forKey:@"ContentVersion"];
  }
  masteredVersion = self->_masteredVersion;
  if (masteredVersion) {
    [v3 setObject:masteredVersion forKey:@"MasteredVersion"];
  }
  return v3;
}

- (id)description
{
  contentVersion = self->_contentVersion;
  if (contentVersion)
  {
    id v4 = [(NSNumber *)contentVersion stringValue];
  }
  else
  {
    id v4 = @"?";
  }
  masteredVersion = (__CFString *)self->_masteredVersion;
  if (!masteredVersion) {
    masteredVersion = @"?";
  }
  uint64_t v6 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)AFVoiceInfo;
  v7 = masteredVersion;
  uint64_t v8 = [(AFVoiceInfo *)&v16 description];
  languageCode = self->_languageCode;
  name = self->_name;
  v11 = [(AFVoiceInfo *)self genderString];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isCustom];
  v13 = [(AFVoiceInfo *)self footprintString];
  objc_super v14 = [v6 stringWithFormat:@"%@ languageCode: %@ name: %@ gender: %@ custom: %@ footprint: %@ contentVersion: %@ masteredVersion: %@", v8, languageCode, name, v11, v12, v13, v4, v7, v16.receiver, v16.super_class];

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageCode hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_contentVersion hash];
  return v4 ^ v5 ^ [(NSString *)self->_masteredVersion hash] ^ self->_gender ^ self->_footprint ^ (16 * self->_isCustom);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    languageCode = self->_languageCode;
    if ((!((unint64_t)languageCode | v5[2]) || -[NSString isEqualToString:](languageCode, "isEqualToString:"))
      && self->_gender == v5[3]
      && self->_isCustom == *((unsigned __int8 *)v5 + 8)
      && self->_footprint == v5[4]
      && ((name = self->_name, !((unint64_t)name | v5[5]))
       || -[NSString isEqualToString:](name, "isEqualToString:"))
      && ((contentVersion = self->_contentVersion, !((unint64_t)contentVersion | v5[6]))
       || -[NSNumber isEqualToNumber:](contentVersion, "isEqualToNumber:")))
    {
      masteredVersion = self->_masteredVersion;
      if ((unint64_t)masteredVersion | v5[7]) {
        char v10 = -[NSString isEqualToString:](masteredVersion, "isEqualToString:");
      }
      else {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isLanguageAndGenderEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    languageCode = self->_languageCode;
    BOOL v7 = (!((unint64_t)languageCode | v5[2]) || -[NSString isEqualToString:](languageCode, "isEqualToString:"))
      && self->_gender == v5[3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)gender
{
  int64_t result = self->_gender;
  if (!result)
  {
    if (self->_languageCode)
    {
      id v4 = objc_opt_class();
      languageCode = self->_languageCode;
      return [v4 defaultGenderForOutputVoiceLanguageCode:languageCode];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3
{
  return [(AFVoiceInfo *)self initWithLanguageCode:a3 gender:0 isCustom:1];
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 name:(id)a5 footprint:(int64_t)a6 isCustom:(BOOL)a7
{
  return [(AFVoiceInfo *)self initWithLanguageCode:a3 gender:a4 isCustom:a7 name:a5 footprint:a6 contentVersion:0 masteredVersion:0];
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 isCustom:(BOOL)a6
{
  return [(AFVoiceInfo *)self initWithLanguageCode:a3 gender:a4 isCustom:a6 name:0 footprint:a5 contentVersion:0 masteredVersion:0];
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5
{
  return [(AFVoiceInfo *)self initWithLanguageCode:a3 gender:a4 isCustom:a5 name:0 footprint:0 contentVersion:0 masteredVersion:0];
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5 name:(id)a6 footprint:(int64_t)a7 contentVersion:(id)a8 masteredVersion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)AFVoiceInfo;
  v19 = [(AFVoiceInfo *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    languageCode = v19->_languageCode;
    v19->_languageCode = (NSString *)v20;

    v19->_gender = a4;
    v19->_isCustom = a5;
    uint64_t v22 = [v16 copy];
    name = v19->_name;
    v19->_name = (NSString *)v22;

    v19->_footprint = a7;
    uint64_t v24 = [v17 copy];
    contentVersion = v19->_contentVersion;
    v19->_contentVersion = (NSNumber *)v24;

    uint64_t v26 = [v18 copy];
    masteredVersion = v19->_masteredVersion;
    v19->_masteredVersion = (NSString *)v26;
  }
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)defaultGenderForOutputVoiceLanguageCode:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ar-SA", @"en-GB", @"en-IN", @"fr-FR", @"nl-NL", 0), id v4 = objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "containsObject:", v3), v4, (v5 & 1) != 0))
  {
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (BOOL)isMatchForSiriVoice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  BOOL v6 = [(AFVoiceInfo *)self isCustom];
  int64_t v7 = [(AFVoiceInfo *)self footprint];
  uint64_t v8 = [v4 AFVoiceFootprint];
  v9 = [(AFVoiceInfo *)self languageCode];
  char v10 = [v4 language];
  if ([v9 isEqualToString:v10])
  {
    if (v6) {
      uint64_t v11 = -3;
    }
    else {
      uint64_t v11 = -1;
    }
    uint64_t v12 = [(AFVoiceInfo *)self name];
    v13 = [v4 name];
    v19 = v12;
    int v14 = [v12 isEqualToString:v13];
    char v15 = 0;
    if (v14 && (unint64_t)(v11 + v5) <= 1 && v7 == v8)
    {
      id v16 = [(AFVoiceInfo *)self contentVersion];
      id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "version"));
      char v15 = [v16 isEqualToNumber:v17];
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)isValidForSiriSessionLanguage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)objc_opt_class() allVoicesForSiriSessionLanguage:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int64_t v11 = [(AFVoiceInfo *)self gender];
        if (v11 == [v10 gender])
        {
          uint64_t v12 = [(AFVoiceInfo *)self languageCode];
          v13 = [v10 languageCode];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            char v15 = [v10 name];
            id v16 = [(AFVoiceInfo *)self name];
            char v17 = [v15 isEqualToString:v16];

            if (v17)
            {
              BOOL v18 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_13:

  return v18;
}

+ (id)outputVoiceIdentifierForLanguageCode:(id)a3 voiceName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [v5 stringByAppendingString:v6];
    v9 = +[AFLocalization sharedInstance];
    char v10 = v9;
    if (v9)
    {
      [v9 _voiceMaps];
      int64_t v11 = (void *)*((void *)&v17 + 1);
    }
    else
    {
      int64_t v11 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
    }
    v13 = objc_msgSend(v11, "objectForKey:", v8, v16, v17);
    __destructor_8_s0_s8_s16_s24((uint64_t)&v16);

    if (!v13)
    {
      int v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "+[AFVoiceInfo(AFLocalizationAdditions) outputVoiceIdentifierForLanguageCode:voiceName:]";
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        long long v23 = v7;
        _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Cannot get output voice identifier for languageCode: %@, voiceName: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "+[AFVoiceInfo(AFLocalizationAdditions) outputVoiceIdentifierForLanguageCode:voiceName:]";
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      long long v23 = v7;
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Cannot get output voice identifier for languageCode: %@, voiceName: %@", buf, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)voiceInfoForSessionLanguageCode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[AFLocalization sharedInstance];
  id v5 = [v4 loadInfoForVoicesWithLanguageCode:v3];
  id v6 = [v5 firstObject];

  uint64_t v7 = [v6 languageCode];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    v9 = [v4 defaultOutputVoiceForSiriSessionLanguage:v3];
    char v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      char v15 = "+[AFVoiceInfo(AFLocalizationAdditions) voiceInfoForSessionLanguageCode:]";
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s No voiceInfo was found for %@. Will return default output voice info instead: %@", (uint8_t *)&v14, 0x20u);
    }
    int64_t v11 = [v4 loadInfoForVoicesWithLanguageCode:v9];
    uint64_t v12 = [v11 firstObject];

    id v6 = (void *)v12;
  }

  return v6;
}

+ (id)voiceInfoForLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = +[AFLocalization sharedInstance];
  id v5 = [v4 loadInfoForVoicesWithLanguageCode:v3];

  id v6 = [v5 firstObject];

  return v6;
}

+ (id)allVoiceInfoForLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = +[AFLocalization sharedInstance];
  id v5 = [v4 loadInfoForVoicesWithLanguageCode:v3];

  return v5;
}

+ (id)allVoicesForSiriSessionLanguage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[AFLocalization sharedInstance];
  __int16 v16 = v3;
  id v5 = [v4 allOutputVoiceIdentifiersForSiriLanguage:v3];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v4 loadInfoForVoicesWithLanguageCode:v12];
        if ([v13 count])
        {
          [v6 addObjectsFromArray:v13];
        }
        else
        {
          int v14 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v22 = "+[AFVoiceInfo(AFLocalizationAdditions) allVoicesForSiriSessionLanguage:]";
            __int16 v23 = 2112;
            uint64_t v24 = v12;
            _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s No voices loaded for %@, but they were expected", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isMatchForVoiceAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  if (v5
    && (id v6 = (void *)v5,
        [(AFVoiceInfo *)self name],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [(AFVoiceInfo *)self name];
    uint64_t v9 = [v4 name];
    int v10 = [v8 isEqualToString:v9];

    int v11 = v10 ^ 1;
  }
  else
  {
    int v11 = 0;
  }
  int64_t v12 = [(AFVoiceInfo *)self VSSpeechGender];
  if (v12 == [v4 gender]
    && (int64_t v13 = -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"), v13 == [v4 footprint])
    && (int v14 = -[AFVoiceInfo isCustom](self, "isCustom"), v14 != [v4 isBuiltInVoice]))
  {
    char v15 = [v4 languages];
    __int16 v16 = [(AFVoiceInfo *)self languageCode];
    if (([v15 containsObject:v16] ^ 1 | v11))
    {
      char v17 = 0;
    }
    else
    {
      long long v19 = [(AFVoiceInfo *)self contentVersion];
      long long v20 = [v4 contentVersion];
      if ([v19 isEqualToNumber:v20])
      {
        id v21 = [(AFVoiceInfo *)self masteredVersion];
        __int16 v22 = [v4 masteredVersion];
        char v17 = [v21 isEqualToString:v22];
      }
      else
      {
        char v17 = 0;
      }
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)VSVoiceAsset
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB4268]);
  objc_msgSend(v3, "setGender:", -[AFVoiceInfo VSSpeechGender](self, "VSSpeechGender"));
  objc_msgSend(v3, "setFootprint:", -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"));
  objc_msgSend(v3, "setIsBuiltInVoice:", -[AFVoiceInfo isCustom](self, "isCustom") ^ 1);
  uint64_t v4 = [(AFVoiceInfo *)self languageCode];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v11[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v3 setLanguages:v6];
  }
  id v7 = [(AFVoiceInfo *)self contentVersion];
  [v3 setContentVersion:v7];

  uint64_t v8 = [(AFVoiceInfo *)self masteredVersion];
  [v3 setMasteredVersion:v8];

  uint64_t v9 = [(AFVoiceInfo *)self name];
  [v3 setName:v9];

  return v3;
}

- (int64_t)VSSpeechType
{
  if ([(AFVoiceInfo *)self isCustom]) {
    return 3;
  }
  else {
    return 1;
  }
}

- (int64_t)VSSpeechFootprint
{
  int64_t result = [(AFVoiceInfo *)self footprint];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (int64_t)VSSpeechGender
{
  int64_t result = [(AFVoiceInfo *)self gender];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

+ (int64_t)genderForVSSpeechGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

@end