@interface AVAudioOutputSettings
+ (AVAudioOutputSettings)audioOutputSettingsWithAudioSettingsDictionary:(id)a3;
+ (AVAudioOutputSettings)audioOutputSettingsWithTrustedAudioSettingsDictionary:(id)a3;
+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5;
+ (id)audioConverterPropertiesForAudioSettingsDictionary:(id)a3;
+ (id)defaultAudioOutputSettings;
+ (id)registeredOutputSettingsClasses;
- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4;
- (id)compatibleMediaTypes;
@end

@implementation AVAudioOutputSettings

+ (id)registeredOutputSettingsClasses
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  return (id)[a1 _audioOutputSettingsWithAudioSettingsDictionary:a3 exceptionReason:a5];
}

+ (AVAudioOutputSettings)audioOutputSettingsWithAudioSettingsDictionary:(id)a3
{
  uint64_t v13 = 0;
  result = (AVAudioOutputSettings *)[a1 _audioOutputSettingsWithAudioSettingsDictionary:a3 exceptionReason:&v13];
  if (!result)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  return result;
}

+ (AVAudioOutputSettings)audioOutputSettingsWithTrustedAudioSettingsDictionary:(id)a3
{
  result = (AVAudioOutputSettings *)[a3 objectForKey:*MEMORY[0x1E4F151E0]];
  if (result)
  {
    v5 = [[AVAVAudioSettingsAudioOutputSettings alloc] initWithTrustedAVAudioSettingsDictionary:a3];
    return (AVAudioOutputSettings *)v5;
  }
  return result;
}

+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  if (a3)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___AVAudioOutputSettings;
    return objc_msgSendSuper2(&v6, sel__outputSettingsWithOutputSettingsDictionary_mediaType_exceptionReason_, a3, @"soun", a4);
  }
  else
  {
    return (id)[a1 defaultAudioOutputSettings];
  }
}

+ (id)defaultAudioOutputSettings
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"not implemented", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

+ (id)audioConverterPropertiesForAudioSettingsDictionary:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
  uint64_t v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151F0]];
  if (v5 || (uint64_t v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151B0]]) != 0)
  {
    int v20 = [v5 unsignedIntValue];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x61636264u));
  }
  uint64_t v6 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151C0]];
  if (v6)
  {
    int v20 = [v6 unsignedIntValue];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x62726174u));
  }
  uint64_t v7 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151C8]];
  if (v7)
  {
    int v8 = [v7 unsignedIntValue];
    uint64_t v9 = (void *)[a3 objectForKey:*MEMORY[0x1E4F15228]];
    if (v9)
    {
      int v20 = [v9 unsignedIntValue] * v8;
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x62726174u));
    }
  }
  uint64_t v10 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151A8]];
  if (v10)
  {
    int v20 = [v10 unsignedIntValue];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x63647175u));
  }
  v11 = (void *)[a3 objectForKey:*MEMORY[0x1E4F15260]];
  if (v11)
  {
    int v20 = [v11 unsignedIntValue];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x73726371u));
  }
  uint64_t v12 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151D0]];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 compare:*MEMORY[0x1E4F14F38]])
    {
      if ([v13 compare:*MEMORY[0x1E4F14F40]])
      {
        if ([v13 compare:*MEMORY[0x1E4F14F50]])
        {
          if ([v13 compare:*MEMORY[0x1E4F14F48]]) {
            goto LABEL_24;
          }
          int v14 = 3;
        }
        else
        {
          int v14 = 2;
        }
      }
      else
      {
        int v14 = 1;
      }
      int v20 = v14;
    }
    else
    {
      int v20 = 0;
    }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x61636266u));
  }
LABEL_24:
  v15 = (void *)[a3 objectForKey:*MEMORY[0x1E4F151A0]];
  if (v15)
  {
    int v20 = [v15 unsignedIntValue];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x76627271u));
  }
  v16 = (void *)[a3 objectForKey:*MEMORY[0x1E4F15238]];
  if (v16)
  {
    v17 = v16;
    if ([v16 isEqualToString:*MEMORY[0x1E4F15258]])
    {
      int v18 = 1852797549;
    }
    else if ([v17 isEqualToString:*MEMORY[0x1E4F15248]])
    {
      int v18 = 1650553971;
    }
    else
    {
      int v18 = 0;
    }
    int v20 = v18;
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x73726361u));
  }
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
}

- (id)compatibleMediaTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"soun"];
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return [a3 validateAudioOutputSettings:self reason:a4];
}

@end