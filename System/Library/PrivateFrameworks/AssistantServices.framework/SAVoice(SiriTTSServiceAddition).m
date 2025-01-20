@interface SAVoice(SiriTTSServiceAddition)
- (void)initWithSiriVoice:()SiriTTSServiceAddition;
@end

@implementation SAVoice(SiriTTSServiceAddition)

- (void)initWithSiriVoice:()SiriTTSServiceAddition
{
  id v4 = a3;
  v5 = (void *)[a1 init];
  v6 = [v4 language];
  [v5 setLanguageString:v6];

  v7 = [v4 name];
  [v5 setName:v7];

  v8 = [v4 SAVoiceGender];
  [v5 setGender:v8];

  v9 = [v4 SAVoiceQuality];
  [v5 setQuality:v9];

  v10 = [v4 SAVoiceType];
  [v5 setVoiceType:v10];

  uint64_t v11 = [v4 version];
  [v5 setVoiceContentVersion:v11];
  return v5;
}

@end