@interface AFVoiceInfo(SiriTTSServiceAdditions)
- (uint64_t)isMatchForSiriVoice:()SiriTTSServiceAdditions;
@end

@implementation AFVoiceInfo(SiriTTSServiceAdditions)

- (uint64_t)isMatchForSiriVoice:()SiriTTSServiceAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  int v6 = [a1 isCustom];
  uint64_t v7 = [a1 footprint];
  uint64_t v8 = [v4 AFVoiceFootprint];
  v9 = [a1 languageCode];
  v10 = [v4 language];
  if ([v9 isEqualToString:v10])
  {
    if (v6) {
      uint64_t v11 = -3;
    }
    else {
      uint64_t v11 = -1;
    }
    v12 = [a1 name];
    v13 = [v4 name];
    v19 = v12;
    int v14 = [v12 isEqualToString:v13];
    uint64_t v15 = 0;
    if (v14 && (unint64_t)(v11 + v5) <= 1 && v7 == v8)
    {
      v16 = [a1 contentVersion];
      v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "version"));
      uint64_t v15 = [v16 isEqualToNumber:v17];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

@end