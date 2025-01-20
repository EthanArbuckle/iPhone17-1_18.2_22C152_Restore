@interface AFInterstitialConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFInterstitialConfiguration)init;
- (AFInterstitialConfiguration)initWithBuilder:(id)a3;
- (AFInterstitialConfiguration)initWithCoder:(id)a3;
- (AFInterstitialConfiguration)initWithStyle:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 recordRoute:(id)a6 isVoiceTrigger:(BOOL)a7 isDucking:(BOOL)a8 isTwoShot:(BOOL)a9 speechEndHostTime:(unint64_t)a10;
- (BOOL)isDucking;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTwoShot;
- (BOOL)isVoiceTrigger;
- (NSString)languageCode;
- (NSString)recordRoute;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)gender;
- (int64_t)style;
- (unint64_t)hash;
- (unint64_t)speechEndHostTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFInterstitialConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (unint64_t)speechEndHostTime
{
  return self->_speechEndHostTime;
}

- (BOOL)isTwoShot
{
  return self->_isTwoShot;
}

- (BOOL)isDucking
{
  return self->_isDucking;
}

- (BOOL)isVoiceTrigger
{
  return self->_isVoiceTrigger;
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)style
{
  return self->_style;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t style = self->_style;
  id v6 = a3;
  v7 = [v4 numberWithInteger:style];
  [v6 encodeObject:v7 forKey:@"AFInterstitialConfiguration::style"];

  [v6 encodeObject:self->_languageCode forKey:@"AFInterstitialConfiguration::languageCode"];
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_gender];
  [v6 encodeObject:v8 forKey:@"AFInterstitialConfiguration::gender"];

  [v6 encodeObject:self->_recordRoute forKey:@"AFInterstitialConfiguration::recordRoute"];
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isVoiceTrigger];
  [v6 encodeObject:v9 forKey:@"AFInterstitialConfiguration::isVoiceTrigger"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDucking];
  [v6 encodeObject:v10 forKey:@"AFInterstitialConfiguration::isDucking"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isTwoShot];
  [v6 encodeObject:v11 forKey:@"AFInterstitialConfiguration::isTwoShot"];

  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_speechEndHostTime];
  [v6 encodeObject:v12 forKey:@"AFInterstitialConfiguration::speechEndHostTime"];
}

- (AFInterstitialConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::style"];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::languageCode"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::gender"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::recordRoute"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::isVoiceTrigger"];
  uint64_t v11 = [v10 BOOLValue];

  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::isDucking"];
  uint64_t v13 = [v12 BOOLValue];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::isTwoShot"];
  char v15 = [v14 BOOLValue];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFInterstitialConfiguration::speechEndHostTime"];

  uint64_t v17 = [v16 unsignedLongLongValue];
  LOBYTE(v20) = v15;
  v18 = [(AFInterstitialConfiguration *)self initWithStyle:v5 languageCode:v6 gender:v8 recordRoute:v9 isVoiceTrigger:v11 isDucking:v13 isTwoShot:v20 speechEndHostTime:v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFInterstitialConfiguration *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t style = self->_style;
      if (style == [(AFInterstitialConfiguration *)v5 style]
        && (int64_t gender = self->_gender, gender == [(AFInterstitialConfiguration *)v5 gender])
        && (BOOL isVoiceTrigger = self->_isVoiceTrigger,
            isVoiceTrigger == [(AFInterstitialConfiguration *)v5 isVoiceTrigger])
        && (BOOL isDucking = self->_isDucking, isDucking == [(AFInterstitialConfiguration *)v5 isDucking])
        && (BOOL isTwoShot = self->_isTwoShot, isTwoShot == [(AFInterstitialConfiguration *)v5 isTwoShot])
        && (unint64_t speechEndHostTime = self->_speechEndHostTime,
            speechEndHostTime == [(AFInterstitialConfiguration *)v5 speechEndHostTime]))
      {
        id v12 = [(AFInterstitialConfiguration *)v5 languageCode];
        languageCode = self->_languageCode;
        if (languageCode == v12 || [(NSString *)languageCode isEqual:v12])
        {
          v14 = [(AFInterstitialConfiguration *)v5 recordRoute];
          recordRoute = self->_recordRoute;
          BOOL v16 = recordRoute == v14 || [(NSString *)recordRoute isEqual:v14];
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_style];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_languageCode hash] ^ v4;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_gender];
  uint64_t v7 = [v6 hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_recordRoute hash];
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isVoiceTrigger];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDucking];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isTwoShot];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  char v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_speechEndHostTime];
  unint64_t v16 = v14 ^ [v15 hash];

  return v16;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)AFInterstitialConfiguration;
  NSUInteger v5 = [(AFInterstitialConfiguration *)&v15 description];
  unint64_t style = self->_style;
  if (style > 8) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_1E592B0C0[style];
  }
  NSUInteger v8 = v7;
  v9 = v8;
  uint64_t v10 = @"YES";
  if (self->_isVoiceTrigger) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_isDucking) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (!self->_isTwoShot) {
    uint64_t v10 = @"NO";
  }
  v13 = (void *)[v4 initWithFormat:@"%@ {unint64_t style = %@, languageCode = %@, gender = %lld, recordRoute = %@, isVoiceTrigger = %@, isDucking = %@, isTwoShot = %@, speechEndHostTime = %llu}", v5, v8, *(_OWORD *)&self->_languageCode, self->_recordRoute, v11, v12, v10, self->_speechEndHostTime];

  return v13;
}

