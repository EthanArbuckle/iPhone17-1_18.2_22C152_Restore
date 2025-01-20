@interface SiriTTSSynthesisVoice(AFAddition)
- (id)SAVoiceGender;
- (id)SAVoiceQuality;
- (id)SAVoiceType;
- (uint64_t)AFVoiceFootprint;
- (uint64_t)AFVoiceGender;
- (void)updateWithTargetVoice:()AFAddition;
@end

@implementation SiriTTSSynthesisVoice(AFAddition)

- (id)SAVoiceType
{
  uint64_t v1 = [a1 type];
  if ((unint64_t)(v1 - 1) > 3) {
    v2 = (void **)MEMORY[0x1E4F978C8];
  }
  else {
    v2 = (void **)qword_1E5925848[v1 - 1];
  }
  v3 = *v2;
  return v3;
}

- (id)SAVoiceQuality
{
  unint64_t v1 = [a1 footprint];
  if (v1 > 3) {
    v2 = (void **)MEMORY[0x1E4F978C0];
  }
  else {
    v2 = (void **)qword_1E5925828[v1];
  }
  v3 = *v2;
  return v3;
}

- (id)SAVoiceGender
{
  uint64_t v1 = [a1 gender];
  if ((unint64_t)(v1 - 1) > 2) {
    v2 = (void **)MEMORY[0x1E4F978A8];
  }
  else {
    v2 = (void **)qword_1E5925810[v1 - 1];
  }
  v3 = *v2;
  return v3;
}

- (uint64_t)AFVoiceFootprint
{
  unint64_t v1 = [a1 footprint];
  if (v1 > 3) {
    return 0;
  }
  else {
    return qword_19D0E25D8[v1];
  }
}

- (uint64_t)AFVoiceGender
{
  uint64_t result = [a1 gender];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (void)updateWithTargetVoice:()AFAddition
{
  id v4 = a3;
  v5 = [v4 name];
  id v13 = [v5 lowercaseString];

  v6 = [v4 language];

  v7 = [a1 language];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [a1 setLanguage:v6];
  }
  id v9 = v13;
  if (!v13) {
    goto LABEL_5;
  }
  v10 = [a1 name];
  v11 = [v10 lowercaseString];
  char v12 = [v13 isEqualToString:v11];

  id v9 = v13;
  if ((v12 & 1) == 0)
  {
    [a1 setName:v13];
  }
  else
  {
LABEL_5:
    if (v8)
    {
      [a1 setName:v9];
      goto LABEL_9;
    }
  }
  [a1 setFootprint:1];
  [a1 setType:1];
  [a1 setVersion:0];
LABEL_9:
}

@end