- (id)description
{
  return [(AFInterstitialConfiguration *)self _descriptionWithIndent:0];
}

- (AFInterstitialConfiguration)initWithStyle:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 recordRoute:(id)a6 isVoiceTrigger:(BOOL)a7 isDucking:(BOOL)a8 isTwoShot:(BOOL)a9 speechEndHostTime:(unint64_t)a10
{
  id v16 = a4;
  id v17 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __130__AFInterstitialConfiguration_initWithStyle_languageCode_gender_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime___block_invoke;
  v22[3] = &unk_1E592B850;
  int64_t v25 = a3;
  int64_t v26 = a5;
  id v23 = v16;
  id v24 = v17;
  BOOL v28 = a7;
  BOOL v29 = a8;
  BOOL v30 = a9;
  unint64_t v27 = a10;
  id v18 = v17;
  id v19 = v16;
  uint64_t v20 = [(AFInterstitialConfiguration *)self initWithBuilder:v22];

  return v20;
}

void __130__AFInterstitialConfiguration_initWithStyle_languageCode_gender_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  [v4 setStyle:v3];
  [v4 setLanguageCode:*(void *)(a1 + 32)];
  [v4 setGender:*(void *)(a1 + 56)];
  [v4 setRecordRoute:*(void *)(a1 + 40)];
  [v4 setIsVoiceTrigger:*(unsigned __int8 *)(a1 + 72)];
  [v4 setIsDucking:*(unsigned __int8 *)(a1 + 73)];
  [v4 setIsTwoShot:*(unsigned __int8 *)(a1 + 74)];
  [v4 setSpeechEndHostTime:*(void *)(a1 + 64)];
}

- (AFInterstitialConfiguration)init
{
  return [(AFInterstitialConfiguration *)self initWithBuilder:0];
}

- (AFInterstitialConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFInterstitialConfigurationMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFInterstitialConfiguration;
  NSUInteger v5 = [(AFInterstitialConfiguration *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFInterstitialConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFInterstitialConfigurationMutation *)v7 isDirty])
    {
      v6->_unint64_t style = [(_AFInterstitialConfigurationMutation *)v7 getStyle];
      NSUInteger v8 = [(_AFInterstitialConfigurationMutation *)v7 getLanguageCode];
      uint64_t v9 = [v8 copy];
      languageCode = v6->_languageCode;
      v6->_languageCode = (NSString *)v9;

      v6->_int64_t gender = [(_AFInterstitialConfigurationMutation *)v7 getGender];
      uint64_t v11 = [(_AFInterstitialConfigurationMutation *)v7 getRecordRoute];
      uint64_t v12 = [v11 copy];
      recordRoute = v6->_recordRoute;
      v6->_recordRoute = (NSString *)v12;

      v6->_BOOL isVoiceTrigger = [(_AFInterstitialConfigurationMutation *)v7 getIsVoiceTrigger];
      v6->_BOOL isDucking = [(_AFInterstitialConfigurationMutation *)v7 getIsDucking];
      v6->_BOOL isTwoShot = [(_AFInterstitialConfigurationMutation *)v7 getIsTwoShot];
      v6->_unint64_t speechEndHostTime = [(_AFInterstitialConfigurationMutation *)v7 getSpeechEndHostTime];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFInterstitialConfigurationMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFInterstitialConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFInterstitialConfigurationMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFInterstitialConfiguration);
      v6->_unint64_t style = [(_AFInterstitialConfigurationMutation *)v5 getStyle];
      uint64_t v7 = [(_AFInterstitialConfigurationMutation *)v5 getLanguageCode];
      uint64_t v8 = [v7 copy];
      languageCode = v6->_languageCode;
      v6->_languageCode = (NSString *)v8;

      v6->_int64_t gender = [(_AFInterstitialConfigurationMutation *)v5 getGender];
      uint64_t v10 = [(_AFInterstitialConfigurationMutation *)v5 getRecordRoute];
      uint64_t v11 = [v10 copy];
      recordRoute = v6->_recordRoute;
      v6->_recordRoute = (NSString *)v11;

      v6->_BOOL isVoiceTrigger = [(_AFInterstitialConfigurationMutation *)v5 getIsVoiceTrigger];
      v6->_BOOL isDucking = [(_AFInterstitialConfigurationMutation *)v5 getIsDucking];
      v6->_BOOL isTwoShot = [(_AFInterstitialConfigurationMutation *)v5 getIsTwoShot];
      v6->_unint64_t speechEndHostTime = [(_AFInterstitialConfigurationMutation *)v5 getSpeechEndHostTime];
    }
    else
    {
      id v6 = (AFInterstitialConfiguration *)[(AFInterstitialConfiguration *)self copy];
    }
  }
  else
  {
    id v6 = (AFInterstitialConfiguration *)[(AFInterstitialConfiguration *)self copy];
  }

  return v6;
}

@end